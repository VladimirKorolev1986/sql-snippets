-- Напишите SQL-запрос, который выведет название (original_title) произведения (эпизода) с максимальной продолжительностью. 
-- Если таких произведений несколько, то выведите все


SELECT original_title FROM titles
WHERE run_time = (SELECT MAX(run_time) FROM titles)
