CREATE OR REPLACE VIEW VI_HOMEPAGE_TODO_CREDIT AS
SELECT SYS_GUID() as id,
       T.ALARM_DATE,
       T.OPERATOR_TLR,
       T.RISK_LEVEL,
       T.FILED1,
       T.FILED2
  FROM (SELECT a.ALARM_DATE,
               a.OPERATOR_TLR,
               a.RISK_LEVEL,
               sum(case
                     when a.MESSAGE_RESULT in ('02', '04') and
                          (to_date(substr(g.operator_time, 1, 8), 'yyyymmdd') <=
                          (select c.natural_date
                              from (select rownum as rn, b.natural_date
                                      from (select b.natural_date
                                              from aml_sshldyp b
                                             where b.natural_date <= sysDate
                                               and b.is_holiday = '0'
                                             order by b.natural_date desc) b) c
                             where c.rn = 6)) then
                      1
                     else
                      0
                   end) as filed1,
               sum(case
                     when (a.OUTBOUND_RESULT = '06' or a.OUTBOUND_RESULT is null) and
                          (to_date(substr(h.operator_time, 1, 8), 'yyyymmdd') <=
                          (select c.natural_date
                              from (select rownum as rn, b.natural_date
                                      from (select b.natural_date
                                              from aml_sshldyp b
                                             where b.natural_date <= sysDate
                                               and b.is_holiday = '0'
                                             order by b.natural_date desc) b) c
                             where c.rn = 2)) then
                      1
                     else
                      0
                   end) as filed2
          from CREDIT_CARD_ALERT a
          left join (select f.alarm_no, f.operator_time
                      from (select e.alarm_no,
                                   e.operator_time,
                                   row_number() over(partition by e.alarm_no order by e.operator_time desc) rn
                              from (select d.alarm_no, d.operator_time
                                      from credit_card_audit_trail d
                                     where d.fileld_name = '短信结果'
                                       and d.alarm_no =
                                           (select k.alarm_no
                                              from CREDIT_CARD_ALERT k
                                             where k.INVESTIGATE_RESULT = '01'
                                               and k.MESSAGE_RESULT in
                                                   ('02', '04'))) e) f
                     where f.rn = '1') g on a.alarm_no = g.alarm_no
          left join (select f.alarm_no, f.operator_time
                      from (select e.alarm_no,
                                   e.operator_time,
                                   row_number() over(partition by e.alarm_no order by e.operator_time desc) rn
                              from (select d.alarm_no, d.operator_time
                                      from credit_card_audit_trail d
                                     where d.fileld_name = '外呼结果'
                                       and d.alarm_no =
                                           (select l.alarm_no
                                              from CREDIT_CARD_ALERT l
                                             where l.INVESTIGATE_RESULT = '01'
                                               and (l.OUTBOUND_RESULT = '06' or
                                                   l.OUTBOUND_RESULT is null))) e) f
                     where f.rn = '1') h on a.alarm_no = h.alarm_no
         where a.INVESTIGATE_RESULT = '01'
           and (a.MESSAGE_RESULT in ('02', '04') or
               (a.OUTBOUND_RESULT = '06' or a.OUTBOUND_RESULT is null))
         group by a.ALARM_DATE, a.OPERATOR_TLR, a.RISK_LEVEL) T
 WHERE (T.FILED1 <> 0 OR T.FILED2 <> 0)
 ORDER BY T.ALARM_DATE DESC;
 
 
 -------------------------------------------
 
 
 CREATE OR REPLACE VIEW VI_HOMEPAGE_TODO_CREDIT_01 AS
SELECT q.OPERATOR_TIME AS MSG_TIME,k.OPERATOR_TIME AS OUT_TIME,z.* from CREDIT_CARD_ALERT z left join (
SELECT * from CREDIT_CARD_AUDIT_TRAIL c where c.FILELD_NAME='短信结果' and c.OPERATOR_TIME = (select max(b.OPERATOR_TIME) from CREDIT_CARD_AUDIT_TRAIL b where c.ALARM_NO=b.ALARM_NO and  b.FILELD_NAME='短信结果')
) q on z.ALARM_NO=q.ALARM_NO left join (
SELECT * from CREDIT_CARD_AUDIT_TRAIL c where c.FILELD_NAME='外呼结果' and c.OPERATOR_TIME = (select max(b.OPERATOR_TIME) from CREDIT_CARD_AUDIT_TRAIL b where c.ALARM_NO=b.ALARM_NO and  b.FILELD_NAME='外呼结果')
) k on z.ALARM_NO=k.ALARM_NO



