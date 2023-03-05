/*
Вычислите НДС каждого товара в таблице products и рассчитайте цену без учёта НДС.
Выведите всю информацию о товарах, включая сумму налога и цену без его учёта.
Колонки с суммой налога и ценой без НДС назовите соответственно tax и price_before_tax.
Округлите значения в этих колонках до двух знаков после запятой.
Результат отсортируйте сначала по убыванию цены товара без учёта НДС, затем по возрастанию id товара.
Поля в результирующей таблице: product_id, name, price, tax, price_before_tax
*/
SELECT
  product_id,
  name,
  price,
  ROUND(price * 20 / 120, 2) AS tax,
  ROUND(price * 100 / 120, 2) AS price_before_tax
FROM
  products
ORDER BY
  price_before_tax DESC,
  product_id;