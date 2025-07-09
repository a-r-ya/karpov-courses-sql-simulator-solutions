/*
Для первых 200 записей из таблицы orders выведите информацию в следующем виде (обратите внимание на пробелы):
Заказ № [id заказа] создан [дата]
Полученную колонку назовите order_info.
*/
SELECT
  CONCAT('Заказ № ', order_id, ' создан ', CAST(creation_time AS DATE)) AS order_info
FROM
  orders
LIMIT
  200;
