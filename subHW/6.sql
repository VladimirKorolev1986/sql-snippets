-- Напишите SQL-запрос, который с помощью подзапроса в блоке WHERE выведет строку таблицы titles, 
-- у которой максимальный рейтинг (avg_rating из таблицы ratings) 
-- и максимальное количество голосов (vote_cnt) среди других произведений с тем же рейтингом.

WITH max_rating AS 
(SELECT MAX(avg_rating) AS max_val FROM ratings) 


 SELECT *
  FROM titles
  WHERE titles.id=(
        SELECT title_id FROM (SELECT * FROM ratings WHERE avg_rating=(SELECT max_val FROM max_rating)) AS max_vote
WHERE vote_cnt = (SELECT MAX(vote_cnt) FROM (SELECT * FROM ratings WHERE avg_rating=(SELECT max_val FROM max_rating)) AS max_vote)
  )
-- Решение от автора (и как я недогадался)
SELECT *
FROM   titles
WHERE  id in (SELECT title_id
              FROM   ratings
              ORDER BY avg_rating desc, vote_cnt desc limit 1);
