/* 
Напишите SQL-запрос к таблице courier_actions, чтобы узнать id и время доставки
последних 10 заказов, доставленных курьером с id 100.
Поля в результирующей таблице: order_id, time
*/
SELECT
  order_id,
  time
FROM
  courier_actions
WHERE
  courier_id = 100
  AND action = 'deliver_order'
ORDER BY
  order_id DESC
LIMIT
  10;