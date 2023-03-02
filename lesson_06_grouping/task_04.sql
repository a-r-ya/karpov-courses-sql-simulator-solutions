/*
Вновь разбейте пользователей из таблицы users на группы по возрасту (возраст измеряем количеством полных лет),
только теперь добавьте в группировку пол пользователя.
В результате в каждой возрастной группе должно появиться ещё по две подгруппы с полом.
В каждой такой подгруппе посчитайте число пользователей.
Все NULL значения в колонке birth_date заранее отфильтруйте с помощью WHERE.
Колонку с возрастом назовите age, а колонку с числом пользователей — users_count,
имя колонки с полом оставьте без изменений.
Отсортируйте полученную таблицу сначала по колонке с возрастом по возрастанию,
затем по колонке с полом — тоже по возрастанию.
Поля в результирующей таблице: age, sex, users_count
*/

SELECT
  DATE_PART('year', AGE(birth_date)) age,
  sex,
  COUNT(DISTINCT user_id) AS users_count
FROM
  users
WHERE
  birth_date IS NOT NULL
GROUP BY
  age,
  sex
ORDER BY
  age,
  sex;