-- Задание 3
-- Напишите SQL-запрос, который выведет:

-- — year_of_start из таблицы titles

-- — количество произведений по годам накопленным итогом, набравших максимальный средний рейтинг, равный 10

-- Для выполнения запроса используйте таблицы titles и ratings. Поля к выводу: год (year_of_start), кумулятивная сумма (cum_cnt). Отсортируйте результат по их возрастанию.

WITH cte AS (SELECT titles.year_of_start, count(titles.year_of_start) as cum_cnt
  FROM titles
  JOIN ratings
    ON titles.id=ratings.title_id
 WHERE ratings.avg_rating =10
 GROUP BY titles.year_of_start)
 
 SELECT year_of_start, 
 SUM(cum_cnt) OVER (ORDER BY year_of_start) AS cum_cnt
 FROM cte
