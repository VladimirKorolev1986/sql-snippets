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
 
 SELECT name,
        season, 
        ep_cnt,
        FIRST_VALUE(ep_cnt) OVER (PARTITION BY name ORDER BY season) AS first,
        LAST_VALUE(ep_cnt) OVER (PARTITION BY name ORDER BY season) AS last,
        LAG(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS lag,
        LEAD(ep_cnt) OVER (PARTITION BY name ORDER BY season) AS lead,
        NTH_VALUE(ep_cnt, 3) OVER (PARTITION BY name ORDER BY season)::int AS first
        
        -- SUM(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS an_sum,
        -- AVG(ep_cnt) OVER (PARTITION BY name ORDER BY season) AS an_avg,
        -- MIN(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS an_min,
        -- MAX(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS an_max,
        -- COUNT(ep_cnt) OVER (PARTITION BY name ORDER BY season)::int AS an_count
   FROM cte
