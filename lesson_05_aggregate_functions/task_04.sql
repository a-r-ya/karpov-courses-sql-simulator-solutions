/*
С помощью COUNT(DISTINCT) посчитайте количество уникальных пользователей сервиса, количество уникальных заказов, 
поделите одно на другое и рассчитайте, сколько заказов приходится на одного пользователя. 
Показатель числа заказов на пользователя округлите до двух знаков после запятой при помощи функции ROUND, 
которую мы рассматривали в этой задаче.
В результирующей таблице отобразите все три значения — 
поля назовите соответственно unique_users, unique_orders, orders_per_user. 
Все расчёты проведите на основе таблицы user_actions.
Поля в результирующей таблице: unique_users, unique_orders, orders_per_user
*/
SELECT
  COUNT(DISTINCT user_id) AS unique_users,
  COUNT(DISTINCT order_id) AS unique_orders,
  ROUND(
    CAST(COUNT(DISTINCT order_id) AS DECIMAL) / COUNT(DISTINCT user_id),
    2
  ) AS orders_per_user
FROM
  user_actions;