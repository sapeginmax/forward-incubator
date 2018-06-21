

create table SCD_SIGNERS
(
  v_fio                VARCHAR2(255),
  id_manager           NUMBER
);
comment on table SCD_SIGNERS
  is 'Таблица подписантов';
  comment on column SCD_SIGNERS.id_manager
  is 'Идентификатор пользователя';
  comment on column SCD_SIGNERS.v_fio
  is 'ФИО подписанта';
  
  create table FW_CLIENTS
(
  id_rec                 NUMBER not null,
  id_client_inst         NUMBER(10),
  dt_start               TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  dt_stop                TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  v_long_title           VARCHAR2(255 CHAR)
);
comment on table FW_CLIENTS
  is 'Таблица клиентов';
  comment on column FW_CLIENTS.id_rec
  is 'Уникальный код записи в рамках всей системы';
  comment on column FW_CLIENTS.id_client_inst
  is 'Идентификатор пользователя';
comment on column FW_CLIENTS.dt_start
  is 'Дата начала действия записи';
comment on column FW_CLIENTS.dt_stop
  is 'Дата конца действия записи';
  comment on column FW_CLIENTS.v_long_title
  is 'Идентификатор пользователя';
  comment on column FW_CLIENTS.v_long_title
  is 'Полное наименование контрагента';

create table CI_USERS
(
  id_user               NUMBER(10) not null,
  v_username            VARCHAR2(255) not null,
  v_description         VARCHAR2(255),
  v_status              CHAR(1),
  dt_created            TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  dt_modified           TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  id_client_inst        NUMBER(10)
);
  
comment on table CI_USERS
  is 'Каталог пользователей системы';
-- Add comments to the columns 
comment on column CI_USERS.id_user
  is 'Код пользователя';
comment on column CI_USERS.v_username
  is 'Логин';
comment on column CI_USERS.v_description
  is 'Описание пользователя (Ф.И.О.)';
comment on column CI_USERS.dt_created
  is 'Дата создания пользователя';
comment on column CI_USERS.dt_modified
  is 'Дата последнего изменения данных пользователя';
comment on column CI_USERS.v_status
  is 'Статус пользователя (активен, заблокирован)';
comment on column CI_USERS.id_client_inst
  is 'Идентификатор пользователя';
             
  create table SCD_EQUIP_KITS
(
  id_equip_kits_inst NUMBER not null,
  id_equip_kits_type NUMBER,
  v_ext_ident        VARCHAR2(32),
  dt_start           TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  id_rec             NUMBER not null,
  id_status          NUMBER not null,
  id_contract_inst   NUMBER,
  id_dealer_client   NUMBER,
  dt_stop            TIMESTAMP(0) WITH LOCAL TIME ZONE,
  v_cas_id           VARCHAR2(100)
);
comment on table SCD_EQUIP_KITS
  is 'Комплекты оборудования';
-- Add comments to the columns 
comment on column SCD_EQUIP_KITS.id_equip_kits_inst
  is 'Идентификатор';
comment on column SCD_EQUIP_KITS.id_equip_kits_type
  is 'Тип комплекта';
comment on column SCD_EQUIP_KITS.v_ext_ident
  is 'Серийный номер';
comment on column SCD_EQUIP_KITS.dt_start
  is 'Дата начала действия записи';
comment on column SCD_EQUIP_KITS.dt_stop
  is 'Дата конца действия записи';
comment on column SCD_EQUIP_KITS.id_status
  is 'Статус';
comment on column SCD_EQUIP_KITS.id_contract_inst
  is 'Дилер';
comment on column SCD_EQUIP_KITS.id_dealer_client
  is 'Клиент дилера, к которому привязан комплект';
comment on column SCD_EQUIP_KITS.v_cas_id
  is 'cas id';  
  
  create table SCD_CONTRACTS
(
  id_contract_inst   NUMBER not null,
  b_agency     NUMBER
);
  comment on table SCD_CONTRACTS
  is 'Подробности по контрактам';
-- Add comments to the columns 
comment on column SCD_CONTRACTS.id_contract_inst
  is 'Контракт';
comment on column SCD_CONTRACTS.b_agency
  is 'Признак отношения к агентской сети. 1 - является агентской сетью, 0 - не является агентской сетью';  

  
create table SCD_EQUIPMENT_STATUS
(
  id_equipment_status NUMBER(10) not null,
  v_name              VARCHAR2(128),
  v_descr             VARCHAR2(255),
  b_deleted           NUMBER(1) default 0 not null,
  v_ext_ident         VARCHAR2(255)
);


comment on table SCD_EQUIPMENT_STATUS
  is 'Справочник статусов оборудования';
-- Add comments to the columns 
comment on column SCD_EQUIPMENT_STATUS.id_equipment_status
  is 'Идентификатор';
comment on column SCD_EQUIPMENT_STATUS.v_name
  is 'Наименование';
comment on column SCD_EQUIPMENT_STATUS.v_descr
  is 'Описание';
comment on column SCD_EQUIPMENT_STATUS.b_deleted
  is 'Признак удаления';
comment on column SCD_EQUIPMENT_STATUS.v_ext_ident
  is 'Внешний идентификатор';
  
create table FW_CONTRACTS
(
  id_contract_inst         NUMBER(10) not null,
  dt_stop                  TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  dt_start                 TIMESTAMP(0) WITH LOCAL TIME ZONE not null,
  id_rec                   NUMBER,
  id_client_inst           NUMBER(10) not null,
  id_currency              NUMBER(10),
  v_status                 CHAR(1) default 'A' not null,
  dt_reg_event             TIMESTAMP(0) WITH LOCAL TIME ZONE,
  v_description            VARCHAR2(255),
  id_department            NUMBER(10),
  id_category              NUMBER(10),
  v_ext_ident              VARCHAR2(150)
);
-- Add comments to the table 
comment on table FW_CONTRACTS
  is 'Контракты';
-- Add comments to the columns 
comment on column FW_CONTRACTS.id_contract_inst
  is 'Идентификатор контракта';
comment on column FW_CONTRACTS.dt_stop
  is 'Дата конца действия записи';
comment on column FW_CONTRACTS.dt_start
  is 'Дата начала действия записи';
comment on column FW_CONTRACTS.id_rec
  is 'Идентификатор записи';
comment on column FW_CONTRACTS.id_client_inst
  is 'Идентификатор клиента';
comment on column FW_CONTRACTS.v_status
  is 'Статус
   А активен,
   B заблокирован,
   С расторжен,
   D удален';
comment on column FW_CONTRACTS.dt_reg_event
  is 'Дата регистрации';
comment on column FW_CONTRACTS.v_description
  is 'Описание контракта';
comment on column FW_CONTRACTS.id_department
  is 'Код департамента из миграционной таблицы MIGR_DEPARTMENTS';
comment on column FW_CONTRACTS.id_category
  is 'Код котегории контракта';
comment on column FW_CONTRACTS.v_ext_ident
  is 'Внешний идентификатор контракта';  
  
  
  create table SCD_EQUIPMENT_KITS_TYPE
(
  id_equip_kits_type NUMBER(10) not null,
  v_name             VARCHAR2(255) not null,
  dt_start           TIMESTAMP(0) WITH LOCAL TIME ZONE,
  dt_stop            TIMESTAMP(0) WITH LOCAL TIME ZONE,
  id_rec             NUMBER
);
  comment on table SCD_EQUIPMENT_KITS_TYPE
  is 'Типы комплектов оборудования';
-- Add comments to the columns 
comment on column SCD_EQUIPMENT_KITS_TYPE.id_equip_kits_type
  is 'Первичный ключ';
comment on column SCD_EQUIPMENT_KITS_TYPE.v_name
  is 'Наименование';
comment on column SCD_EQUIPMENT_KITS_TYPE.dt_start
  is 'Дата начала действия записи';
comment on column SCD_EQUIPMENT_KITS_TYPE.dt_stop
  is 'Дата окончания действия записи';
  
  
alter session set NLS_NUMERIC_CHARACTERS='.,';
alter session set NLS_CALENDAR='GREGORIAN';
alter session set NLS_DATE_FORMAT='YYYY-MM-DD';
alter session set NLS_TIME_FORMAT='HH24:MI:SSXFF';
alter session set NLS_TIMESTAMP_FORMAT='YYYY-MM-DD HH24:MI:SSXFF';
alter session set NLS_TIME_TZ_FORMAT='HH24:MI:SSXFF TZR';
alter session set NLS_TIMESTAMP_TZ_FORMAT='YYYY-MM-DD HH24:MI:SSXFF TZR';

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (1, 'Склад', 'На складе оператора', 0, 'STORE');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (2, 'Дилер', 'Передано дилеру', 0, 'DEALER');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (3, 'Аренда', 'Выдан в аренду абоненту', 0, 'LEASE');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (4, 'Резерв', 'Резерв на складе оператора', 0, 'RESERVED');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (5, 'Неисправно', null, 0, 'BROKEN');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (6, 'Утеряно', null, 0, 'LOST');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (22, 'Продано', null, 0, 'REDEEM');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (21, 'Возврат', null, 0, 'RETURN');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (41, 'Ожидает возврата', 'Ожидает возврата', 0, 'WAIT_RETURN');


insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4257, '3713', 'Мобильные Системы, ООО', 'A', '2015-12-07 12:55:43', '2015-12-07 12:55:40', 3713);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4943, '4406', 'Петрина Людмила Николаевна, ИП', 'A', '2016-03-03 13:20:47', '2016-03-03 13:20:34', 4406);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5166, '4664', 'Мир Цифровых Систем', 'A', '2016-03-25 15:24:44', '2016-03-25 15:24:28', 4664);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4772, '4204', 'ИП Исаенко Дмитрий Сергеевич', 'A', '2016-02-24 11:09:42', '2016-02-24 16:55:59', 4204);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6159, '5528', 'АПЦ_Бараковских Олег Александрович', 'A', '2016-10-29 09:18:58', '2016-10-29 09:18:05', 5528);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6396, '5756', 'АПЦ_Диваев Артур Фаритович', 'A', '2016-12-16 16:28:58', '2016-12-16 16:28:58', 5756);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7677, '6920', 'АПЦ_Вершинин Александр Олегович', 'A', '2017-03-10 16:04:15', '2017-03-10 16:04:03', 6920);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6737, '6008', 'АПЦ_Байтимиров Ильдар Исмаилович', 'A', '2017-01-25 08:39:46', '2017-01-25 08:39:41', 6008);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6738, '6009', 'АПЦ_Бердышев Александр Викторович', 'A', '2017-01-25 09:17:03', '2017-01-25 09:16:58', 6009);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7466, '6734', 'АПЦ_Юрасов Денис Евгеньевич', 'A', '2017-02-28 14:39:14', '2017-02-28 14:39:04', 6734);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7202, '6471', 'АПЦ_Нурмухаметов Айнур Наилевич', 'A', '2017-02-14 15:02:35', '2017-02-14 15:02:28', 6471);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6003, '5363', 'Стручков Алексей Олегович, ИП', 'A', '2016-10-11 06:50:57', '2016-10-11 11:34:20', 5363);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (6819, '6100', 'АПЦ_Елыжев Дмитрий Станиславович', 'A', '2017-01-30 11:01:42', '2017-01-30 11:01:36', 6100);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5252, '4757', 'Березина Валентина Павловна', 'A', '2016-04-11 10:27:07', '2016-04-11 10:26:49', 4757);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5840, '5213', 'Гружевский Игорь Рафаилович', 'A', '2016-08-22 13:37:42', '2016-08-22 14:32:37', 5213);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4200, '3645', 'Ибрагимов Салим Касымович ИП', 'A', '2015-11-24 15:04:11', '2015-11-24 15:04:09', 3645);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5771, '5152', 'Гололобов Андрей Алексеевич ИП', 'A', '2016-07-28 07:56:29', '2016-07-28 11:16:55', 5152);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (2758, '2405', 'Индивидуальный предприниматель Верховых Александр Александрович', 'A', '2014-11-25 10:16:34', '2014-11-25 10:16:34', 2405);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4802, '4239', 'Белоусов Алексей Александрович ИП', 'A', '2016-02-25 11:42:58', '2016-02-25 11:42:45', 4239);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4179, '3621', 'Яшкин Вячеслав Дэмбэрэлович, ИП', 'A', '2015-11-19 03:42:58', '2015-11-19 03:42:56', 3621);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5384, '4882', 'Рангина Татьяна Валерьевна ИП', 'A', '2016-05-12 06:50:16', '2016-05-12 12:11:06', 4882);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5150, '4646', 'Смирнов Василий Александрович ИП', 'A', '2016-03-24 11:38:23', '2016-03-24 11:38:07', 4646);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5243, '4749', 'Захаров Алексей Викторович', 'A', '2016-04-08 11:35:48', '2016-04-08 11:35:30', 4749);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (3847, '3272', 'Цифрогид Регион ООО', 'A', '2015-09-23 15:27:26', '2015-09-23 15:36:55', 3272);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4491, '3907', 'Хисаметдинов Ринат Раисович, ИП', 'B', '2016-01-28 15:38:33', '2018-05-16 15:17:40', 3907);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (8571, '7776', 'АПЦ_Ларин Леонид Леонидович', 'A', '2017-04-27 06:06:28', '2017-04-27 06:06:10', 7776);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7175, '6444', 'АПЦ_Чернигов Константин Анатольевич', 'A', '2017-02-14 04:20:08', '2017-02-14 04:20:01', 6444);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (5596, '5025', 'Юг_МГТС', 'A', '2016-06-15 17:07:38', '2016-06-28 15:36:02', 5025);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7237, '6504', 'Аюшеев Александр Валерьевич ИП', 'A', '2017-02-16 03:41:43', '2017-02-16 03:41:35', 6504);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (4954, '4422', 'Лысенко Ольга Валерьевна, ИП', 'A', '2016-03-04 10:12:22', '2016-03-04 10:12:08', 4422);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7079, '6359', 'АПЦ_Бежин Валерий Михпйлович', 'A', '2017-02-09 08:24:37', '2017-02-09 08:24:30', 6359);

insert into ci_users (ID_USER, V_USERNAME, V_DESCRIPTION, V_STATUS, DT_CREATED, DT_MODIFIED, ID_CLIENT_INST)
values (7536, '6803', 'АПЦ_Минин Степан Васильевич', 'A', '2017-03-03 11:48:56', '2017-03-03 11:48:46', 6803);



insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1166416, 3713, '2015-12-07 12:55:43', '2016-05-13 20:00:02', 'Мобильные Системы, ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1688125, 3713, '2016-05-13 20:00:02', '2016-09-06 13:44:06', 'Мобильные Системы, ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2578562, 3713, '2016-09-06 13:44:06', '2017-05-24 17:24:28', 'Мобильные Системы ООО (ИНН 2315178457)');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4292438, 3713, '2017-05-24 17:24:28', '2018-04-04 14:49:38', 'Мобильные Системы ООО (ИНН 2315178457)');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9495708, 3713, '2018-04-04 14:49:38', '2500-01-01 00:00:00', 'Мобильные Системы ООО (ИНН 2315178457)');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1398009, 4406, '2016-03-03 13:20:47', '2016-08-25 09:13:52', 'Петрина Людмила Николаевна, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2533862, 4406, '2016-08-25 09:13:52', '2017-05-25 14:45:18', 'Петрина Людмила Николаевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4298620, 4406, '2017-05-25 14:45:18', '2018-04-05 09:50:43', 'Петрина Людмила Николаевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9503156, 4406, '2018-04-05 09:50:43', '2500-01-01 00:00:00', 'Петрина Людмила Николаевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1461281, 4664, '2016-03-25 15:24:44', '2016-08-19 11:44:53', 'Мир Цифровых Систем');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2512435, 4664, '2016-08-19 11:44:53', '2017-05-25 18:09:45', 'Мир Цифровых Систем ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4313066, 4664, '2017-05-25 18:09:45', '2018-04-05 11:19:57', 'Мир Цифровых Систем ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9505283, 4664, '2018-04-05 11:19:57', '2500-01-01 00:00:00', 'Мир Цифровых Систем ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2512807, 4204, '2016-08-19 12:29:07', '2018-04-04 17:39:05', 'Исаенко Дмитрий Сергеевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1446060, 4204, '2016-03-21 15:29:44', '2016-08-19 12:29:07', 'Исаенко Дмитрий Сергеевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1376511, 4204, '2016-02-24 11:09:42', '2016-03-21 15:29:44', 'ИП Исаенко Дмитрий Сергеевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9498338, 4204, '2018-04-04 17:39:05', '2500-01-01 00:00:00', 'Исаенко Дмитрий Сергеевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2835385, 5528, '2016-11-08 11:19:02', '2017-11-24 09:51:36', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2802030, 5528, '2016-10-29 09:18:58', '2016-11-08 11:19:02', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6359059, 5528, '2017-11-24 09:51:36', '2018-01-12 15:23:35', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (7791405, 5528, '2018-01-12 15:23:35', '2018-04-23 12:12:37', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9984206, 5528, '2018-05-04 14:28:13', '2500-01-01 00:00:00', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9761106, 5528, '2018-04-23 12:12:37', '2018-05-04 14:28:13', 'АПЦ_Бараковских Олег Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3109828, 5756, '2016-12-16 16:28:58', '2017-11-28 08:28:11', 'АПЦ_Диваев Артур Фаритович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6432230, 5756, '2017-11-28 08:28:11', '2018-01-12 08:31:18', 'АПЦ_Диваев Артур Фаритович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (8989368, 5756, '2018-03-02 10:57:40', '2018-04-05 15:21:26', 'АПЦ_Диваев Артур Фаритович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (7769928, 5756, '2018-01-12 08:31:18', '2018-03-02 10:57:40', 'АПЦ_Диваев Артур Фаритович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9510323, 5756, '2018-04-05 15:21:26', '2500-01-01 00:00:00', 'АПЦ_Диваев Артур Фаритович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3776217, 6920, '2017-03-10 16:04:15', '2018-04-05 16:04:28', 'АПЦ_Вершинин Александр Олегович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511011, 6920, '2018-04-05 16:04:28', '2500-01-01 00:00:00', 'АПЦ_Вершинин Александр Олегович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3476336, 6008, '2017-01-25 08:39:46', '2018-04-05 16:36:19', 'АПЦ_Байтимиров Ильдар Исмаилович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511774, 6008, '2018-04-05 16:36:19', '2500-01-01 00:00:00', 'АПЦ_Байтимиров Ильдар Исмаилович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3477145, 6009, '2017-01-25 09:17:03', '2018-04-05 16:36:45', 'АПЦ_Бердышев Александр Викторович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511789, 6009, '2018-04-05 16:37:00', '2500-01-01 00:00:00', 'АПЦ_Бердышев Александр Викторович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511784, 6009, '2018-04-05 16:36:45', '2018-04-05 16:37:00', 'АПЦ_Бердышев Александр Викторович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3723711, 6734, '2017-02-28 14:39:14', '2017-11-29 08:29:20', 'АПЦ_Юрасов Денис Евгеньевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6464635, 6734, '2017-11-29 08:29:20', '2018-04-05 15:08:17', 'АПЦ_Юрасов Денис Евгеньевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9510048, 6734, '2018-04-05 15:08:17', '2500-01-01 00:00:00', 'АПЦ_Юрасов Денис Евгеньевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3639643, 6471, '2017-02-14 15:02:35', '2018-04-05 16:13:04', 'АПЦ_Нурмухаметов Айнур Наилевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (10303252, 6471, '2018-05-18 13:50:01', '2500-01-01 00:00:00', 'АПЦ_Нурмухаметов Айнур Наилевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511237, 6471, '2018-04-05 16:13:04', '2018-05-18 13:50:01', 'АПЦ_Нурмухаметов Айнур Наилевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2722785, 5363, '2016-10-11 06:50:57', '2017-01-13 15:00:16', 'Стручков Алексей Олегович, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3393337, 5363, '2017-01-13 15:00:16', '2017-05-26 15:19:49', 'Стручков Алексей Олегович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4319399, 5363, '2017-05-26 15:19:49', '2018-04-05 14:37:11', 'Стручков Алексей Олегович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9508959, 5363, '2018-04-05 14:37:11', '2500-01-01 00:00:00', 'Стручков Алексей Олегович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3516804, 6100, '2017-01-30 11:01:42', '2017-11-24 10:45:37', 'АПЦ_Елыжев Дмитрий Станиславович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6425547, 6100, '2017-11-27 17:34:52', '2018-04-05 14:11:49', 'АПЦ_Елыжев Дмитрий Станиславович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6360394, 6100, '2017-11-24 10:45:37', '2017-11-27 17:34:52', 'АПЦ_Елыжев Дмитрий Станиславович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9508408, 6100, '2018-04-05 14:11:49', '2500-01-01 00:00:00', 'АПЦ_Елыжев Дмитрий Станиславович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1523734, 4757, '2016-04-12 07:07:01', '2016-05-30 13:43:34', 'Березина Валентина Павловна, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1520935, 4757, '2016-04-11 10:27:07', '2016-04-12 07:07:01', 'Березина Валентина Павловна');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1811307, 4757, '2016-05-30 13:43:34', '2016-09-07 08:31:38', 'Березина Валентина Павловна, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2580924, 4757, '2016-09-07 08:31:38', '2018-04-05 11:18:26', 'Березина Валентина Павловна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9505245, 4757, '2018-04-05 11:18:26', '2500-01-01 00:00:00', 'Березина Валентина Павловна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2522501, 5213, '2016-08-22 13:37:42', '2016-09-14 11:43:07', 'Гружевский Игорь Рафаилович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2608517, 5213, '2016-09-14 11:43:07', '2017-05-26 15:26:59', 'Гружевский Игорь Рафаилович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4319500, 5213, '2017-05-26 15:26:59', '2018-04-05 12:53:35', 'Гружевский Игорь Рафаилович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9507407, 5213, '2018-04-05 12:53:35', '2500-01-01 00:00:00', 'Гружевский Игорь Рафаилович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1098902, 3645, '2015-11-24 15:04:11', '2015-11-24 15:06:16', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1098912, 3645, '2015-11-24 15:06:16', '2017-05-04 13:58:55', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4091927, 3645, '2017-05-04 13:58:55', '2017-05-04 13:59:16', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4091947, 3645, '2017-05-04 14:02:14', '2017-05-24 17:06:49', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4091929, 3645, '2017-05-04 13:59:16', '2017-05-04 14:02:14', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4292314, 3645, '2017-05-24 17:06:49', '2018-04-04 13:04:35', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9493868, 3645, '2018-04-04 13:04:35', '2500-01-01 00:00:00', 'Ибрагимов Салим Касымович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2361583, 5152, '2016-07-28 07:56:29', '2018-04-05 12:29:46', 'Гололобов Андрей Алексеевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9506847, 5152, '2018-04-05 12:29:46', '2500-01-01 00:00:00', 'Гололобов Андрей Алексеевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (468117, 2405, '2014-11-25 10:16:34', '2014-12-15 14:32:33', 'Индивидуальный предприниматель Верховых Александр Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (468673, 2405, '2014-12-15 14:32:33', '2015-06-22 15:45:40', 'ИП Верховых Александр Александрович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (651819, 2405, '2015-06-22 15:45:40', '2015-06-22 17:47:33', 'Верховых Александр Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (653416, 2405, '2015-06-22 17:47:33', '2017-05-10 11:34:52', 'Верховых Александр Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4117775, 2405, '2017-05-10 11:34:52', '2018-04-03 18:32:46', 'Верховых Александр Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9485685, 2405, '2018-04-03 18:32:46', '2500-01-01 00:00:00', 'Верховых Александр Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1379811, 4239, '2016-02-25 11:46:01', '2016-03-15 07:32:28', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1423462, 4239, '2016-03-15 07:34:26', '2017-03-03 08:29:43', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1379795, 4239, '2016-02-25 11:42:58', '2016-02-25 11:46:01', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1423458, 4239, '2016-03-15 07:32:28', '2016-03-15 07:34:26', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3738481, 4239, '2017-03-03 08:29:43', '2017-10-27 05:51:38', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (5886219, 4239, '2017-10-27 05:51:38', '2017-12-04 09:31:32', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6641946, 4239, '2017-12-04 09:31:32', '2018-04-04 17:56:47', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9498773, 4239, '2018-04-04 17:56:47', '2500-01-01 00:00:00', 'Белоусов Алексей Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1088758, 3621, '2015-11-19 03:42:58', '2015-11-19 03:47:18', 'Яшкин Вячеслав Дэмбэрэлович, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1088766, 3621, '2015-11-19 03:47:18', '2016-09-07 09:03:05', 'Яшкин Вячеслав Дэмбэрэлович, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4289597, 3621, '2017-05-24 12:32:34', '2018-04-04 14:45:35', 'Яшкин Вячеслав Дэмбэрэлович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3504282, 3621, '2017-01-27 16:33:02', '2017-05-24 12:32:34', 'Яшкин Вячеслав Дэмбэрэлович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2581098, 3621, '2016-09-07 09:03:05', '2017-01-27 16:33:02', 'Яшкин Вячеслав Дэмбэрэлович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9495670, 3621, '2018-04-04 14:45:35', '2500-01-01 00:00:00', 'Яшкин Вячеслав Дэмбэрэлович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1673359, 4882, '2016-05-12 06:50:16', '2017-05-26 15:00:33', 'Рангина Татьяна Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4319250, 4882, '2017-05-26 15:00:33', '2018-04-05 11:31:20', 'Рангина Татьяна Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9505623, 4882, '2018-04-05 11:31:20', '2500-01-01 00:00:00', 'Рангина Татьяна Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1453573, 4646, '2016-03-24 11:38:23', '2018-04-05 11:13:32', 'Смирнов Василий Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9505098, 4646, '2018-04-05 11:13:32', '2500-01-01 00:00:00', 'Смирнов Василий Александрович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1515232, 4749, '2016-04-08 11:35:48', '2016-08-19 12:15:04', 'Захаров Алексей Викторович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2512711, 4749, '2016-08-19 12:15:04', '2017-05-24 14:22:26', 'Захаров Алексей Викторович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4290596, 4749, '2017-05-24 14:22:26', '2018-04-05 11:16:02', 'Захаров Алексей Викторович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9505167, 4749, '2018-04-05 11:16:02', '2500-01-01 00:00:00', 'Захаров Алексей Викторович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (982880, 3272, '2015-09-23 15:27:26', '2016-03-22 13:37:08', 'Цифрогид Регион ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1447971, 3272, '2016-03-22 13:37:08', '2017-07-17 14:42:02', 'Цифрогид Регион ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4765701, 3272, '2017-07-17 14:42:02', '2018-04-04 12:20:08', 'Цифрогид Регион ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9492537, 3272, '2018-04-04 12:20:08', '2500-01-01 00:00:00', 'Цифрогид Регион ООО');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1305094, 3907, '2016-01-28 15:38:33', '2016-01-28 15:42:27', 'Хисаметдинов Ринат Раисович, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1305101, 3907, '2016-01-28 15:42:27', '2016-08-25 09:11:33', 'Хисаметдинов Ринат Раисович, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2533849, 3907, '2016-08-25 09:11:33', '2018-04-04 14:56:34', 'Хисаметдинов Ринат Раисович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9495847, 3907, '2018-04-04 14:56:34', '2500-01-01 00:00:00', 'Хисаметдинов Ринат Раисович ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4036317, 7776, '2017-04-27 06:06:28', '2018-03-21 12:21:44', 'АПЦ_Ларин Леонид Леонидович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9295577, 7776, '2018-03-21 12:21:44', '2500-01-01 00:00:00', 'АПЦ_Ларин Леонид Леонидович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3634812, 6444, '2017-02-14 04:20:08', '2018-03-21 12:18:52', 'АПЦ_Чернигов Константин Анатольевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9295530, 6444, '2018-03-21 12:18:52', '2018-05-10 12:57:59', 'АПЦ_Чернигов Константин Анатольевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (10116348, 6444, '2018-05-10 12:57:59', '2500-01-01 00:00:00', 'АПЦ_Чернигов Константин Анатольевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1976485, 5025, '2016-06-15 17:07:38', '2017-02-15 13:33:19', 'Юг_МГТС');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3648608, 5025, '2017-02-15 16:16:36', '2500-01-01 00:00:00', 'Монтажник_Юг_МГТС');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3646272, 5025, '2017-02-15 13:33:19', '2017-02-15 16:16:36', 'Монтажни_Юг_МГТС');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3651091, 6504, '2017-02-16 03:41:43', '2018-04-05 14:00:50', 'Аюшеев Александр Валерьевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9508146, 6504, '2018-04-05 14:00:50', '2500-01-01 00:00:00', 'Аюшеев Александр Валерьевич ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1399787, 4422, '2016-03-04 10:12:22', '2016-03-04 10:32:32', 'Лысенко Ольга Валерьевна, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (1399918, 4422, '2016-03-04 10:32:32', '2016-09-06 12:43:44', 'Лысенко Ольга Валерьевна, ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3760519, 4422, '2017-03-07 15:07:37', '2017-05-03 15:31:06', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4084605, 4422, '2017-05-03 15:31:06', '2017-05-24 12:22:20', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (4289469, 4422, '2017-05-24 12:22:20', '2018-04-05 10:06:28', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (2578094, 4422, '2016-09-06 12:43:44', '2017-03-07 15:07:37', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9511721, 4422, '2018-04-05 16:32:49', '2500-01-01 00:00:00', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9503386, 4422, '2018-04-05 10:06:28', '2018-04-05 16:32:49', 'Лысенко Ольга Валерьевна ИП');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3605625, 6359, '2017-02-09 08:27:17', '2018-04-05 16:01:37', 'АПЦ_Бежин Валерий Михайлович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3605229, 6359, '2017-02-09 08:24:37', '2017-02-09 08:27:17', 'АПЦ_Бежин Валерий Михпйлович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9510962, 6359, '2018-04-05 16:01:37', '2500-01-01 00:00:00', 'АПЦ_Бежин Валерий Михайлович');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (3740162, 6803, '2017-03-03 11:48:56', '2017-11-24 11:57:17', 'АПЦ_Минин Степан Васильевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (6363063, 6803, '2017-11-24 11:57:17', '2018-04-09 13:04:51', 'АПЦ_Минин Степан Васильевич');

insert into fw_clients (ID_REC, ID_CLIENT_INST, DT_START, DT_STOP, V_LONG_TITLE)
values (9556331, 6803, '2018-04-09 13:04:51', '2500-01-01 00:00:00', 'АПЦ_Минин Степан Васильевич');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2017-08-04 11:29:53', '2017-06-30 07:23:03', 4620165, 2405, null, 'A', '2015-04-06 01:00:00', null, 2343, 2000, 'D150201977-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2500-01-01 00:00:00', '2017-08-04 11:29:53', 4923100, 2405, null, 'A', '2015-04-06 01:00:00', null, 2343, 2000, 'D150201977-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2017-06-30 07:23:03', '2017-06-28 17:59:06', 4610114, 2405, null, 'A', '2015-04-06 01:00:00', null, 2343, 2000, 'D150201977-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2017-06-28 17:59:06', '2017-06-26 12:02:05', 4583293, 2405, null, 'A', '2015-04-06 01:00:00', null, 2343, 2000, 'D150201977-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2017-06-26 12:02:05', '2015-12-07 09:15:48', 1165248, 2405, null, 'A', '2014-11-10 21:00:00', null, 2343, 2000, 'D140677660-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2015-12-07 09:15:48', '2015-01-13 10:15:06', 469150, 2405, null, 'A', '2014-11-10 21:00:00', null, 2343, 2000, 'D140677660-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2015-01-13 10:15:06', '2015-01-13 10:15:02', 469149, 2405, null, 'A', '2014-11-10 21:00:00', null, 2343, 2000, 'D140677660-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (2343, '2015-01-13 10:15:02', '2014-11-25 10:21:06', 468119, 2405, 1, 'A', '2014-11-10 21:00:00', null, 2343, 2000, 'D140677660-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3122, '2500-01-01 00:00:00', '2018-01-12 12:57:40', 7787156, 3272, null, 'A', '2015-08-21 01:00:00', null, 3103, 2000, 'D150445310-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3122, '2018-01-12 12:57:40', '2017-07-03 12:33:09', 4656023, 3272, null, 'A', '2015-08-21 01:00:00', null, 3103, 2000, 'D150445310-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3122, '2017-07-03 12:33:09', '2015-09-23 15:29:36', 982896, 3272, null, 'A', '2015-08-20 22:00:00', null, 3103, 2000, 'D150445310-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3387, '2017-06-06 14:50:54', '2017-05-18 07:02:02', 4202957, 3621, null, 'A', '2015-11-09 03:47:21', null, 3368, 2000, 'D150573283-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3387, '2500-01-01 00:00:00', '2017-11-08 04:48:01', 6041768, 3621, null, 'A', '2015-11-09 03:47:21', null, 3368, 2000, 'D150573283-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3387, '2017-11-08 04:48:01', '2017-06-06 14:50:54', 4393274, 3621, null, 'A', '2015-11-09 03:47:21', null, 3368, 2000, 'D150573283-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3387, '2017-05-18 07:02:02', '2016-05-12 07:34:26', 1673498, 3621, null, 'A', '2015-11-09 03:47:21', null, 3368, 2000, 'D150573283-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3387, '2016-05-12 07:34:26', '2015-11-19 03:48:17', 1088768, 3621, null, 'A', '2015-11-09 03:47:21', null, 3368, 2000, 'D150573283-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3407, '2500-01-01 00:00:00', '2017-07-03 11:37:36', 4654865, 3645, null, 'A', '2015-09-01 01:00:00', null, 3387, 2000, 'D150577489-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3407, '2017-07-03 11:37:36', '2016-06-17 11:26:28', 1996504, 3645, null, 'A', '2015-11-24 15:06:51', null, 3387, 2000, 'D150577489-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3407, '2016-06-17 11:26:28', '2016-01-18 12:01:44', 1278588, 3645, null, 'A', '2015-11-24 15:06:51', null, 3387, 2000, 'D150577489-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3407, '2016-01-18 12:01:44', '2015-11-24 15:07:01', 1098917, 3645, null, 'A', '2015-11-24 15:06:51', null, 3387, 2000, 'D150577489-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3468, '2500-01-01 00:00:00', '2016-01-15 16:42:05', 1275599, 3713, null, 'A', '2015-09-01 01:00:00', null, 3441, 2000, 'D150586064-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3468, '2016-01-15 16:42:05', '2015-12-07 13:01:10', 1166458, 3713, null, 'A', '2015-09-01 01:00:00', null, 3441, 2000, 'D150586064-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3632, '2016-02-17 08:21:22', '2016-01-28 15:41:01', 1305097, 3907, null, 'A', '2015-09-01 01:00:00', null, 3598, 2000, 'D150666480-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3632, '2500-01-01 00:00:00', '2016-02-17 08:21:22', 1356972, 3907, null, 'A', '2015-09-01 01:00:00', null, 3598, 2000, 'D150666480-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3876, '2500-01-01 00:00:00', '2016-06-20 11:33:27', 2022128, 4204, null, 'A', '2015-11-24 00:00:00', null, 3828, 2000, 'D150602043-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3876, '2016-06-20 11:33:27', '2016-02-24 12:19:12', 1376808, 4204, null, 'A', '2015-11-24 00:00:00', null, 3828, 2000, 'D150602043-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2017-11-21 11:16:28', '2017-07-03 12:11:30', 4655498, 4239, null, 'A', '2016-02-10 00:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2017-06-26 12:08:47', '2017-06-06 13:38:52', 4392436, 4239, null, 'A', '2016-01-13 19:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2500-01-01 00:00:00', '2017-11-21 11:16:28', 6292154, 4239, null, 'A', '2016-02-10 00:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2017-07-03 12:11:30', '2017-06-26 12:08:47', 4583412, 4239, null, 'A', '2016-01-14 00:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2017-06-06 13:38:52', '2016-03-15 07:34:42', 1423464, 4239, null, 'A', '2016-01-13 19:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2016-03-15 07:34:42', '2016-03-15 07:32:44', 1423460, 4239, null, 'A', '2016-01-13 19:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (3905, '2016-03-15 07:32:44', '2016-02-25 13:57:53', 1380322, 4239, null, 'A', '2016-01-13 19:00:00', null, 3857, 2000, 'D160006331-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4037, '2500-01-01 00:00:00', '2016-03-03 13:23:03', 1398014, 4406, null, 'A', '2016-01-25 00:00:00', null, 3994, 2000, 'D160025832-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4047, '2500-01-01 00:00:00', '2017-10-16 12:00:48', 5721419, 4422, null, 'A', '2016-02-04 10:14:47', null, 4004, 2000, 'D160054209-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4047, '2017-10-16 12:00:48', '2016-03-04 10:15:39', 1399825, 4422, null, 'A', '2016-02-04 10:14:47', null, 4004, 2000, 'D160054209-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4224, '2500-01-01 00:00:00', '2017-06-26 10:54:44', 4581979, 4646, null, 'A', '2016-02-12 21:00:00', null, 4184, 2000, 'D160057199-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4224, '2017-06-26 10:54:44', '2016-03-24 11:48:40', 1453609, 4646, null, 'A', '2016-02-11 21:00:00', null, 4184, 2000, 'D160057199-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4239, '2016-06-20 11:19:34', '2016-03-25 15:31:44', 1461652, 4664, null, 'A', '2016-03-15 00:00:00', null, 4200, 2000, 'D160103390-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4239, '2500-01-01 00:00:00', '2016-06-20 11:19:34', 2021684, 4664, null, 'A', '2016-03-15 00:00:00', null, 4200, 2000, 'D160103390-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4310, '2016-06-20 11:26:35', '2016-04-08 11:39:15', 1515238, 4749, null, 'A', '2016-03-21 00:00:00', null, 4272, 2000, 'D160117979-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4310, '2500-01-01 00:00:00', '2016-06-20 11:26:35', 2021982, 4749, null, 'A', '2016-03-21 00:00:00', null, 4272, 2000, 'D160117979-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4320, '2500-01-01 00:00:00', '2017-06-19 05:09:19', 4503302, 4757, null, 'A', '2016-04-04 18:00:00', null, 4280, 2000, 'D160143615-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4320, '2017-06-19 05:09:19', '2017-05-30 15:29:05', 4345448, 4757, null, 'A', '2016-04-04 18:00:00', null, 4280, 2000, 'D160143615-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4320, '2017-05-30 15:29:05', '2016-04-12 07:05:20', 1523731, 4757, null, 'A', '2016-04-03 18:00:00', null, 4280, 2000, 'D160143615-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4412, '2500-01-01 00:00:00', '2017-11-09 11:43:59', 6062049, 4882, null, 'A', '2016-04-05 01:00:00', null, 4380, 2000, 'D160145838-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4412, '2017-06-26 11:40:05', '2017-06-06 15:12:38', 4393406, 4882, null, 'A', '2016-04-03 20:00:00', null, 4380, 2000, 'D160145838-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4412, '2017-11-09 11:43:59', '2017-06-26 11:40:05', 4582817, 4882, null, 'A', '2016-04-05 01:00:00', null, 4380, 2000, 'D160145838-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4412, '2017-06-06 15:12:38', '2016-05-12 07:03:41', 1673395, 4882, null, 'A', '2016-04-03 20:00:00', null, 4380, 2000, 'D160145838-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4412, '2016-05-12 07:03:41', '2016-05-12 06:54:00', 1673363, 4882, null, 'A', '2016-04-03 20:00:00', null, 4380, 2000, 'D160145838-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4505, '2500-01-01 00:00:00', '2018-01-30 09:24:39', 8210995, 5025, null, 'A', '2016-06-15 17:20:23', null, 4489, 2000, 'D000005-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4505, '2018-01-30 09:24:39', '2016-11-23 13:31:59', 2922797, 5025, null, 'A', '2016-06-15 17:20:23', null, 4489, 2000, 'D000005-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4505, '2016-11-23 13:31:59', '2016-06-15 17:18:11', 1976643, 5025, null, 'A', '2016-06-15 17:20:23', null, 4489, 2000, 'D000005-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4616, '2500-01-01 00:00:00', '2017-06-28 09:45:02', 4604254, 5152, null, 'A', '2016-07-07 01:00:00', null, 4608, 2000, 'D160266755-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4616, '2017-06-28 09:45:02', '2017-06-26 12:05:35', 4583356, 5152, null, 'A', '2016-07-07 01:00:00', null, 4608, 2000, 'D160266755-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4616, '2017-06-26 12:05:35', '2017-03-14 12:45:11', 3792555, 5152, null, 'A', '2016-07-28 14:03:56', null, 4608, 2000, 'D160266755-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4616, '2017-03-14 12:45:11', '2016-07-28 08:05:00', 2361607, 5152, null, 'A', '2016-07-28 14:03:56', null, 4608, 2000, 'D160266755-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4668, '2500-01-01 00:00:00', '2017-07-03 10:01:57', 4653097, 5213, null, 'A', '2016-06-21 01:00:00', null, 4661, 2000, 'D160250535-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4668, '2017-07-03 10:01:57', '2016-09-15 08:55:26', 2612595, 5213, null, 'A', '2016-08-22 13:40:15', null, 4661, 2000, 'D160250535-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4668, '2016-09-15 08:55:26', '2016-08-22 13:41:07', 2522530, 5213, null, 'A', '2016-08-22 13:40:15', null, 4661, 2000, 'D160250535-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4773, '2500-01-01 00:00:00', '2017-05-30 11:57:19', 4340928, 5363, null, 'A', '2015-07-03 19:00:00', null, 4766, 2000, 'D150366947-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4773, '2017-05-30 11:57:19', '2017-01-26 19:14:48', 3494407, 5363, null, 'A', '2016-06-25 19:00:00', null, 4766, 2000, 'D150366947-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4773, '2017-01-26 19:14:48', '2017-01-13 15:01:33', 3393348, 5363, null, 'A', '2016-06-25 19:00:00', null, 4766, 2000, '№ D150366947-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4773, '2017-01-13 15:01:33', '2016-10-11 09:14:59', 2723187, 5363, null, 'A', '2016-06-25 19:00:00', null, 4766, 2000, '№ D150366947-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4921, '2500-01-01 00:00:00', '2017-01-12 05:37:21', 3376448, 5528, null, 'A', '2016-10-29 11:26:22', 'АПЦ Михайловск', 4903, 2000, '286916');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4921, '2017-01-11 09:14:48', '2016-12-08 17:07:56', 3041498, 5528, null, 'A', '2016-10-29 11:26:22', 'АПЦ Михайловск', 4903, 2000, '000011-16-2400/ДП');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4921, '2017-01-12 05:37:21', '2017-01-11 09:15:33', 3368461, 5528, null, 'A', '2016-10-29 11:26:22', 'АПЦ Михайловск', 4903, 2000, '286916');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4921, '2017-01-11 09:15:33', '2017-01-11 09:14:48', 3368451, 5528, null, 'A', '2016-10-29 11:26:22', 'АПЦ Михайловск', 4903, 2000, '286916');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (4921, '2016-12-08 17:07:56', '2016-10-29 09:27:06', 2802068, 5528, null, 'A', '2016-10-29 11:26:22', 'АПЦ Михайловск', 4903, 2000, '1');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5123, '2500-01-01 00:00:00', '2017-01-12 06:03:57', 3376604, 5756, null, 'A', '2016-12-16 18:32:01', 'АПЦ Екатеринбург', 5106, 2000, '291597');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5123, '2017-01-12 06:03:57', '2016-12-16 16:32:29', 3110155, 5756, null, 'A', '2016-12-16 18:32:01', 'АПЦ Екатеринбург', 5106, 2000, '1');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5320, '2500-01-01 00:00:00', '2017-03-17 10:21:22', 3809589, 6008, null, 'A', '2017-01-09 00:00:00', null, 5327, 2000, '298620');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5320, '2017-03-17 10:21:22', '2017-01-25 08:42:37', 3476352, 6008, null, 'A', '2017-01-09 00:00:00', null, 5327, 2000, '5');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5322, '2500-01-01 00:00:00', '2017-03-17 10:22:19', 3809605, 6009, null, 'A', '2017-01-09 00:00:00', null, 5328, 2000, '298614');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5322, '2017-03-17 10:22:19', '2017-01-25 09:22:32', 3477190, 6009, null, 'A', '2017-01-09 00:00:00', null, 5328, 2000, '6');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5382, '2017-06-07 10:19:49', '2017-06-07 10:19:29', 4397306, 6100, null, 'A', '2017-01-09 00:00:00', null, 5406, 2000, '296786');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5382, '2500-01-01 00:00:00', '2017-06-07 10:19:49', 4397308, 6100, null, 'A', '2017-01-09 00:00:00', null, 5406, 2000, '296786');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5382, '2017-06-07 10:19:29', '2017-03-03 13:23:56', 3741231, 6100, null, 'A', '2017-01-09 00:00:00', null, 5406, 2000, '296786');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5382, '2017-03-03 13:23:56', '2017-03-03 13:22:04', 3741207, 6100, null, 'A', '2017-01-09 00:00:00', null, 5406, 2000, '296650');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5382, '2017-03-03 13:22:04', '2017-01-30 11:09:15', 3516949, 6100, null, 'A', '2017-01-09 00:00:00', null, 5406, 2000, 'ГПД');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5588, '2500-01-01 00:00:00', '2017-05-16 12:15:35', 4187818, 6359, null, 'A', '2017-04-01 22:00:00', null, 5645, 2000, '302474');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5588, '2017-05-16 12:15:35', '2017-02-09 08:30:37', 3605639, 6359, null, 'A', '2017-01-31 21:00:00', null, 5645, 2000, '3');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5656, '2500-01-01 00:00:00', '2017-11-21 12:44:29', 6295208, 6444, null, 'A', '2017-02-14 04:24:32', null, 5720, 2000, '298356');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5656, '2017-08-01 14:25:15', '2017-05-12 10:01:28', 4156612, 6444, null, 'A', '2017-02-14 04:24:32', null, 5720, 2000, '298356-2');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5656, '2017-11-21 12:44:29', '2017-08-01 14:25:15', 4900867, 6444, null, 'A', '2017-02-14 04:24:32', null, 5720, 2000, '298356');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5656, '2017-05-12 10:01:28', '2017-03-15 05:21:00', 3795854, 6444, null, 'A', '2017-02-14 04:24:32', null, 5720, 2000, '298356');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5656, '2017-03-15 05:21:00', '2017-02-14 04:27:38', 3634849, 6444, null, 'A', '2017-02-14 04:24:32', null, 5720, 2000, '1234567');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5683, '2500-01-01 00:00:00', '2017-04-11 10:40:50', 3918478, 6471, null, 'A', '2017-02-14 15:04:30', null, 5747, 2000, '298334');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5683, '2017-04-11 10:40:50', '2017-03-03 19:27:15', 3743576, 6471, null, 'A', '2017-02-14 15:04:30', null, 5747, 2000, '100002');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5683, '2017-03-03 19:27:15', '2017-03-03 18:59:19', 3743551, 6471, null, 'A', '2017-02-14 15:04:30', null, 5747, 2000, '100002');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5683, '2017-03-03 18:59:19', '2017-02-14 15:05:02', 3639667, 6471, null, 'A', '2017-02-14 15:04:30', null, 5747, 2000, '100002');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2017-06-06 13:56:05', '2017-05-15 17:40:09', 4179051, 6504, null, 'A', '2017-02-01 19:00:00', null, 5778, 2000, 'D170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2500-01-01 00:00:00', '2017-11-21 11:30:06', 6292573, 6504, null, 'A', '2017-02-01 19:00:00', null, 5778, 2000, 'D170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2017-05-15 17:40:09', '2017-05-15 16:37:23', 4177246, 6504, null, 'A', '2017-01-31 19:00:00', null, 5778, 2000, 'D170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2017-11-21 11:30:06', '2017-08-21 05:49:08', 5070658, 6504, null, 'A', '2017-02-01 19:00:00', null, 5778, 2000, 'D170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2017-08-21 05:49:08', '2017-06-06 13:56:05', 4392648, 6504, null, 'A', '2017-02-01 19:00:00', null, 5778, 2000, 'D170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5709, '2017-05-15 16:37:23', '2017-02-16 03:44:38', 3651096, 6504, null, 'A', '2017-01-31 19:00:00', null, 5778, 2000, 'D-170033097-24');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5900, '2500-01-01 00:00:00', '2017-03-29 11:02:19', 3858636, 6734, null, 'A', '2017-03-01 00:00:00', null, 5997, 2000, '298316');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5900, '2017-03-29 11:02:19', '2017-02-28 14:41:50', 3723738, 6734, null, 'A', '2017-03-01 00:00:00', null, 5997, 2000, '555555');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5968, '2500-01-01 00:00:00', '2017-03-17 14:09:03', 3811833, 6803, null, 'A', '2017-03-03 12:52:49', null, 6064, 2000, '298775');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (5968, '2017-03-17 14:09:03', '2017-03-03 11:53:48', 3740237, 6803, null, 'A', '2017-03-03 12:52:49', null, 6064, 2000, '03');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6069, '2500-01-01 00:00:00', '2017-04-07 07:27:27', 3903062, 6920, null, 'A', '2017-03-10 16:06:47', null, 6178, 2000, '301192');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6069, '2017-04-07 07:27:27', '2017-03-10 16:07:18', 3776223, 6920, null, 'A', '2017-03-10 16:06:47', null, 6178, 2000, 'Д130');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6864, '2017-11-21 12:48:16', '2017-07-04 13:37:25', 4667172, 7776, null, 'A', '2017-04-27 06:11:22', null, 6993, 2000, '307516');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6864, '2500-01-01 00:00:00', '2017-11-21 12:48:16', 6295397, 7776, null, 'A', '2017-04-27 06:11:22', null, 6993, 2000, '307516');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6864, '2017-07-04 13:37:25', '2017-05-12 06:45:09', 4155689, 7776, null, 'A', '2017-04-27 06:11:22', null, 6993, 2000, 'АПЦ_ЛаринЛЛ');

insert into fw_contracts (ID_CONTRACT_INST, DT_STOP, DT_START, ID_REC, ID_CLIENT_INST, ID_CURRENCY, V_STATUS, DT_REG_EVENT, V_DESCRIPTION, ID_DEPARTMENT, ID_CATEGORY, V_EXT_IDENT)
values (6864, '2017-05-12 06:45:09', '2017-04-27 06:11:42', 4036336, 7776, null, 'A', '2017-04-27 06:11:22', null, 6993, 2000, '123');

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 3468);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4037);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4239);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 3876);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4921);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 5123);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 6069);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 5320);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 5322);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 5900);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 5683);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4773);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 5382);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4320);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4668);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 3407);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4616);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 2343);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 3905);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 3387);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4412);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4224);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 4310);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 3122);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 3632);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 6864);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 5656);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4505);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 5709);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 4047);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (0, 5588);

