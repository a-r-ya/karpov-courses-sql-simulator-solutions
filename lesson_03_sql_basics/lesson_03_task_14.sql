/*
Повысьте цену на 5% только на те товары, цена которых превышает 100 рублей. 
Цену остальных товаров оставьте без изменений. 
Также не повышайте цену на икру, которая и так стоит 800 рублей. 
Выведите id и наименования всех товаров, их старую и новую цену. 
Цену округлять не нужно.
Результат отсортируйте сначала по убыванию новой цены, затем по возрастанию id товара.
Поля в результирующей таблице: product_id, name, old_price, new_price
*/
SELECT
  product_id,
  name,
  price AS old_price,
  CASE
    WHEN name <> 'икра' AND price > 100 THEN price * 1.05
    ELSE price
  END AS new_price
FROM
  products
ORDER BY
  new_price DESC,
  product_id;
