----------------------------------------HSBC员工交易监测报表
--------汇丰中国员工交易监测三张报表
------------------------Alert Summary Report
create table AML_ALERT_SUMMARY_REPORT(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6),
  id_name    varchar2(128)
);

comment on table AML_ALERT_SUMMARY_REPORT is 'Alert Summary Report'; 
comment on column AML_ALERT_SUMMARY_REPORT.seq_no is '序号';
comment on column AML_ALERT_SUMMARY_REPORT.id is '指标';
comment on column AML_ALERT_SUMMARY_REPORT.id_desc is '指标描述';
comment on column AML_ALERT_SUMMARY_REPORT.sum_num is '统计值';
comment on column AML_ALERT_SUMMARY_REPORT.data_date is '统计日期';
comment on column AML_ALERT_SUMMARY_REPORT.id_name is '指标名称';

-------------------------Case Summary Report
create table AML_CASE_SUMMARY_REPORT(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6),
  id_name    varchar2(128)
);

comment on table AML_CASE_SUMMARY_REPORT is 'Case Summary Report'; 
comment on column AML_CASE_SUMMARY_REPORT.seq_no is '序号';
comment on column AML_CASE_SUMMARY_REPORT.id is '指标';
comment on column AML_CASE_SUMMARY_REPORT.id_desc is '指标描述';
comment on column AML_CASE_SUMMARY_REPORT.sum_num is '统计值';
comment on column AML_CASE_SUMMARY_REPORT.data_date is '统计日期';
comment on column AML_CASE_SUMMARY_REPORT.id_name is '指标名称';

-------------------------Six Months Summary Report
create table AML_SIX_MONTHS_SUMMARY(
  seq_no       number,
  data_no      varchar2(60),
  data_date    varchar2(12),
  level_no     varchar2(120),
  leve_name    varchar2(120),
  scc_to_fcr   number,
  scc_to_mis   number,
  scc_to_safe  number,
  scc_total    number,
  data_flag    varchar2(12)
);

insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('230', '员工交易监测报表', null, 2, 1, '0', 26, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2301', 'Alert Summary Report', '/fpages/hf/form/ftl/AmlAlertSummaryReport.ftl', 2, 0, '230', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2302', 'Case Summary Report', '/fpages/hf/form/ftl/AmlCaseSummaryReport.ftl', 2, 0, '230', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2303', 'Three Months Summary Report', '/fpages/hf/form/ftl/AmlSixMonthsSummary.ftl', 2, 0, '230', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2304', 'Real Time Query Report', '/fpages/hf/form/ftl/AmlRealTimeQuery.ftl', 2, 0, '230', 4, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
commit;





----------------------------------------RRB员工交易监测报表
--------村镇行员工交易监测三张报表
------------------------Alert Summary Report
create table AML_ALERT_SUMMARY_REPORT_RRB(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6),
  id_name    varchar2(128),
  org_code   varchar2(12)
);

comment on table AML_ALERT_SUMMARY_REPORT_RRB is 'Alert Summary Report'; 
comment on column AML_ALERT_SUMMARY_REPORT_RRB.seq_no is '序号';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.id is '指标';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.id_desc is '指标描述';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.sum_num is '统计值';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.data_date is '统计日期';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.id_name is '指标名称';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.org_code is '机构名称';

-------------------------Case Summary Report
create table AML_CASE_SUMMARY_REPORT_RRB(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6),
  id_name    varchar2(128),
  org_code   varchar2(12)
);

comment on table AML_CASE_SUMMARY_REPORT_RRB is 'Case Summary Report'; 
comment on column AML_CASE_SUMMARY_REPORT_RRB.seq_no is '序号';
comment on column AML_CASE_SUMMARY_REPORT_RRB.id is '指标';
comment on column AML_CASE_SUMMARY_REPORT_RRB.id_desc is '指标描述';
comment on column AML_CASE_SUMMARY_REPORT_RRB.sum_num is '统计值';
comment on column AML_CASE_SUMMARY_REPORT_RRB.data_date is '统计日期';
comment on column AML_CASE_SUMMARY_REPORT_RRB.id_name is '指标名称';
comment on column AML_CASE_SUMMARY_REPORT_RRB.org_code is '机构名称';


