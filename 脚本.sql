---黑名单交易添加分行号。
--HSBC与RRB都需要添加
alter table C_BLACK_TRANS_DOWNLOAD_RET add brno varchar(20) ;
comment on column C_BLACK_TRANS_DOWNLOAD_RET.brno is '分行号';