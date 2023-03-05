/*
Из таблицы courier_actions отберите id трёх курьеров,
доставивших наибольшее количество заказов в августе 2022 года.
Выведите две колонки — id курьера и число доставленных заказов.
Колонку с числом доставленных заказов назовите delivered_orders.
Отсортируйте результат по убыванию delivered_orders.
Поля в результирующей таблице: courier_id, delivered_orders
*/
SELECT
  courier_id,
  COUNT(DISTINCT order_id) AS delivered_orders
FROM
  courier_actions
WHERE
  action = 'deliver_order'
  AND DATE_PART('year', time) = 2022
  AND DATE_PART('month', time) = 8
GROUP BY
  courier_id
ORDER BY
  delivered_orders DESC
LIMIT
  3;