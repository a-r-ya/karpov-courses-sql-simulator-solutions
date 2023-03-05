/*
Повторите запрос из предыдущего задания, но теперь вместо подзапроса
используйте оператор WITH и табличное выражение. Условия задачи те же.
Поле в результирующей таблице: orders_avg
*/
WITH t1 AS (
  SELECT
    user_id,
    COUNT(order_id) AS orders_count
  FROM
    user_actions
  WHERE
    action = 'create_order'
  GROUP BY
    user_id
)
SELECT
  ROUND(AVG(orders_count), 2) AS orders_avg
FROM
  t1;