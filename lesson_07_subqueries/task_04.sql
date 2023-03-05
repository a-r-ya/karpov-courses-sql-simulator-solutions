/*
Выведите информацию о товарах в таблице products,
цена на которые превышает среднюю цену всех товаров на 20 рублей и более.
Результат отсортируйте по убыванию id товара.
Поля в результирующей таблице: product_id, name, price
*/
SELECT
  product_id,
  name,
  price
FROM
  products
WHERE
  price >= (
    SELECT
      AVG(price)
    FROM
      products
  ) + 20
ORDER BY
  product_id DESC;