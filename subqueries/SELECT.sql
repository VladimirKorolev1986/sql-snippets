-- скалярный некоррелилуемый подзапрос 
-- скалярный коррелируемый подзапрос 


SELECT ep_char.season,
       COUNT (DISTINCT ep_char.name) AS char_cnt,
       (SELECT COUNT(1) FROM episodes) AS all_cnt,  -- выводит общее количество серий во всех сезонах 
       (SELECT COUNT(1) -- выводит количество серий в каждом сезоне
          FROM episodes as ep
         WHERE (substr(ep.episode_id, 1, 3)) = ep_char.season) as series_cnt
  FROM 
     (
     SELECT substr(ep.episode_id, 1, 3) AS season,
            ch.name
       FROM episodes AS ep
       JOIN char_ep AS ce
         ON ep.id = ce.episode_id
       JOIN characters AS ch
         ON ce.character_id = ch.id
     ) AS ep_char
 GROUP BY season