insert into scd_contracts (B_AGENCY, ID_CONTRACT_INST)
values (1, 5968);

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128329, 2072, '0051411400014923', '2017-03-09 13:27:53', '2017-05-01 08:47:51', 2, 4239, null, 3766977, '2710644747');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128329, 2072, '0051411400014923', '2017-03-09 13:27:31', '2017-03-09 13:27:53', 4, null, null, 3766955, '2710644747');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128329, 2072, '0051411400014923', '2017-05-01 08:47:51', '2500-01-01 00:00:00', 6, 4239, 193694, 4060863, '2710644747');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122227, 2072, '0051411400014568', '2017-02-23 06:07:42', '2017-04-14 11:39:53', 2, 5426, null, 3698604, '2710595587');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122227, 2072, '0051411400014568', '2017-04-14 11:39:53', '2017-05-01 10:03:08', 2, 6069, null, 3936426, '2710595587');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122227, 2072, '0051411400014568', '2017-02-09 12:03:45', '2017-02-09 12:04:07', 4, null, null, 3608344, '2710595587');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122227, 2072, '0051411400014568', '2017-02-09 12:04:07', '2017-02-23 06:07:42', 2, 5426, null, 3608452, '2710595587');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122227, 2072, '0051411400014568', '2017-05-01 10:03:08', '2500-01-01 00:00:00', 6, 6069, 195138, 4061102, '2710595587');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143036, 2123, '0055595800002955', '2017-05-01 10:15:21', '2500-01-01 00:00:00', 6, 4616, 195330, 4061157, '2711711109');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143036, 2123, '0055595800002955', '2017-04-27 10:05:28', '2017-04-27 10:05:46', 4, null, null, 4037075, '2711711109');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143036, 2123, '0055595800002955', '2017-04-27 10:05:46', '2017-05-01 10:15:21', 2, 4616, null, 4037136, '2711711109');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110820, 2072, '0051411400005659', '2017-01-18 09:44:07', '2017-05-01 13:13:58', 2, 3387, null, 3423562, '2710581104');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110820, 2072, '0051411400005659', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423471, '2710581104');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110820, 2072, '0051411400005659', '2017-05-01 13:13:58', '2500-01-01 00:00:00', 22, 3387, 192509, 4061594, '2710581104');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140922, 2126, '0055595800001462', '2017-05-01 03:03:28', '2500-01-01 00:00:00', 22, 5322, 195037, 4060586, '2711690359');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140922, 2126, '0055595800001462', '2017-04-21 13:22:08', '2017-04-24 10:28:55', 2, 5268, null, 4004129, '2711690359');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140922, 2126, '0055595800001462', '2017-04-24 10:28:55', '2017-05-01 03:03:28', 2, 5322, null, 4014803, '2711690359');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140922, 2126, '0055595800001462', '2017-04-21 13:21:24', '2017-04-21 13:22:08', 4, null, null, 4004064, '2711690359');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110809, 2072, '0051411400005612', '2017-01-18 09:44:07', '2017-05-01 10:28:42', 2, 3387, null, 3423529, '2710568915');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110809, 2072, '0051411400005612', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423438, '2710568915');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110809, 2072, '0051411400005612', '2017-05-01 10:28:42', '2500-01-01 00:00:00', 22, 3387, 192529, 4061183, '2710568915');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (123290, 2072, '0051411400007545', '2017-02-13 16:41:02', '2017-02-13 16:41:31', 4, null, null, 3633413, '2711278090');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (123290, 2072, '0051411400007545', '2017-02-13 16:41:31', '2017-05-01 17:23:52', 2, 4320, null, 3633434, '2711278090');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (123290, 2072, '0051411400007545', '2017-05-01 17:23:52', '2500-01-01 00:00:00', 22, 4320, 195405, 4062130, '2711278090');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (89915, 2093, '0050614100016322', '2016-11-21 10:27:50', '2016-11-21 10:31:17', 4, null, null, 2908985, '2151839037');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (89915, 2143, '0050614100016322', '2016-11-21 10:31:17', '2017-04-14 09:15:31', 2, 4767, null, 2909273, '2151839037');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (89915, 2143, '0050614100016322', '2017-04-14 09:15:31', '2017-05-01 23:56:42', 2, 5123, null, 3935272, '2151839037');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (89915, 2143, '0050614100016322', '2017-05-01 23:56:42', '2500-01-01 00:00:00', 22, 5123, 195406, 4062490, '2151839037');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121606, 2052, '0041229400013971', '2017-02-08 10:28:42', '2017-05-01 06:41:14', 2, 4773, null, 3599548, '2711290764');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121606, 2052, '0041229400013971', '2017-02-08 10:28:21', '2017-02-08 10:28:42', 4, null, null, 3599527, '2711290764');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121606, 2052, '0041229400013971', '2017-05-01 06:41:14', '2500-01-01 00:00:00', 22, 4773, 195299, 4060704, '2711290764');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121692, 2068, '0026435200000138', '2017-02-08 10:57:06', '2017-05-01 08:39:30', 2, 4310, null, 3600239, '7700026021');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121692, 2068, '0026435200000138', '2017-02-08 10:56:50', '2017-02-08 10:57:06', 4, null, null, 3600228, '7700026021');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (121692, 2068, '0026435200000138', '2017-05-01 08:39:30', '2500-01-01 00:00:00', 22, 4310, 193612, 4060821, '7700026021');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140721, 2123, '0055595800002302', '2017-05-01 10:44:00', '2500-01-01 00:00:00', 22, 3632, 195334, 4061239, '2711711455');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140721, 2123, '0055595800002302', '2017-04-20 18:31:36', '2017-04-20 18:31:52', 4, null, null, 3999909, '2711711455');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140721, 2123, '0055595800002302', '2017-04-20 18:31:52', '2017-05-01 10:44:00', 2, 3632, null, 3999939, '2711711455');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (125108, 2118, '0052926800001625', '2017-02-21 09:38:14', '2017-02-21 09:38:35', 4, null, null, 3683323, '7700060969');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (125108, 2118, '0052926800001625', '2017-02-21 09:38:35', '2017-05-01 11:04:59', 2, 4047, null, 3683353, '7700060969');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (125108, 2118, '0052926800001625', '2017-05-01 11:04:59', '2500-01-01 00:00:00', 22, 4047, 195331, 4061307, '7700060969');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141136, 2123, '0055595800003610', '2017-05-01 12:01:43', '2500-01-01 00:00:00', 22, 3905, 195348, 4061462, '2711712843');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141136, 2123, '0055595800003610', '2017-04-21 15:25:08', '2017-05-01 12:01:43', 2, 3905, null, 4006147, '2711712843');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141136, 2123, '0055595800003610', '2017-04-21 15:24:43', '2017-04-21 15:25:08', 4, null, null, 4005995, '2711712843');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141243, 2133, '0055570700001184', '2017-05-01 21:04:18', '2500-01-01 00:00:00', 22, 5968, 195407, 4062445, '2715729294');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141243, 2133, '0055570700001184', '2017-04-21 15:46:48', '2017-04-21 15:47:01', 4, null, null, 4006789, '2715729294');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141243, 2133, '0055570700001184', '2017-04-21 15:47:01', '2017-05-01 21:04:18', 2, 5968, null, 4006843, '2715729294');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (137900, 2123, '0055595500001383', '2017-05-01 08:53:13', '2500-01-01 00:00:00', 22, 5709, 195308, 4060879, '2715740263');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (137900, 2123, '0055595500001383', '2017-04-14 17:42:43', '2017-04-14 17:42:56', 4, null, null, 3943223, '2715740263');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (137900, 2123, '0055595500001383', '2017-04-14 17:42:56', '2017-05-01 08:53:13', 2, 5709, null, 3943253, '2715740263');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141241, 2133, '0055570700001182', '2017-05-01 09:05:44', '2500-01-01 00:00:00', 22, 5968, 195222, 4060936, '2715711767');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141241, 2133, '0055570700001182', '2017-04-21 15:46:48', '2017-04-21 15:47:01', 4, null, null, 4006783, '2715711767');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141241, 2133, '0055570700001182', '2017-04-21 15:47:01', '2017-05-01 09:05:44', 2, 5968, null, 4006837, '2715711767');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140771, 2124, '0055595800003832', '2017-05-01 09:10:15', '2500-01-01 00:00:00', 22, 3122, 195310, 4060957, '2711713818');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140771, 2124, '0055595800003832', '2017-04-21 11:19:22', '2017-04-21 11:32:01', 4, null, null, 4002163, '2711713818');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140771, 2124, '0055595800003832', '2017-04-21 11:32:01', '2017-05-01 09:10:15', 2, 3122, null, 4002291, '2711713818');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (138600, 2071, '0051411400004313', '2017-05-01 09:28:54', '2500-01-01 00:00:00', 22, 4224, 195320, 4061000, '2710573436');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (138600, 2071, '0051411400004313', '2017-04-18 13:26:53', '2017-05-01 09:28:54', 2, 4224, null, 3977791, '2710573436');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (138600, 2071, '0051411400004313', '2017-04-18 13:26:35', '2017-04-18 13:26:53', 4, null, null, 3977776, '2710573436');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (102046, 2072, '0051411400010936', '2016-12-26 13:25:18', '2016-12-29 20:08:43', 2, 4767, null, 3222750, '2711290150');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (102046, 2072, '0051411400010936', '2016-12-26 12:49:06', '2016-12-26 13:25:18', 4, null, null, 3221737, '2711290150');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (102046, 2072, '0051411400010936', '2016-12-29 20:08:43', '2017-05-01 17:42:14', 2, 4921, null, 3275627, '2711290150');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (102046, 2072, '0051411400010936', '2017-05-01 17:42:14', '2500-01-01 00:00:00', 22, 4921, 193796, 4062175, '2711290150');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136336, 2126, '0055595800001508', '2017-04-12 11:43:25', '2017-04-12 11:43:47', 4, null, null, 3924987, '2711691456');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136336, 2126, '0055595800001508', '2017-04-12 11:43:47', '2017-05-01 05:08:38', 2, 5683, null, 3925095, '2711691456');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136336, 2126, '0055595800001508', '2017-05-01 05:08:38', '2500-01-01 00:00:00', 22, 5683, 195295, 4060651, '2711691456');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143673, 2092, '0050614200001726', '2017-05-01 23:40:35', '2500-01-01 00:00:00', 22, 3407, 193925, 4062481, '2152007814');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143673, 2092, '0050614200001726', '2017-04-28 09:54:29', '2017-05-01 23:40:35', 2, 3407, null, 4045801, '2152007814');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143673, 2092, '0050614200001726', '2017-04-28 09:54:14', '2017-04-28 09:54:29', 4, null, null, 4045798, '2152007814');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110804, 2072, '0051411400005608', '2017-01-18 09:44:07', '2017-05-01 11:08:05', 2, 3387, null, 3423514, '2710581293');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110804, 2072, '0051411400005608', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423423, '2710581293');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110804, 2072, '0051411400005608', '2017-05-01 11:08:05', '2500-01-01 00:00:00', 22, 3387, 192555, 4061322, '2710581293');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (77060, 2093, '0037566500001417', '2016-09-20 09:18:00', '2017-05-01 08:41:37', 2, 4668, null, 2632831, '2151296914');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (77060, 2093, '0037566500001417', '2016-09-20 09:17:43', '2016-09-20 09:18:00', 4, null, null, 2632819, '2151296914');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (77060, 2093, '0037566500001417', '2017-05-01 08:41:37', '2500-01-01 00:00:00', 22, 4668, 193974, 4060829, '2151296914');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110816, 2072, '0051411400005661', '2017-01-18 09:44:07', '2017-05-01 13:37:48', 2, 3387, null, 3423550, '2710581068');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110816, 2072, '0051411400005661', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423459, '2710581068');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110816, 2072, '0051411400005661', '2017-05-01 13:37:48', '2500-01-01 00:00:00', 22, 3387, 192508, 4061668, '2710581068');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128327, 2072, '0051411400014921', '2017-03-09 13:27:53', '2017-05-01 08:46:33', 2, 4239, null, 3766971, '2710644649');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128327, 2072, '0051411400014921', '2017-03-09 13:27:31', '2017-03-09 13:27:53', 4, null, null, 3766949, '2710644649');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (128327, 2072, '0051411400014921', '2017-05-01 08:46:33', '2500-01-01 00:00:00', 22, 4239, 194303, 4060855, '2710644649');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141248, 2133, '0055570700001189', '2017-05-01 21:56:15', '2500-01-01 00:00:00', 22, 5968, 195417, 4062457, '2713983934');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141248, 2133, '0055570700001189', '2017-04-21 15:46:48', '2017-04-21 15:47:01', 4, null, null, 4006804, '2713983934');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141248, 2133, '0055570700001189', '2017-04-21 15:47:01', '2017-05-01 21:56:15', 2, 5968, null, 4006858, '2713983934');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (135919, 2123, '0055595500000385', '2017-04-11 12:42:17', '2017-04-11 12:42:40', 4, null, null, 3919343, '2711710768');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (135919, 2123, '0055595500000385', '2017-04-11 12:42:40', '2017-05-01 17:40:01', 2, 3468, null, 3919358, '2711710768');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (135919, 2123, '0055595500000385', '2017-05-01 17:40:01', '2500-01-01 00:00:00', 22, 3468, 195391, 4062157, '2711710768');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136701, 2126, '0055595800001677', '2017-04-13 14:35:15', '2017-04-13 14:35:34', 4, null, null, 3931620, '2711711459');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136701, 2126, '0055595800001677', '2017-04-13 14:35:34', '2017-05-01 20:40:45', 2, 6864, null, 3931920, '2711711459');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136701, 2126, '0055595800001677', '2017-05-01 20:40:45', '2500-01-01 00:00:00', 22, 6864, 195403, 4062432, '2711711459');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140928, 2126, '0055595800001468', '2017-05-01 03:53:26', '2500-01-01 00:00:00', 22, 5320, 195060, 4060619, '2711690310');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140928, 2126, '0055595800001468', '2017-04-21 13:22:08', '2017-04-24 09:57:54', 2, 5268, null, 4004147, '2711690310');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140928, 2126, '0055595800001468', '2017-04-21 13:21:24', '2017-04-21 13:22:08', 4, null, null, 4004082, '2711690310');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140928, 2126, '0055595800001468', '2017-04-24 09:57:54', '2017-05-01 03:53:26', 2, 5320, null, 4014534, '2711690310');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110812, 2072, '0051411400005672', '2017-01-18 09:44:07', '2017-05-01 13:23:17', 2, 3387, null, 3423538, '2710583458');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110812, 2072, '0051411400005672', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423447, '2710583458');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110812, 2072, '0051411400005672', '2017-05-01 13:23:17', '2500-01-01 00:00:00', 22, 3387, 192518, 4061624, '2710583458');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136395, 2093, '0050614100037403', '2017-04-12 12:57:27', '2017-04-12 12:57:44', 4, null, null, 3925766, '2152078159');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136395, 2093, '0050614100037403', '2017-04-12 12:57:44', '2017-05-01 06:03:51', 2, 4412, null, 3925781, '2152078159');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136395, 2093, '0050614100037403', '2017-05-01 06:03:51', '2500-01-01 00:00:00', 22, 4412, 194344, 4060690, '2152078159');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143125, 2123, '0055595500001060', '2017-05-01 08:38:18', '2500-01-01 00:00:00', 22, 3876, 194349, 4060811, '2715739418');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143125, 2123, '0055595500001060', '2017-04-27 11:35:42', '2017-05-01 08:38:18', 2, 3876, null, 4038154, '2715739418');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143125, 2123, '0055595500001060', '2017-04-27 11:35:32', '2017-04-27 11:35:42', 4, null, null, 4038103, '2715739418');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141246, 2133, '0055570700001187', '2017-05-01 09:34:41', '2500-01-01 00:00:00', 22, 5968, 195042, 4061017, '2715740608');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141246, 2133, '0055570700001187', '2017-04-21 15:46:48', '2017-04-21 15:47:01', 4, null, null, 4006798, '2715740608');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141246, 2133, '0055570700001187', '2017-04-21 15:47:01', '2017-05-01 09:34:41', 2, 5968, null, 4006852, '2715740608');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143043, 2123, '0055595800002962', '2017-05-01 05:38:05', '2500-01-01 00:00:00', 22, 4616, 195294, 4060677, '2711712774');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143043, 2123, '0055595800002962', '2017-04-27 10:05:28', '2017-04-27 10:05:46', 4, null, null, 4037096, '2711712774');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143043, 2123, '0055595800002962', '2017-04-27 10:05:46', '2017-05-01 05:38:05', 2, 4616, null, 4037157, '2711712774');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110807, 2072, '0051411400005609', '2017-01-18 09:44:07', '2017-05-01 11:31:32', 2, 3387, null, 3423523, '2710579313');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110807, 2072, '0051411400005609', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423432, '2710579313');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110807, 2072, '0051411400005609', '2017-05-01 11:31:32', '2500-01-01 00:00:00', 22, 3387, 192528, 4061381, '2710579313');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140719, 2123, '0055595800002300', '2017-05-01 11:39:39', '2500-01-01 00:00:00', 22, 3632, 195345, 4061403, '2711712059');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140719, 2123, '0055595800002300', '2017-04-20 18:31:36', '2017-04-20 18:31:52', 4, null, null, 3999903, '2711712059');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140719, 2123, '0055595800002300', '2017-04-20 18:31:52', '2017-05-01 11:39:39', 2, 3632, null, 3999933, '2711712059');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141134, 2123, '0055595800003608', '2017-05-01 12:06:22', '2500-01-01 00:00:00', 22, 3905, 195353, 4061476, '2711691786');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141134, 2123, '0055595800003608', '2017-04-21 15:25:08', '2017-05-01 12:06:22', 2, 3905, null, 4006141, '2711691786');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141134, 2123, '0055595800003608', '2017-04-21 15:24:43', '2017-04-21 15:25:08', 4, null, null, 4005989, '2711691786');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (108943, 2105, '0051097200005402', '2017-01-12 14:46:41', '2017-05-01 08:33:37', 2, 2343, null, 3382501, '2710607184');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (108943, 2105, '0051097200005402', '2017-01-12 14:46:17', '2017-01-12 14:46:41', 4, null, null, 3382449, '2710607184');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (108943, 2105, '0051097200005402', '2017-05-01 08:33:37', '2500-01-01 00:00:00', 22, 2343, 194541, 4060804, '2710607184');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141247, 2133, '0055570700001188', '2017-05-01 08:45:30', '2500-01-01 00:00:00', 22, 5968, 195199, 4060849, '2715722138');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141247, 2133, '0055570700001188', '2017-04-21 15:46:48', '2017-04-21 15:47:01', 4, null, null, 4006801, '2715722138');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (141247, 2133, '0055570700001188', '2017-04-21 15:47:01', '2017-05-01 08:45:30', 2, 5968, null, 4006855, '2715722138');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136861, 2126, '0055595800000445', '2017-04-13 15:23:36', '2017-04-13 15:23:52', 4, null, null, 3932930, '2711690413');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136861, 2126, '0055595800000445', '2017-04-13 15:23:52', '2017-04-14 11:39:53', 2, 5426, null, 3932972, '2711690413');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136861, 2126, '0055595800000445', '2017-04-14 11:39:53', '2017-05-01 09:49:32', 2, 6069, null, 3936453, '2711690413');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136861, 2126, '0055595800000445', '2017-05-01 09:49:32', '2500-01-01 00:00:00', 22, 6069, 195034, 4061047, '2711690413');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (139867, 2123, '0055595800001885', '2017-05-01 16:05:53', '2500-01-01 00:00:00', 22, 4037, 195314, 4061998, '2711691450');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (139867, 2123, '0055595800001885', '2017-04-19 11:27:30', '2017-04-19 11:27:57', 4, null, null, 3988717, '2711691450');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (139867, 2123, '0055595800001885', '2017-04-19 11:27:57', '2017-05-01 16:05:53', 2, 4037, null, 3988734, '2711691450');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136337, 2126, '0055595800001509', '2017-04-12 11:43:25', '2017-04-12 11:43:47', 4, null, null, 3924990, '2711690820');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136337, 2126, '0055595800001509', '2017-04-12 11:43:47', '2017-05-01 04:27:51', 2, 5683, null, 3925098, '2711690820');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136337, 2126, '0055595800001509', '2017-05-01 04:27:51', '2500-01-01 00:00:00', 22, 5683, 195273, 4060629, '2711690820');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136314, 2111, '0052256500007155', '2017-04-12 11:39:23', '2017-04-12 11:39:40', 4, null, null, 3924832, '7700039426');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136314, 2111, '0052256500007155', '2017-04-12 11:39:40', '2017-05-01 22:42:27', 2, 5656, null, 3924868, '7700039426');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (136314, 2111, '0052256500007155', '2017-05-01 22:42:27', '2500-01-01 00:00:00', 22, 5656, 193818, 4062463, '7700039426');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (118457, 2093, '0050614100034066', '2017-02-02 17:17:08', '2017-02-02 17:19:12', 4, null, null, 3555633, '2151985496');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (118457, 2143, '0050614100034066', '2017-02-02 17:19:12', '2017-05-01 18:46:04', 2, 5900, null, 3555783, '2151985496');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (118457, 2143, '0050614100034066', '2017-05-01 18:46:04', '2500-01-01 00:00:00', 22, 5900, 191833, 4062236, '2151985496');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (61745, 2054, '0041664200006972', '2016-06-28 13:23:12', '2017-05-01 16:20:02', 2, 4505, null, 2115639, '2701366248');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (61745, 2054, '0041664200006972', '2016-06-23 13:02:50', '2016-06-23 13:03:38', 4, null, null, 2062126, '2701366248');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (61745, 2054, '0041664200006972', '2016-06-23 13:03:38', '2016-06-28 13:23:12', 2, 4505, null, 2062649, '2701366248');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (61745, 2054, '0041664200006972', '2017-05-01 16:20:02', '2500-01-01 00:00:00', 22, 4505, 189614, 4062033, '2701366248');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140923, 2126, '0055595800001463', '2017-05-01 03:37:43', '2500-01-01 00:00:00', 22, 5320, 195051, 4060612, '2711692624');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140923, 2126, '0055595800001463', '2017-04-21 13:22:08', '2017-04-24 09:56:31', 2, 5268, null, 4004132, '2711692624');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140923, 2126, '0055595800001463', '2017-04-21 13:21:24', '2017-04-21 13:22:08', 4, null, null, 4004067, '2711692624');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (140923, 2126, '0055595800001463', '2017-04-24 09:56:31', '2017-05-01 03:37:43', 2, 5320, null, 4014524, '2711692624');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (115698, 2072, '0051411400013125', '2017-01-30 14:24:21', '2017-01-30 14:24:46', 4, null, null, 3520426, '2711291628');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (115698, 2072, '0051411400013125', '2017-01-30 14:24:46', '2017-03-16 10:22:11', 2, 5361, null, 3520473, '2711291628');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (115698, 2072, '0051411400013125', '2017-03-16 10:22:11', '2017-05-01 03:18:08', 2, 5382, null, 3803773, '2711291628');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (115698, 2072, '0051411400013125', '2017-05-01 03:18:08', '2500-01-01 00:00:00', 22, 5382, 194997, 4060605, '2711291628');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110799, 2072, '0051411400005614', '2017-01-18 09:44:07', '2017-05-01 06:51:32', 2, 3387, null, 3423499, '2710600342');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110799, 2072, '0051411400005614', '2017-01-18 09:43:46', '2017-01-18 09:44:07', 4, null, null, 3423408, '2710600342');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (110799, 2072, '0051411400005614', '2017-05-01 06:51:32', '2500-01-01 00:00:00', 22, 3387, 192558, 4060710, '2710600342');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122371, 2072, '0051411400015811', '2017-02-09 13:00:29', '2017-05-01 08:21:14', 2, 5588, null, 3609476, '2711259913');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122371, 2072, '0051411400015811', '2017-02-09 12:59:54', '2017-02-09 13:00:29', 4, null, null, 3609365, '2711259913');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (122371, 2072, '0051411400015811', '2017-05-01 08:21:14', '2500-01-01 00:00:00', 22, 5588, 191891, 4060778, '2711259913');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143095, 2093, '0050614100039008', '2017-04-27 11:32:01', '2017-05-01 16:46:07', 2, 4320, null, 4037941, '2152120949');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143095, 2093, '0050614100039008', '2017-05-01 16:46:07', '2500-01-01 00:00:00', 6, 4320, 195399, 4062075, '2152120949');

