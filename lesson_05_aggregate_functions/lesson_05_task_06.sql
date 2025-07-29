/*
Посчитайте количество курьеров женского пола в таблице couriers. 
Полученный столбец с одним значением назовите couriers.
Поле в результирующей таблице: couriers
*/
SELECT
  COUNT(DISTINCT courier_id) AS couriers
FROM
  couriers
WHERE
  sex = 'female';
