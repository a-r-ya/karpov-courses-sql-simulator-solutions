/*
Выведите id всех уникальных пользователей из таблицы user_actions. 
Результат отсортируйте по возрастанию id.
Поле в результирующей таблице: user_id
*/
SELECT
  DISTINCT user_id
FROM
  user_actions
ORDER BY
  user_id;
