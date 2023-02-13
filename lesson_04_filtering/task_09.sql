/*
Из таблицы user_actions получите id всех заказов, сделанных пользователями сервиса в августе 2022 года.
Результат отсортируйте по возрастанию id заказа.
Поле в результирующей таблице: order_id
*/

SELECT
  order_id
FROM
  user_actions
WHERE
  DATE_PART('year', time) = 2022
  AND DATE_PART('month', time) = 8
  AND action = 'create_order'
ORDER BY
  order_id;