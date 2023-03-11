/*
Объедините таблицы user_actions и users по ключу user_id.
В результат включите две колонки с user_id из обеих таблиц.
Эти две колонки назовите соответственно user_id_left и user_id_right.
Также в результат включите колонки order_id, time, action, sex, birth_date.
Отсортируйте получившуюся таблицу по возрастанию id пользователя (в любой из двух колонок с id).
Поля в результирующей таблице: user_id_left, user_id_right, order_id, time, action, sex, birth_date
*/
SELECT
  a.user_id AS user_id_left,
  u.user_id AS user_id_right,
  order_id,
  time,
  action,
  sex,
  birth_date
FROM
  user_actions AS a
  INNER JOIN users AS u ON a.user_id = u.user_id
ORDER BY
  user_id_left;