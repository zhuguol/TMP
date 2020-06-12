<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="告警信息、客户信息、调查信息和质检信息">
<@CommonQueryMacro.CommonQuery id="AStaffAcctTradUpdate" init="true" insertOnEmpty="true" submitMode="allchange" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top" >
			<table width="100%" cellpadding="0" cellspacing="0" id="bhdetail">
				<tr>
				    <td width="25%">
				   		<@CommonQueryMacro.GroupBox id="groupbox1" label="告警信息" expand="true">
							<table frame="void" class="grouptable" width="100%">
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">数据日期</td>
							   		<td width="25%" width="25%" class="datatd" id="tddataDate"><@CommonQueryMacro.SingleField fId="dataDate"/></td>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">告警号</td>
							    	<td width="25%" width="25%" class="datatd" id="tdalertId"><@CommonQueryMacro.SingleField fId="alertId"/></td>
								</tr>
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">规则代码</td>
							    	<td width="25%" width="25%" class="datatd" id="tdruleCode"><@CommonQueryMacro.SingleField fId="ruleCode"/></td>
								</tr>
							</table> 
						</@CommonQueryMacro.GroupBox>
				    </td>
				</tr>
				
				<tr>
					<td width="100%">
						<@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
							<table frame="void" class="grouptable" width="100%">
						   		<tr>
							   		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">分行号</td>
							   		<td width="25%" width="25%" class="datatd" id="tdbranCode"><@CommonQueryMacro.SingleField fId="branCode"/></td>			
							   		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							  		<td width="25%" width="25%" class="datatd" id="tdcustNo"><@CommonQueryMacro.SingleField fId="custNo"/></td>	
						  	 	</tr>
						   		<tr>
							   		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称/姓名</td>
							   		<td width="25%" width="25%" class="datatd" id="tdcustName"><@CommonQueryMacro.SingleField fId="custName"/></td>			
							   		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件号码</td>
							  		<td width="25%" width="25%" class="datatd" id="tdcustIdCertNo"><@CommonQueryMacro.SingleField fId="custIdCertNo"/></td>	
						  	 	</tr>
						   		<tr>
						   			<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
									<td width="25%" width="25%" class="datatd" id="tdctnt"><@CommonQueryMacro.SingleField fId="ctnt"/></td>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户住址/经营地址</td>
									<td width="25%" width="25%" class="datatd" id="tdctar"><@CommonQueryMacro.SingleField fId="ctar"/></td>
						   		</tr>
						   		<tr>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">员工编号</td>
									<td width="25%" width="25%" class="datatd" id="tdstaffNumber"><@CommonQueryMacro.SingleField fId="staffNumber"/></td>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">员工所在部门</td>
									<td width="25%" width="25%" class="datatd" id="tdstaffDepartment"><@CommonQueryMacro.SingleField fId="staffDepartment"/></td>
						   		</tr>
						   		<tr>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">员工职位名称</td>
									<td width="25%" width="25%" class="datatd" id="tdstaffJobTitle"><@CommonQueryMacro.SingleField fId="staffJobTitle"/></td>
						   		</tr>
							</table> 
						</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%">
				   		<@CommonQueryMacro.GroupBox id="groupbox1" label="调查信息" expand="true">
							<table frame="void" class="grouptable" width="100%">
								<tr>
						    		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">日报/月报</td>
						    		<td width="25%" width="25%" class="datatd" id="tdreportDOrM"><@CommonQueryMacro.SingleField fId="reportDOrM"/></td>
						    		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">(日报当月/月报当季)被抓出次数</td>
						    		<td width="25%" width="25%" class="datatd" id="tdappearanceTime"><@CommonQueryMacro.SingleField fId="appearanceTime"/></td>
								</tr>
								<tr>
						    		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">初步调查日期</td>
						    		<td width="25%" width="25%" class="datatd" id="tdcheckDate"><@CommonQueryMacro.SingleField fId="checkDate"/></td>
						    		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">调查者</td>
						    		<td width="25%" width="25%" class="datatd" id="tdinvestigator"><@CommonQueryMacro.SingleField fId="investigator"/></td>  
								</tr>
								<tr>   
						    		<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">调查阶段</td>
						    		<td width="25%" width="25%" class="datatd" id="tdstatus"><@CommonQueryMacro.SingleField fId="status"/></td> 
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">直线经理姓名</td>
						    		<td width="25%" width="25%" class="datatd" id="tdmanagerName"><@CommonQueryMacro.SingleField fId="managerName"/></td> 
								</tr>
								<tr>   
									<td width="25%" colspan="1" align="right" nowrap class="labeltd">初步调查结论(by OPS)</td>
									<td width="75%" colspan="3" class="datatd" id="tdinvesResultByOps"><@CommonQueryMacro.SingleField fId="invesResultByOps"/></td>
								</tr>
								<tr>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">上报案件编号</td>
									<td width="25%" width="25%" class="datatd" id="tdcaseId"><@CommonQueryMacro.SingleField fId="caseId"/></td>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">上报日期</td>
							    	<td width="25%" width="25%" class="datatd" id="tdreportDate"><@CommonQueryMacro.SingleField fId="reportDate"/></td>
							    </tr>
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">(初步调查)上报的可疑类型</td>
							    	<td width="25%" width="25%" class="datatd" id="tdpotentialCaseType"><@CommonQueryMacro.SingleField fId="potentialCaseType"/></td>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">收到反馈时间</td>
							    	<td width="25%" width="25%" class="datatd" id="tdfeedbackDate"><@CommonQueryMacro.SingleField fId="feedbackDate"/></td>  
							    </tr>
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">(收到反馈)判定的可疑类型</td>
							    	<td width="25%" width="25%" class="datatd" id="tdconcludedType"><@CommonQueryMacro.SingleField fId="concludedType"/></td>
								</tr>
								<tr>  
									<td width="25%" colspan="1" align="right" nowrap class="labeltd">反馈结果(从FCTM或者GB/GF指定部门)</td>
							    	<td width="75%" colspan="3" class="datatd" id="tdfeedbackFrom"><@CommonQueryMacro.SingleField fId="feedbackFrom"/></td>  
							    </tr>
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">是否判定可疑(及由哪方判定)</td>
							    	<td width="25%" width="25%" class="datatd" id="tdcomfirmedSusp"><@CommonQueryMacro.SingleField fId="comfirmedSusp"/></td>
									<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">反馈案件编号</td>
							    	<td width="25%" width="25%" class="datatd" id="tdalterUar"><@CommonQueryMacro.SingleField fId="alterUar"/></td>
								</tr>
							</table> 
						</@CommonQueryMacro.GroupBox>
				   </td>
				</tr>
				<tr>
				    <td width="25%">
				   		<@CommonQueryMacro.GroupBox id="groupbox1" label="质检信息" expand="true">
							<table frame="void" class="grouptable" width="100%">
								<tr>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">记录状态</td>
							   		<td width="25%" width="25%" class="datatd" id="tdapproveStatus"><@CommonQueryMacro.SingleField fId="approveStatus"/></td>
							    	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">审核人员</td>
							    	<td width="25%" width="25%" class="datatd" id="tdapproveUpdTlr"><@CommonQueryMacro.SingleField fId="approveUpdTlr"/></td>
								</tr>
								<tr>
									<td width="25%" colspan="1" align="right" nowrap class="labeltd">质检意见</td>
							    	<td width="75%" colspan="3" class="datatd" id="tdqcComment"><@CommonQueryMacro.SingleField fId="qcComment"/></td>
								</tr>
								<tr>
									<td>&nbsp; &nbsp;</td>
								</tr>
							</table> 
						</@CommonQueryMacro.GroupBox>
				    </td>
				</tr>
				<tr>
		      		<td>
		      			<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="205" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      				<div align="center">
		        				<@CommonQueryMacro.GroupBox id="group2" label="审核信息" expand="true">
				  					<table frame="void" class="grouptable" width="100%">
										<tr>
									   		<td width="25%" colspan="1" align="right" nowrap class="labeltd">审核状态</td>
									   		<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveStatusChoose"/></td>			
						   				</tr>
						   				<tr>
									   		<td width="25%" colspan="1" align="right" nowrap class="labeltd">审核说明</td>
									   		<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveResultChoose"/></td>			
						   				</tr>
						   				<tr>
									   		<td width="25%" id="specialTypeLable" colspan="1" align="right" nowrap class="labeltd">新调查者</td>
									  		<td width="25%" class="datatd" id="specialType"><@CommonQueryMacro.SingleField fId="recordUpdTlrChoose"/></td>			
						   				</tr>
						   			</table>
				    				<@CommonQueryMacro.Button id= "btnSubmit"/>
				    				<@CommonQueryMacro.Button id= "btnCancels"/>
				    			</@CommonQueryMacro.GroupBox>
		      				</div>
		     		 	</@CommonQueryMacro.FloatWindow>
		  			</td>
  				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="3">
			<center>
				<@CommonQueryMacro.Button id="btnApprove"/>&nbsp; &nbsp;
			 	<@CommonQueryMacro.Button id="btnSave"/>&nbsp; &nbsp;
				<@CommonQueryMacro.Button id="btnCancel"/>
			</center>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	//页面初始化
	function initCallGetter_post(){
  		//详细页面设置只读、其他按钮全部屏蔽
  		if(op == "detail"){
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("dataDate",true);//数据日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alertId",true);//告警号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ruleCode",true);//规则代码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("branCode",true);//分行号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custNo",true);//客户号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custName",true);//客户名称/姓名
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custIdCertNo",true);//客户身份证件号码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctnt",true);//客户国籍
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctar",true);//客户住址/经营地址
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffNumber",true);//员工编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffDepartment",true);//员工所在部门
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffJobTitle",true);//员工职位名称
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("reportDOrM",true);//日报/月报
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("appearanceTime",true);//(日报当月/月报当季)被抓出次数
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("checkDate",true);//初步调查日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("investigator",true);//调查者
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("status",true);//调查阶段
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("managerName",true);//直线经理姓名
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("invesResultByOps",true);//初步调查结论(by OPS)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("caseId",true);//上报案件编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("reportDate",true);//上报日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("potentialCaseType",true);//(初步调查)上报的可疑类型
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("feedbackDate",true);//收到反馈时间
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("concludedType",true);//(收到反馈)判定的可疑类型
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("feedbackFrom",true);//反馈结果(从FCTM或者GB/GF指定部门)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("comfirmedSusp",true);//是否判定可疑(及由哪方判定)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alterUar",true);//反馈案件编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveStatus",true);//记录状态
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("qcComment",true);//质检意见
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveUpdTlr",true);//审核人员
  			//将保存按钮隐藏
  			document.getElementById('btnSave').style.display="none";
  			//将审核按钮隐藏
  			document.getElementById('btnApprove').style.display="none";
		}else if(op == "update"){
			AStaffAcctTradUpdate_dataset.setFieldReadOnly("dataDate",true);//数据日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alertId",true);//告警号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ruleCode",true);//规则代码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("branCode",true);//分行号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custNo",true);//客户号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custName",true);//客户名称/姓名
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custIdCertNo",true);//客户身份证件号码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctnt",true);//客户国籍
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctar",true);//客户住址/经营地址
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffNumber",true);//员工编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffDepartment",true);//员工所在部门
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffJobTitle",true);//员工职位名称
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("reportDOrM",true);//日报/月报
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("appearanceTime",true);//(日报当月/月报当季)被抓出次数
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("checkDate",true);//初步调查日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("investigator",true);//调查者
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alterUar",true);//反馈案件编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveStatus",true);//记录状态
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("qcComment",true);//质检意见
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveUpdTlr",true);//审核人员
  			//将审核按钮隐藏
  			document.getElementById('btnApprove').style.display="none";
		}else if(op == "approve"){
			AStaffAcctTradUpdate_dataset.setFieldReadOnly("dataDate",true);//数据日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alertId",true);//告警号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ruleCode",true);//规则代码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("branCode",true);//分行号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custNo",true);//客户号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custName",true);//客户名称/姓名
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("custIdCertNo",true);//客户身份证件号码
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctnt",true);//客户国籍
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("ctar",true);//客户住址/经营地址
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffNumber",true);//员工编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffDepartment",true);//员工所在部门
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("staffJobTitle",true);//员工职位名称
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("reportDOrM",true);//日报/月报
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("appearanceTime",true);//(日报当月/月报当季)被抓出次数
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("checkDate",true);//初步调查日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("investigator",true);//调查者
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("status",true);//调查阶段
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("managerName",true);//直线经理姓名
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("invesResultByOps",true);//初步调查结论(by OPS)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("caseId",true);//上报案件编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("reportDate",true);//上报日期
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("potentialCaseType",true);//(初步调查)上报的可疑类型
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("feedbackDate",true);//收到反馈时间
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("concludedType",true);//(收到反馈)判定的可疑类型
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("feedbackFrom",true);//反馈结果(从FCTM或者GB/GF指定部门)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("comfirmedSusp",true);//是否判定可疑(及由哪方判定)
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("alterUar",true);//反馈案件编号
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveStatus",true);//记录状态
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("qcComment",true);//质检意见
  			AStaffAcctTradUpdate_dataset.setFieldReadOnly("approveUpdTlr",true);//审核人员
  			//将保存按钮隐藏
  			document.getElementById('btnSave').style.display="none";
		}
	}
	
	//返回按钮
	function btnCancel_onClick() {
		closeWin(true);
	}
	
	//修改成功返回上一页面
	function btnSave_postSubmit(button){
		if(op == 'update'){
			alert("调查信息修改成功！");
			closeWin(true);
		}
	}
	
	//审核按钮
	function btnApprove_onClickCheck(button){
		subwindow_floatWindowAudit.show();
	}
	
	//确定按钮
	function btnSubmit_onClickCheck(){
		var approveStatusChoose = AStaffAcctTradUpdate_dataset.getValue("approveStatusChoose");
		var approveResultChoose = AStaffAcctTradUpdate_dataset.getValue("approveResultChoose");
		var recordUpdTlrChoose = AStaffAcctTradUpdate_dataset.getValue("recordUpdTlrChoose");
		if(!approveStatusChoose.length > 0){
			alert("请选择审核状态！");
		   	return false;
		}
		if(approveStatusChoose == "02" && approveResultChoose.length < 1) {
		   	alert('审核状态为"02-不通过"，审核说明必须填写！');
		   	return false;
		}
		if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>500){//中文和中文符号转为3个字符
			alert("审核说明过长，请修改！");
			return false;
		}
		if(recordUpdTlrChoose.replace(/[^\x00-\xff]/g, "***").length>20){
			alert("新调查者过长，请检查！");
			return false;
		}
		AStaffAcctTradUpdate_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		AStaffAcctTradUpdate_dataset.setParameter("approveResultChoose",approveResultChoose);
	    AStaffAcctTradUpdate_dataset.setParameter("recordUpdTlrChoose",recordUpdTlrChoose);
		subwindow_floatWindowAudit.hide();
	}
	
	function btnSubmit_postSubmit(button) {
		button.url="#";
		alert("保存成功！");
		//关闭当前小窗口
		btnCancels.click();
		//返回主页面
		btnCancel.click();
	}
	
	//取消按钮
	function btnCancels_onClick(){
		subwindow_floatWindowAudit.close();
	}
</script>
</@CommonQueryMacro.page>