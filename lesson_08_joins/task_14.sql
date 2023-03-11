/*
Объедините запрос из предыдущего задания с частью запроса,
который вы составили в задаче 11,
то есть объедините запрос со стоимостью заказов с запросом,
в котором вы считали размер каждого заказа из таблицы user_actions.
На основе объединённой таблицы для каждого пользователя рассчитайте следующие показатели:
- общее число заказов — колонку назовите orders_count
- среднее количество товаров в заказе — avg_order_size
- суммарную стоимость всех покупок — sum_order_value
- среднюю стоимость заказа — avg_order_value
- минимальную стоимость заказа — min_order_value
- максимальную стоимость заказа — max_order_value
Полученный результат отсортируйте по возрастанию id пользователя.
Добавьте в запрос оператор LIMIT и выведите
только первые 1000 строк результирующей таблицы.
Помните, что в расчётах мы по-прежнему учитываем только неотменённые заказы.
При расчёте средних значений, округляйте их до двух знаков после запятой.
Поля в результирующей таблице: 
user_id, orders_count, avg_order_size, sum_order_value,
avg_order_value, min_order_value, max_order_value
*/
SELECT user_id,
       COUNT(order_price) AS orders_count,
       ROUND(AVG(order_size), 2) AS avg_order_size,
       SUM(order_price) AS sum_order_value,
       ROUND(AVG(order_price), 2) AS avg_order_value,
       MIN(order_price) AS min_order_value,
       MAX(order_price) AS max_order_value
FROM   (SELECT user_id,
               order_id,
               ARRAY_LENGTH(product_ids, 1) AS order_size
        FROM   (SELECT user_id,
                       order_id
                FROM   user_actions
                WHERE  order_id NOT IN (SELECT order_id
                                        FROM   user_actions
                                        WHERE  action = 'cancel_order')) t1
            LEFT JOIN orders USING(order_id)) t2
    LEFT JOIN (SELECT order_id,
                      SUM(price) AS order_price
               FROM   (SELECT order_id,
                              product_ids,
                              UNNEST(product_ids) AS product_id
                       FROM   orders
                       WHERE  order_id NOT IN (SELECT order_id
                                               FROM   user_actions
                                               WHERE  action = 'cancel_order')) t3
                   LEFT JOIN products USING(product_id)
               GROUP BY order_id) t4 USING(order_id)
GROUP BY user_id
ORDER BY user_id
LIMIT 1000;