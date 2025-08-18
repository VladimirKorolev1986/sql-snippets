WITH char_in_episodes AS (
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
   	SUM(ep_cnt) OVER (PARTITION BY name ORDER BY season ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)::int AS v1,
   	SUM (ep_cnt) OVER (PARTITION BY name ORDER BY season ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)::int AS v2,
   	SUM (ep_cnt) OVER (PARTITION BY name ORDER BY season ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)::int AS v3,
   	SUM (ep_cnt) OVER (PARTITION BY name ORDER BY season ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)::int AS v4
FROM char_in_episodes  
