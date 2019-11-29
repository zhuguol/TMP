-----------------------------------------贷款核销
create table E_DKHX
(
  ETL_DATE              VARCHAR2(6),
  STATUS                VARCHAR2(2),
  DATA_FLAG             VARCHAR2(64), 
  XDJJH					VARCHAR2(100),
  XDHTH					VARCHAR2(100),
  KHTYBH				VARCHAR2(60),
  --YXJGDM				VARCHAR2(30),
  --JRXKZH			    VARCHAR2(30),
  --NBJGH       		VARCHAR2(30),
  KMGSJG                VARCHAR2(30),
  BZ                    VARCHAR2(3),
  SHDKBJ				NUMBER(20,2),
  SHBNLX				NUMBER(20,2),
  SHBWLX				NUMBER(20,2),
  HXRQ					VARCHAR2(8),
  HXSHBJ				NUMBER(20,2),
  HXSHBNLX				NUMBER(20,2),
  HXSHBWLX				NUMBER(20,2),
  SHBZ					VARCHAR2(4),
  HXSHGYH				VARCHAR2(30),
  HXSHRQ				VARCHAR2(8),
  BZH					VARCHAR2(200)
--CJRQ				VARCHAR2(8)
);

comment on table E_DKHX
  is '贷款核销';
comment on column E_DKHX.ETL_DATE
  is '上传时间';
comment on column E_DKHX.STATUS
  is '数据状态';
comment on column E_DKHX.DATA_FLAG
  is '数据标示';
comment on column E_DKHX.XDJJH
  is '信贷借据号';
comment on column E_DKHX.XDHTH
  is '信贷合同号';
comment on column E_DKHX.KHTYBH
  is '客户统一编号';
--comment on column E_DKHX.YXJGDM
--  is '银行机构代码';
--comment on column E_DKHX.JRXKZH
--  is '金融许可证号';
--comment on column E_DKHX.NBJGH
--  is '内部机构号';
comment on column E_DKHX.KMGSJG
  is '科目归属机构';
comment on column E_DKHX.BZ
  is '币种';
comment on column E_DKHX.SHDKBJ
  is '实核贷款本金';
comment on column E_DKHX.SHBNLX
  is '实核表内利息';
comment on column E_DKHX.SHBWLX
  is '实核表外利息';
comment on column E_DKHX.HXRQ
  is '核销日期';
comment on column E_DKHX.HXSHBJ
  is '核销收回本金';
comment on column E_DKHX.HXSHBNLX
  is '核销收回表内利息';
comment on column E_DKHX.HXSHBWLX
  is '核销收回表外利息';
comment on column E_DKHX.SHBZ
  is '收回标志';
comment on column E_DKHX.HXSHGYH
  is '核销收回柜员号';
comment on column E_DKHX.HXSHRQ
  is '核销收回日期';
comment on column E_DKHX.BZH
  is '备注';
--comment on column DKHX.CJRQ
--  is '采集日期';
create unique index DKHX_PRIMARY_KEY ON E_DKHX (XDJJH,HXRQ,HXSHRQ,ETL_DATE); 



--部门DKHX_CSS的TB_TABLEINFO脚本
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'XDJJH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'XDHTH', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'KHTYBH', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'KMGSJG', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'BZ', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'SHDKBJ', null, null, null, null, 6, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'SHBNLX', null, null, null, null, 7, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'SHBWLX', null, null, null, null, 8, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXRQ', null, null, null, null, 9, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXSHBJ', null, null, null, null, 10, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXSHBNLX', null, null, null, null, 11, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXSHBWLX', null, null, null, null, 12, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'SHBZ', null, null, null, null, 13, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXSHGYH', null, null, null, null, 14, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'HXSHRQ', null, null, null, null, 15, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CCS', 'E_DKHX', 'BZH', null, null, null, null, 16, null, null, null, null);


--部门DKHX_WMR的TB_TABLEINFO脚本

insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'XDJJH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'XDHTH', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'KHTYBH', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'KMGSJG', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'BZ', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'SHDKBJ', null, null, null, null, 6, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'SHBNLX', null, null, null, null, 7, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'SHBWLX', null, null, null, null, 8, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXRQ', null, null, null, null, 9, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXSHBJ', null, null, null, null, 10, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXSHBNLX', null, null, null, null, 11, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXSHBWLX', null, null, null, null, 12, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'SHBZ', null, null, null, null, 13, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXSHGYH', null, null, null, null, 14, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'HXSHRQ', null, null, null, null, 15, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_WMR', 'E_DKHX', 'BZH', null, null, null, null, 16, null, null, null, null);



--部门DKHX_CDT的TB_TABLEINFO脚本

insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'XDJJH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'XDHTH', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'KHTYBH', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'KMGSJG', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'BZ', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'SHDKBJ', null, null, null, null, 6, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'SHBNLX', null, null, null, null, 7, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'SHBWLX', null, null, null, null, 8, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXRQ', null, null, null, null, 9, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXSHBJ', null, null, null, null, 10, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXSHBNLX', null, null, null, null, 11, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXSHBWLX', null, null, null, null, 12, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'SHBZ', null, null, null, null, 13, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXSHGYH', null, null, null, null, 14, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'HXSHRQ', null, null, null, null, 15, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_CDT', 'E_DKHX', 'BZH', null, null, null, null, 16, null, null, null, null);


--部门DKHX_RBB的TB_TABLEINFO脚本

insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'XDJJH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'XDHTH', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'KHTYBH', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'KMGSJG', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'BZ', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'SHDKBJ', null, null, null, null, 6, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'SHBNLX', null, null, null, null, 7, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'SHBWLX', null, null, null, null, 8, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXRQ', null, null, null, null, 9, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXSHBJ', null, null, null, null, 10, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXSHBNLX', null, null, null, null, 11, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXSHBWLX', null, null, null, null, 12, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'SHBZ', null, null, null, null, 13, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXSHGYH', null, null, null, null, 14, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'HXSHRQ', null, null, null, null, 15, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('DKHX_RBB', 'E_DKHX', 'BZH', null, null, null, null, 16, null, null, null, null);



insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'CCS', 'DKHX_CCS', 'CCS部门上传文件', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'WMR', 'DKHX_WMR', 'WMR部门上传文件', null, '4', 'F', 'F', null, null, null);  
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'CDT', 'DKHX_CDT', 'CDT部门上传文件', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'RBB', 'DKHX_RBB', 'RBB部门上传文件', null, '4', 'F', 'F', null, null, null);

---------------------------------------机构信息表
create table E_JGXXB
(
  ETL_DATE              VARCHAR2(6),
  STATUS                VARCHAR2(2),
  DATA_FLAG             VARCHAR2(64),
  NBJGH					VARCHAR2(30),
  JRXKZH				VARCHAR2(30),
  YXJGMC                VARCHAR2(200),
  CLSJ                  VARCHAR2(8),
  YXJGDM				VARCHAR2(30),
  JGDZ					VARCHAR2(400),
  YYZZH					VARCHAR2(60),
--  JGLB			    VARCHAR2(30),
--  YZBM       			VARCHAR2(6),
--  WDH       			VARCHAR2(30),
  YYZT                VARCHAR2(6)
--  JGGZKSSJ 		    VARCHAR2(6),
--  JGGZZZSJ            VARCHAR2(6),  
--  FZRXM			    VARCHAR2(100),
--  FZRZW				VARCHAR2(60),
--  FZRLXDH  			VARCHAR2(30)
--  CJRQ				VARCHAR2(8)
);

comment on table E_JGXXB
  is '机构信息表';
comment on column E_JGXXB.ETL_DATE
  is '上传时间';
comment on column E_JGXXB.STATUS
  is '数据状态';
comment on column E_JGXXB.DATA_FLAG
  is '数据标示';
comment on column E_JGXXB.NBJGH
  is '内部机构号';   
comment on column E_JGXXB.JRXKZH
  is '金融许可证号'; 
comment on column E_JGXXB.YXJGMC
  is '银行机构名称';
comment on column E_JGXXB.CLSJ
  is '成立时间';
comment on column E_JGXXB.YXJGDM
  is '银行机构代码';  