SELECT SYS_GUID() as id,T.ALARM_DATE,T.OPERATOR_TLR,T.RISK_LEVEL,T.FILED1,T.FILED2 FROM(
SELECT a.ALARM_DATE,a.OPERATOR_TLR,a.RISK_LEVEL,
sum(
case when a.MESSAGE_RESULT in ('02','04') and to_date(substr(a.MSG_TIME,1,8), 'yyyymmdd')<=(
select c.natural_date from (
select rownum as rn,b.natural_date from ( select b.natural_date
   from aml_sshldyp b
  where b.natural_date <= sysDate
    and b.is_holiday = '0'
  order by b.natural_date desc)b )c where c.rn=5) then 1 else 0 end
) as filed1,
sum(
case when a.OUTBOUND_RESULT ='06' then 1 else 0 end
) as filed2
from VI_HOMEPAGE_TODO_CREDIT_01 a where a.INVESTIGATE_RESULT='01' group by a.ALARM_DATE ,a.OPERATOR_TLR,a.RISK_LEVEL 
) T WHERE (T.FILED1<>0 OR T.FILED2<>0) ORDER BY T.ALARM_DATE DESC


--------------------------------------------------------------------
CREATE OR REPLACE VIEW VI_HOMEPAGE_TODO_CREDIT_01 AS
SELECT q.OPERATOR_TIME AS MSG_TIME,k.OPERATOR_TIME AS OUT_TIME,z.* from CREDIT_CARD_ALERT z left join (
SELECT * from CREDIT_CARD_AUDIT_TRAIL c where c.FILELD_NAME='短信结果' and c.OPERATOR_TIME = (select max(b.OPERATOR_TIME) from CREDIT_CARD_AUDIT_TRAIL b where c.ALARM_NO=b.ALARM_NO and  b.FILELD_NAME='短信结果')
) q on z.ALARM_NO=q.ALARM_NO left join (
SELECT * from CREDIT_CARD_AUDIT_TRAIL c where c.FILELD_NAME='外呼结果' OR c.FILELD_NAME='调查结果' and c.OPERATOR_TIME = (select max(b.OPERATOR_TIME) from CREDIT_CARD_AUDIT_TRAIL b 
where c.ALARM_NO=b.ALARM_NO and  b.FILELD_NAME='外呼结果' OR (b.FILELD_NAME='调查结果' and b.NEW_VALUE='01-调查中'))
) k on z.ALARM_NO=k.ALARM_NO




SELECT SYS_GUID() as id,T.ALARM_DATE,T.OPERATOR_TLR,T.RISK_LEVEL,T.FILED1,T.FILED2 FROM(
SELECT a.ALARM_DATE,a.OPERATOR_TLR,a.RISK_LEVEL,
sum(
case when a.MESSAGE_RESULT in ('02','04') and to_date(substr(a.MSG_TIME,1,8), 'yyyymmdd')<=(
select c.natural_date from (
select rownum as rn,b.natural_date from ( select b.natural_date
   from aml_sshldyp b
  where b.natural_date <= sysDate
    and b.is_holiday = '0'
  order by b.natural_date desc)b )c where c.rn=6) then 1 else 0 end
) as filed1,
sum(
case when (a.OUTBOUND_RESULT ='06' or a.OUTBOUND_RESULT is null) and to_date(substr(a.OUT_TIME,1,8), 'yyyymmdd')<=(
select c.natural_date from (
select rownum as rn,b.natural_date from ( select b.natural_date
   from aml_sshldyp b
  where b.natural_date <= sysDate
    and b.is_holiday = '0'
  order by b.natural_date desc)b )c where c.rn=2) then 1 else 0 end
) as filed2
from VI_HOMEPAGE_TODO_CREDIT_01 a where a.INVESTIGATE_RESULT='01' and (a.MESSAGE_RESULT='02' or a.MESSAGE_RESULT='04' or a.OUTBOUND_RESULT ='06' or a.OUTBOUND_RESULT is null) group by a.ALARM_DATE ,a.OPERATOR_TLR,a.RISK_LEVEL 
) T WHERE (T.FILED1<>0 OR T.FILED2<>0) ORDER BY T.ALARM_DATE DESC
