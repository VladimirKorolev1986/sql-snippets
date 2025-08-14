-- Количество участников в каждом сезоне

SELECT season,
       COUNT(DISTINCT name) AS char_cnt
  FROM (
       SELECT substr(ep.episode_id, 1, 3) AS season,
              ep.episode_id,
              ch.name
          FROM episodes AS ep 
          JOIN char_ep AS ce
            ON ep.id = ce.episode_id
          JOIN characters AS ch 
            ON ce.character_id = ch.id
       ) AS ep_char
   GROUP BY season
