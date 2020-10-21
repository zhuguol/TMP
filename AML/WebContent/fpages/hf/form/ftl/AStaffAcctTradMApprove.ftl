<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="交易监测月报自查审核">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradMApprove" init="false" submitMode="allchange" navigate="false" >
		<table align="left"  width="100%">
			<tr>
				<td colspan="2">
					<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="4"/>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
				</td>
		    </tr>
		    <tr>
		    	<td colspan="2">
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnApprove" fieldStr="select,opr[150],ruleCode[80],dataDate[80],branCode[70],custNo[80],custName[90],custIdCertNo[130],ctnt[80],ctar[220],staffNumber[80],staffDepartment[110],staffJobTitle[100],reportDOrM[80],appearanceTime[150],checkDate[90],investigator[90],status[100],managerName[100],invesResultByOps[120],caseId[120],reportDate[90],potentialCaseType[120],feedbackDate[90],concludedType[120],feedbackFrom[150],comfirmedSusp[120],alterUar[150],alterFlag[120],approveStatus[120],qcComment[150],approveUpdTlr[120],recordUpdTlr[120]" width="100%" height="500" hasFrame="true" readonly="true"/>
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
			    				<@CommonQueryMacro.Button id= "btnSave"/>
			    				<@CommonQueryMacro.Button id= "btnCancel"/>
			    			</@CommonQueryMacro.GroupBox>
	      				</div>
	     		 	</@CommonQueryMacro.FloatWindow>
	  			</td>
			</tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMM")};   
	var tlrno = "${v_tlrno}";
	//交易日期初始化
	function initCallGetter_post() {
		//交易起始日期
		AStaffAcctTradMApprove_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradMApprove_interface_dataset.setValue("etlDateEnd",sysTxdate);
	}
	
	//设置客户编号链接
	function datatable_opr_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var alertId = record.getValue("alertId");//标识信息
			var approveStatus = record.getValue("approveStatus");//记录状态
			if(alertId != ""){
				cell.innerHTML = "<a href=\"JavaScript:doDetail('" + alertId + "')\">" + alertId + "</a>";
			}else{
				cell.innerHTML = "&nbsp;";
			}
		}
	}
	
	//链接查看详细信息
	function doDetail(alertId){
		showWin("客户交易明细","/fpages/hf/form/ftl/AStaffAcctTradInfo.ftl?alertId="+alertId,"window","flushPage()",window);
	}
	
	//详情按钮
	function btnSelect_onClickCheck(button){
		var record = AStaffAcctTradMApprove_dataset.firstUnit;
		var updateCount = 0;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    alertIds = record.getValue("alertId");
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要查看详情的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录进行查看详情！");
			return false;
		}
		showWin("告警信息、客户信息、调查信息和质检信息","/fpages/hf/form/ftl/AStaffAcctTradMUpdate.ftl?alertIds="+alertIds+"&op=approve","window","flushPage()",window);
	}
	
	//批量审核
	function btnApprove_onClickCheck(button){
		var record = AStaffAcctTradMApprove_dataset.firstUnit;
		var updateCount = 0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择审核的记录！");
			return false;
		}
		subwindow_floatWindowAudit.show();
	}
	
	//保存操作
	function btnSave_onClickCheck(){
		var approveStatusChoose = AStaffAcctTradMApprove_dataset.getValue("approveStatusChoose");
		var approveResultChoose = AStaffAcctTradMApprove_dataset.getValue("approveResultChoose");
		var recordUpdTlrChoose = AStaffAcctTradMApprove_dataset.getValue("recordUpdTlrChoose");
		if(!(approveStatusChoose.length > 0)){
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
		AStaffAcctTradMApprove_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		AStaffAcctTradMApprove_dataset.setParameter("approveResultChoose",approveResultChoose);
	    AStaffAcctTradMApprove_dataset.setParameter("recordUpdTlrChoose",recordUpdTlrChoose);
		subwindow_floatWindowAudit.hide();
		return true;
	}
	
	function btnSave_postSubmit(button) {
		button.url="#";
		alert("保存成功！");
		//关闭当前小窗口
		btnCancel.click();
		flushPage();
	}
	
	//取消按钮
	function btnCancel_onClick(){
		subwindow_floatWindowAudit.close();
	}
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradMApprove_dataset.flushData(AStaffAcctTradMApprove_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>