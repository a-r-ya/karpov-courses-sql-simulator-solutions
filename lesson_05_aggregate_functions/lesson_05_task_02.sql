/*
Примените DISTINCT сразу к двум колонкам таблицы courier_actions 
и отберите уникальные пары значений courier_id и order_id.
Результат отсортируйте сначала по возрастанию id курьера, затем по возрастанию id заказа.
Поля в результирующей таблице: courier_id, order_id
*/
SELECT
  DISTINCT courier_id,
  order_id
FROM
  courier_actions
ORDER BY
  courier_id,
  order_id;
