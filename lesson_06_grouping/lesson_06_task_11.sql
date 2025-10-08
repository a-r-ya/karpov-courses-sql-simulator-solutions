/*
Посчитайте количество товаров в каждом заказе, 
примените к этим значениям группировку и рассчитайте количество заказов в каждой группе. 
Учитывайте только заказы, оформленные по будням. 
В результат включите только те размеры заказов, общее число которых превышает 2000. 
Для расчётов используйте данные из таблицы orders.
Выведите две колонки: размер заказа и число заказов такого размера. 
Колонки назовите соответственно order_size и orders_count.
Результат отсортируйте по возрастанию размера заказа.
Поля в результирующей таблице: order_size, orders_count
*/
SELECT
  ARRAY_LENGTH(product_ids, 1) AS order_size,
  COUNT(order_id) AS orders_count
FROM
  orders
WHERE
  DATE_PART('isodow', creation_time) < 6
GROUP BY
  ARRAY_LENGTH(product_ids, 1)
HAVING
  COUNT(order_id) > 2000
ORDER BY
  order_size;
