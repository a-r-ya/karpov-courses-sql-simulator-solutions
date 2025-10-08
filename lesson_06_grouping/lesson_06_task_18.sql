/*
Для каждого пользователя в таблице user_actions посчитайте 
общее количество оформленных заказов и долю отменённых заказов.
Новые колонки назовите соответственно orders_count и cancel_rate. 
Колонку с долей отменённых заказов округлите до двух знаков после запятой.
В результат включите только тех пользователей, которые оформили больше трёх заказов 
и у которых показатель cancel_rate составляет не менее 0.5.
Результат отсортируйте по возрастанию id пользователя.
Поля в результирующей таблице: user_id, orders_count, cancel_rate
*/
SELECT
  user_id,
  COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order') AS orders_count,
  ROUND(
    (
        COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order')*1.0 / 
        COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order')
    ), 2
  ) AS cancel_rate
FROM
  user_actions
GROUP BY
  user_id
HAVING 
  COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order') > 3 
  AND ROUND(
        (
            COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order')*1.0 / 
            COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order')
        ), 2
      ) >= 0.5
ORDER BY
  user_id;
