-- Rick and Morty
-- Добавлена колонка количество серий в каждм сезоне
SELECT ep_char.season,
       COUNT(DISTINCT ep_char.name) AS char_cnt,
       COUNT(DISTINCT ep.episode_id) AS episode_cnt
  FROM (
       SELECT substr(ep.episode_id, 1, 3) AS season,
              ch.name
          FROM episodes AS ep 
          JOIN char_ep AS ce
            ON ep.id = ce.episode_id
          JOIN characters AS ch 
            ON ce.character_id = ch.id
       ) AS ep_char
  JOIN episodes AS ep 
    ON substr(ep.episode_id, 1, 3) = ep_char.season
   GROUP BY season
