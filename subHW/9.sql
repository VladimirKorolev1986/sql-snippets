-- Задание 9
-- Выберите имена (без фамилий) из таблицы persons, которых в таблице persons больше 1000. 
-- В качестве ответа напишите SQL-запрос, который выведет строки из таблицы persons про людей с такими именами.
-- Результат отсортируйте по возрастанию id

 
 SELECT * FROM persons
 WHERE SPLIT_PART(name, ' ', 1) IN (SELECT SPLIT_PART(name, ' ', 1) FROM persons
 GROUP BY SPLIT_PART(name, ' ', 1)
 HAVING COUNT(SPLIT_PART(name, ' ', 1))>1000)
 ORDER BY id
