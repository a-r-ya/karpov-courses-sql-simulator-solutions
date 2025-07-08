/*
Выведите все записи из таблицы products, отсортировав их по наименованиям товаров в алфавитном порядке, т.е. по возрастанию.
Для сортировки используйте оператор ORDER BY.
Поля в результирующей таблице: product_id, name, price
*/
SELECT
  product_id,
  name,
  price
FROM
  products
ORDER BY
  name;
