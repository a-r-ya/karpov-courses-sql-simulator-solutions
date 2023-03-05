/*
Разбейте пользователей из таблицы users на 4 возрастные группы:
от 19 до 24 лет;
от 25 до 29 лет;
от 30 до 35 лет;
от 36 до 41 года.
Посчитайте число пользователей, попавших в каждую возрастную группу.
Группы назовите соответственно «19-24», «25-29», «30-35», «36-41» (без кавычек).
Выведите наименования групп и число пользователей в них.
Колонку с наименованием групп назовите group_age,
а колонку с числом пользователей — users_count.
Отсортируйте полученную таблицу по колонке с наименованием групп по возрастанию.
Поля в результирующей таблице: group_age, users_count
*/
SELECT
  CASE
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 19
    AND 24 THEN '19-24'
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 25
    AND 29 THEN '25-29'
    WHEN DATE_PART('year', AGE(birth_date)) BETWEEN 30
    AND 35 THEN '30-35'
    ELSE '36-41'
  END AS group_age,
  COUNT(DISTINCT user_id) AS users_count
FROM
  users
WHERE
  birth_date IS NOT NULL
GROUP BY
  group_age
ORDER BY
  group_age;