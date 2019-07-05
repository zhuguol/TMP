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