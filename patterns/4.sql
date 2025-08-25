-- Задание 4
-- Напишите SQL-запрос, который выведет из таблицы persons:

-- — число людей в таблице persons (алиас person_cnt)

-- — количество людей, у которых в списке профессий есть 'actor' (алиас actor_cnt)

-- — количество людей, у которых в списке профессий есть 'actress' (алиас actress_cnt)

SELECT COUNT(1) AS person_cnt,
       SUM(CASE WHEN professions LIKE '%actor%' THEN 1 ELSE 0 END) AS actor_cnt,
       SUM(CASE WHEN professions LIKE '%actress%' THEN 1 ELSE 0 END) AS actress_cnt
  FROM persons
