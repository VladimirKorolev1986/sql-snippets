-- Напишите SQL-запрос, который выведет оригинальное название (original_title), год начала (year_of_start) и 
-- количество человек в команде (com_cnt), у которых команда больше 30 человек. 
-- Для этого используйте подзапрос к таблице principals с группировкой. 
-- Выведите только строки, которые есть в таблице titles и в сгруппированной таблице.

-- Итоговый результат отсортируйте по убыванию com_cnt и original_title.

SELECT t.original_title, t.year_of_start, p.com_cnt AS com_cnt
  FROM titles AS t
  JOIN (
       SELECT principals.title_id, COUNT(DISTINCT principals.person_id) as com_cnt
         FROM principals
        GROUP BY principals.title_id
       ) AS p
    ON t.id=p.title_id
 WHERE p.com_cnt>30
ORDER BY com_cnt DESC, original_title DESC
