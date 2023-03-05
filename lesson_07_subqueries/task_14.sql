/*
Из таблицы orders выведите id и содержимое заказов, которые
включают хотя бы один из пяти самых дорогих товаров, доступных в нашем сервисе.
Результат отсортируйте по возрастанию id заказа.
Поля в результирующей таблице: order_id, product_ids
*/
WITH top_products AS (
  SELECT
    product_id,
    price
  FROM
    products
  ORDER BY
    price DESC
  LIMIT
    5
), unnest AS (
  SELECT
    order_id,
    product_ids,
    UNNEST(product_ids) AS product_id
  FROM
    orders
)
SELECT
  DISTINCT order_id,
  product_ids
FROM
  unnest
WHERE
  product_id IN (
    SELECT
      product_id
    FROM
      top_products
  )
ORDER BY
  order_id;