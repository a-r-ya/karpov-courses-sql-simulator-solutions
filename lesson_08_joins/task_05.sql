/*
Возьмите запрос из задания 3, где вы объединяли таблицы
user_actions и users с помощью LEFT JOIN,
добавьте к запросу оператор WHERE и исключите NULL
значения в колонке user_id из правой таблицы.
Включите в результат все те же колонки и
отсортируйте получившуюся таблицу по возрастанию
id пользователя в колонке из левой таблицы.
Поля в результирующей таблице: user_id_left, user_id_right,
order_id, time, action, sex, birth_date
После того как решите задачу, попробуйте
сдать это же решение в первом задании — сработает или нет?
Подумайте, какой JOIN мы сейчас получили после всех манипуляций с результатом.
Заодно можете посчитать число уникальных user_id
в запросе из этого задания, чтобы расставить все точки над «i».
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
WHERE
  u.user_id IS NOT NULL
ORDER BY
  user_id_left;