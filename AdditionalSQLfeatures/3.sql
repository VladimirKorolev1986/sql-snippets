-- Задание 3
-- Напишите SQL-запрос, который с помощью рекурсии выведет все буквы от A до Z.

-- Для того, чтобы получить следующую букву нужно применить составную функцию. Например, chr(ascii('A') + 1) вернёт B
  
WITH RECURSIVE Alphabet AS (
    SELECT 'A' AS letter
    UNION ALL
    SELECT CHR(ASCII(letter) + 1)
    FROM Alphabet
    WHERE letter < 'Z'
)
SELECT letter
FROM Alphabet;
