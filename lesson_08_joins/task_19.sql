/*
Выясните, кто заказывал и доставлял самые большие заказы.
Самыми большими считайте заказы с наибольшим числом товаров.
Выведите id заказа, id пользователя и id курьера.
Также в отдельных колонках укажите возраст пользователя и возраст курьера.
Возраст измерьте числом полных лет, как мы делали в прошлых уроках.
Считайте его относительно последней даты в таблице user_actions —
как для пользователей, так и для курьеров.
Колонки с возрастом назовите user_age и courier_age.
Результат отсортируйте по возрастанию id заказа.
Поля в результирующей таблице: order_id, user_id, user_age,
courier_id, courier_age
*/
WITH u_age AS (
  SELECT
    user_id,
    EXTRACT(
      YEAR
      FROM
        AGE(
          (
            SELECT
              MAX(time)
            FROM
              user_actions
          ),
          birth_date
        )
    ) AS user_age
  FROM
    users
),
c_age AS (
  SELECT
    courier_id,
    EXTRACT(
      YEAR
      FROM
        AGE(
          (
            SELECT
              MAX(time)
            FROM
              user_actions
          ),
          birth_date
        )
    ) AS courier_age
  FROM
    couriers
),
top_orders AS (
  SELECT
    o.order_id,
    c.courier_id,
    u.user_id
  FROM
    orders AS o
    LEFT JOIN (
      SELECT
        order_id,
        courier_id
      FROM
        courier_actions
      WHERE
        action = 'deliver_order'
    ) AS c USING(order_id)
    LEFT JOIN (
      SELECT
        order_id,
        user_id
      FROM
        user_actions
      WHERE
        action = 'create_order'
    ) AS u USING(order_id)
  WHERE
    ARRAY_LENGTH(o.product_ids, 1) = (
      SELECT
        MAX(ARRAY_LENGTH(product_ids, 1))
      FROM
        orders
    )
)
SELECT
  t.order_id,
  t.user_id,
  u.user_age,
  t.courier_id,
  c.courier_age
FROM
  top_orders AS t
  LEFT JOIN u_age AS u USING(user_id)
  LEFT JOIN c_age AS c USING(courier_id)
ORDER BY
  order_id;