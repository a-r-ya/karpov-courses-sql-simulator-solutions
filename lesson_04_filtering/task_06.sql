/*
Напишите SQL-запрос к таблице couriers и выведите всю информацию о курьерах,
у которых не указан их день рождения. Результат отсортируйте по возрастанию id.
Поля в результирующей таблице: birth_date, courier_id, sex
*/
SELECT
  birth_date,
  courier_id,
  sex
FROM
  couriers
WHERE
  birth_date IS NULL
ORDER BY
  courier_id;