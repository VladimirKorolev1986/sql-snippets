-- Задание 2
-- Напишите SQL-запрос, который выведет из таблицы titles все строки, содержащие жанр 'Sci-Fi' и заменит его на 'Фантастика'

-- Поля к выводу:

-- — id из таблицы titles

-- — оригинальное название (original_title)

-- — изначальное значение строки genres

-- — изменённое значение строки genres (назовите его new_genres)

-- Результат отсортируйте по возрастанию id, original_title, genres, new_genres

SELECT id, original_title, genres,
       (CASE 
        WHEN genres ~ '\mSci-Fi\M' THEN REPLACE(genres, 'Sci-Fi', 'Фантастика')
        ELSE genres
        END) AS new_genres
  FROM titles
 WHERE genres ~ '\mSci-Fi\M'
 ORDER BY id, original_title, genres, new_genres
