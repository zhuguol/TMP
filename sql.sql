CREATE OR REPLACE VIEW VI_HOMEPAGE_TODO_CREDIT AS
SELECT SYS_GUID() as id,T.ALARM_DATE,T.OPERATOR_TLR,T.RISK_LEVEL,T.FILED1,T.FILED2 FROM(select m.ALARM_DATE,
       m.OPERATOR_TLR,
       m.RISK_LEVEL,
       sum(case
             when m.MESSAGE_RESULT in ('02','04') and
                  (to_date(substr(m.operator_time1,1,8),'yyyymmdd') <=
                  (select c.natural_date
                      from (select rownum as rn, b.natural_date
                              from (select b.natural_date
                                      from aml_sshldyp b
                                     where b.natural_date < sysDate
                                       and b.is_holiday = '0'
                                     order by b.natural_date desc) b) c
                     where c.rn = 5)) then
              1
             else
              0
           end) as filed1,
       sum(case
             when (m.OUTBOUND_RESULT = '06' or m.OUTBOUND_RESULT is null) and
                  (to_date(substr(m.operator_time2,1,8),'yyyymmdd') <=
                  (select c.natural_date
                      from (select rownum as rn, b.natural_date
                              from (select b.natural_date
                                      from aml_sshldyp b
                                     where b.natural_date < sysDate
                                       and b.is_holiday = '0'
                                     order by b.natural_date desc) b) c
                     where c.rn = 1)) then
              1
             else
              0
           end) as filed2
  from (SELECT a.ALARM_DATE,
               a.OPERATOR_TLR,
               a.RISK_LEVEL,
               a.MESSAGE_RESULT,
               a.OUTBOUND_RESULT,
               f.alarm_no,
               f.operator_time as operator_time1,
               k.alarm_no,
               k.operator_time as operator_time2
          from CREDIT_CARD_ALERT a
          left join (select e.alarm_no, e.operator_time
                      from (select d.alarm_no,
                                   d.operator_time,
                                   row_number() over(partition by d.alarm_no order by d.operator_time desc) as rn
                              from (select c.alarm_no, c.operator_time
                                      from credit_card_audit_trail c
                                     where c.fileld_name = '短信结果'
                                       and c.alarm_no =
                                           (select b.alarm_no
                                              from CREDIT_CARD_ALERT b
                                             where b.INVESTIGATE_RESULT = '01'
                                               and b.MESSAGE_RESULT in
                                                   ('02', '04'))) d) e
                     where e.rn = '1') f on f.alarm_no = a.alarm_no
          left join (select i.alarm_no, i.operator_time
                      from (select h.alarm_no,
                                   h.operator_time,
                                   row_number() over(partition by h.alarm_no order by h.operator_time desc) rn
                              from (select j.alarm_no, j.operator_time
                                      from credit_card_audit_trail j
                                     where j.fileld_name = '外呼结果'
                                       and j.alarm_no =
                                           (select g.alarm_no
                                              from CREDIT_CARD_ALERT g
                                             where g.INVESTIGATE_RESULT = '01'
                                               and (g.OUTBOUND_RESULT = '06' or
                                                   g.OUTBOUND_RESULT is null))) h) i
                     where i.rn = '1') k on k.alarm_no = a.alarm_no
         where a.INVESTIGATE_RESULT = '01'
           and (a.MESSAGE_RESULT in ('02', '04') or
               (a.OUTBOUND_RESULT = '06' or a.OUTBOUND_RESULT is null))
         group by a.ALARM_DATE,
                  a.ALARM_DATE,
                  a.OPERATOR_TLR,
                  a.RISK_LEVEL,
                  a.MESSAGE_RESULT,
                  a.OUTBOUND_RESULT,
                  f.alarm_no,
                  f.operator_time,
                  k.alarm_no,
                  k.operator_time) m
 group by m.ALARM_DATE, m.OPERATOR_TLR, m.RISK_LEVEL)T;