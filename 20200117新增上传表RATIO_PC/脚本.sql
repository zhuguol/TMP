create table E_RATIO_PC
(
  ETL_DATE              VARCHAR2(6),
  STATUS                VARCHAR2(2),
  DATA_FLAG             VARCHAR2(64), 
  RGSMNO                VARCHAR2(30),
  RGRSDU                NUMBER(5,2)
);

comment on table E_RATIO_PC
  is 'RATIO_PC';
comment on column E_RATIO_PC.ETL_DATE
  is '上传时间';
comment on column E_RATIO_PC.STATUS
  is '数据状态';
comment on column E_RATIO_PC.DATA_FLAG
  is '数据标示';

--部门RATIO_PC的TB_TABLEINFO脚本

insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('RATIO_PC', 'E_RATIO_PC', 'RGSMNO', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('RATIO_PC', 'E_RATIO_PC', 'RGRSDU', null, null, null, null, 2, null, null, null, null);


insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'PC', 'RATIO_PC', 'PC部门上传文件', null, '4', 'F', 'F', null, null, null);