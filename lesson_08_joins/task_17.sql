/*
По таблицам orders и courier_actions определите
id десяти заказов, которые доставляли дольше всего.
Поле в результирующей таблице: order_id
*/
SELECT
  a.order_id
FROM
  courier_actions AS a
  LEFT JOIN orders AS o USING(order_id)
WHERE
  a.action = 'deliver_order'
ORDER BY
  a.time - o.creation_time DESC
LIMIT
  10;