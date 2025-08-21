with cte_cnt as (SELECT year_of_death,
                        count(year_of_death) as dead_cnt
                 FROM   persons
                 WHERE  year_of_death > 1999
                 GROUP BY year_of_death
                 ORDER BY year_of_death)
SELECT year_of_death,
       sum(dead_cnt) OVER (PARTITION BY 2000
                           ORDER BY year_of_death) as cume_cnt
FROM   cte_cnt
