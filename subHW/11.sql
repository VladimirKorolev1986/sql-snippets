-- Напишите SQL-запрос, который выведет имена людей (поле name из таблицы persons), 
-- которые судя по таблице principals участвовали в создании 10 самых высокооценённых произведений (топ 10 по рейтингу (avg_rating) 
-- и количеству набранных голосов из таблицы ratings). 
-- Итоговый результат отсортируйте по name.

SELECT DISTINCT p.name 
  FROM persons AS p
  JOIN principals AS prin
    ON p.id=prin.person_id
  JOIN (SELECT title_id, avg_rating, vote_cnt FROM ratings
   ORDER BY avg_rating DESC, vote_cnt DESC
   LIMIT 10) AS top_10
    ON prin.title_id=top_10.title_id
 ORDER BY p.name 
