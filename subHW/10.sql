-- Напишите SQL-запрос, 
-- который выведет тип (type), 
-- оригинальное название (original_title), 
-- год выпуска (year_of_start) и жанр (genres) произведений для взрослых (is_adult), 
-- отсортировав их по убыванию рейтинга (avg_rating в таблице ratings). 
-- Для этого используйте коррелированный подзапрос в секции сортировки.

SELECT type, original_title, year_of_start, genres FROM titles
 JOIN ratings
   ON titles.id=ratings.title_id
WHERE is_adult=true
ORDER BY avg_rating DESC

SELECT type, original_title, year_of_start, genres FROM titles
WHERE is_adult=true
ORDER BY (SELECT avg_rating FROM ratings WHERE ratings.title_id=titles.id) DESC