insert into scd_equip_kits (ID_EQUIP_KITS_INST, ID_EQUIP_KITS_TYPE, V_EXT_IDENT, DT_START, DT_STOP, ID_STATUS, ID_CONTRACT_INST, ID_DEALER_CLIENT, ID_REC, V_CAS_ID)
values (143095, 2093, '0050614100039008', '2017-04-27 11:31:34', '2017-04-27 11:32:01', 4, null, null, 4037917, '2152120949');

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2015-07-24 01:00:00', '2015-08-11 01:00:00', 738077);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2015-08-11 01:00:00', '2015-09-30 01:00:00', 778743);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2015-08-11 01:00:00', '2015-09-30 01:00:00', 778804);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2015-09-30 01:00:00', '2016-01-11 00:00:00', 1000563);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2015-09-30 01:00:00', '2016-01-11 00:00:00', 1000572);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2016-01-11 00:00:00', '2017-05-16 01:00:00', 1264801);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2015-08-05 01:00:00', '2015-08-11 01:00:00', 763763);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2016-01-11 00:00:00', '2016-04-29 01:00:00', 1264790);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, 'Комплект Спутникового ТВ МТС №40 (Субсидирование) STB Dune HD TV 251-S2 MTS Lite Plus, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2016-04-04 01:00:00', '2017-04-18 01:00:00', 1494428);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2071, 'Комплект Спутникового ТВ МТС №43 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2016-04-14 01:00:00', '2017-03-30 01:00:00', 1532752);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2016-04-29 01:00:00', '2017-03-30 01:00:00', 1628741);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2133, 'Комплект Спутникового ТВ МТС №169 спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-03-03 00:00:00', '2017-05-16 01:00:00', 3742736);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81', '2016-10-19 01:00:00', '2016-11-08 00:00:00', 2759468);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка 790х670х140мм', '2017-03-30 01:00:00', '2017-05-16 01:00:00', 3864402);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2071, 'Комплект Спутникового ТВ МТС №43 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-03-30 01:00:00', '2017-04-18 01:00:00', 3864415);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2124, 'Комплект Спутникового ТВ МТС №174 (Субсидирование) спутниковый приемник, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1', '2017-03-30 01:00:00', '2017-04-18 01:00:00', 3864395);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, 'Комплект Спутникового ТВ МТС №105 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986931);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование)', '2017-04-17 01:00:00', '2017-04-18 01:00:00', 3952948);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2123, 'Комплект Спутникового ТВ МТС №173 (Субсидирование) спутниковый приемник, антенна 0.6 красная, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3985241);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-05-15 01:00:00', '2017-05-16 01:00:00', 4177200);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2092, 'Комплект Спутникового ТВ МТС №72 (лёгкий старт) модуль CAM Irdeto, антенна 0,6м красная, конвертер, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц, инт. коробка', '2016-10-10 01:00:00', '2017-05-15 01:00:00', 2722381);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2123, 'Комплект Спутникового ТВ МТС №173 (Субсидирование) спутниковый приемник, антенна 0.6 красная, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-03-02 00:00:00', '2017-04-18 01:00:00', 3737665);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2124, 'Комплект Спутникового ТВ МТС №174 (Субсидирование) спутниковый приемник, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1', '2017-03-02 00:00:00', '2017-03-30 01:00:00', 3737713);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, 'Комплект Спутникового ТВ МТС №94 (Субсидирование) приемник Huawei DS300а, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2016-11-29 00:00:00', '2017-04-18 01:00:00', 2982237);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2072, 'Комплект Спутникового ТВ МТС №44 (Субсидирование) приемник DVB-S EKT DSD 4404, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2016-04-14 01:00:00', '2017-04-18 01:00:00', 1532754);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2092, 'Комплект Спутникового ТВ МТС №72 (лёгкий старт) Комплект Спутникового ТВ МТС №72 (лёгкий старт) модуль CAM Irdeto, антенна 0,6м красная, конвертер, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц, инт. коробка', '2016-08-19 01:00:00', '2016-10-10 01:00:00', 2514675);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2126, 'Комплект Спутникового ТВ МТС №176 (Субсидирование) спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986584);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2124, 'Комплект Спутникового ТВ МТС №174 (Субсидирование) спутниковый приемник, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986597);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, 'Комплект Спутникового ТВ МТС №40 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986897);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2071, 'Комплект Спутникового ТВ МТС №43 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986862);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2072, 'Комплект Спутникового ТВ МТС №44 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986884);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986892);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81', '2016-09-12 01:00:00', '2016-10-19 01:00:00', 2601629);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81', '2016-11-08 00:00:00', '2017-03-30 01:00:00', 2835368);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, 'Комплект Спутникового ТВ МТС №105 (Субсидирование) приемник Huawei DS300а, антенна 0.6 красная, конвертер, кабель, SIM-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-01-27 00:00:00', '2017-04-18 01:00:00', 3498446);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2126, 'Комплект Спутникового ТВ МТС №176 (Субсидирование) спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-03-02 00:00:00', '2017-04-18 01:00:00', 3737748);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986907);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, 'Комплект Спутникового ТВ МТС №94 (Субсидирование)', '2017-04-18 01:00:00', '2017-05-16 01:00:00', 3986923);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (лёгкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2016-08-19 01:00:00', '2017-05-15 01:00:00', 2514685);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, смарт-карта CAS IRDETO, услуга Спутникового ТВ на 1 месяц, уст. коробка', '2017-03-30 01:00:00', '2017-04-18 01:00:00', 3864419);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2092, 'Комплект Спутникового ТВ МТС №72 (легкий старт) модуль CAM Irdeto, антенна 0,6м красная, конвертер, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц, инт. коробка', '2017-05-15 01:00:00', '2017-05-16 01:00:00', 4177203);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, 'Комплект Спутникового ТВ МТС №105 (Субсидирование) приемник Huawei DS300а, антенна 0.6 красная, конвертер, кабель, SIM-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-05-16 01:00:00', '2017-10-12 01:00:00', 4192710);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, 'Комплект Спутникового ТВ МТС №40 (Субсидирование) STB Dune HD TV 251-S2 MTS Lite Plus, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-10-12 01:00:00', 4192801);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2071, 'Комплект Спутникового ТВ МТС №43 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192807);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2072, 'Комплект Спутникового ТВ МТС №44 (Субсидирование) приемник DVB-S EKT DSD 4404, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192809);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-06-08 01:00:00', 4192866);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2092, 'Комплект Спутникового ТВ МТС №72 (легкий старт) модуль CAM Irdeto, антенна 0,6м красная, конвертер, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц, коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192869);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, 'Комплект Спутникового ТВ МТС №94 (Субсидирование) приемник Huawei DS300а, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-10-18 01:00:00', '2018-05-04 01:00:00', 5749316);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, 'Комплект Спутникового ТВ МТС №40 (Субсидирование) STB Dune HD TV 251-S2 MTS Lite Plus, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-10-19 01:00:00', '2018-05-04 01:00:00', 5765802);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование) модуль CAM IRDETO, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-11-01 00:00:00', '2018-04-28 01:00:00', 5963396);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-11-02 00:00:00', '2017-12-01 00:00:00', 5974979);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2133, 'Комплект Спутникового ТВ МТС №169 спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192755);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2123, 'Комплект Спутникового ТВ МТС №173 (Субсидирование) спутниковый приемник, антенна 0.6 красная, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192759);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2124, 'Комплект Спутникового ТВ МТС №174 (Субсидирование) спутниковый приемник, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192761);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2126, 'Комплект Спутникового ТВ МТС №176 (Субсидирование) спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192765);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование) модуль CAM IRDETO, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-06-06 01:00:00', 4248005);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, 'Комплект Спутникового ТВ МТС №94 (Субсидирование) приемник Huawei DS300а, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-05-16 01:00:00', '2017-10-12 01:00:00', 4192897);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование) модуль CAM IRDETO, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-06-06 01:00:00', '2017-11-01 00:00:00', 4395298);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-06-08 01:00:00', '2017-08-14 01:00:00', 4424072);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-08-14 01:00:00', '2017-11-02 00:00:00', 5005796);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, '(ВЫКУП) Комплект Спутникового ТВ МТС №105 (Субсидирование) приемник Huawei DS300а, антенна 0.6 красная, конвертер, кабель, SIM-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-10-12 01:00:00', '2017-10-18 01:00:00', 5679954);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, '(ВЫКУП) Комплект Спутникового ТВ МТС №40 (Субсидирование) STB Dune HD TV 251-S2 MTS Lite Plus, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-10-12 01:00:00', '2017-10-19 01:00:00', 5680031);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, '(ВЫКУП) Комплект Спутникового ТВ МТС №94 (Субсидирование) приемник Huawei DS300а, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2017-10-12 01:00:00', '2017-10-18 01:00:00', 5680033);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, смарт-карта CAS IRDETO, услуга Спутникового ТВ на 1 месяц, уст. коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192885);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, 'Комплект Спутникового ТВ МТС №105 (Субсидирование) приемник Huawei DS300а, антенна 0.6 красная, конвертер, кабель, SIM-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-10-18 01:00:00', '2018-05-04 01:00:00', 5748958);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192744);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка', '2017-05-16 01:00:00', '2017-12-01 00:00:00', 4192786);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2017-12-01 00:00:00', '2018-04-18 01:00:00', 6578843);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2105, 'Комплект Спутникового ТВ МТС №81 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, смарт-карта CAS IRDETO, услуга Спутникового ТВ на 1 месяц, уст. коробка', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6592124);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2124, 'Комплект Спутникового ТВ МТС №174 (Субсидирование) спутниковый приемник, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6591623);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2071, 'Комплект Спутникового ТВ МТС №43 (Субсидирование) приемник DVB-S EKT DSD 4404, антенна 0.6 серая, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6591883);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2123, 'Комплект Спутникового ТВ МТС №173 (Субсидирование) спутниковый приемник, антенна 0.6 красная, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2017-12-01 00:00:00', '2018-05-04 01:00:00', 6578487);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2017-12-01 00:00:00', '2018-04-18 01:00:00', 6592332);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2126, 'Комплект Спутникового ТВ МТС №176 (Субсидирование) спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6578534);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2133, 'Комплект Спутникового ТВ МТС №169 спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-12-01 00:00:00', '2018-04-18 01:00:00', 6578718);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2092, 'Комплект Спутникового ТВ МТС №72 (легкий старт) модуль CAM Irdeto, антенна 0,6м красная, конвертер, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц, коробка', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6579021);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка', '2017-12-01 00:00:00', '2018-04-18 01:00:00', 6591718);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2072, 'Комплект Спутникового ТВ МТС №44 (Субсидирование) приемник DVB-S EKT DSD 4404, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2017-12-01 00:00:00', '2500-01-01 00:00:00', 6591892);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2123, 'Комплект Спутникового ТВ МТС №173 (Субсидирование) спутниковый приемник, антенна 0.6 красная, конвертер, кабель, SMART-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2018-05-04 01:00:00', '2500-01-01 00:00:00', 9981431);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2133, 'Комплект Спутникового ТВ МТС №169 спутниковый приемник, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2018-04-18 01:00:00', '2500-01-01 00:00:00', 9695443);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2052, 'Комплект Спутникового ТВ МТС №16 приемник DVB-S EKT DSD 4404, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год', '2018-04-18 01:00:00', '2500-01-01 00:00:00', 9695720);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2054, 'Комплект Спутникового ТВ МТС №21 приемник DVB-S EKT DSD 4404, Антенна 0.6 серая, Конвертор, Кабель, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 год, Коробка', '2018-04-18 01:00:00', '2500-01-01 00:00:00', 9695746);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2093, 'Комплект Спутникового ТВ МТС №71 (легкий старт) модуль CAM Irdeto, смарт-карта CAS Irdeto, услуга Спутникового ТВ на 1 месяц', '2018-04-18 01:00:00', '2500-01-01 00:00:00', 9696084);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2143, 'Комплект Спутникового ТВ МТС №47 (Субсидирование) модуль CAM IRDETO, SMART-карта, услуга Спутникового ТВ на 1 месяц', '2018-04-28 01:00:00', '2500-01-01 00:00:00', 9885076);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2068, 'Комплект Спутникового ТВ МТС №40 (Субсидирование) STB Dune HD TV 251-S2 MTS Lite Plus, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2018-05-04 01:00:00', '2500-01-01 00:00:00', 9981385);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2118, 'Комплект Спутникового ТВ МТС №105 (Субсидирование) приемник Huawei DS300а, антенна 0.6 красная, конвертер, кабель, SIM-карта, услуга Спутникового ТВ на 1 месяц, коробка', '2018-05-04 01:00:00', '2500-01-01 00:00:00', 9981359);

insert into scd_equipment_kits_type (ID_EQUIP_KITS_TYPE, V_NAME, DT_START, DT_STOP, ID_REC)
values (2111, 'Комплект Спутникового ТВ МТС №94 (Субсидирование) приемник Huawei DS300а, SIM-карта, услуга Спутникового ТВ на 1 месяц', '2018-05-04 01:00:00', '2500-01-01 00:00:00', 9981370);



insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (1, 'Склад', 'На складе оператора', 0, 'STORE');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (2, 'Дилер', 'Передано дилеру', 0, 'DEALER');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (3, 'Аренда', 'Выдан в аренду абоненту', 0, 'LEASE');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (4, 'Резерв', 'Резерв на складе оператора', 0, 'RESERVED');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (5, 'Неисправно', null, 0, 'BROKEN');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (6, 'Утеряно', null, 0, 'LOST');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (22, 'Продано', null, 0, 'REDEEM');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (21, 'Возврат', null, 0, 'RETURN');

insert into SCD_EQUIPMENT_STATUS (ID_EQUIPMENT_STATUS, V_NAME, V_DESCR, B_DELETED, V_EXT_IDENT)
values (41, 'Ожидает возврата', 'Ожидает возврата', 0, 'WAIT_RETURN');
    
