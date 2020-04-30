-------------HBCNAML和RRBAML两个数据库
update function_info t set t.showseq='1', t.funcname='黑名单上传' where t.funcname='黑名单上传';
update function_info t set t.showseq='2', t.funcname='黑名单拆分确认' where t.funcname='黑名单拆分确认表';
update function_info t set t.showseq='3', t.funcname='黑名单批处理状态' where t.funcname='黑名单批处理状态表';
update function_info t set t.showseq='4', t.funcname='黑名单交易下载' where t.funcname='黑名单交易下载表';
update function_info t set t.showseq='5', t.funcname='黑名单命中交易统计' where t.funcname='黑名单命中交易统计报表';
commit;
alter table c_black_list_split_confirm modify (ALIAS VARCHAR2(900));
alter table c_black_list_split_confirm_his modify (ALIAS VARCHAR2(900));

--------------新增一个部门，多个用户操作黑名单，只能看到自己上传的信息。
alter table c_black_list_upload add(UPDATE_PERSON varchar2(20));
alter table c_black_list_upload add(ROLE_NAME varchar2(30));
comment on column c_black_list_upload.UPDATE_PERSON is '上传的用户';
comment on column c_black_list_upload.ROLE_NAME is '上传用户属于部门';


alter table c_black_list_split_confirm add(UPDATE_PERSON varchar2(20));
alter table c_black_list_split_confirm add(ROLE_NAME varchar2(30));
comment on column c_black_list_split_confirm.UPDATE_PERSON is '上传的用户';
comment on column c_black_list_split_confirm.ROLE_NAME is '上传用户属于部门';


alter table c_black_list_split_confirm_his add(UPDATE_PERSON varchar2(20));
alter table c_black_list_split_confirm_his add(ROLE_NAME varchar2(30));
comment on column c_black_list_split_confirm_his.UPDATE_PERSON is '上传的用户';
comment on column c_black_list_split_confirm_his.ROLE_NAME is '上传用户属于部门';


alter table c_black_batch_status add(UPDATE_PERSON varchar2(20));
alter table c_black_batch_status add(ROLE_NAME varchar2(30));
comment on column c_black_batch_status.UPDATE_PERSON is '上传的用户';
comment on column c_black_batch_status.ROLE_NAME is '上传用户属于部门';


alter table c_black_trans_download_ret add(UPDATE_PERSON varchar2(20));
alter table c_black_trans_download_ret add(ROLE_NAME varchar2(30));
comment on column c_black_trans_download_ret.UPDATE_PERSON is '上传的用户';
comment on column c_black_trans_download_ret.ROLE_NAME is '上传用户属于部门';
alter table c_black_trans_download_ret modify (C$DLNO VARCHAR2(50));


alter table c_black_hit_count add(UPDATE_PERSON varchar2(20));
alter table c_black_hit_count add(ROLE_NAME varchar2(30));
comment on column c_black_hit_count.UPDATE_PERSON is '上传的用户';
comment on column c_black_hit_count.ROLE_NAME is '上传用户属于部门';

--------------手动添加一个部门角色FCTM#MAJOR。