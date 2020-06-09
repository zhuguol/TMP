-----------------------AML_UBO_REPORT_INFO
create table AML_UBO_REPORT_INFO(
    seq_no      NUMBER,
    data_date   VARCHAR2(6),
    cust_no     VARCHAR2(9),
    cust_name   VARCHAR2(512),
    p_name      VARCHAR2(512),
    p_idty      VARCHAR2(18),
    p_idno      VARCHAR2(128),
    p_idep      NUMBER(8),
    addresss     VARCHAR2(4000),
    lob         VARCHAR2(24)
);

comment on table AML_UBO_REPORT_INFO is 'UBO实际受益人报表信息';
comment on column AML_UBO_REPORT_INFO.seq_no is '序号';
comment on column AML_UBO_REPORT_INFO.data_date is '数据日期';
comment on column AML_UBO_REPORT_INFO.cust_no is '客户号';
comment on column AML_UBO_REPORT_INFO.cust_name is '客户名称';
comment on column AML_UBO_REPORT_INFO.p_name is '实际受益人姓名';
comment on column AML_UBO_REPORT_INFO.p_idty is '实际受益人证件类型';
comment on column AML_UBO_REPORT_INFO.p_idno is '实际受益人证件号码';
comment on column AML_UBO_REPORT_INFO.p_idep is '实际受益人证件有效期';
comment on column AML_UBO_REPORT_INFO.addresss is '实际受益人联系地址';
comment on column AML_UBO_REPORT_INFO.lob is '业务线';

-----------------------AML_UBO_REPORT_INFO_GB
create table AML_UBO_REPORT_INFO_GB(
    seq_no      NUMBER,
    data_date   VARCHAR2(6),
    cust_no     VARCHAR2(9),
    cust_name   VARCHAR2(512),
    p_name      VARCHAR2(512),
    p_idty      VARCHAR2(18),
    p_idno      VARCHAR2(128),
    p_idep      NUMBER(8),
    addresss     VARCHAR2(4000),
    lob         VARCHAR2(24)
);

comment on table AML_UBO_REPORT_INFO_GB is 'GB有豁免权实际受益人报表信息';
comment on column AML_UBO_REPORT_INFO_GB.seq_no is '序号';
comment on column AML_UBO_REPORT_INFO_GB.data_date is '数据日期';
comment on column AML_UBO_REPORT_INFO_GB.cust_no is '客户号';
comment on column AML_UBO_REPORT_INFO_GB.cust_name is '客户名称';
comment on column AML_UBO_REPORT_INFO_GB.p_name is '实际受益人姓名';
comment on column AML_UBO_REPORT_INFO_GB.p_idty is '实际受益人证件类型';
comment on column AML_UBO_REPORT_INFO_GB.p_idno is '实际受益人证件号码';
comment on column AML_UBO_REPORT_INFO_GB.p_idep is '实际受益人证件有效期';
comment on column AML_UBO_REPORT_INFO_GB.addresss is '实际受益人联系地址';
comment on column AML_UBO_REPORT_INFO_GB.lob is '业务线';


-----------------------AML_UBO_REPORT_INFO_H
create table AML_UBO_REPORT_INFO_H(
    seq_no      NUMBER,
    data_date   VARCHAR2(6),
    cust_no     VARCHAR2(9),
    cust_name   VARCHAR2(512),
    p_name      VARCHAR2(512),
    p_idty      VARCHAR2(18),
    p_idno      VARCHAR2(128),
    p_idep      NUMBER(8),
    addresss     VARCHAR2(4000),
    lob         VARCHAR2(24)
);

comment on table AML_UBO_REPORT_INFO_H is 'UBO实际受益人报表历史信息';
comment on column AML_UBO_REPORT_INFO_H.seq_no is '序号';
comment on column AML_UBO_REPORT_INFO_H.data_date is '数据日期';
comment on column AML_UBO_REPORT_INFO_H.cust_no is '客户号';
comment on column AML_UBO_REPORT_INFO_H.cust_name is '客户名称';
comment on column AML_UBO_REPORT_INFO_H.p_name is '实际受益人姓名';
comment on column AML_UBO_REPORT_INFO_H.p_idty is '实际受益人证件类型';
comment on column AML_UBO_REPORT_INFO_H.p_idno is '实际受益人证件号码';
comment on column AML_UBO_REPORT_INFO_H.p_idep is '实际受益人证件有效期';
comment on column AML_UBO_REPORT_INFO_H.addresss is '实际受益人联系地址';
comment on column AML_UBO_REPORT_INFO_H.lob is '业务线';

-----------------------AML_UBO_REPORT_INFO_GB_H
create table AML_UBO_REPORT_INFO_GB_H(
    seq_no      NUMBER,
    data_date   VARCHAR2(6),
    cust_no     VARCHAR2(9),
    cust_name   VARCHAR2(512),
    p_name      VARCHAR2(512),
    p_idty      VARCHAR2(18),
    p_idno      VARCHAR2(128),
    p_idep      NUMBER(8),
    addresss     VARCHAR2(4000),
    lob         VARCHAR2(24)
);

comment on table AML_UBO_REPORT_INFO_GB_H is 'GB有豁免权实际受益人报表历史信息';
comment on column AML_UBO_REPORT_INFO_GB_H.seq_no is '序号';
comment on column AML_UBO_REPORT_INFO_GB_H.data_date is '数据日期';
comment on column AML_UBO_REPORT_INFO_GB_H.cust_no is '客户号';
comment on column AML_UBO_REPORT_INFO_GB_H.cust_name is '客户名称';
comment on column AML_UBO_REPORT_INFO_GB_H.p_name is '实际受益人姓名';
comment on column AML_UBO_REPORT_INFO_GB_H.p_idty is '实际受益人证件类型';
comment on column AML_UBO_REPORT_INFO_GB_H.p_idno is '实际受益人证件号码';
comment on column AML_UBO_REPORT_INFO_GB_H.p_idep is '实际受益人证件有效期';
comment on column AML_UBO_REPORT_INFO_GB_H.addresss is '实际受益人联系地址';
comment on column AML_UBO_REPORT_INFO_GB_H.lob is '业务线';


insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('20', 'UBO报表', null, 2, 1, '0', 9, null, '0', null, null, null, '1', null, null, null, null, null, null);
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2001', 'UBO实际受益人报表', '/fpages/export/ftl/AmlUboReportInfo.ftl', 2, 0, '20', 1, '1', '1', null, null, null, '1', null, null, null, null, null, null);
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2002', 'GB有豁免权实际受益人报表', '/fpages/export/ftl/AmlUboReportInfoGb.ftl', 2, 0, '20', 2, '1', '1', null, null, null, '1', null, null, null, null, null, null);
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2003', 'UBO实际受益人历史报表', '/fpages/export/ftl/AmlUboReportInfoH.ftl', 2, 0, '20', 3, '1', '1', null, null, null, '1', null, null, null, null, null, null);
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2004', 'GB有豁免权实际受益人历史报表', '/fpages/export/ftl/AmlUboReportInfoGbH.ftl', 2, 0, '20', 4, '1', '1', null, null, null, '1', null, null, null, null, null, null);
commit;