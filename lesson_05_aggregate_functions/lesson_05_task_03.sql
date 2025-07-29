/*
Посчитайте максимальную и минимальную цены товаров в таблице products. 
Поля назовите соответственно max_price, min_price.
Поля в результирующей таблице: max_price, min_price
*/
SELECT
  MAX(price) AS max_price,
  MIN(price) AS min_price
FROM
  products;
