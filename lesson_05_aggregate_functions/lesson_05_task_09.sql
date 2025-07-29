/*
Посчитайте количество заказов в таблице orders с девятью и более товарами. 
Для этого воспользуйтесь функцией array_length, 
отфильтруйте данные по количеству товаров в заказе и проведите агрегацию. 
Полученный столбец назовите orders.
Поле в результирующей таблице: orders
*/
SELECT
  COUNT(DISTINCT order_id) AS orders
FROM
  orders
WHERE
  ARRAY_LENGTH(product_ids, 1) >= 9;
