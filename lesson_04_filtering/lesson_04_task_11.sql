/*
Определите id и даты рождения 50 самых молодых пользователей мужского пола из таблицы users. 
Не учитывайте тех пользователей, у которых не указана дата рождения.
Поле в результирующей таблице: user_id, birth_date
*/
SELECT
  user_id,
  birth_date
FROM
  users
WHERE
  sex = 'male'
  AND birth_date IS NOT NULL
ORDER BY
  birth_date DESC
LIMIT
  50;
