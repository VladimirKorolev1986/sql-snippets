-- Задание 7
-- Напишите SQL-запрос, который выведет:

-- — название сериала (назовите поле series_name)

-- — название эпизода (назовите поле episode_name)

-- — идентификатор эпизода (назовите поле episode_id)

-- — номер сезона

-- — номер эпизода в сезоне

-- — ранг эпизода с пропусками по убыванию среднего рейтинга (назовите поле rnk)

-- Серии с пустыми значениями сезона и эпизода показывать не нужно.

-- Результат отсортируйте по возрастанию episode_id.

WITH cte AS (SELECT e.parent_id,  e.title_id ,t.original_title AS series_name, 
        (SELECT t1.original_title FROM titles AS t1 WHERE t1.id=e.title_id) AS episode_name, 
        e.title_id AS episode_id,
        e.season,
        e.episode,
        r.avg_rating
FROM episodes AS e
JOIN titles AS t
  ON e.parent_id=t.id
JOIN ratings AS r
  ON r.title_id=e.title_id)
  
  SELECT series_name, episode_name, episode_id, season, episode,
  RANK() OVER (PARTITION BY parent_id ORDER BY avg_rating DESC) AS rnk
  FROM cte
  WHERE season IS NOT NULL AND episode IS NOT NULL
  ORDER BY episode_id
