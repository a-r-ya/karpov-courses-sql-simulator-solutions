/*
Для каждого дня недели в таблице user_actions посчитайте:
Общее количество оформленных заказов.
Общее количество отменённых заказов.
Общее количество неотменённых заказов (т.е. доставленных).
Долю неотменённых заказов в общем числе заказов (success rate).
Новые колонки назовите соответственно created_orders, canceled_orders, actual_orders и success_rate. 
Колонку с долей неотменённых заказов округлите до трёх знаков после запятой.
Все расчёты проводите за период с 24 августа по 6 сентября 2022 года включительно, 
чтобы во временной интервал попало равное количество разных дней недели.
Группы сформируйте следующим образом: выделите день недели из даты с помощью функции to_char с параметром 'Dy', 
также выделите порядковый номер дня недели с помощью функции DATE_PART с параметром 'isodow'. 
Далее сгруппируйте данные по двум полям и проведите все необходимые расчёты.
В результате должна получиться группировка по двум колонкам: с порядковым номером дней недели и их сокращёнными наименованиями.
Результат отсортируйте по возрастанию порядкового номера дня недели.
Поля в результирующей таблице: weekday_number, weekday, created_orders, canceled_orders, actual_orders, success_rate
*/
SELECT
  DATE_PART('isodow', time)::INTEGER AS weekday_number,
  TO_CHAR(time, 'Dy') AS weekday,
  COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order') AS created_orders,
  COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order') AS canceled_orders,
  (
    COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order') - 
    COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order')
  ) AS actual_orders,
  ROUND(
    (
        (
            COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order') - 
            COUNT(DISTINCT order_id) FILTER (WHERE action = 'cancel_order')
        )*1.0 / 
    COUNT(DISTINCT order_id) FILTER (WHERE action = 'create_order')
    ), 3
  ) AS success_rate
FROM
  user_actions
WHERE
  time >= '2022-08-24'
  AND time < '2022-09-07'
GROUP BY 
  weekday_number, 
  weekday
ORDER BY
  weekday_number;
