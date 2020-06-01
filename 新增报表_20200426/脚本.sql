-----------------CUSTOMER_VOLUME_BY_BRANCH 
create table CUSTOMER_VOLUME_BY_BRANCH
( 
  REC_ID			    VARCHAR2(20) not null,
  SEARCH_DATE           VARCHAR2(10),
  BRANCH                VARCHAR2(10),
  BRANCH_NAME           VARCHAR2(320),
  CUSTOMER_VOLUME_WPB   NUMBER(20),
  CUSTOMER_VOLUME_GBM   NUMBER(20),
  CUSTOMER_VOLUME_CMB   NUMBER(20),
  CUSTOMER_VOLUME_ALL   NUMBER(20),
  constraint PK_CUSTOMER_VOLUME_BY_BRANCH primary key(REC_ID)      --设置主键
);

comment on table CUSTOMER_VOLUME_BY_BRANCH is 'CUSTOMER_VOLUME_BY_BRANCH';
comment on column CUSTOMER_VOLUME_BY_BRANCH.REC_ID is '主键序列号';
comment on column CUSTOMER_VOLUME_BY_BRANCH.SEARCH_DATE is '检索时间(年/月)';
comment on column CUSTOMER_VOLUME_BY_BRANCH.BRANCH is '分行号';
comment on column CUSTOMER_VOLUME_BY_BRANCH.BRANCH_NAME is '分行名称';
comment on column CUSTOMER_VOLUME_BY_BRANCH.CUSTOMER_VOLUME_WPB is 'CUSTOMER_VOLUME WPB';
comment on column CUSTOMER_VOLUME_BY_BRANCH.CUSTOMER_VOLUME_GBM is 'CUSTOMER_VOLUME GBM';
comment on column CUSTOMER_VOLUME_BY_BRANCH.CUSTOMER_VOLUME_CMB is 'CUSTOMER_VOLUME CMB';
comment on column CUSTOMER_VOLUME_BY_BRANCH.CUSTOMER_VOLUME_CMB is 'CUSTOMER_VOLUME ALL';

-----------------CUSTOMER_VOLUME_BY_LOB
create table CUSTOMER_VOLUME_BY_LOB
( 
  REC_ID			VARCHAR2(20) not null,
  SEARCH_DATE       VARCHAR2(10),
  LOB               VARCHAR2(10),
  CUSTOMER_VOLUME   NUMBER(20),
  constraint PK_CUSTOMER_VOLUME_BY_LOB primary key(REC_ID)      --设置主键
);

comment on table CUSTOMER_VOLUME_BY_LOB is 'CUSTOMER_VOLUME_BY_LOB';
comment on column CUSTOMER_VOLUME_BY_LOB.REC_ID is '主键序列号';
comment on column CUSTOMER_VOLUME_BY_LOB.SEARCH_DATE is '检索时间(年/月)';
comment on column CUSTOMER_VOLUME_BY_LOB.LOB is 'LOB';
comment on column CUSTOMER_VOLUME_BY_LOB.CUSTOMER_VOLUME is 'CUSTOMER_VOLUME';

------------------------TRANSACTION_VOLUME_BY_BRANCH
create table TRANSACTION_VOLUME_BY_BRANCH
(   
  REC_ID	      VARCHAR2(20) not null,
  SEARCH_DATE     VARCHAR2(10),
  BRANCH          VARCHAR2(10),
  BRANCH_NAME     VARCHAR2(320),
  TRAD_COUNT      NUMBER(20),
  TRAD_AMT        NUMBER(20,3),
  constraint PK_TRANSACTION_VOLUME_BRANCH primary key(REC_ID)      --设置主键
);
comment on table TRANSACTION_VOLUME_BY_BRANCH is 'TRANSACTION_VOLUME_BY_BRANCH';
comment on column TRANSACTION_VOLUME_BY_BRANCH.REC_ID is '主键序列号';
comment on column TRANSACTION_VOLUME_BY_BRANCH.SEARCH_DATE is '检索时间(年/月)';
comment on column TRANSACTION_VOLUME_BY_BRANCH.BRANCH is '分行号';
comment on column TRANSACTION_VOLUME_BY_BRANCH.BRANCH_NAME is '分行名称';
comment on column TRANSACTION_VOLUME_BY_BRANCH.TRAD_COUNT is '交易笔数';
comment on column TRANSACTION_VOLUME_BY_BRANCH.TRAD_AMT is '交易金额(万元人民币)';

------------------------TRANSACTION_VOLUME_BY_LOB
create table TRANSACTION_VOLUME_BY_LOB
(   
  REC_ID	      VARCHAR2(20) not null,
  SEARCH_DATE     VARCHAR2(10),
  LOB             VARCHAR2(10),
  TRAD_COUNT      NUMBER(20),
  TRAD_AMT        NUMBER(20,3),
  constraint PK_TRANSACTION_VOLUME_LOB primary key(REC_ID)      --设置主键
);
comment on table TRANSACTION_VOLUME_BY_LOB is 'TRANSACTION_VOLUME_BY_LOB';
comment on column TRANSACTION_VOLUME_BY_LOB.REC_ID is '主键序列号';
comment on column TRANSACTION_VOLUME_BY_LOB.SEARCH_DATE is '检索时间(年/月)';
comment on column TRANSACTION_VOLUME_BY_LOB.LOB is 'LOB';
comment on column TRANSACTION_VOLUME_BY_LOB.TRAD_COUNT is '交易笔数';
comment on column TRANSACTION_VOLUME_BY_LOB.TRAD_AMT is '交易金额(万元人民币)';


------------------------菜单
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1901', 'Customer Volume', '/fpages/hf/form/ftl/CustomerVolume.ftl', 2, 0, '190', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1902', 'Transaction Volume', '/fpages/hf/form/ftl/TransactionVolume.ftl', 2, 0, '190', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('190', 'FC UAR Raw Data Report', null, 2, 1, '0', 23, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-ok');
commit;