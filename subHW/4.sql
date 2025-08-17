-- Напишите SQL-запрос, который выведет:
-- — количество строк в таблице titles (назовите поле title_cnt);
-- — количество уникальных записей в поле type таблицы titles (назовите поле  type_cnt);
-- — общее количество голосов vote_cnt в таблице ratings (назовите поле sum_vote).

SELECT (SELECT COUNT(DISTINCT titles.id) FROM  titles) AS title_cnt,
       (SELECT COUNT(DISTINCT titles.type) FROM titles) AS type_cnt,
       (SELECT  SUM(ratings.vote_cnt) FROM ratings) AS sum_vote
