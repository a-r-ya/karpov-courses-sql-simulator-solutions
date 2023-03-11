/*
Выясните, какие пары товаров покупают вместе чаще всего.
Пары товаров сформируйте на основе таблицы с заказами.
Отменённые заказы не учитывайте.
В качестве результата выведите две колонки —
колонку с парами наименований товаров и колонку со значениями,показывающими,
сколько раз конкретная пара встретилась в заказах пользователей.
Колонки назовите соответственно pair и count_pair.
Пары товаров должны быть представлены в виде списков из двух наименований.
Пары товаров внутри списков должны быть отсортированы в порядке возрастания наименования.
Результат отсортируйте сначала по убыванию частоты встречаемости пары товаров в заказах,
затем по колонке pair — по возрастанию.
Поля в результирующей таблице: pair, count_pair
*/
WITH list AS 
(   
    SELECT o.order_id, p.name
    FROM (
            SELECT order_id,
                   UNNEST(product_ids) AS product_id
            FROM orders
         ) AS o
    LEFT JOIN products AS p USING(product_id)
    WHERE order_id NOT IN (
                              SELECT order_id 
                              FROM user_actions
                              WHERE action = 'cancel_order'
                          )
),
pairs_raw AS 
(
    SELECT order_id, 
           ARRAY[t1.name, t2.name] AS pair_raw
    FROM list AS t1 
    INNER JOIN list AS t2 USING(order_id)
    WHERE t1.name <> t2.name
),
pairs AS
(
    SELECT DISTINCT
           order_id, 
           pair_1 AS pair 
    FROM (
             SELECT order_id, 
                    t1.pair_raw AS pair_1, 
                    t2.pair_raw AS pair_2,
                    CASE 
                        WHEN t1.pair_raw < t2.pair_raw 
                             AND t1.pair_raw @> t2.pair_raw THEN 'ok' 
                        ELSE 'double' 
                    END AS check 
             FROM pairs_raw t1 JOIN pairs_raw t2 USING(order_id)
             WHERE t1.pair_raw <> t2.pair_raw
         ) AS p
    WHERE p.check = 'ok'
)
SELECT pair,
       COUNT(*) AS count_pair
FROM pairs
GROUP BY pair
ORDER BY COUNT(*) DESC,
         pair;