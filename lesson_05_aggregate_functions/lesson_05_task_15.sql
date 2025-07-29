/*
На основе данных в таблице user_actions посчитайте 
количество уникальных пользователей сервиса, количество уникальных заказов, 
поделите одно на другое и выясните, сколько заказов приходится на одного пользователя.
В результирующей таблице отразите все три значения — 
поля назовите соответственно unique_users, unique_orders, orders_per_user.
Показатель числа заказов на пользователя округлите до двух знаков после запятой.
Поля в результирующей таблице: unique_users, unique_orders, orders_per_user
*/
SELECT
  COUNT(DISTINCT user_id) AS unique_users,
  COUNT(DISTINCT order_id) AS unique_orders,
  ROUND(COUNT(DISTINCT order_id)::DECIMAL / COUNT(DISTINCT user_id), 2) AS orders_per_user
FROM
  user_actions;
