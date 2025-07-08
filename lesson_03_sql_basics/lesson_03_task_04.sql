/*
Используя операторы SELECT, FROM, ORDER BY и LIMIT, 
определите 5 самых дорогих товаров в таблице products, которые доставляет наш сервис. 
Выведите их наименования и цену.
Поля в результирующей таблице: name, price
*/
SELECT
  name,
  price
FROM
  products
ORDER BY
  price DESC
LIMIT
  5;
