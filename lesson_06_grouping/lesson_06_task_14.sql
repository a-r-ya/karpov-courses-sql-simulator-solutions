/*
Из таблицы user_actions отберите пользователей, 
у которых последний заказ был создан до 8 сентября 2022 года.
Выведите только их id, дату создания заказа выводить не нужно.
Результат отсортируйте по возрастанию id пользователя.
Поле в результирующей таблице: user_id
*/
SELECT
  user_id
FROM
  user_actions
WHERE
  action = 'create_order'
GROUP BY
  user_id
HAVING
  MAX(time) < '2022-09-08'
ORDER BY
  user_id;
