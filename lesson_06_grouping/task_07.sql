/*
Дополните предыдущий запрос оператором HAVING и
отберите только те размеры заказов, общее число которых превышает 5000.
Вновь выведите две колонки: количество товаров в заказе и число заказов с таким количеством.
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
HAVING
  COUNT(DISTINCT order_id) > 5000
ORDER BY
  order_size;