------------------HSBC
------------------记录状态数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (392, 400001, '00', '客户交易监管记录状态', 1, '00-未处理', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (393, 400001, '01', '客户交易监管记录状态', 1, '01-已下载', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (394, 400001, '02', '客户交易监管记录状态', 1, '02-已调研', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (395, 400001, '03', '客户交易监管记录状态', 1, '03-自查审核成功', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (396, 400001, '04', '客户交易监管记录状态', 1, '04-审核失败，重新调研', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (397, 400001, '05', '客户交易监管记录状态', 1, '05-自查已调研', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
-------------------调查阶段数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (398, 400002, '00', '客户交易监管调查阶段', 1, '00-OPS结案', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (399, 400002, '01', '客户交易监管调查阶段', 1, '01-已上报FCTM', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (400, 400002, '02', '客户交易监管调查阶段', 1, '02-FCTM结案', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (401, 400002, '03', '客户交易监管调查阶段', 1, '03-已上报GB/GF 指定部门', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (402, 400002, '04', '客户交易监管调查阶段', 1, '04-GB/GF 指定部门结案', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
-------------------可疑类型数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (403, 400003, '00', '客户交易监管可疑类型', 1, '00-FCR', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (404, 400003, '01', '客户交易监管可疑类型', 1, '01-Misconduct', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (405, 400003, '02', '客户交易监管可疑类型', 1, '02-SAFE', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
-------------------是否判定可疑数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (406, 400004, '00', '客户交易监管是否判定可疑', 1, '00-Y:FCTM', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (407, 400004, '01', '客户交易监管是否判定可疑', 1, '01-Y:GB/GF 指定部门', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (408, 400004, '02', '客户交易监管是否判定可疑', 1, '02-N', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
-------------------是否存在员工编号数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (409, 400005, '00', '客户交易监管是否存在员工编号', 1, '00-无', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (410, 400005, '01', '客户交易监管是否存在员工编号', 1, '01-有', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (411, 400005, '02', '客户交易监管是否存在员工编号', 1, '02-全部', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

-----------------员工交易监测日报
create table A_STAFF_ACCT_TRAD   
(   DATA_DATE                  varchar(8),
    ALERT_ID                   varchar(40) not null,
    CUST_NAME                  varchar(128),
    CUST_ID_CERT_NO            varchar(128),
	CUST_NO                    varchar(32),
    --ACCT_NO                    varchar(64),
    --ACCT_TYPE                  varchar(40),
    --BANK_CARD_TYPE             varchar(2),
    --BANK_CARD_NO               varchar(64),
    STAFF_NUMBER               varchar(10),
    STAFF_DEPARTMENT           varchar(100),
    STAFF_JOB_TITLE            varchar(120),
    RULE_CODE                  varchar(10),
    BUSS_FLAG                  varchar(100),
    MANAGER_NAME               varchar(100),
    CTAR                       varchar(4000),
    CTNT                       varchar(6),
    INVES_RESULT_BY_OPS        varchar(4000),
    CHECK_DATE                 varchar(10),
    INVESTIGATOR               varchar(4000),
    QC_COMMENT                 varchar(4000),
    STATUS                     varchar(10),
    APPEARANCE_TIME            varchar(60),
    REPORT_D_OR_M              varchar(60),
    FEEDBACK_FROM              varchar(4000),
    FEEDBACK_DATE              varchar(10),
    POTENTIAL_CASE_TYPE        varchar(10),
    CONCLUDED_TYPE             varchar(10),
    COMFIRMED_SUSP             varchar(10),
    CASE_ID                    varchar(4000),
    APPROVE_STATUS             varchar(2),
    APPROVE_UPD_TLR            varchar(20),
    APPROVE_RESULT             varchar(500),
    APPROVE_UPD_TM             varchar(30),
    RECORD_UPD_TLR             varchar(20),
    RECORD_UPD_TM              varchar(30),
    FREE_FLAG                  varchar(2),
    ETL_FLAG                   varchar(2),
    REPORT_DATE                varchar(8),
    FILLER1                    varchar(64),
    FILLER2                    varchar(64),
    FILLER3                    varchar(256),
	BRAN_CODE				   varchar(20),
	ALTER_UAR				   varchar(4000),
    constraint PK_A_STAFF_ACCT_TRAD primary key(ALERT_ID)      --设置主键
);

comment on table A_STAFF_ACCT_TRAD is '员工交易监测日报';
comment on column A_STAFF_ACCT_TRAD.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD.CUST_NAME is '客户名称/姓名';
comment on column A_STAFF_ACCT_TRAD.CUST_ID_CERT_NO is '客户身份证件号码';
comment on column A_STAFF_ACCT_TRAD.CUST_NO is '客户号';
--comment on column A_STAFF_ACCT_TRAD.ACCT_NO is '客户账号';
--comment on column A_STAFF_ACCT_TRAD.ACCT_TYPE is '客户账号类型';
--comment on column A_STAFF_ACCT_TRAD.BANK_CARD_TYPE is '银行卡类型';
--comment on column A_STAFF_ACCT_TRAD.BANK_CARD_NO is '银行卡号码';
comment on column A_STAFF_ACCT_TRAD.STAFF_NUMBER is '员工编号';
comment on column A_STAFF_ACCT_TRAD.STAFF_DEPARTMENT is '员工所在部门';
comment on column A_STAFF_ACCT_TRAD.STAFF_JOB_TITLE is '员工职位名称';
comment on column A_STAFF_ACCT_TRAD.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD.MANAGER_NAME is '直线经理姓名';
comment on column A_STAFF_ACCT_TRAD.CTAR is '客户住址/经营地址';
comment on column A_STAFF_ACCT_TRAD.CTNT is '客户国籍';
comment on column A_STAFF_ACCT_TRAD.INVES_RESULT_BY_OPS is '初步调查结论(by OPS)';
comment on column A_STAFF_ACCT_TRAD.CHECK_DATE is '初步调查日期';
comment on column A_STAFF_ACCT_TRAD.INVESTIGATOR is '调查者';
comment on column A_STAFF_ACCT_TRAD.QC_COMMENT is '质检意见';
comment on column A_STAFF_ACCT_TRAD.STATUS is '调查阶段';
comment on column A_STAFF_ACCT_TRAD.APPEARANCE_TIME is '(日报当月/月报当季)被抓出次数';
comment on column A_STAFF_ACCT_TRAD.REPORT_D_OR_M is '日报/月报';
comment on column A_STAFF_ACCT_TRAD.FEEDBACK_FROM is '反馈结果(从FCTM或者GB/GF指定部门)';
comment on column A_STAFF_ACCT_TRAD.FEEDBACK_DATE is '收到反馈时间';
comment on column A_STAFF_ACCT_TRAD.POTENTIAL_CASE_TYPE is '(初步调查)上报的可疑类型';
comment on column A_STAFF_ACCT_TRAD.CONCLUDED_TYPE is '(收到反馈)判定的可疑类型';
comment on column A_STAFF_ACCT_TRAD.COMFIRMED_SUSP is '是否判定可疑';
comment on column A_STAFF_ACCT_TRAD.CASE_ID is '上报案件编号';
comment on column A_STAFF_ACCT_TRAD.APPROVE_STATUS is '记录状态';
comment on column A_STAFF_ACCT_TRAD.APPROVE_UPD_TLR is '审核人员';
comment on column A_STAFF_ACCT_TRAD.APPROVE_RESULT is '审核说明';
comment on column A_STAFF_ACCT_TRAD.APPROVE_UPD_TM is '审核日期';
comment on column A_STAFF_ACCT_TRAD.RECORD_UPD_TLR is '记录修改人';
comment on column A_STAFF_ACCT_TRAD.RECORD_UPD_TM is '记录修改时间';
comment on column A_STAFF_ACCT_TRAD.FREE_FLAG is '自查状态';
comment on column A_STAFF_ACCT_TRAD.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD.REPORT_DATE is '上报日期';
comment on column A_STAFF_ACCT_TRAD.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD.FILLER3 is '预留字段3';
comment on column A_STAFF_ACCT_TRAD.BRAN_CODE is '分行号';
comment on column A_STAFF_ACCT_TRAD.ALTER_UAR is '反馈案件编号';

------------------------员工交易监测月报
create table A_STAFF_ACCT_TRAD_M
(   DATA_DATE             varchar2(8),
    ALERT_ID              varchar2(40) not null,
    CUST_NAME             varchar2(128),
    CUST_ID_CERT_NO       varchar2(128),
    CUST_NO               varchar2(32),
    --ACCT_NO               varchar2(64),
    --ACCT_TYPE             varchar2(40),
    --BANK_CARD_TYPE        varchar2(2),
    --BANK_CARD_NO          varchar2(64),
    STAFF_NUMBER          varchar2(10),
    STAFF_DEPARTMENT      varchar2(100),
    STAFF_JOB_TITLE       varchar2(120),
    RULE_CODE             varchar2(10),
    BUSS_FLAG             varchar2(100),
    manager_name          varchar2(100),
    CTAR                  varchar2(4000),
    CTNT                  varchar2(6),
    INVES_RESULT_BY_OPS   varchar2(4000),
    CHECK_DATE            varchar2(10),
    INVESTIGATOR          varchar2(4000),
    QC_COMMENT            varchar2(4000),
    STATUS                varchar2(10),
    APPEARANCE_TIME       varchar2(60),
    REPORT_D_OR_M         varchar2(60),
    FEEDBACK_FROM         varchar2(4000),
    FEEDBACK_DATE         varchar2(10),
    POTENTIAL_CASE_TYPE   varchar2(10),
    CONCLUDED_TYPE        varchar2(10),
    COMFIRMED_SUSP        varchar2(10),
    CASE_ID               varchar2(4000),
    ALTER_FLAG            varchar2(4000),
    ALTER_UAR             varchar2(4000),
    APPROVE_STATUS        varchar2(2),
    APPROVE_UPD_TLR       varchar2(20),
    APPROVE_RESULT        varchar2(500),
    APPROVE_UPD_TM        varchar2(30),
    RECORD_UPD_TLR        varchar2(20),
    RECORD_UPD_TM         varchar2(30),
    FREE_FLAG             varchar2(2),
    ETL_FLAG              varchar2(2),
    REPORT_DATE           varchar2(8),
    FILLER1               varchar2(64),
    FILLER2               varchar2(64),
    FILLER3               varchar2(256),
	BRAN_CODE			  varchar(20),
	CURR_SEASON           varchar(8),
    constraint PK_A_STAFF_ACCT_TRAD_M primary key(ALERT_ID)      --设置主键
);
comment on table A_STAFF_ACCT_TRAD_M is '员工交易监测月报';
comment on column A_STAFF_ACCT_TRAD_M.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD_M.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD_M.CUST_NAME is '客户名称/姓名';
comment on column A_STAFF_ACCT_TRAD_M.CUST_ID_CERT_NO is '客户身份证件号码';
comment on column A_STAFF_ACCT_TRAD_M.CUST_NO is '客户号';
--comment on column A_STAFF_ACCT_TRAD_M.ACCT_NO is '客户账号';
--comment on column A_STAFF_ACCT_TRAD_M.ACCT_TYPE is '客户账号类型';
--comment on column A_STAFF_ACCT_TRAD_M.BANK_CARD_TYPE is '银行卡类型';
--comment on column A_STAFF_ACCT_TRAD_M.BANK_CARD_NO is '银行卡号码';
comment on column A_STAFF_ACCT_TRAD_M.STAFF_NUMBER is '员工编号';
comment on column A_STAFF_ACCT_TRAD_M.STAFF_DEPARTMENT is '员工所在部门';
comment on column A_STAFF_ACCT_TRAD_M.STAFF_JOB_TITLE is '员工职位名称';
comment on column A_STAFF_ACCT_TRAD_M.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD_M.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD_M.manager_name is '直线经理姓名';
comment on column A_STAFF_ACCT_TRAD_M.CTAR is '客户住址/经营地址';
comment on column A_STAFF_ACCT_TRAD_M.CTNT is '客户国籍';
comment on column A_STAFF_ACCT_TRAD_M.INVES_RESULT_BY_OPS is '初步调查结论(by OPS)';
comment on column A_STAFF_ACCT_TRAD_M.CHECK_DATE is '初步调查日期';
comment on column A_STAFF_ACCT_TRAD_M.INVESTIGATOR is '调查者';
comment on column A_STAFF_ACCT_TRAD_M.QC_COMMENT is '质检意见';
comment on column A_STAFF_ACCT_TRAD_M.STATUS is '调查阶段';
comment on column A_STAFF_ACCT_TRAD_M.APPEARANCE_TIME is '(日报当月/月报当季)被抓出次数';
comment on column A_STAFF_ACCT_TRAD_M.REPORT_D_OR_M is '日报/月报';
comment on column A_STAFF_ACCT_TRAD_M.FEEDBACK_FROM is '反馈结果(从FCTM或者GB/GF指定部门)';
comment on column A_STAFF_ACCT_TRAD_M.FEEDBACK_DATE is '收到反馈时间';
comment on column A_STAFF_ACCT_TRAD_M.POTENTIAL_CASE_TYPE is '(初步调查)上报的可疑类型';
comment on column A_STAFF_ACCT_TRAD_M.CONCLUDED_TYPE is '(收到反馈)判定的可疑类型';
comment on column A_STAFF_ACCT_TRAD_M.COMFIRMED_SUSP is '是否判定可疑';
comment on column A_STAFF_ACCT_TRAD_M.CASE_ID is '上报案件编号';
comment on column A_STAFF_ACCT_TRAD_M.ALTER_FLAG is '当月日报上报案件编号';
comment on column A_STAFF_ACCT_TRAD_M.ALTER_UAR is '反馈案件编号';
comment on column A_STAFF_ACCT_TRAD_M.APPROVE_STATUS is '记录状态';
comment on column A_STAFF_ACCT_TRAD_M.APPROVE_UPD_TLR is '审核人员';
comment on column A_STAFF_ACCT_TRAD_M.APPROVE_RESULT is '审核说明';
comment on column A_STAFF_ACCT_TRAD_M.APPROVE_UPD_TM is '审核日期';
comment on column A_STAFF_ACCT_TRAD_M.RECORD_UPD_TLR is '记录修改人';
comment on column A_STAFF_ACCT_TRAD_M.RECORD_UPD_TM is '记录修改时间';
comment on column A_STAFF_ACCT_TRAD_M.FREE_FLAG is '自查状态';
comment on column A_STAFF_ACCT_TRAD_M.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD_M.REPORT_DATE is '上报日期';
comment on column A_STAFF_ACCT_TRAD_M.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD_M.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD_M.FILLER3 is '预留字段3';
comment on column A_STAFF_ACCT_TRAD_M.BRAN_CODE is '分行号';
comment on column A_STAFF_ACCT_TRAD_M.CURR_SEASON is '所属季度';

------------------------客户交易明细
create table A_STAFF_ACCT_TRAD_INFO
(   
	REC_ID                   varchar2(150) not null,
	DATA_DATE                varchar2(8),
    ALERT_ID                 varchar2(40) not null,
    CUST_NO                  varchar2(32),
    ACCT_NO                  varchar(64),
    ACCT_TYPE                varchar(40),
    BANK_CARD_TYPE           varchar(2),
	BANK_CARD_NO             varchar2(64),
    TSTM                     varchar2(10),
    TRAD_PLACE               varchar2(9),
    PAY_MATCH_NO_TYPE        varchar2(2),
    TRAD_TYPE                varchar2(6),
    FUND_PAY_FLAG            varchar2(2),
    FUND_PAY_PURPOS          varchar2(256),
    CCY_CD                   varchar2(3),
    TRAD_AMT                 number(20,3),
    CNY_TRAD_AMT             number(20,3),
    OPS_FINA_ORG_NAME        varchar2(128),
    OPS_FINA_ORG_AREA_CODE   varchar2(9),
    TRAD_ADVS_NAME           varchar2(128),
    TRAD_ADVS_ID_CERT_NO     varchar2(128),
    TRAD_ADVS_ACCT_NO        varchar2(64),
    NON_COTR_TRAD_TYPE       varchar2(2),
    NON_COTR_TRAD_TYPE_CODE  varchar2(500),
    RULE_CODE                varchar2(10),
    BUSS_FLAG                varchar2(100),
    TBNM                     varchar2(64),
    TBID                     varchar2(128),
    ETL_FLAG                 varchar2(2),
    FILLER1                  varchar2(64),
    FILLER2                  varchar2(64),
    FILLER3                  varchar2(256),
	constraint PK_A_STAFF_ACCT_TRAD_INFO primary key(REC_ID)      --设置主键
);


comment on table A_STAFF_ACCT_TRAD_INFO is '客户交易明细';
comment on column A_STAFF_ACCT_TRAD_INFO.REC_ID is '主键';
comment on column A_STAFF_ACCT_TRAD_INFO.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD_INFO.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD_INFO.CUST_NO is '客户号';
comment on column A_STAFF_ACCT_TRAD_INFO.ACCT_NO is '客户账号';
comment on column A_STAFF_ACCT_TRAD_INFO.ACCT_TYPE is '客户账号类型';
comment on column A_STAFF_ACCT_TRAD_INFO.BANK_CARD_TYPE is '银行卡类型';
comment on column A_STAFF_ACCT_TRAD_INFO.BANK_CARD_NO is '银行卡号码';
comment on column A_STAFF_ACCT_TRAD_INFO.TSTM is '交易发生日期';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_PLACE is '交易发生地';
comment on column A_STAFF_ACCT_TRAD_INFO.PAY_MATCH_NO_TYPE is '收付款方匹配号码类型';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_TYPE is '交易方式';
comment on column A_STAFF_ACCT_TRAD_INFO.FUND_PAY_FLAG is '资金收付标志';
comment on column A_STAFF_ACCT_TRAD_INFO.FUND_PAY_PURPOS is '资金用途';
comment on column A_STAFF_ACCT_TRAD_INFO.CCY_CD is '币种';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_AMT is '交易金额(元)';
comment on column A_STAFF_ACCT_TRAD_INFO.CNY_TRAD_AMT is '交易金额转人民币(元)';
comment on column A_STAFF_ACCT_TRAD_INFO.OPS_FINA_ORG_NAME is '对方金融机构网点名称';
comment on column A_STAFF_ACCT_TRAD_INFO.OPS_FINA_ORG_AREA_CODE is '对方金融机构网点行政代码';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_ADVS_NAME is '交易对手名称';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_ADVS_ID_CERT_NO is '交易对手身份证件号码';
comment on column A_STAFF_ACCT_TRAD_INFO.TRAD_ADVS_ACCT_NO is '交易对手账号';
comment on column A_STAFF_ACCT_TRAD_INFO.NON_COTR_TRAD_TYPE is '非柜台交易方式';
comment on column A_STAFF_ACCT_TRAD_INFO.NON_COTR_TRAD_TYPE_CODE is '非柜台交易方式设备号码';
comment on column A_STAFF_ACCT_TRAD_INFO.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD_INFO.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD_INFO.TBNM is '交易代办人姓名';
comment on column A_STAFF_ACCT_TRAD_INFO.TBID is '代办人身份证件/证明文件号码';
comment on column A_STAFF_ACCT_TRAD_INFO.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD_INFO.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD_INFO.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD_INFO.FILLER3 is '预留字段3';

----菜单设置
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('170', '员工交易监测日报', null, 2, 1, '0', 21, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1701', '员工交易监测日报', '/fpages/hf/form/ftl/AStaffAcctTrad.ftl', 2, 0, '170', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1702', '交易监测日报自查手工抽取', '/fpages/hf/form/ftl/AStaffAcctTradQuery.ftl', 2, 0, '170', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1703', '交易监测日报自查审核', '/fpages/hf/form/ftl/AStaffAcctTradApprove.ftl', 2, 0, '170', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1704', '员工交易监测日报管理', '/fpages/hf/form/ftl/AStaffAcctTradTaskNew.ftl', 2, 0, '170', 4, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');

insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('180', '员工交易监测月报', null, 2, 1, '0', 22, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1801', '员工交易监测月报', '/fpages/hf/form/ftl/AStaffAcctTradM.ftl', 2, 0, '180', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1802', '交易监测月报自查手工抽取', '/fpages/hf/form/ftl/AStaffAcctTradMQuery.ftl', 2, 0, '180', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1803', '交易监测月报自查审核', '/fpages/hf/form/ftl/AStaffAcctTradMApprove.ftl', 2, 0, '180', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1804', '员工交易监测月报管理', '/fpages/hf/form/ftl/AStaffAcctTradMTaskNew.ftl', 2, 0, '180', 4, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
commit;

------客户参数设置
INSERT INTO SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER) 
VALUES ('ALTER', 'ALTER', '10', '交易自查比例', '交易自查比例', '4', 'F', 'F', '20200511', '20200511120720', null);
commit;

insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1012', '客户参数设置', '/fpages/hf/form/ftl/AStaffSysParams.ftl', 2, 0, '10', 13, 1, '1', null, null, null, '1', null, null, null, null, null, 'icon-set');
commit;

------待办任务
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STAFF', '1701,1801', '主页员工交易调研', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STAFS', '1702,1703,1704,1802,1803,1804', '主页员工交易自查', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STRRB', '2101,2201', '主页员工交易调研', null, '4', 'F', 'F', null, null, null);
commit;
commit;

--------操作员员工交易监测调研
create or replace view vi_homepage_todo05 as 
select c.id,c.data_date,c.report_d_or_m,c.snt from (       
select SYS_GUID() AS id,t.data_date, t.report_d_or_m || '-日报' as report_d_or_m , sum(case when t.status is null then 1 else 0 end) as snt
  from a_staff_acct_trad t
 where t.status is null
 group by t.data_date, report_d_or_m, t.status
union
select SYS_GUID() AS id,m.data_date, m.report_d_or_m || '-月报' as report_d_or_m, sum(case when m.status is null then 1 else 0 end) as snt
  from a_staff_acct_trad_m m
 where m.status is null
 group by m.data_date, report_d_or_m, m.status) c where c.snt > 0
order by c.data_date;


-------操作员员工交易监测自查
create or replace view vi_homepage_todo06 as
select c.id,c.data_date,c.report_d_or_m, c.cnt,c.snt from(
 select SYS_GUID() AS id,t.data_date as data_date,
        t.report_d_or_m || '-日报' as report_d_or_m,
        sum(case
              when t.FREE_FLAG = '01' then
               1
              else
               0
            end) cnt,
        sum(case
              when t.approve_status = '02' then
               1
              else
               0
            end) snt
 
   from a_staff_acct_trad t
  where t.FREE_FLAG = '01'
  group by t.data_date, t.report_d_or_m
 union
 select SYS_GUID() AS id,m.data_date as data_date,
        m.report_d_or_m || '-月报' as report_d_or_m,
        sum(case
              when m.FREE_FLAG = '01' then
               1
              else
               0
            end) cnt,
        sum(case
              when m.approve_status = '02' then
               1
              else
               0
            end) snt
 
   from a_staff_acct_trad_m m
  where m.FREE_FLAG = '01'
  group by m.data_date, m.report_d_or_m)c where c.snt > 0
order by c.data_date;







-------------------------------------------------村镇行RRB员工交易监测
--------------------村镇行员工交易监测菜单
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('210', '员工交易监测日报', null, 2, 1, '0', 24, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2101', '员工交易监测日报', '/fpages/hf/form/ftl/AStaffAcctTradRRB.ftl', 2, 0, '210', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2102', '员工交易监测日报管理', '/fpages/hf/form/ftl/AStaffAcctTradRRBTaskNew.ftl', 2, 0, '210', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('220', '员工交易监测月报', null, 2, 1, '0', 25, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2201', '员工交易监测月报', '/fpages/hf/form/ftl/AStaffAcctTradMRRB.ftl', 2, 0, '220', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2202', '员工交易监测月报管理', '/fpages/hf/form/ftl/AStaffAcctTradMRRBTaskNew.ftl', 2, 0, '220', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
commit;
--------------------记录状态
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (412, 400006, '00', '客户交易监管记录状态', 1, '00-未处理', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (413, 400006, '01', '客户交易监管记录状态', 1, '01-已下载', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (414, 400006, '02', '客户交易监管记录状态', 1, '02-已调研', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

--------------------调查阶段
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (415, 400007, '00', '客户交易监管调查阶段', 1, '00-to FCTM', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (416, 400007, '01', '客户交易监管调查阶段', 1, '01-to President', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (417, 400007, '02', '客户交易监管调查阶段', 1, '02-Closed by FCTM', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (418, 400007, '03', '客户交易监管调查阶段', 1, '03-Closed by President', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (419, 400007, '04', '客户交易监管调查阶段', 1, '04-Closed by VPHOST', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

--------------------客户交易监管可疑类型
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (420, 400008, '00', '客户交易监管可疑类型', 1, '00-FCR', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (421, 400008, '01', '客户交易监管可疑类型', 1, '01-Misconduct', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

--------------------客户交易监管是否判定可疑
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (422, 400009, '00', '客户交易监管是否判定可疑', 1, '00-Y:FCTM', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (423, 400009, '01', '客户交易监管是否判定可疑', 1, '01-Y:President', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (424, 400009, '02', '客户交易监管是否判定可疑', 1, '02-N', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

-------------------是否存在员工编号数据字典
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (425, 400010, '00', '客户交易监管是否存在员工编号', 1, '00-无', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (426, 400010, '01', '客户交易监管是否存在员工编号', 1, '01-有', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into DATA_DIC (ID, DATA_TYPE_NO, DATA_NO, DATA_TYPE_NAME, DATA_NO_LEN, DATA_NAME, LIMIT_FLAG, HIGH_LIMIT, LOW_LIMIT, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, APPROVE_STATUS, APPROVE_RESULT, REC_STATUS, REP_STATUS, IS_SUB_SUCCESS, CRT_TM, LST_UPD_TM, LST_UPD_TLR, APPTYPE, BR_NO, YWDATE, ORGCODE, RECORD_UPD_TLR, RECORD_UPD_TM, ST)
values (427, 400010, '02', '客户交易监管是否存在员工编号', 1, '02-全部', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;

------待办任务
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STAFF', '1701,1801', '主页员工交易调研', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STAFS', '1702,1703,1704,1802,1803,1804', '主页员工交易自查', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_STRRB', '2101,2201', '主页员工交易调研', null, '4', 'F', 'F', null, null, null);
commit;

--------------------村镇行员工交易监测日报
create table A_STAFF_ACCT_TRAD_RRB  
(   DATA_DATE                  varchar(8),
    ALERT_ID                   varchar(40) not null,
    CUST_NAME                  varchar(128),
    CUST_ID_CERT_NO            varchar(128),
	CUST_NO                    varchar(32),
    STAFF_NUMBER               varchar(10),
    STAFF_DEPARTMENT           varchar(100),
    STAFF_JOB_TITLE            varchar(120),
    RULE_CODE                  varchar(10),
    BUSS_FLAG                  varchar(100),
    MANAGER_NAME               varchar(100),
    CTAR                       varchar(4000),
    CTNT                       varchar(6),
    INVES_RESULT_BY_OPS        varchar(4000),
    CHECK_DATE                 varchar(10),
    INVESTIGATOR               varchar(4000),
    STATUS                     varchar(10),
    APPEARANCE_TIME            varchar(60),
    REPORT_D_OR_M              varchar(60),
    FEEDBACK_FROM              varchar(4000),
    FEEDBACK_DATE              varchar(10),
    POTENTIAL_CASE_TYPE        varchar(10),
    CONCLUDED_TYPE             varchar(10),
    COMFIRMED_SUSP             varchar(10),
    CASE_ID                    varchar(4000),
    APPROVE_STATUS             varchar(2),
    APPROVE_UPD_TLR            varchar(20),
    APPROVE_RESULT             varchar(500),
    APPROVE_UPD_TM             varchar(30),
    RECORD_UPD_TLR             varchar(20),
    RECORD_UPD_TM              varchar(30),
    FREE_FLAG                  varchar(2),
    ETL_FLAG                   varchar(2),
    REPORT_DATE                varchar(8),
    FILLER1                    varchar(64),
    FILLER2                    varchar(64),
    FILLER3                    varchar(256),
	BRAN_CODE				   varchar(20),
	ALTER_UAR				   varchar(4000),
    constraint PK_A_STAFF_ACCT_TRAD_RRB primary key(ALERT_ID)      --设置主键
);

comment on table A_STAFF_ACCT_TRAD_RRB is '员工交易监测日报';
comment on column A_STAFF_ACCT_TRAD_RRB.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD_RRB.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD_RRB.CUST_NAME is '客户名称/姓名';
comment on column A_STAFF_ACCT_TRAD_RRB.CUST_ID_CERT_NO is '客户身份证件号码';
comment on column A_STAFF_ACCT_TRAD_RRB.CUST_NO is '客户号';
comment on column A_STAFF_ACCT_TRAD_RRB.STAFF_NUMBER is '员工编号';
comment on column A_STAFF_ACCT_TRAD_RRB.STAFF_DEPARTMENT is '员工所在部门';
comment on column A_STAFF_ACCT_TRAD_RRB.STAFF_JOB_TITLE is '员工职位名称';
comment on column A_STAFF_ACCT_TRAD_RRB.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD_RRB.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD_RRB.MANAGER_NAME is '直线经理姓名';
comment on column A_STAFF_ACCT_TRAD_RRB.CTAR is '客户住址/经营地址';
comment on column A_STAFF_ACCT_TRAD_RRB.CTNT is '客户国籍';
comment on column A_STAFF_ACCT_TRAD_RRB.INVES_RESULT_BY_OPS is '初步调查结论(by OPS)';
comment on column A_STAFF_ACCT_TRAD_RRB.CHECK_DATE is '初步调查日期';
comment on column A_STAFF_ACCT_TRAD_RRB.INVESTIGATOR is '调查者';
comment on column A_STAFF_ACCT_TRAD_RRB.STATUS is '调查阶段';
comment on column A_STAFF_ACCT_TRAD_RRB.APPEARANCE_TIME is '(日报当月/月报当季)被抓出次数';
comment on column A_STAFF_ACCT_TRAD_RRB.REPORT_D_OR_M is '日报/月报';
comment on column A_STAFF_ACCT_TRAD_RRB.FEEDBACK_FROM is '反馈结果(从FCTM或者President)';
comment on column A_STAFF_ACCT_TRAD_RRB.FEEDBACK_DATE is '收到反馈时间';
comment on column A_STAFF_ACCT_TRAD_RRB.POTENTIAL_CASE_TYPE is '(初步调查)上报的可疑类型';
comment on column A_STAFF_ACCT_TRAD_RRB.CONCLUDED_TYPE is '(收到反馈)判定的可疑类型';
comment on column A_STAFF_ACCT_TRAD_RRB.COMFIRMED_SUSP is '是否判定可疑';
comment on column A_STAFF_ACCT_TRAD_RRB.CASE_ID is '上报案件编号';
comment on column A_STAFF_ACCT_TRAD_RRB.APPROVE_STATUS is '记录状态';
comment on column A_STAFF_ACCT_TRAD_RRB.APPROVE_UPD_TLR is '审核人员';
comment on column A_STAFF_ACCT_TRAD_RRB.APPROVE_RESULT is '审核说明';
comment on column A_STAFF_ACCT_TRAD_RRB.APPROVE_UPD_TM is '审核日期';
comment on column A_STAFF_ACCT_TRAD_RRB.RECORD_UPD_TLR is '记录修改人';
comment on column A_STAFF_ACCT_TRAD_RRB.RECORD_UPD_TM is '记录修改时间';
comment on column A_STAFF_ACCT_TRAD_RRB.FREE_FLAG is '自查状态';
comment on column A_STAFF_ACCT_TRAD_RRB.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD_RRB.REPORT_DATE is '上报日期';
comment on column A_STAFF_ACCT_TRAD_RRB.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD_RRB.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD_RRB.FILLER3 is '预留字段3';
comment on column A_STAFF_ACCT_TRAD_RRB.BRAN_CODE is '机构号';
comment on column A_STAFF_ACCT_TRAD_RRB.ALTER_UAR is '反馈案件编号';


------------------------员工交易监测月报
create table A_STAFF_ACCT_TRAD_M_RRB
(   DATA_DATE             varchar2(8),
    ALERT_ID              varchar2(40) not null,
    CUST_NAME             varchar2(128),
    CUST_ID_CERT_NO       varchar2(128),
    CUST_NO               varchar2(32),
    STAFF_NUMBER          varchar2(10),
    STAFF_DEPARTMENT      varchar2(100),
    STAFF_JOB_TITLE       varchar2(120),
    RULE_CODE             varchar2(10),
    BUSS_FLAG             varchar2(100),
    manager_name          varchar2(100),
    CTAR                  varchar2(4000),
    CTNT                  varchar2(6),
    INVES_RESULT_BY_OPS   varchar2(4000),
    CHECK_DATE            varchar2(10),
    INVESTIGATOR          varchar2(4000),
    STATUS                varchar2(10),
    APPEARANCE_TIME       varchar2(60),
    REPORT_D_OR_M         varchar2(60),
    FEEDBACK_FROM         varchar2(4000),
    FEEDBACK_DATE         varchar2(10),
    POTENTIAL_CASE_TYPE   varchar2(10),
    CONCLUDED_TYPE        varchar2(10),
    COMFIRMED_SUSP        varchar2(10),
    CASE_ID               varchar2(4000),
    ALTER_FLAG            varchar2(4000),
    ALTER_UAR             varchar2(4000),
    APPROVE_STATUS        varchar2(2),
    APPROVE_UPD_TLR       varchar2(20),
    APPROVE_RESULT        varchar2(500),
    APPROVE_UPD_TM        varchar2(30),
    RECORD_UPD_TLR        varchar2(20),
    RECORD_UPD_TM         varchar2(30),
    FREE_FLAG             varchar2(2),
    ETL_FLAG              varchar2(2),
    REPORT_DATE           varchar2(8),
    FILLER1               varchar2(64),
    FILLER2               varchar2(64),
    FILLER3               varchar2(256),
	BRAN_CODE			  varchar(20),
	CURR_SEASON           varchar(8),
    constraint PK_A_STAFF_ACCT_TRAD_M_RRB primary key(ALERT_ID)      --设置主键
);
comment on table A_STAFF_ACCT_TRAD_M_RRB is '员工交易监测月报';
comment on column A_STAFF_ACCT_TRAD_M_RRB.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD_M_RRB.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CUST_NAME is '客户名称/姓名';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CUST_ID_CERT_NO is '客户身份证件号码';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CUST_NO is '客户号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.STAFF_NUMBER is '员工编号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.STAFF_DEPARTMENT is '员工所在部门';
comment on column A_STAFF_ACCT_TRAD_M_RRB.STAFF_JOB_TITLE is '员工职位名称';
comment on column A_STAFF_ACCT_TRAD_M_RRB.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD_M_RRB.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD_M_RRB.manager_name is '直线经理姓名';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CTAR is '客户住址/经营地址';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CTNT is '客户国籍';
comment on column A_STAFF_ACCT_TRAD_M_RRB.INVES_RESULT_BY_OPS is '初步调查结论(by OPS)';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CHECK_DATE is '初步调查日期';
comment on column A_STAFF_ACCT_TRAD_M_RRB.INVESTIGATOR is '调查者';
comment on column A_STAFF_ACCT_TRAD_M_RRB.STATUS is '调查阶段';
comment on column A_STAFF_ACCT_TRAD_M_RRB.APPEARANCE_TIME is '(日报当月/月报当季)被抓出次数';
comment on column A_STAFF_ACCT_TRAD_M_RRB.REPORT_D_OR_M is '日报/月报';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FEEDBACK_FROM is '反馈结果(从FCTM或者President)';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FEEDBACK_DATE is '收到反馈时间';
comment on column A_STAFF_ACCT_TRAD_M_RRB.POTENTIAL_CASE_TYPE is '(初步调查)上报的可疑类型';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CONCLUDED_TYPE is '(收到反馈)判定的可疑类型';
comment on column A_STAFF_ACCT_TRAD_M_RRB.COMFIRMED_SUSP is '是否判定可疑';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CASE_ID is '上报案件编号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.ALTER_FLAG is '当月日报上报案件编号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.ALTER_UAR is '反馈案件编号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.APPROVE_STATUS is '记录状态';
comment on column A_STAFF_ACCT_TRAD_M_RRB.APPROVE_UPD_TLR is '审核人员';
comment on column A_STAFF_ACCT_TRAD_M_RRB.APPROVE_RESULT is '审核说明';
comment on column A_STAFF_ACCT_TRAD_M_RRB.APPROVE_UPD_TM is '审核日期';
comment on column A_STAFF_ACCT_TRAD_M_RRB.RECORD_UPD_TLR is '记录修改人';
comment on column A_STAFF_ACCT_TRAD_M_RRB.RECORD_UPD_TM is '记录修改时间';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FREE_FLAG is '自查状态';
comment on column A_STAFF_ACCT_TRAD_M_RRB.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD_M_RRB.REPORT_DATE is '上报日期';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD_M_RRB.FILLER3 is '预留字段3';
comment on column A_STAFF_ACCT_TRAD_M_RRB.BRAN_CODE is '机构号';
comment on column A_STAFF_ACCT_TRAD_M_RRB.CURR_SEASON is '所属季度';


------------------------客户交易明细
create table A_STAFF_ACCT_TRAD_INFO_RRB
(   
	REC_ID                   varchar2(150) not null,
	DATA_DATE                varchar2(8),
    ALERT_ID                 varchar2(40) not null,
    CUST_NO                  varchar2(32),
    ACCT_NO                  varchar(64),
    ACCT_TYPE                varchar(40),
    BANK_CARD_TYPE           varchar(2),
	BANK_CARD_NO             varchar2(64),
    TSTM                     varchar2(10),
    TRAD_PLACE               varchar2(9),
    PAY_MATCH_NO_TYPE        varchar2(2),
    TRAD_TYPE                varchar2(6),
    FUND_PAY_FLAG            varchar2(2),
    FUND_PAY_PURPOS          varchar2(256),
    CCY_CD                   varchar2(3),
    TRAD_AMT                 number(20,3),
    CNY_TRAD_AMT             number(20,3),
    OPS_FINA_ORG_NAME        varchar2(128),
    OPS_FINA_ORG_AREA_CODE   varchar2(9),
    TRAD_ADVS_NAME           varchar2(128),
    TRAD_ADVS_ID_CERT_NO     varchar2(128),
    TRAD_ADVS_ACCT_NO        varchar2(64),
    NON_COTR_TRAD_TYPE       varchar2(2),
    NON_COTR_TRAD_TYPE_CODE  varchar2(500),
    RULE_CODE                varchar2(10),
    BUSS_FLAG                varchar2(100),
    TBNM                     varchar2(64),
    TBID                     varchar2(128),
    ETL_FLAG                 varchar2(2),
    FILLER1                  varchar2(64),
    FILLER2                  varchar2(64),
    FILLER3                  varchar2(256),
	constraint PK_A_STAFF_ACCT_TRAD_INFO_RRB primary key(REC_ID)      --设置主键
);


comment on table A_STAFF_ACCT_TRAD_INFO_RRB is '客户交易明细';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.REC_ID is '主键';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.DATA_DATE is '数据日期';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.ALERT_ID is '告警号';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.CUST_NO is '客户号';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.ACCT_NO is '客户账号';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.ACCT_TYPE is '客户账号类型';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.BANK_CARD_TYPE is '银行卡类型';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.BANK_CARD_NO is '银行卡号码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TSTM is '交易发生日期';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_PLACE is '交易发生地';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.PAY_MATCH_NO_TYPE is '收付款方匹配号码类型';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_TYPE is '交易方式';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.FUND_PAY_FLAG is '资金收付标志';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.FUND_PAY_PURPOS is '资金用途';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.CCY_CD is '币种';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_AMT is '交易金额(元)';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.CNY_TRAD_AMT is '交易金额转人民币(元)';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.OPS_FINA_ORG_NAME is '对方金融机构网点名称';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.OPS_FINA_ORG_AREA_CODE is '对方金融机构网点行政代码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_ADVS_NAME is '交易对手名称';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_ADVS_ID_CERT_NO is '交易对手身份证件号码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TRAD_ADVS_ACCT_NO is '交易对手账号';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.NON_COTR_TRAD_TYPE is '非柜台交易方式';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.NON_COTR_TRAD_TYPE_CODE is '非柜台交易方式设备号码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.RULE_CODE is '规则代码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.BUSS_FLAG is '业务标识';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TBNM is '交易代办人姓名';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.TBID is '代办人身份证件/证明文件号码';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.ETL_FLAG is '数据频度';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.FILLER1 is '预留字段1';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.FILLER2 is '预留字段2';
comment on column A_STAFF_ACCT_TRAD_INFO_RRB.FILLER3 is '预留字段3';

-------村镇行RRB操作员员工交易监测自查
create or replace view vi_homepage_todo07 as
select c.id,c.data_date,c.report_d_or_m,c.br_no,c.snt from (
select SYS_GUID() AS id,t.data_date, t.report_d_or_m || '-日报' as report_d_or_m , t.bran_code as br_no, count(1) as snt
  from a_staff_acct_trad_rrb t
 where t.status='00' or t.status='01' or t.status='02' or t.status is null
 group by t.data_date, t.report_d_or_m, t.bran_code
union
select SYS_GUID() AS id,m.data_date, m.report_d_or_m || '-月报' as report_d_or_m, m.bran_code as br_no, count(1) as snt
  from a_staff_acct_trad_m_rrb m
 where m.status='00' or m.status='01' or m.status='02' or m.status is null
 group by m.data_date, m.report_d_or_m, m.bran_code) c where c.snt > 0
order by c.data_date;
