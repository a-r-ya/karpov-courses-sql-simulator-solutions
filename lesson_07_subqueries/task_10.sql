/*
Из таблицы couriers выведите всю информацию о курьерах,
которые в сентябре 2022 года доставили 30 и более заказов.
Результат отсортируйте по возрастанию id курьера.
Поля в результирующей таблице: courier_id, birth_date, sex
*/
WITH t1 AS (
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
    COUNT(order_id) >= 30
)
SELECT
  courier_id,
  birth_date,
  sex
FROM
  couriers
WHERE
  courier_id IN (
    SELECT
      *
    FROM
      t1
  )
ORDER BY
  courier_id;