/*
Используя данные из таблицы user_actions, рассчитайте,
сколько заказов сделал каждый пользователь и отразите это в столбце orders_count.
В отдельном столбце orders_avg напротив каждого пользователя укажите среднее
число заказов всех пользователей, округлив его до двух знаков после запятой.
Также для каждого пользователя посчитайте отклонение числа заказов от среднего значения.
Отклонение считайте так: число заказов «минус» округлённое среднее значение.
Колонку с отклонением назовите orders_diff.
Результат отсортируйте по возрастанию id пользователя.
Добавьте в запрос оператор LIMIT и выведите только первые 1000 строк результирующей таблицы.
Поля в результирующей таблице: user_id, orders_count, orders_avg, orders_diff
*/
WITH t1 AS (
  SELECT
    user_id,
    COUNT(DISTINCT order_id) AS orders_count
  FROM
    user_actions
  GROUP BY
    user_id
)
SELECT
  user_id,
  orders_count,
  (
    SELECT
      ROUND(AVG(orders_count), 2)
    FROM
      t1
  ) AS orders_avg,
  ROUND(
    orders_count - (
      SELECT
        AVG(orders_count)
      FROM
        t1
    ),
    2
  ) AS orders_diff
FROM
  t1
LIMIT
  1000;