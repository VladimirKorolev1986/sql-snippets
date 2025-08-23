-- Задание 9
-- Напишите SQL-запрос, который выведет количество умерших людей из таблицы persons для каждого года, начиная с 2000-го, накопленным итогом для текущего года и всех последующих лет.

-- Например, для 2012 года будет указано количество людей, которые ушли из жизни с 2012 по 2024 год.

-- Поля к выводу: год (year_of_death), кумулятивная сумма на этот год (cume_cnt).

-- Результат отсортируйте по возрастанию year_of_death, cume_cnt (тип данных должен быть integer)

WITH cte AS (SELECT year_of_death, 
       count(id) as cnt
  FROM persons
  WHERE year_of_death IS NOT NULL AND year_of_death >= 2000
 GROUP BY year_of_death
)

SELECT year_of_death,
       SUM(cnt) OVER (ORDER BY year_of_death DESC)::int AS cume_cnt
  FROM cte
 ORDER BY year_of_death
