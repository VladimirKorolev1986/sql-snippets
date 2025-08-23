-- Задание 10
-- Напишите SQL-запрос, который выведет:

-- — название сериала (назовите поле series_name)

-- — название эпизода (назовите поле episode_name)

-- — идентификатор эпизода (назовите поле episode_id)

-- — номер сезона

-- — номер эпизода в сезоне

-- — сквозной номер (назовите поле num)

-- — максимальный рейтинг эпизодов до этой серии включительно (назовите поле max_rating)

-- — количество голосов, отданных за сериал до этой серии включительно (назовите поле vote_cnt)

-- Серии с пустыми значениями сезона и эпизода показывать не нужно.

-- Результат отсортируйте по возрастанию episode_id.

-- Используйте Window Frame

WITH cte AS (SELECT e.parent_id,  e.title_id ,t.original_title AS series_name, 
        (SELECT t1.original_title FROM titles AS t1 WHERE t1.id=e.title_id) AS episode_name, 
        e.title_id AS episode_id,
        e.season,
        e.episode,
        r.avg_rating,
        r.vote_cnt
FROM episodes AS e
JOIN titles AS t
  ON e.parent_id=t.id
JOIN ratings AS r
  ON r.title_id=e.title_id)
  
  SELECT series_name, episode_name, episode_id, season, episode,
  
  ROW_NUMBER() OVER w AS num,
  MAX(avg_rating) OVER w AS max_rating,
  SUM(vote_cnt) OVER w AS vote_cnt
  FROM cte
  WHERE season IS NOT NULL AND episode IS NOT NULL
  WINDOW w AS (PARTITION BY parent_id ORDER BY season, episode)
  ORDER BY episode_id
