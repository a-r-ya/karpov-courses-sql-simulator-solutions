/*
Посчитайте возраст каждого пользователя в таблице users.
Возраст измерьте числом полных лет, как мы делали в прошлых уроках.
Возраст считайте относительно последней даты в таблице user_actions.
В результат включите колонки с id пользователя и возрастом.
Для тех пользователей, у которых в таблице users не указана дата рождения, укажите
среднее значение возраста всех остальных пользователей, округлённое до целого числа.
Колонку с возрастом назовите age.
Результат отсортируйте по возрастанию id пользователя.
Поля в результирующей таблице: user_id, age
*/
WITH users_age AS (
  SELECT
    user_id,
    DATE_PART(
      'year',
      AGE(
        (
          SELECT
            MAX(time)
          FROM
            user_actions
        ),
        birth_date
      )
    ) AS age
  FROM
    users
)
SELECT
  user_id,
  COALESCE(
    age,
    (
      SELECT
        ROUND(AVG(age))
      FROM
        users_age
    )
  ) AS age
FROM
  users_age
ORDER BY
  user_id;