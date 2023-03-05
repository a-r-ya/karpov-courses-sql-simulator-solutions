/*
Выберите из таблицы products id и наименования только тех товаров,
названия которых начинаются на букву «с» и содержат только одно слово.
Поля в результирующей таблице: product_id, name
*/
SELECT
  product_id,
  name
FROM
  products
WHERE
  name LIKE 'с%'
  AND name NOT LIKE 'с% %';