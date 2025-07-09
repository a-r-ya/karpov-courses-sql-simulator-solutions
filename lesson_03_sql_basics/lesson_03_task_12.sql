/*
Давайте представим, что по какой-то необъяснимой причине мы вдруг решили в одночасье повысить цену 
всех товаров в таблице products на 5%.
Выведите id и наименования всех товаров, их старую и новую цену. 
Колонку со старой ценой назовите old_price, а колонку с новой — new_price.
Результат отсортируйте сначала по убыванию новой цены, затем по возрастанию id товара.
Поля в результирующей таблице: product_id, name, old_price, new_price
*/
SELECT
  product_id,
  name,
  price AS old_price,
  price * 1.05 AS new_price
FROM
  products
ORDER BY
  new_price DESC,
  product_id;
