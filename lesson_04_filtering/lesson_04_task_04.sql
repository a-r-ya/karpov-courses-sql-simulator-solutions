/*
Назначьте скидку 20% на все товары из таблицы products и отберите те, 
цена на которые с учётом скидки превышает 100 рублей. 
Выведите id товаров, их наименования, прежнюю цену и новую цену с учётом скидки. 
Колонку со старой ценой назовите old_price, с новой — new_price.
Результат должен быть отсортирован по возрастанию id товара.
Поля в результирующей таблице: product_id, name, old_price, new_price
*/
SELECT
  product_id,
  name,
  price AS old_price,
  price * 0.8 AS new_price
FROM
  products
WHERE
  price * 0.8 > 100
ORDER BY
  product_id;
