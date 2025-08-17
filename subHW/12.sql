-- Задание 12
-- Перепишите SQL-запрос из первого задания с использованием CTE.
-- Запрос выводит названия (original_name) сериалов, у которых первый эпизод первого сезона получил рейтинг 10.
-- Назовите результирующее поле name и отсортируйте результат по его возрастанию.

WITH cte AS (SELECT
      (
        SELECT
          t.original_title
        FROM
          titles as t
        WHERE
          t.id = e.parent_id
      ) as name,
      (
        SELECT
          r.avg_rating
        FROM
          ratings as r
        WHERE
          r.title_id = e.title_id
      ) as avg_rating
    FROM
      episodes as e
    WHERE
      e.episode = 1
      and e.season = 1)

SELECT
  gr.name
FROM
  (
    SELECT * FROM cte
  ) as gr
WHERE
  gr.avg_rating = 10
  and name is not null
ORDER BY
  1;
