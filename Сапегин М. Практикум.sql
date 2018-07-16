/*
3. Найти всех абонентов, чья абонентская плата больше средней абонентской платы (пофилиально).
 Результат: Номер договора и величина АП
*/

select f.v_ext_ident, sum(c.n_cost_period) as SUM
from fw_contracts f 

join fw_services_cost c 
on c.id_contract_inst=f.id_contract_inst 
and c.dt_start <= current_timestamp 
and c.dt_stop > current_timestamp 
and f.v_status = 'A' 

left join fw_departments d 
on d.id_department=f.id_department 
and d.b_deleted=0 
where f.dt_start <= current_timestamp 
and f.dt_stop > current_timestamp
group by f.v_ext_ident

having sum(c.n_cost_period)> all

(select avg(a.sum) 
from 
(select f.v_ext_ident, sum(c.n_cost_period) as SUM, d.v_name 
from fw_contracts f 

join fw_services_cost c 
on c.id_contract_inst=f.id_contract_inst 
and c.dt_start <= current_timestamp 
and c.dt_stop > current_timestamp 
and f.v_status = 'A' 

left join fw_departments d 
on d.id_department=f.id_department 
and d.b_deleted=0 
where f.dt_start <= current_timestamp 
and f.dt_stop > current_timestamp 
group by f.v_ext_ident, d.v_name) a)