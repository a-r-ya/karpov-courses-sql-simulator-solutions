/*
Напишите SQL-запрос к таблице products и выведите всю информацию о товарах, цена которых не превышает 100 рублей.
Результат отсортируйте по убыванию цены.
Поля в результирующей таблице: product_id, name, price
*/
SELECT
  product_id,
  name,
  price
FROM
  products
WHERE
  price <= 100
ORDER BY
  price DESC;