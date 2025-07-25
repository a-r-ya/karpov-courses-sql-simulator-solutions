/*
Измените тип колонки price из таблицы products на VARCHAR. 
Выведите колонки с наименованием товаров, ценой в исходном формате и ценой в формате VARCHAR. 
Новую колонку с ценой в новом формате назовите price_char.
Результат отсортируйте по возрастанию исходного наименования товара в колонке name. 
Количество выводимых записей не ограничивайте.
Поле в результирующей таблице: name, price, price_char
*/
SELECT
  name,
  price,
  CAST(price AS VARCHAR) AS price_char
FROM
  products
ORDER BY
  name;
