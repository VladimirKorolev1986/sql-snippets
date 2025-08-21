-- Задание 3
-- Напишите SQL-запрос, который выведет:

-- — year_of_start из таблицы titles

-- — количество произведений по годам накопленным итогом, набравших максимальный средний рейтинг, равный 10

-- Для выполнения запроса используйте таблицы titles и ratings. Поля к выводу: год (year_of_start), кумулятивная сумма (cum_cnt). Отсортируйте результат по их возрастанию.

WITH cte AS (SELECT year_of_start, (SELECT avg_rating FROM ratings WHERE ratings.title_id=titles.id) AS r
  FROM titles
 WHERE ((SELECT avg_rating FROM ratings WHERE ratings.title_id=titles.id) IS NOT NULL) AND ((SELECT avg_rating FROM ratings WHERE ratings.title_id=titles.id) = 10.00)
 ORDER BY year_of_start)
 
 SELECT year_of_start, 
 COUNT(year_of_start) OVER (PARTITION BY year_of_start ORDER BY 2) AS cum_cnt
 FROM cte
