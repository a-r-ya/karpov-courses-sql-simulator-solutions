/*
Для каждого пользователя в таблице user_actions посчитайте долю отменённых заказов.
Выведите две колонки: id пользователя и рассчитанный показатель.
Новую колонку с показателем округлите до двух знаков после запятой и назовите cancel_rate.
Результат отсортируйте по возрастанию id пользователя.
Поля в результирующей таблице: user_id, cancel_rate
*/
SELECT
  user_id,
  ROUND(
    COUNT(DISTINCT order_id) FILTER (
      WHERE
        action = 'cancel_order'
    ) :: DECIMAL / COUNT(DISTINCT order_id),
    2
  ) AS cancel_rate
FROM
  user_actions
GROUP BY
  user_id
ORDER BY
  user_id;