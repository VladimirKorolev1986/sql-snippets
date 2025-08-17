-- Задание 2
-- Напишите SQL-запрос, который выведет оригинальное название (original_title), год начала (year_of_start) и количество эпизодов произведений, у которых больше 500 серий, 
-- отсортировав их по убыванию количества серий. 
-- Для этого используйте подзапрос к таблице episodes с группировкой по полю parent_id. Выведите только строки, которые есть в таблице titles и в сгруппированной таблице.

-- Назовите поле с количеством эпизодов произведений ep_cnt. Отсортируйте результат по этому полю в порядке убывания.

SELECT t.original_title, t.year_of_start, ep_cnt.ep_cnt AS ep_cnt
 FROM titles AS t
 JOIN (
 SELECT e.parent_id, COUNT(e.title_id) AS ep_cnt
   FROM episodes AS e
  GROUP BY e.parent_id 
 ) AS ep_cnt ON t.id=ep_cnt.parent_id
 WHERE ep_cnt.ep_cnt>500
 ORDER BY ep_cnt DESC
