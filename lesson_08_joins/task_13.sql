/*
Используя запрос из предыдущего задания,
рассчитайте суммарную стоимость каждого заказа.
Выведите колонки с id заказов и их стоимостью.
Колонку со стоимостью заказа назовите order_price.
Результат отсортируйте по возрастанию id заказа.
Добавьте в запрос оператор LIMIT и выведите
только первые 1000 строк результирующей таблицы.
Поля в результирующей таблице: order_id, order_price
*/
WITH o AS (
  SELECT
    order_id,
    UNNEST(product_ids) AS product_id
  FROM
    orders
)
SELECT
  o.order_id,
  SUM(p.price) AS order_price
FROM
  o
  LEFT JOIN products p USING(product_id)
GROUP BY
  o.order_id
ORDER BY
  o.order_id
LIMIT
  1000;