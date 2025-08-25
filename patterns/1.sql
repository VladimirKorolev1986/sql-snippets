-- Задание 1
-- Напишите SQL-запрос, который выведет год начала произведений (year_of_start) из таблицы titles и их количество (алиас count), отсортированное в обратном порядке.

SELECT year_of_start, count(1) AS count
  FROM titles
 GROUP BY year_of_start
 ORDER BY count DESC
