/*
Посчитайте количество товаров в каждом заказе из таблицы orders,
примените к этим значениям группировку и посчитайте количество заказов в каждой группе.
Выведите две колонки: количество товаров в заказе и число заказов с таким количеством.
Колонки назовите соответственно order_size и orders_count.
Результат отсортируйте по возрастанию числа товаров в заказе.
Поля в результирующей таблице: order_size, orders_count
*/

SELECT
  ARRAY_LENGTH(product_ids, 1) AS order_size,
  COUNT(DISTINCT order_id) AS orders_count
FROM
  orders
GROUP BY
  order_size
ORDER BY
  order_size;