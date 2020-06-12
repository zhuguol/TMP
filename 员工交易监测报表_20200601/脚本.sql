--------汇丰中国员工交易监测三张报表
------------------------Alert Summary Report
create table AML_ALERT_SUMMARY_REPORT(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6)
);

comment on table AML_ALERT_SUMMARY_REPORT is 'Alert Summary Report'; 
comment on column AML_ALERT_SUMMARY_REPORT.seq_no is '序号';
comment on column AML_ALERT_SUMMARY_REPORT.id is '编号';
comment on column AML_ALERT_SUMMARY_REPORT.id_desc is '编号描述';
comment on column AML_ALERT_SUMMARY_REPORT.sum_num is '统计值';
comment on column AML_ALERT_SUMMARY_REPORT.data_date is '统计日期';


-------------------------Case Summary Report
create table AML_CASE_SUMMARY_REPORT(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6)
);

comment on table AML_CASE_SUMMARY_REPORT is 'Case Summary Report'; 
comment on column AML_CASE_SUMMARY_REPORT.seq_no is '序号';
comment on column AML_CASE_SUMMARY_REPORT.id is '编号';
comment on column AML_CASE_SUMMARY_REPORT.id_desc is '编号描述';
comment on column AML_CASE_SUMMARY_REPORT.sum_num is '统计值';
comment on column AML_CASE_SUMMARY_REPORT.data_date is '统计日期';


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
values ('2303', 'Six Months Summary Report', '/fpages/hf/form/ftl/AmlSixMonthsSummary.ftl', 2, 0, '230', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
commit;





--------村镇行员工交易监测三张报表
------------------------Alert Summary Report
create table AML_ALERT_SUMMARY_REPORT_RRB(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6)
);

comment on table AML_ALERT_SUMMARY_REPORT_RRB is 'Alert Summary Report'; 
comment on column AML_ALERT_SUMMARY_REPORT_RRB.seq_no is '序号';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.id is '编号';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.id_desc is '编号描述';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.sum_num is '统计值';
comment on column AML_ALERT_SUMMARY_REPORT_RRB.data_date is '统计日期';


-------------------------Case Summary Report
create table AML_CASE_SUMMARY_REPORT_RRB(
  seq_no     number,
  id         varchar2(12),
  id_desc    varchar2(128),
  sum_num    varchar2(40),
  data_date  varchar2(6)
);

comment on table AML_CASE_SUMMARY_REPORT_RRB is 'Case Summary Report'; 
comment on column AML_CASE_SUMMARY_REPORT_RRB.seq_no is '序号';
comment on column AML_CASE_SUMMARY_REPORT_RRB.id is '编号';
comment on column AML_CASE_SUMMARY_REPORT_RRB.id_desc is '编号描述';
comment on column AML_CASE_SUMMARY_REPORT_RRB.sum_num is '统计值';
comment on column AML_CASE_SUMMARY_REPORT_RRB.data_date is '统计日期';


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
values ('2403', 'Six Months Summary Report', '/fpages/hf/form/ftl/AmlSixMonthsSummaryRRB.ftl', 2, 0, '240', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');
commit;