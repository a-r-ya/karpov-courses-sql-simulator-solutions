/*
Возьмите запрос, составленный на одном из прошлых уроков, и
подтяните в него из таблицы users данные о поле пользователей таким образом,
чтобы все пользователи из таблицы users_actions остались в результате.
Затем посчитайте среднее значение cancel_rate для каждого пола,
округлив его до трёх знаков после запятой.
Колонку с посчитанным средним значением назовите avg_cancel_rate.
Помните про отсутствие информации о поле некоторых пользователей после join,
так как не все пользователи из таблицы user_action есть в таблице users.
Для этой группы тоже посчитайте cancel_rate и в результирующей таблице
для пустого значения в колонке с полом укажите ‘unknown’ (без кавычек).
Возможно, для этого придётся вспомнить, как работает COALESCE.
Результат отсортируйте по колонке с полом пользователя по возрастанию.
Поля в результирующей таблице: sex, avg_cancel_rate
*/
SELECT
  COALESCE(u.sex, 'unknown') AS sex,
  ROUND(AVG(cr.cancel_rate), 3) AS avg_cancel_rate
FROM
  (
    SELECT
      user_id,
      ROUND(
        COUNT(DISTINCT order_id) FILTER (
          WHERE
            action = 'cancel_order'
        ) :: DECIMAL / COUNT(distinct order_id),
        2
      ) AS cancel_rate
    FROM
      user_actions
    GROUP BY
      user_id
    ORDER BY
      user_id
  ) AS cr
  LEFT JOIN users AS u USING(user_id)
GROUP BY
  u.sex
ORDER BY
  u.sex;