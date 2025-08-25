-- Задание 3
-- Напишите SQL-запрос, который выведет из таблицы titles:

-- — общее количество произведений в таблице titles (алиас cnt)

-- — количество строк с типом 'tvEpisode' (алиас episode_cnt)

-- — количество строк с типом 'movie' (алиас movie_cnt)

SELECT COUNT(1) AS cnt,
       SUM(CASE WHEN type='tvEpisode' THEN 1 ELSE 0 END) AS episode_cnt,
       SUM(CASE WHEN type='movie' THEN 1 ELSE 0 END) AS movie_cnt
  FROM titles
