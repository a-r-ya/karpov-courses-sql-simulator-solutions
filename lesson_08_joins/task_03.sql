/*
С помощью LEFT JOIN объедините таблицы user_actions и users по ключу user_id.
Обратите внимание на порядок таблиц — слева users_actions, справа users.
В результат включите две колонки с user_id из обеих таблиц.
Эти две колонки назовите соответственно user_id_left и user_id_right.
Также в результат включите колонки order_id, time, action, sex, birth_date.
Отсортируйте получившуюся таблицу по возрастанию id пользователя (в колонке из левой таблицы).
Поля в результирующей таблице: user_id_left, user_id_right,  order_id, time, action, sex, birth_date
После того как решите задачу, обратите внимание на колонки с user_id.
Нет ли в какой-то из них пропущенных значений?
*/
SELECT
  ua.user_id AS user_id_left,
  u.user_id AS user_id_right,
  order_id,
  time,
  action,
  sex,
  birth_date
FROM
  user_actions AS ua
  LEFT JOIN users AS u ON ua.user_id = u.user_id
ORDER BY
  user_id_left;