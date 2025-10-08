/*
По данным из таблицы orders рассчитайте средний размер заказа по выходным и будням.
Группу с выходными днями (суббота и воскресенье) назовите «weekend», 
а группу с будними днями (с понедельника по пятницу) — «weekdays» (без кавычек).
В результат включите две колонки: колонку с группами назовите week_part, 
а колонку со средним размером заказа — avg_order_size. 
Средний размер заказа округлите до двух знаков после запятой.
Результат отсортируйте по колонке со средним размером заказа — по возрастанию.
Поля в результирующей таблице: week_part, avg_order_size
*/
SELECT
  CASE
    WHEN DATE_PART('isodow', creation_time) IN (6, 7) THEN 'weekend'
    ELSE 'weekdays'
  END AS week_part,
  ROUND(AVG(ARRAY_LENGTH(product_ids, 1)), 2) AS avg_order_size
FROM
  orders
GROUP BY
  week_part
ORDER BY
  avg_order_size;
