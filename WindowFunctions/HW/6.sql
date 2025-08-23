-- Задание 6
-- Напишите SQL-запрос, который выведет:

-- — название сериала (назовите поле series_name)

-- — название эпизода (назовите поле episode_name)

-- — идентификатор эпизода (назовите поле episode_id)

-- — номер сезона

-- — номер эпизода в сезоне

-- — расчетное поле: если предыдущий эпизод получил оценку хуже — better, если лучше — worse, если такую же — the same. Для первого эпизода значение принимается NULL. Назовите поле mark.

-- Серии с пустыми значениями сезона и эпизода показывать не нужно.

-- Результат отсортируйте по возрастанию episode_id.

WITH cte AS (SELECT e.parent_id,  e.title_id ,t.original_title AS series_name, 
        (SELECT t1.original_title FROM titles AS t1 WHERE t1.id=e.title_id) AS episode_name, 
        e.title_id AS episode_id,
        e.season,
        e.episode,
        (LAG(r.avg_rating) OVER (PARTITION BY e.parent_id ORDER BY season, episode)) AS prev_rating,
        r.avg_rating
FROM episodes AS e
JOIN titles AS t
  ON e.parent_id=t.id
JOIN ratings AS r
  ON r.title_id=e.title_id)
  
  SELECT series_name, episode_name, episode_id, season, episode,
  (CASE 
  WHEN prev_rating is NULL THEN NULL
  WHEN prev_rating<avg_rating THEN 'better'
  WHEN prev_rating>avg_rating THEN 'worse'
  ELSE 'the same'
  END
  ) AS mark
  FROM cte
  WHERE season IS NOT NULL AND episode IS NOT NULL
  ORDER BY episode_id
  
