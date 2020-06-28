create table E_AOCHS1RATE(
	P_APCD                VARCHAR2(26),
	P_ACNO                VARCHAR2(12),
	P_DRSP                NUMBER(11,8),
	P_BSRT                NUMBER(11,8),
	ETL_DATE              VARCHAR2(6),
	STATUS                VARCHAR2(2),
    DATA_FLAG             VARCHAR2(64) 
);
comment on table E_AOCHS1RATE
  is '信贷借据信息表';
comment on column E_AOCHS1RATE.P_APCD
  is '信贷借据号';
comment on column E_AOCHS1RATE.P_ACNO
  is 'Loan A/C';
comment on column E_AOCHS1RATE.P_DRSP
  is 'LPR加减点值';
comment on column E_AOCHS1RATE.P_BSRT
  is 'LPR基准利率';
comment on column E_AOCHS1RATE.ETL_DATE
  is '上传时间';
comment on column E_AOCHS1RATE.STATUS
  is '数据状态';
comment on column E_AOCHS1RATE.DATA_FLAG
  is '数据标示';


insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('AOCHS1RATE_MBS', 'E_AOCHS1RATE', 'P_APCD', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('AOCHS1RATE_MBS', 'E_AOCHS1RATE', 'P_ACNO', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('AOCHS1RATE_MBS', 'E_AOCHS1RATE', 'P_DRSP', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('AOCHS1RATE_MBS', 'E_AOCHS1RATE', 'P_BSRT', null, null, null, null, 4, null, null, null, null);



insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'MBS', 'AOCHS1RATE_MBS', 'MBS部门上传文件', null, '4', 'F', 'F', null, null, null);