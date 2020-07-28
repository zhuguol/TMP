insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('1000', '信用卡0905', null, 2, 1, '0', 21, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');


insert into FUNCTION_INFO (FUNCID, FUNCNAME, PAGEPATH, LOCATION, ISDIRECTORY, LASTDIRECTORY, SHOWSEQ, FUNC_CLASS, FUNC_TYPE, WORKFLOW_FLAG, UP_FUNC_CODE, FUNC_DESC, STATUS, EFFECT_DATE, EXPIRE_DATE, TIMESTAMPS, MISCFLGS, MISC, ICON_CLS)
values ('10001', '信用卡0905上传下载', '/fpages/hf/form/ftl/CreditCard0905ListUpload.ftl', 2, 0, '1000', 1, null, '1', null, null, null, '1', null, null, null, null, null, 'icon-edit');


DROP TABLE Credit_Card_0905_List_Upload;
CREATE TABLE Credit_Card_0905_List_Upload 
   (SEQ_NO VARCHAR2(20), 
	ETL_DATE VARCHAR2(8), 
	GL_ACCONT VARCHAR2(20), 
	BUSS_NAME VARCHAR2(200),
	BUSS_USE VARCHAR2(200),
	NOTICE VARCHAR2(400),
	ROLE_NAME VARCHAR2(30),
	UPDATE_PERSON VARCHAR2(20)
   );
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.SEQ_NO IS '序列号';
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.ETL_DATE IS '上传日期';
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.GL_ACCONT IS 'GL_ACCONT';
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.BUSS_NAME IS '业务名称';
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.BUSS_USE IS '业务用途';
 
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.NOTICE IS '备注';
   
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.ROLE_NAME IS '上传用户属于部门';
   
   COMMENT ON COLUMN Credit_Card_0905_List_Upload.UPDATE_PERSON IS '上传的用户';
 
   COMMENT ON TABLE Credit_Card_0905_List_Upload  IS '信用卡0905上传表';
   
create sequence AML.SEQ_CreditCard0905ListUpload
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;


insert into user_col_comments(table_name,column_name,comments) values ('Credit_Card_0905_List_Upload','SEQ_NO','序列号');


