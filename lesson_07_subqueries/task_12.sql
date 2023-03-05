/*
Выберите все колонки из таблицы orders, но в качестве последней колонки
укажите функцию unnest, применённую к колонке product_ids.
Новую колонку назовите product_id.
Выведите только первые 100 записей результирующей таблицы.
Посмотрите на результат работы функции unnest и постарайтесь разобраться, что произошло с исходной таблицей.
Поля в результирующей таблице: creation_time, order_id, product_ids, product_id
*/
SELECT
  creation_time,
  order_id,
  product_ids,
  UNNEST(product_ids) AS product_id
FROM
  orders
LIMIT
  100;