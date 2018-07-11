/*
1. Найти сумму последнего платежа на контракте с лицевым счетом 0102100000088207_MG1
 Результат: сумма платежа, дата платежа
*/

select max(t.dt_event), t.f_sum
from fw_contracts f 
join trans_external t 
on t.id_contract = f.id_contract_inst 
and f.v_ext_ident = '0102100000088207_MG1'
group by t.f_sum


/*
2. Создать отчет по департаментам контрактов. Выводить только те контракты, которые активны на текущий момент. 
 Результат: номер лицевого счета, дату регистрации контракта, наименование департамента (если у контракта не указан департамент, то выводить null)
*/

select f.v_ext_ident, f.dt_reg_event, d.v_name
from fw_contracts f 
left join fw_departments d
on d.id_department=f.id_department
where f.v_status='A'


/*
3. Найти департаменты, к которым привязано менее 2 контрактов
 Результат: наименования департаментов
*/

select d.v_name 
from fw_contracts f
join fw_departments d
on d.id_department=f.id_department
group by d.v_name
having count(*)<2


/*
4. Создать отчет по платежам за последний месяц в разрезе департаментов 
Результат: наименование департамента, сумма платежей в этом департаменте за последний месяц, количество платежей в этом департаменте за последний месяц, количество контрактов в этом департаменте.
*/

select d.v_name, sum(t.f_sum), sum(t.id_trans), count(f.id_contract_inst)
from fw_departments d
join fw_contracts f
on f.id_department=d.id_department
join trans_external t
on t.id_contract=f.id_contract_inst
and t.dt_event>=trunc(current_timestamp, 'month')
group by d.v_name


/*
5. Найти контракты, на которые в 2017 году было совершено более 3 платежей
Результат: номер лицевого счета, статус контракта, количество платежей на этом контракте за 2017 году
*/

select f.v_ext_ident, f.v_status, count(t.id_trans)
from fw_contracts f
join trans_external t
on t.id_contract=f.id_contract_inst
and f.dt_start <= current_timestamp
and f.dt_stop > current_timestamp
where (t.dt_event >='01.jan.2017' and t.dt_event<'01.jan.2018')
group by f.v_ext_ident, f.v_status
having count(t.id_trans)>3

/*
6. Найти такие контракты, на которых есть хотя бы один платеж в 2017 году
 Результат: Номер лицевого счета, статус контракта, департамент контракта (если департамент не указан то показать NULL)
*/

select f.v_ext_ident, f.v_status, d.v_name
from fw_contracts f
left join fw_departments d
on d.id_department=f.id_department
where f.dt_start <= current_timestamp
and f.dt_stop > current_timestamp
and exists
(select 1 from trans_external t
where t.id_contract = f.id_contract_inst
and (t.dt_event >='01.jan.2017' and t.dt_event<'01.jan.2018'))


/*
7. Найти такие департаменты, к которым не привязано ни одного контракта
Результат: наименование департаментов
/*

select distinct d.v_name
from fw_departments d
join fw_contracts f
on f.id_department!=d.id_department
order by d.v_name asc


/*
8. Вывести количество платежей на контрактах.
Результат: количество платежей, дата последнего платежа, номер лицевого счета контракта, имя пользователя, создавшего платеж.

По идее t.id_manager должен быть равен u.id_users, но совпадений нет, использовал t.id_manager
*/

select count(t.id_trans), max(t.dt_event), f.v_ext_ident, t.id_manager
from fw_contracts f
join trans_external t
on t.id_contract=f.id_contract_inst
group by f.v_ext_ident, t.id_manager 



/*
9. Какой был лицевой счет первого января 2016 у контракта, на который совершили платеж ID_TRANCE = 6397542
Результат: номер лицевого счета
*/

select f.v_ext_ident
from fw_contracts f
join trans_external t
on t.id_contract=f.id_contract_inst
and t.id_trans=6397542
and f.dt_start <= '01.jan.2016'
and f.dt_stop > '01.jan.2016'


/*
10.  Найти те контракты, у которых менялась валюта, например, была указана валюта рубль, потом появилась новая запись с валютой уже доллар
Результат: код контракта, лицевой счет, статус, наименование валюты Данные вывести на текущий день
*/

select distinct a.id_contract_inst
from fw_contracts a
join fw_contracts b
on a.id_contract_inst=b.id_contract_inst
and a.id_currency<>b.id_currency


/*
11. Найти контракты, у которых есть несколько записей со статусом "Расторгнут"
*/

select f.id_contract_inst, count(f.v_status)
from fw_contracts f
where f.v_status='c'
group by f.id_contract_inst
having count(f.v_status)>1

/*
ДЗ 1. Задача 3. Найти все номера заказов в таблице аудита, с которых начиналась загрузка порции заказов.<br> _Результат_: номера заказов
/*

select distinct ltrim(v_message, 'Загрузка порции заказов начиная с ') as "Orders"
from fw_process_log f
where f.n_action=12


/*
ДЗ 1. Задача 4. Найти количество уникальных номеров заказов в таблице аудита, с которых начиналась загрузка порции заказов.<br> _Результат:_ единственное число - количество заказов
*/

select count(distinct ltrim(v_message, 'Загрузка порции заказов начиная с ')) as "Amount of orders"
from fw_process_log f
where f.n_action=12


/*
ДЗ 1. Задача 5. Найти суммарную продолжительность продвижения заказов в долях секунды (доли секунды для "+000000000 00:00:00.063924000" = 63924000) в таблице аудита.<br> _Результат_: единственное число
*/

select sum(substr(v_message, 140))
from fw_process_log f
where f.n_action=11








