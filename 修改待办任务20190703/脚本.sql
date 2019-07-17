create or replace view vi_homepage_todo04 as
select SYS_GUID() AS id,
       t2.brno,--行号
       t2.work_Date,--交易日期
       t2.cnt,--审核总量
       t2.snt --待审核量
from
(select t.brno,
        t.work_date,
        count(*) as cnt,
        sum(case when t.filler2 is null then 1 else 0 end) as snt
 from Aml_Bs_Upload_bak t
 group by t.brno,t.work_date
)t2
where snt > 0
order by t2.work_Date;

insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_BH_ZC', '140_33,140_34', '主页大额交易自查', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_BH', '30_30101,30_30102,30_30103', '主页大额代办任务', null, '4', 'F', 'F', null, null, null);
insert into SYS_PARAMS (PARAMGROUP_ID, PARAM_ID, PARAM_VAL, PARAM_NAME, MEMO, ST, IS_LOCK, IS_DEL, CRT_DT, LAST_UPD_TMS, LAST_UPD_OPER)
values ('AML3', 'TODO_BS_ZC', '140_31,140_32', '主页可疑交易自查', null, '4', 'F', 'F', null, null, null);
