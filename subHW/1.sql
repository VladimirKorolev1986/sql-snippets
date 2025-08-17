-- Задание 1
-- Напишите SQL-запрос, который выведет названия (name) сериалов, у которых первый эпизод первого сезона получил рейтинг 10. 
-- Назовите результирующее поле name. Для выборки используйте таблицы titles, ratings, episodes и кореллированные подзапросы. Результат отсортируйте в лексикографическом порядке.

SELECT original_title as name
FROM   titles t
WHERE  exists (SELECT 1
               FROM   episodes e
               WHERE  e.parent_id = t.id
                  and e.season = 1
                  and e.episode = 1
                  and exists (SELECT 1
                           FROM   ratings r
                           WHERE  r.title_id = e.title_id
                              and r.avg_rating = 10))
ORDER BY name;
