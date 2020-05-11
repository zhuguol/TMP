<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="员工交易监测月报员工管理">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradMTaskNew" init="false" submitMode="all" navigate="false" >
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
		    		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnReceive" fieldStr="select,opr[150],ruleCode[80],dataDate[80],branCode[70],custNo[80],custName[90],custIdCertNo[130],ctnt[80],ctar[220],staffNumber[80],staffDepartment[110],staffJobTitle[100],reportDOrM[80],appearanceTime[150],checkDate[90],investigator[90],status[100],managerName[100],invesResultByOps[120],caseId[120],reportDate[90],potentialCaseType[120],feedbackDate[90],concludedType[120],feedbackFrom[150],comfirmedSusp[120],qcComment[150],alterFlag[120],alterUar[120]" width="100%" hasFrame="true" readonly="true"/>
				</td>
		    </tr>
		    <tr>
      			<td colspan="2">
      				<@CommonQueryMacro.FloatWindow id="signWindow" label="" height="140" width="500" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      					<div align="center">
      						<@CommonQueryMacro.Group id="group1" label="选择需要分派的操作员编号" fieldStr="selectTlrno"/>
        					 <br/>
      						<@CommonQueryMacro.Button id= "btnConfirm"/>
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
		AStaffAcctTradMTaskNew_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradMTaskNew_interface_dataset.setValue("etlDateEnd",sysTxdate);
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
		var record = AStaffAcctTradMTaskNew_dataset.firstUnit;
		var updateCount = 0;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				alertIds = record.getValue("alertId");
				updateCount ++;
			}
			record=record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要查看详情的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录进行查看详情！");
			return false;
		}
		showWin("告警信息、客户信息和调查信息","/fpages/hf/form/ftl/AStaffAcctTradMUpdate.ftl?alertIds="+alertIds+"&op=detail","window","flushPage()",window);
	}
	
	//分派按钮
	function btnReceive_onClickCheck(button){
		var record = AStaffAcctTradMTaskNew_dataset.firstUnit;
		var updateCount = 0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要分派的记录！");
			return false;
		}else{
			subwindow_signWindow.show();
			return true;
		}
	}
	
	//确认分派
	function btnConfirm_onClickCheck(){
		var selectTlrno = AStaffAcctTradMTaskNew_dataset.getValue("selectTlrno");
		if(!selectTlrno.length > 0){
			alert("请选择操作员编号！");
		   	return false;
		}
		if(selectTlrno.length > 20) {
		   	alert('操作员编号长度超过20！');
		   	return false;
		}
		AStaffAcctTradMTaskNew_dataset.setParameter("selectTlrno",selectTlrno);
		return true;
	}
	
	function btnConfirm_postSubmit(button){
    	alert("分派成功！");
    	subwindow_signWindow.close();
    	flushPage();
    }
	
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradMTaskNew_dataset.flushData(AStaffAcctTradMTaskNew_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>