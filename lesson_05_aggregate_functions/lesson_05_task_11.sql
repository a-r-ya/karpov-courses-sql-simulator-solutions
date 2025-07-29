/*
Посчитайте стоимость заказа, в котором будут 
три пачки сухариков, две пачки чипсов и один энергетический напиток. 
Колонку с рассчитанной стоимостью заказа назовите order_price.
Для расчётов используйте таблицу products.
Поле в результирующей таблице: order_price
*/
SELECT SUM(
    CASE 
        WHEN name = 'сухарики' THEN price * 3
        WHEN name = 'чипсы' THEN price * 2
        WHEN name = 'энергетический напиток' THEN price
        ELSE 0
    END
    ) AS order_price
FROM
  products;
