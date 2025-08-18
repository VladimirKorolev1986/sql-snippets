WITH cte AS (
SELECT c.name,
       substr(ep.episode_id, 1, 3) AS season,
       COUNT(DISTINCT ep.episode_id) AS ep_cnt
  FROM characters AS c
  LEFT JOIN char_ep AS ce
    ON c.id = ce.character_id
  LEFT JOIN episodes AS ep
    ON ce.episode_id = ep.id
 GROUP BY 1, 2
 HAVING COUNT(ep.episode_id) > 5
 )
 
 
 SELECT
 name,
 season,
 ep_cnt, 
 SUM(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS ep_sum,
 AVG(ep_cnt) OVER (PARTITION BY name ORDER BY season) AS ep_avg,
 MIN(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS ep_min,
 MAX(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS ep_max
 FROM cte
