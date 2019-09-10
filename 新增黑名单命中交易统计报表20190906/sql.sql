create table C_BLACK_HIT_COUNT
(
  SEARCH_DATE VARCHAR2(10),
  QUERIES_NUM NUMBER(20),
  HITS_NUM    NUMBER(20),
  BATCH_TIME  DATE
);

comment on table C_BLACK_HIT_COUNT
  is '黑名单命中交易统计报表';
comment on column C_BLACK_HIT_COUNT.SEARCH_DATE
  is '黑名单检索时间(年/月)';
comment on column C_BLACK_HIT_COUNT.QUERIES_NUM
  is '查询次数';
comment on column C_BLACK_HIT_COUNT.HITS_NUM
  is '命中交易数量';
comment on column C_BLACK_HIT_COUNT.BATCH_TIME
  is '跑批日期';