comment on column E_JGXXB.JGDZ
  is '机构地址';  
comment on column E_JGXXB.YYZZH
  is '营业执照号';  
--comment on column E_JGXXB.JGLB
--  is '机构类别';
--comment on column E_JGXXB.YZBM
--  is '邮政编码';
--comment on column E_JGXXB.WDH
--  is '网点号'; 
comment on column E_JGXXB.YYZT
  is '营业状态';
--comment on column E_JGXXB.JGGZKSSJ
--  is '机构工作开始时间';
--comment on column E_JGXXB.JGGZZZSJ
--  is '机构工作终止时间';
--comment on column E_JGXXB.FZRXM
--  is '负责人姓名';
--comment on column E_JGXXB.FZRZW
--  is '负责人职务';
--comment on column E_JGXXB.FZRLXDH
--  is '联系人电话';
--comment on column E_JGXXB.CJRQ
 -- is '采集日期';
create unique index JGXXB_PRIMARY_KEY ON E_JGXXB (NBJGH,ETL_DATE);
  

--TB_TABLEINFO脚本
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'NBJGH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'JRXKZH', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'YXJGMC', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'CLSJ', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'YXJGDM', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'JGDZ', null, null, null, null, 6, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'YYZZH', null, null, null, null, 7, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGXXB', 'E_JGXXB', 'YYZT', null, null, null, null, 8, null, null, null, null);

insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'BMO', 'JGXXB', 'BMO部门上传文件', null, '4', 'F', 'F', null, null, null);
  
  
------------------------------------------------------------机构关系表
create table E_JGGXB
(
  ETL_DATE              VARCHAR2(6),
  STATUS                VARCHAR2(2),
  DATA_FLAG             VARCHAR2(64),
  NBJGH					VARCHAR2(30),
  YHJGMC				VARCHAR2(200),
  YZBM			        VARCHAR2(6),
  SJGLJGDM       		VARCHAR2(30),
  SJGLJGMC              VARCHAR2(200),
  XNH  					VARCHAR2(3)
  --JRXKZH				VARCHAR2(30),  
  --YHJGDM				VARCHAR2(30),
  --CJRQ                VARCHAR2(8)
);

comment on table E_JGGXB
  is '机构关系表';
comment on column E_JGGXB.ETL_DATE
  is '上传时间';
comment on column E_JGGXB.STATUS
  is '数据状态';
comment on column E_JGGXB.DATA_FLAG
  is '数据标示';
comment on column E_JGGXB.NBJGH
  is '内部机构号';
comment on column E_JGGXB.YHJGMC
  is '银行机构名称';  
comment on column E_JGGXB.YZBM
  is '邮政编码';  
comment on column E_JGGXB.SJGLJGDM
  is '上级管理机构代码';
comment on column E_JGGXB.SJGLJGMC
  is '上级管理机构名称';   
comment on column E_JGGXB.XNH
  is '是否虚拟行'; 
--comment on column E_JGGXB.JRXKZH
--  is '金融许可证号'; 
--comment on column E_JGGXB.YHJGDM
--  is '银行机构代码';
--comment on column E_JGGXB.CJRQ
 -- is '采集日期';
create unique index JGGXB_PRIMARY_KEY ON E_JGGXB (NBJGH,ETL_DATE); 
 

--TB_TABLEINFO脚本
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'NBJGH', null, null, null, null, 1, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'YHJGMC', null, null, null, null, 2, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'YZBM', null, null, null, null, 3, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'SJGLJGDM', null, null, null, null, 4, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'SJGLJGMC', null, null, null, null, 5, null, null, null, null);
insert into TB_TABLEINFO (FILE_NAME, TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, COMMENTS, DATA_DIC, ORDNUM, TWO_SEVEN, IS_NOT_NULL, IS_NOT_PK, IS_ONLY)
values ('JGGXB', 'E_JGGXB', 'XNH', null, null, null, null, 6, null, null, null, null);
  

insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('DEPARTMENT', 'BMO', 'JGGXB', 'BMO部门上传文件', null, '4', 'F', 'F', null, null, null);
