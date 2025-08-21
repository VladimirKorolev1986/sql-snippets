-- Напишите SQL-запрос, который выведет количество умерших людей из таблицы persons для каждого года, начиная с 2000-го, накопленным итогом.

-- Например, для 2012 года будет указано количество людей, которые ушли из жизни с 2000 по 2012 год.

-- Поля к выводу: год (year_of_death), кумулятивная сумма на этот год (cume_cnt). Отсортируйте результат по их возрастанию.

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
