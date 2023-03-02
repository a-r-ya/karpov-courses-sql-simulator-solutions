/*
С помощью группировки посчитайте количество 
курьеров мужского и женского пола в таблице couriers. 
Новую колонку с числом курьером назовите couriers_count. 
Результат отсортируйте по этой колонке по возрастанию.
Поля в результирующей таблице: sex, couriers_count
*/

SELECT
  sex,
  COUNT(sex) AS couriers_count
FROM
  couriers
GROUP BY
  sex
ORDER BY
  sex;