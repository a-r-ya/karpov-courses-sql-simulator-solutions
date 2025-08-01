/*
Используя группировку и функцию DATE_TRUNC, 
приведите все даты к началу месяца и посчитайте, 
сколько заказов было сделано в каждом из них.
Расчёты проведите по таблице orders. 
Колонку с усечённой датой назовите month, 
колонку с количеством заказов — orders_count.
Результат отсортируйте по месяцам — по возрастанию.
Поля в результирующей таблице: month, orders_count
*/
SELECT
  DATE_TRUNC('month', creation_time) AS month,
  COUNT(order_id) AS orders_count
FROM
  orders
GROUP BY
  month
ORDER BY
  month;