-------------------------Six Months Summary Report
create table AML_SIX_MONTHS_SUMMARY_RRB(
  seq_no       number,
  data_no      varchar2(60),
  data_date    varchar2(12),
  level_no     varchar2(120),
  scc_to_fcr   number,
  scc_to_mis   number,
  scc_total    number
)
comment on table AML_SIX_MONTHS_SUMMARY_RRB is 'Six Months Summary Report';
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('240', '员工交易监测报表', null, 2, 1, '0', 27, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2401', 'Alert Summary Report', '/fpages/hf/form/ftl/AmlAlertSummaryReportRRB.ftl', 2, 0, '240', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2402', 'Case Summary Report', '/fpages/hf/form/ftl/AmlCaseSummaryReportRRB.ftl', 2, 0, '240', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2403', 'Three Months Summary Report', '/fpages/hf/form/ftl/AmlSixMonthsSummaryRRB.ftl', 2, 0, '240', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2404', 'Real Time Query Report', '/fpages/hf/form/ftl/AmlRRBRealTimeQuery.ftl', 2, 0, '240', 4, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
commit;


----------------------------------------客户信息检索
-----------------文件上传表
CREATE TABLE CUST_UPLOAD_FILEINFO(
	REC_ID            VARCHAR2(32),
	BATCH_NO          VARCHAR2(20),
	CERT_NUM	      VARCHAR2(20),
	NAME              VARCHAR2(256),
	UPLOAD_TLR        VARCHAR2(20),
	UPLOAD_TIME       VARCHAR2(14),
	UPLOAD_FILENAME   VARCHAR2(100),
	RSV1              VARCHAR2(10),
	RSV2              VARCHAR2(10),
	RSV3              VARCHAR2(50),
	RSV4              VARCHAR2(50),
	RSV5              VARCHAR2(500),
	RSV6              VARCHAR2(500)
)

COMMENT ON TABLE CUST_UPLOAD_FILEINFO IS '文件上传表';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.REC_ID IS '逻辑主键';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.BATCH_NO IS '上传批次号';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.CERT_NUM IS '证件号';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.NAME IS '姓名';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.UPLOAD_TLR IS '上传人ID';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.UPLOAD_TIME IS '上传时间';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.UPLOAD_FILENAME IS '上传文件名称';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV1 IS '备用字段1';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV2 IS '备用字段2';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV3 IS '备用字段3';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV4 IS '备用字段4';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV5 IS '备用字段5';
COMMENT ON COLUMN CUST_UPLOAD_FILEINFO.RSV6 IS '备用字段6';

----------------批量日志表
CREATE TABLE CUST_BATCH_LOG(
	REC_ID            VARCHAR2(32),
	BATCH_NO          VARCHAR2(20),
	BATCH_DATE        VARCHAR2(8),
	START_TIME        VARCHAR2(14),
	END_TIME          VARCHAR2(14),
	PER_RESULT        NUMBER(20),
	LEGAL_RESULT      NUMBER(20),
	COMPANY_RESULT    NUMBER(20),
	RSV1              VARCHAR2(10),
	RSV2              VARCHAR2(10),
	RSV3              VARCHAR2(50),
	RSV4              VARCHAR2(50),
	RSV5              VARCHAR2(500),
	RSV6              VARCHAR2(500)
)

COMMENT ON TABLE CUST_BATCH_LOG IS '批量日志表';
COMMENT ON COLUMN CUST_BATCH_LOG.REC_ID IS '逻辑主键';
COMMENT ON COLUMN CUST_BATCH_LOG.BATCH_NO IS '上传批次号';
COMMENT ON COLUMN CUST_BATCH_LOG.BATCH_DATE IS '批量日期';
COMMENT ON COLUMN CUST_BATCH_LOG.START_TIME IS '批量开始时间';
COMMENT ON COLUMN CUST_BATCH_LOG.END_TIME IS '批量结束时间';
COMMENT ON COLUMN CUST_BATCH_LOG.PER_RESULT IS '个人检索结果';
COMMENT ON COLUMN CUST_BATCH_LOG.LEGAL_RESULT IS '法人检索结果';
COMMENT ON COLUMN CUST_BATCH_LOG.COMPANY_RESULT IS '公司检索结果';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV1 IS '备用字段1';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV2 IS '备用字段2';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV3 IS '备用字段3';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV4 IS '备用字段4';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV5 IS '备用字段5';
COMMENT ON COLUMN CUST_BATCH_LOG.RSV6 IS '备用字段6';

----------------检索结果表
CREATE TABLE CUST_SEARCH_RESULT(
	REC_ID            VARCHAR2(32),
	BATCH_NO          VARCHAR2(20),
	UPLOAD_DATE       VARCHAR2(8),
	TYPE              VARCHAR2(1),
	CERT_NUM          VARCHAR2(20),
	NAME              VARCHAR2(256),
	CUST_NO           VARCHAR2(20),
	CUST_NAME         VARCHAR2(256),
	LEGAL_CERT_NO     VARCHAR2(20),
	LEGAL_NAME        VARCHAR2(256),
	MAIN_ID           VARCHAR2(32),
	RSV1              VARCHAR2(10),
	RSV2              VARCHAR2(10),
	RSV3              VARCHAR2(50),
	RSV4              VARCHAR2(50),
	RSV5              VARCHAR2(500),
	RSV6              VARCHAR2(500)
)

COMMENT ON TABLE CUST_SEARCH_RESULT IS '检索结果表';
COMMENT ON COLUMN CUST_SEARCH_RESULT.REC_ID IS '逻辑主键';
COMMENT ON COLUMN CUST_SEARCH_RESULT.BATCH_NO IS '上传批次号';
COMMENT ON COLUMN CUST_SEARCH_RESULT.UPLOAD_DATE IS '上传日期';
COMMENT ON COLUMN CUST_SEARCH_RESULT.TYPE IS '检索结果类型';
COMMENT ON COLUMN CUST_SEARCH_RESULT.CERT_NUM IS '证件号(上传时的证件号)';
COMMENT ON COLUMN CUST_SEARCH_RESULT.NAME IS '姓名(上传时的姓名)';
COMMENT ON COLUMN CUST_SEARCH_RESULT.CUST_NO IS '客户号';
COMMENT ON COLUMN CUST_SEARCH_RESULT.CUST_NAME IS '客户名称';
COMMENT ON COLUMN CUST_SEARCH_RESULT.LEGAL_CERT_NO IS '法人(被检索名单)的证件号';
COMMENT ON COLUMN CUST_SEARCH_RESULT.LEGAL_NAME IS '法人(被检索名单)的姓名';
COMMENT ON COLUMN CUST_SEARCH_RESULT.MAIN_ID IS '关联文件上传表REC_ID';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV1 IS '备用字段1';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV2 IS '备用字段2';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV3 IS '备用字段3';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV4 IS '备用字段4';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV5 IS '备用字段5';
COMMENT ON COLUMN CUST_SEARCH_RESULT.RSV6 IS '备用字段6';



insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS) values ('70', '客户信息检索', null, 2, 1, '0', 31, null, '0', null, null, null, '1', null, null, null, null, null, 'icon-search');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS) values ('7001', '文件上传信息', '/fpages/cust/ftl/CustUploadFileInfo.ftl', 2, 0, '70', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-search');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS) values ('7002', '批量日志信息', '/fpages/cust/ftl/CustBatchLog.ftl', 2, 0, '70', 2, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-search');
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS) values ('7003', '检索结果信息', '/fpages/cust/ftl/CustSearchResult.ftl', 2, 0, '70', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-search');






