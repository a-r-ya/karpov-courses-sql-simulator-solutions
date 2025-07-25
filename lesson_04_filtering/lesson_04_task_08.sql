/*
Составьте SQL-запрос, который выбирает из таблицы products все чаи стоимостью больше 60 рублей 
и вычисляет для них цену со скидкой 25%.
Скидку в % менеджер попросил указать в отдельном столбце в формате текста, 
то есть вот так: «25%» (без кавычек). 
Столбцы со скидкой и новой ценой назовите соответственно discount и new_price.
Также необходимо любым известным способом избавиться от «чайного гриба»: 
вряд ли менеджер имел в виду и его, когда ставил нам задачу.
Результат должен быть отсортирован по возрастанию id товара.
Поля в результирующей таблице: product_id, name, price, discount, new_price
*/
SELECT
  product_id,
  name,
  price,
  '25%' AS discount,
  price * 0.75 AS new_price
FROM
  products
WHERE
  price > 60
  AND name LIKE '%чай%'
  AND name NOT LIKE '%гриб%'
ORDER BY
  product_id;
