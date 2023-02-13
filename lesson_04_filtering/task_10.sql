/*
Из таблицы couriers отберите id всех курьеров, родившихся в период с 1990 по 1995 год включительно.
Результат отсортируйте по возрастанию id курьера.
Поле в результирующей таблице: courier_id
*/

SELECT
  courier_id
FROM
  couriers
WHERE
  DATE_PART('year', birth_date) BETWEEN 1990
  AND 1995
ORDER BY
  courier_id;