/*
1. � ������� ������ ����� ���������� ������� ����������� ������ 2520123, ������������� �������.<br> _���������_: ���������� �������
*/

select count(*) 
from fw_process_log 
where (v_message like'%2520123%' and n_status=500);


/*
2. � ������� ������ ����� ����/����� ��������� ������� ����������� ������ 2520123, ������������� �������.<br> _���������_: ����/����� ������� � ������� dd.mon.yyyy � ����� ������. � �������� "������ ������" ������ id_log
*/

select to_char(t.dt_timestamp, 'dd.mon.yyyy') as "Date", t.id_log
from fw_process_log t 
where (t.dt_timestamp= 
(select max(t.dt_timestamp) 
from fw_process_log t 
where (v_message like'%2520123%' and n_status=500)));


/*
6. ������� ���� ����������� ��������� ����������� ������� � ������� ������ � ����� 2018.<br> _���������_: ������������ ����� - ���������� ����������� ���������
*/

select count(*)
from fw_process_log t
where (t.n_action=11 and t.dt_timestamp >= '01-mar-18' and t.dt_timestamp <= '31-mar-18')


/*
7. ������� ������������� ��������������� ������ ���� � ������� ������.<br> _���������_: ������������ ����� - ���������� ������������� ��������������� - sid = 9507885 (3 ����)
*/

select count(id_log) 
from fw_process_log
group by sid
having count(id_log)>1


/*
8. ����� ������������ � ��������� ���� ��� ����� �� ������� ������ ��� ���� ������������ = 11136.<br> _���������_: ����/����� � ����� ������������
*/

select distinct t.id_user, t.dt_timestamp
from fw_process_log t
where t.dt_timestamp=
(select max(t.dt_timestamp)
from fw_process_log
where t.id_user=11136);


/*
9. ������� ���������� ������� � ������� ������ �� �������. <br> _���������:_ �������� ������ � ���������� ������� ������ � ��
*/

select to_char(t.dt_timestamp, 'Month') as "Month", count(t.id_log) as "Amount"
from fw_process_log t
group by to_char(t.dt_timestamp, 'Month')


/*
10.������� ������� � ������� ������ �� �������� ��������� = "������" ��� �������� � ����� = 5 � ��������� 22.02.2018 - 02.03.2018 (�� ������� �������).
������� ����� ��� � ���������� ������� ���������<br> _���������_: ��� ����� - ����� ���������� ������� �� �������� � ���������� ������� � ���������� ����������.
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
11. �� ������� ��������� ����� ����������� ����� �������� � ����� ����������� � ������� � ��������� 10:00-12:00 14 ������� 2017 ��� �������, ��� ������� ������ ��� ��������� ����� ������� �����������.<br> _���������_: ������������ ����� - ����� ��������
*/

select min(t.n_sum)
from fw_transfers t
where (t.dt_incoming >= '2017-02-14 10.00.00.000000' and t.dt_incoming <= '2017-02-14 12.00.00.000000' 
and t.id_contract_from <> t.id_contract_to)


/*
12. �� �������� ������ ��� ��������� �������� ���� ���� ��� ����������� � ��������� ��������. ������������ ����� ������ � ������ ���� = 22 ��������. ����� ��������, ����������� � ������� �� ���������� �� ������ ������. <br> _���������_: �������� (�� ������� ���������� �������), ���� �������� �� ���������, ���������� �������� �����������, ������� �� ������� � ���� ������. ������ ������ ���� ������������ �� ���������� "�����������" �������� � ������� ��������.
*/

select t.id_contract_to, (length(t.v_description)-22) as "Excess" 
from fw_transfers t 
where (length(t.v_description)-22)>0 
order by length(t.v_description) desc


/*
13. ������������ ���� ���������� �������� ��������� ������ ��������� (�������� � �������� = �������� �� �������) �� ����.<br> _���������_: ���� � ������� dd.mm.yyyy � ���������� ��������� � ���� ����.
*/

select to_char(t.dt_incoming, 'dd.mm.yyyy') as "Date", count(t.id_transfer_inst) as "Amount"
from fw_transfers t 
where t.id_contract_from=t.id_contract_to
group by to_char(t.dt_incoming, 'dd.mm.yyyy')
order by to_char(t.dt_incoming, 'dd.mm.yyyy') asc