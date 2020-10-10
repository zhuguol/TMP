--“审核失败，重新调研”的数量能否在待办任务里单列一条
create or replace view vi_homepage_todo05 as 
select c.id,c.data_date,c.report_d_or_m,c.snt,c.statusNum from (       
select SYS_GUID() AS id,t.data_date, t.report_d_or_m || '-日报' as report_d_or_m , sum(case when t.status is null then 1 else 0 end) as snt,
  sum(case when t.approve_status = '04' then 1 else 0 end) as statusNum
  from a_staff_acct_trad t
 where t.staff_number is not null
 group by t.data_date, report_d_or_m
union
select SYS_GUID() AS id,m.data_date, m.report_d_or_m || '-月报' as report_d_or_m, sum(case when m.status is null then 1 else 0 end) as snt,
  sum(case when m.approve_status = '04' then 1 else 0 end) as statusNum
  from a_staff_acct_trad_m m
 where m.staff_number is not null
 group by m.data_date, report_d_or_m) c where c.snt > 0 or c.statusNum > 0;
 
 
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
              when t.approve_status = '02' or t.approve_status = '05' then
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
              when m.approve_status = '02' or m.approve_status = '05' then
               1
              else
               0
            end) snt
 
   from a_staff_acct_trad_m m
  where m.FREE_FLAG = '01'
  group by m.data_date, m.report_d_or_m)c where c.snt > 0
order by c.data_date;

----------------------HSBC员工交易监测菜单
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1705', '员工交易监测日报更新', '/fpages/hf/form/ftl/AStaffAcctTradS.ftl', 2, 0, '170', 5, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');

insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1805', '员工交易监测月报更新', '/fpages/hf/form/ftl/AStaffAcctTradMS.ftl', 2, 0, '180', 5, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');

----------------------RRB员工交易监测菜单
insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2103', '员工交易监测日报更新', '/fpages/hf/form/ftl/AStaffAcctTradRRBS.ftl', 2, 0, '210', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');

insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('2203', '员工交易监测月报更新', '/fpages/hf/form/ftl/AStaffAcctTradMRRBS.ftl', 2, 0, '220', 3, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');


