/*
1. В таблице аудита найти количество попыток продвижения заказа 2520123, закончившихся ошибкой.<br> _Результат_: количество попыток
*/

select count(*) 
from fw_process_log 
where (v_message like'%2520123%' and n_status=500);


/*
2. В таблице аудита найти дату/время последней попытки продвижения заказа 2520123, закончившейся ошибкой.<br> _Результат_: дата/время попытки в формате dd.mon.yyyy и номер заказа. В качестве "номера заказа" выбрал id_log
*/

select to_char(t.dt_timestamp, 'dd.mon.yyyy') as "Date", t.id_log
from fw_process_log t 
where (t.dt_timestamp= 
(select max(t.dt_timestamp) 
from fw_process_log t 
where (v_message like'%2520123%' and n_status=500)));


/*
6. Сколько было завершённых процессов продвижения заказов в таблице аудита в марте 2018.<br> _Результат_: единственное число - количество завершённых процессов
*/

select count(*)
from fw_process_log t
where (t.n_action=11 and t.dt_timestamp >= '01-mar-18' and t.dt_timestamp <= '31-mar-18')


/*
7. Сколько повторяющихся идентификаторов сессии есть в таблице аудита.<br> _Результат_: единственное число - количество повторяющихся идентификаторов - sid = 9507885 (3 раза)
*/

select count(id_log) 
from fw_process_log
group by sid
having count(id_log)>1


/*
8. Найти пользователя и последнюю дату его входа по таблице аудита для кода пользователя = 11136.<br> _Результат_: дата/время и логин пользователя
*/

select distinct t.id_user, t.dt_timestamp
from fw_process_log t
where t.dt_timestamp=
(select max(t.dt_timestamp)
from fw_process_log
where t.id_user=11136);


/*
9. Вывести количество записей в таблице аудита по месяцам. <br> _Результат:_ название месяца и количество записей аудита в нём
*/

select to_char(t.dt_timestamp, 'Month') as "Month", count(t.id_log) as "Amount"
from fw_process_log t
group by to_char(t.dt_timestamp, 'Month')


/*
10.Сколько записей в таблице аудита со статусом сообщения = "Ошибка" для процесса с кодом = 5 в интервале 22.02.2018 - 02.03.2018 (не включая границы).
Сколько среди них с уникальным текстом сообщения<br> _Результат_: два числа - общее количество записей по условиям и количество записей с уникальным сообщением.
*/

select count(*) as "Unique messages" 
from (select *
from fw_process_log t 
where (t.id_process=5 and t.n_status=500 and t.dt_timestamp>'2018-02-22 23.59.59.999999'
and t.dt_timestamp<'2018-03-02 00.00.00.000000')
order by t.dt_timestamp asc)
where v_message<>v_message;

select count(*) as "General"
from fw_process_log t 
where (t.id_process=5 and t.n_status=500 and t.dt_timestamp>'2018-02-22 23.59.59.999999'
and t.dt_timestamp<'2018-03-02 00.00.00.000000');


/*
11. По таблице переводов найти минимальную сумму перевода с датой поступления в систему в интервале 10:00-12:00 14 февраля 2017 при условии, что перевод должен был проходить между разными контрактами.<br> _Результат_: единственное число - сумма перевода
*/

select min(t.n_sum)
from fw_transfers t
where (t.dt_incoming >= '2017-02-14 10.00.00.000000' and t.dt_incoming <= '2017-02-14 12.00.00.000000' 
and t.id_contract_from <> t.id_contract_to)


/*
12. На печатном бланке для денежного перевода есть поле для комментария к денежному переводу. Максимальная длина текста в данном поле = 22 символам. Найти переводы, комментарий к которым не поместится на данном бланке. <br> _Результат_: контракт (на который совершался перевод), дата перевода от оператора, количество символов комментария, которые не влезают в поле бланка. Список должен быть отсортирован по количеству "невлезающих" символов в порядке убывания.
*/

select t.id_contract_to, (length(t.v_description)-22) as "Excess" 
from fw_transfers t 
where (length(t.v_description)-22)>0 
order by length(t.v_description) desc


/*
13. Предоставить срез количества денежных переводов внутри контракта (контракт с которого = контракт на который) по дням.<br> _Результат_: день в формате dd.mm.yyyy и количество переводов в этот день.
*/

select to_char(t.dt_incoming, 'dd.mm.yyyy') as "Date", count(t.id_transfer_inst) as "Amount"
from fw_transfers t 
where t.id_contract_from=t.id_contract_to
group by to_char(t.dt_incoming, 'dd.mm.yyyy')
order by to_char(t.dt_incoming, 'dd.mm.yyyy') asc