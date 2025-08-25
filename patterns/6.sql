-- Задание 6
-- Напишите SQL-запрос, который найдет дубли в поле original_title таблицы titles. Выведите для них:

-- — название

-- — количество совпадений в порядке убывания (алиас cnt)

SELECT original_title, COUNT(1) AS cnt
  FROM titles
  GROUP BY original_title
  HAVING COUNT(1)>1
  ORDER BY cnt DESC 
