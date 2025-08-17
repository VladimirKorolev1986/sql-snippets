-- Задание 13
-- Перепишите SQL-запрос из второго задания с использованием CTE. 
-- Запрос выводит оригинальное название (original_title), год начала (year_of_start) и количество эпизодов произведений (ep_cnt), 
-- у которых больше 500 серий, отсортировав их по убыванию количества серий. 
-- Выводятся только те строки, которые есть в таблице titles и в сгруппированной таблице.

WITH ep_cnt AS (SELECT e.parent_id,
                                count(e.title_id) as ep_cnt
                         FROM   episodes as e
                         GROUP BY e.parent_id)

SELECT t.original_title,
       t.year_of_start,
       ep_cnt.ep_cnt as ep_cnt
FROM   titles as t join ep_cnt
        ON t.id = ep_cnt.parent_id
WHERE  ep_cnt.ep_cnt > 500
ORDER BY ep_cnt desc
