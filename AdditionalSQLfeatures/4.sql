-- Задание 4
-- Напишите SQL-запрос, который с помощью рекурсии выведет все года с 2000 по 2032 и посчитает количество произведений  с year_of_start, соответствующих каждому выведенному году.

-- Назовите поля year и count

-- Отсортируйте результат по возрастанию year

WITH RECURSIVE year_from AS (
    SELECT 2000 AS year
    UNION ALL
    SELECT year + 1
    FROM year_from
    WHERE year < 2032
), 
cnt_titles AS (
SELECT year_of_start, COUNT(1) AS count
FROM titles
WHERE year_of_start>1999
GROUP BY year_of_start
)

SELECT year, (
CASE 
WHEN count IS NULL THEN 0
ELSE count
END)
  FROM year_from AS y
  LEFT JOIN cnt_titles AS c
          ON y.year=c.year_of_start
    ORDER BY year
