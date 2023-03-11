/*
Для начала к таблице с заказами (orders) примените функцию
unnest, как мы делали в прошлом уроке.
Колонку с id товаров назовите product_id.
Затем к образовавшейся расширенной таблице по ключу product_id
добавьте информацию о ценах на товары (из таблицы products).
Должна получиться таблица с заказами, товарами
внутри каждого заказа и ценами на эти товары.
Выведите колонки с id заказа, id товара и ценой товара.
Результат отсортируйте сначала по возрастанию id заказа,
затем по возрастанию id товара.
Добавьте в запрос оператор LIMIT и выведите
только первые 1000 строк результирующей таблицы.
Поля в результирующей таблице: order_id, product_id, price
*/
WITH o AS (
  SELECT
    order_id,
    UNNEST(product_ids) AS product_id
  FROM
    orders
)
SELECT
  o.order_id,
  o.product_id,
  p.price
FROM
  o
  LEFT JOIN products p USING(product_id)
ORDER BY
  o.order_id,
  o.product_id
LIMIT
  1000;