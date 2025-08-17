-- Напишите SQL-запрос, который выведет названия (original_title) произведений, 
-- продолжительностью между floor и ceil средней продолжительности произведений в таблице titles.
-- Результат отсортируйте по возрастанию original_title


SELECT original_title FROM titles
WHERE run_time BETWEEN (SELECT FLOOR(AVG(run_time)) FROM titles) AND (SELECT CEIL(AVG(run_time)) FROM titles)
ORDER BY original_title
