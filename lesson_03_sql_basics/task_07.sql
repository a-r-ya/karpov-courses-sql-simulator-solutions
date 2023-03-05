/*
Выведите id всех курьеров и их годы рождения из таблицы couriers.
Новую колонку с годом назовите birth_year.
Результат отсортируйте сначала по убыванию года рождения курьера, затем по возрастанию id курьера.
Поля в результирующей таблице: courier_id, birth_year 
*/
SELECT
  courier_id,
  DATE_PART('year', birth_date) AS birth_year
FROM
  couriers
ORDER BY
  birth_year DESC,
  courier_id;