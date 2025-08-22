--   Задание 4
-- Напишите SQL-запрос, который выведет:

-- — название сериала (назовите поле series_name)

-- — название эпизода (назовите поле episode_name)

-- — идентификатор эпизода (назовите поле episode_id)

-- — номер сезона

-- — номер эпизода в сезоне

-- — максимальный рейтинг эпизодов до этой серии включительно (назовите поле max_rating)

-- Серии с пустыми значениями сезона и эпизода показывать не нужно.

SELECT t.original_title AS series_name,
           (SELECT original_title FROM titles AS t1 WHERE t1.id=e.title_id) AS episode_name,
           e.title_id AS episode_id,
           e.season,
           e.episode,
           MAX(r.avg_rating) OVER (PARTITION BY e.parent_id ORDER BY e.season, e.episode ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_rating
    FROM titles AS t
    JOIN episodes AS e
      ON t.id=e.parent_id
    JOIN ratings AS r
      ON r.title_id = e.title_id
    WHERE  e.season IS NOT NULL AND e.episode IS NOT NULL
    ORDER BY e.title_id
