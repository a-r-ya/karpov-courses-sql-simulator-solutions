/*
По таблицам courier_actions, orders и products определите 10
самых популярных товаров, доставленных в сентябре 2022 года.
Самыми популярными товарами будем считать те, которые встречались в заказах чаще всего.
Если товар встречается в одном заказе несколько раз (было куплено несколько единиц товара),
то при подсчёте учитываем только одну единицу товара.
Выведите наименования товаров и сколько раз они встречались в заказах.
Новую колонку с количеством покупок товара назовите times_purchased. 
Поля в результирующей таблице: name, times_purchased
*/
SELECT
  name,
  COUNT(*) AS times_purchased
FROM
  (
    SELECT
      DISTINCT c.order_id,
      UNNEST(o.product_ids) AS product_id
    FROM
      courier_actions c
      LEFT JOIN orders o USING(order_id)
    WHERE
      c.action = 'deliver_order'
      AND DATE_TRUNC('month', c.time) = '2022-09-01'
  ) AS t1
  LEFT JOIN (
    SELECT
      product_id,
      name
    FROM
      products
  ) AS t2 USING(product_id)
GROUP BY
  name
ORDER BY
  times_purchased DESC
LIMIT
  10;