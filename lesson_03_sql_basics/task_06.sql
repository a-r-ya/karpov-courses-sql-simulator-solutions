--Измените тип колонки price из таблицы products на VARCHAR.
--Выведите только эту колонку.
--Поле в результирующей таблице: price

SELECT
  CAST(price AS VARCHAR)
FROM
  products;