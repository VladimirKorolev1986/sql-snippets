-- Напишите SQL-запрос, который выведет:

-- — название сериала (назовите поле series_name)

-- — название эпизода (назовите поле episode_name), для этого необходимо выполнить коррелированный подзапрос, обратившись к внешней таблице episodes

-- — идентификатор эпизода (назовите поле episode_id)

-- — номер сезона

-- — номер эпизода в сезоне

-- — сквозной номер (назовите поле rn)

-- Все названия хранятся в поле original_title таблицы titles

-- Партицирование сделайте по parent_id 

-- Серии с пустыми значениями сезона и эпизода показывать не нужно

-- Результат отсортируйте по возрастанию episode_id

SELECT t_series.original_title as series_name,
       (SELECT t2.original_title
 FROM   titles t2
 WHERE  t2.id = episodes.title_id) as episode_name, episodes.title_id as episode_id, episodes.season as season, episodes.episode as episode, row_number()
OVER (
PARTITION BY episodes.parent_id
ORDER BY episodes.season, episodes.episode) as rn
FROM   episodes join titles t_series
        ON episodes.parent_id = t_series.id
WHERE  episodes.episode is not null
   and episodes.season is not null
ORDER BY episodes.title_id
