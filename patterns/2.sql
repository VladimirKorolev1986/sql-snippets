-- Задание 2
-- Напишите SQL-запрос, который выведет год начала произведений из таблицы titles и их количество (алиас count) в каждом году, отсортированное в порядке возрастания, начиная с 2030 до 2000 года, не пропуская тех лет, в которые не вышло ни одного произведения.

-- Результат отсортируйте в порядке возрастания года.

WITH RECURSIVE list_years AS (
SELECT 2000 AS date 
UNION ALL 
SELECT date + 1
FROM list_years
WHERE date<2030
)
SELECT list_years.date AS dt, COUNT(titles.id) as count
FROM list_years
LEFT JOIN titles
  ON list_years.date=titles.year_of_start
  GROUP BY list_years.date
  ORDER BY list_years.date
