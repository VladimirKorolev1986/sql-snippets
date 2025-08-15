SELECT id FROM locations WHERE name = 'Earth (C-137)'


SELECT *
  FROM char_loc
 WHERE location_id=(SELECT id FROM locations WHERE name = 'Earth (C-137)')
 
 SELECT * 
   FROM characters AS ch
  WHERE EXISTS
        (
        SELECT 1
          FROM char_loc
         WHERE location_id=(SELECT id FROM locations WHERE name = 'Earth (C-137)')
           AND char_loc.character_id = ch.id
        )
        
SELECT substr(episode_id, 1, 3) AS season,
       COUNT(episode_id) AS ep_cnt
  FROM episodes AS ep
 GROUP BY substr(episode_id, 1, 3)
 HAVING COUNT(episode_id) < (
                            SELECT COUNT(1)
                              FROM episodes
                             WHERE episode_id LIKE '%S01%'
                            )
                            
                            
                            
    SELECT *
      FROM characters
     ORDER BY (
                SELECT COUNT(1)
                  FROM char_ep
                 WHERE char_ep.character_id = characters.id
              ) DESC
