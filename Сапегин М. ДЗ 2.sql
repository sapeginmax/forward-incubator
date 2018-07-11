/*
1. ����� ����� ���������� ������� �� ��������� � ������� ������ 0102100000088207_MG1
 ���������: ����� �������, ���� �������
*/

select max(t.dt_event), t.f_sum
from fw_contracts f 
join trans_external t 
on t.id_contract = f.id_contract_inst 
and f.v_ext_ident = '0102100000088207_MG1'
group by t.f_sum


/*
2. ������� ����� �� ������������� ����������. �������� ������ �� ���������, ������� ������� �� ������� ������. 
 ���������: ����� �������� �����, ���� ����������� ���������, ������������ ������������ (���� � ��������� �� ������ �����������, �� �������� null)
*/

select f.v_ext_ident, f.dt_reg_event, d.v_name
from fw_contracts f 
left join fw_departments d
on d.id_department=f.id_department
where f.v_status='A'


/*
3. ����� ������������, � ������� ��������� ����� 2 ����������
 ���������: ������������ �������������
*/

select d.v_name 
from fw_contracts f
join fw_departments d
on d.id_department=f.id_department
group by d.v_name
having count(*)<2


/*
4. ������� ����� �� �������� �� ��������� ����� � ������� ������������� 
���������: ������������ ������������, ����� �������� � ���� ������������ �� ��������� �����, ���������� �������� � ���� ������������ �� ��������� �����, ���������� ���������� � ���� ������������.
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
5. ����� ���������, �� ������� � 2017 ���� ���� ��������� ����� 3 ��������
���������: ����� �������� �����, ������ ���������, ���������� �������� �� ���� ��������� �� 2017 ����
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
6. ����� ����� ���������, �� ������� ���� ���� �� ���� ������ � 2017 ����
 ���������: ����� �������� �����, ������ ���������, ����������� ��������� (���� ����������� �� ������ �� �������� NULL)
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
7. ����� ����� ������������, � ������� �� ��������� �� ������ ���������
���������: ������������ �������������
/*

select distinct d.v_name
from fw_departments d
join fw_contracts f
on f.id_department!=d.id_department
order by d.v_name asc


/*
8. ������� ���������� �������� �� ����������.
���������: ���������� ��������, ���� ���������� �������, ����� �������� ����� ���������, ��� ������������, ���������� ������.

�� ���� t.id_manager ������ ���� ����� u.id_users, �� ���������� ���, ����������� t.id_manager
*/

select count(t.id_trans), max(t.dt_event), f.v_ext_ident, t.id_manager
from fw_contracts f
join trans_external t
on t.id_contract=f.id_contract_inst
group by f.v_ext_ident, t.id_manager 



/*
9. ����� ��� ������� ���� ������� ������ 2016 � ���������, �� ������� ��������� ������ ID_TRANCE = 6397542
���������: ����� �������� �����
*/

select f.v_ext_ident
from fw_contracts f
join trans_external t
on t.id_contract=f.id_contract_inst
and t.id_trans=6397542
and f.dt_start <= '01.jan.2016'
and f.dt_stop > '01.jan.2016'


/*
10.  ����� �� ���������, � ������� �������� ������, ��������, ���� ������� ������ �����, ����� ��������� ����� ������ � ������� ��� ������
���������: ��� ���������, ������� ����, ������, ������������ ������ ������ ������� �� ������� ����
*/

select distinct a.id_contract_inst
from fw_contracts a
join fw_contracts b
on a.id_contract_inst=b.id_contract_inst
and a.id_currency<>b.id_currency


/*
11. ����� ���������, � ������� ���� ��������� ������� �� �������� "����������"
*/

select f.id_contract_inst, count(f.v_status)
from fw_contracts f
where f.v_status='c'
group by f.id_contract_inst
having count(f.v_status)>1

/*
�� 1. ������ 3. ����� ��� ������ ������� � ������� ������, � ������� ���������� �������� ������ �������.<br> _���������_: ������ �������
/*

select distinct ltrim(v_message, '�������� ������ ������� ������� � ') as "Orders"
from fw_process_log f
where f.n_action=12


/*
�� 1. ������ 4. ����� ���������� ���������� ������� ������� � ������� ������, � ������� ���������� �������� ������ �������.<br> _���������:_ ������������ ����� - ���������� �������
*/

select count(distinct ltrim(v_message, '�������� ������ ������� ������� � ')) as "Amount of orders"
from fw_process_log f
where f.n_action=12


/*
�� 1. ������ 5. ����� ��������� ����������������� ����������� ������� � ����� ������� (���� ������� ��� "+000000000 00:00:00.063924000" = 63924000) � ������� ������.<br> _���������_: ������������ �����
*/

select sum(substr(v_message, 140))
from fw_process_log f
where f.n_action=11








