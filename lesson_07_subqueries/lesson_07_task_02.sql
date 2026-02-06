/*
Повторите запрос из предыдущего задания, 
но теперь вместо подзапроса используйте оператор WITH и табличное выражение.
Условия задачи те же: используя данные из таблицы user_actions, 
рассчитайте среднее число заказов всех пользователей.
Полученное среднее число заказов округлите до двух знаков после запятой. 
Колонку с этим значением назовите orders_avg.
Поле в результирующей таблице: orders_avg
*/
WITH t1 AS (
  SELECT
    user_id,
    COUNT(DISTINCT order_id) AS orders_cnt
  FROM
    user_actions
  GROUP BY
    user_id
)
SELECT
  ROUND(AVG(orders_cnt), 2) AS orders_avg
FROM
  t1;
