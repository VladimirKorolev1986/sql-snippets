-- Напишите SQL-запрос, который с помощью кореллированного подзапроса выведет:
-- — id и original_title из таблицы titles
-- — avg_rating из таблицы ratings, относящийся к строке из titles
-- Результат отсортируйте по возрастанию id, original_title, avg_rating
  
  
  SELECT titles.id, 
         titles.original_title, 
         (SELECT ratings.avg_rating FROM ratings WHERE ratings.title_id=titles.id) AS avg_rating 
    FROM titles
   ORDER BY id, original_title, avg_rating
