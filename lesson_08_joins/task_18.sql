/*
Произведите замену списков с id товаров из таблицы orders
на списки с наименованиями товаров.
Наименования возьмите из таблицы products.
Колонку с новыми списками наименований назовите product_names. 
Добавьте в запрос оператор LIMIT и выведите
только первые 1000 строк результирующей таблицы.
Поля в результирующей таблице: order_id, product_names
*/
WITH t1 AS (
  SELECT
    o.order_id,
    o.product_id,
    p.name
  FROM
    (
      SELECT
        order_id,
        UNNEST(product_ids) AS product_id
      FROM
        orders
    ) AS o
    LEFT JOIN products AS p USING(product_id)
)
SELECT
  order_id,
  ARRAY_AGG(name) AS product_names
FROM
  t1
GROUP BY
  order_id
LIMIT
  1000;