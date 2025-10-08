/*
А теперь по данным таблицы courier_actions определите курьеров, 
которые в сентябре 2022 года доставили только по одному заказу.
В этот раз выведите всего одну колонку с id курьеров. 
Колонку с числом заказов в результат включать не нужно.
Результат отсортируйте по возрастанию id курьера.
Поле в результирующей таблице: courier_id
*/
SELECT
  courier_id
FROM
  courier_actions
WHERE
  action = 'deliver_order'
  AND DATE_PART('year', time) = 2022
  AND DATE_PART('month', time) = 9
GROUP BY
  courier_id
HAVING
  COUNT(DISTINCT order_id) = 1
ORDER BY
  courier_id;
