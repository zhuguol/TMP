create table AML_CUST_INFO
(
  ID                      VARCHAR2(20),
  CUST_NAME               VARCHAR2(20),
  CUST_NUM                VARCHAR2(20),
  CUST_ZJNUM              VARCHAR2(64),
  CUST_STATUS             VARCHAR2(8)
);
comment on table AML_CUST_INFO
  is '客户表';
comment on column AML_CUST_INFO.ID
  is 'id';
comment on column AML_CUST_INFO.CUST_NAME
  is '客户姓名';
comment on column AML_CUST_INFO.CUST_NUM
  is '客户编号';
comment on column AML_CUST_INFO.CUST_ZJNUM
  is '客户证件号码';
comment on column AML_CUST_INFO.CUST_STATUS
  is '客户客户状态';
  
----------------------
create table AML_CUST_MX_INFO
(
  ID                      VARCHAR2(20),
  CUST_NUM                VARCHAR2(20),
  TRADE_NUM               VARCHAR2(20),
  TRADE_TYPE              VARCHAR2(20),
  TRADE_DATE              VARCHAR2(20),
  FILLER1                 VARCHAR2(20),
  FILLER2                 VARCHAR2(20),
  FILLER3                 VARCHAR2(20)
);
comment on table AML_CUST_MX_INFO
  is '客户明细表';
comment on column AML_CUST_MX_INFO.ID
  is 'id';
comment on column AML_CUST_MX_INFO.CUST_NUM
  is '客户编号';
comment on column AML_CUST_MX_INFO.TRADE_NUM
  is '交易编号';
comment on column AML_CUST_MX_INFO.TRADE_TYPE
  is '交易类型';
comment on column AML_CUST_MX_INFO.TRADE_DATE
  is '交易时间';
comment on column AML_CUST_MX_INFO.FILLER1
  is '备用字段1';
comment on column AML_CUST_MX_INFO.FILLER2
  is '备用字段2';
comment on column AML_CUST_MX_INFO.FILLER3
  is '备用字段3';

---------------------------
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('130_36', '客户数据抽查', '/fpages/hf/form/ftl/AmlCustInfo.ftl', 2, 0, '130_3', 6, null, '1', null, null, null, '1', null, null, null, null, null, null);
commit;