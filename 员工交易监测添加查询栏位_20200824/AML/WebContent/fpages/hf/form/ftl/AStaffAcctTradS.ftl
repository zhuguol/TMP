<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="员工交易监测日报">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradS" init="false" submitMode="allchange" navigate="false" >
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnUpdate,-,btnBatchUpdate" fieldStr="select,opr[150],ruleCode[80],dataDate[80],branCode[70],custNo[80],custName[90],custIdCertNo[130],ctnt[80],ctar[220],staffNumber[80],staffDepartment[110],staffJobTitle[100],reportDOrM[80],appearanceTime[150],checkDate[90],investigator[90],status[100],managerName[100],invesResultByOps[120],caseId[120],reportDate[90],potentialCaseType[120],feedbackDate[90],concludedType[120],feedbackFrom[150],comfirmedSusp[120],alterUar[150],approveStatus[120],qcComment[150],approveUpdTlr[120],recordUpdTlr[120]" width="100%" height="500" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		    <tr>
		      	<td>
		      		<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="120" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      			<div align="center">
		        			<@CommonQueryMacro.GroupBox id="group2" label="更新初步调查日期" expand="true">
				  				<table frame="void" class="grouptable" width="100%">
									<tr>
									   	<td width="25%" colspan="1" align="right" nowrap class="labeltd">初步调查日期</td>
									   	<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="checkDateChoose"/></td>			
						   			</tr>
						   		</table>
				    			<@CommonQueryMacro.Button id= "btnSubmit"/>
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
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var tlrno = "${v_tlrno}";
	//交易日期初始化
	function initCallGetter_post() {
		//交易起始日期
		AStaffAcctTradS_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradS_interface_dataset.setValue("etlDateEnd",sysTxdate);
		//员工编号
		AStaffAcctTradS_interface_dataset.setValue("staffNumbers","01");
	}
	
	//设置客户编号链接
	function datatable_opr_onRefresh(cell,value,record) {
		if(record) {//当存在记录时
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
		var record = AStaffAcctTradS_dataset.firstUnit;
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
		showWin("告警信息、客户信息、调查信息和质检信息","/fpages/hf/form/ftl/AStaffAcctTradUpdate.ftl?alertIds="+alertIds+"&op=detail","window","flushPage()",window);
	}
	
	//修改页面
	function btnUpdate_onClickCheck(button){
		var record = AStaffAcctTradS_dataset.firstUnit;
		var updateCount = 0;
		var recordUpdTlr;
		var approveStatus;
		var staffNumber;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				recordUpdTlr = record.getValue("recordUpdTlr");//记录修改人
				approveStatus = record.getValue("approveStatus");//记录状态
				staffNumber = record.getValue("staffNumber");//员工编号
				alertIds = record.getValue("alertId");//告警号
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要修改的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录进行修改！");
			return false;
		}else{
			if(staffNumber == ""){
				alert("当前记录的员工编号为空，您不能进行修改操作！");
				return false;
			}else{
				if(approveStatus == "03"){
					alert('当前记录状态为"03-自查审核成功"，不可以修改！');
					return false;
				}else if(approveStatus == "01"){
					alert('当前记录状态为"01-已下载"，但还未进行调查不可以修改！');
					return false;
				}else{
					if(approveStatus != "00" && recordUpdTlr != ""){
						showWin("告警信息、客户信息、调查信息和质检信息","/fpages/hf/form/ftl/AStaffAcctTradUpdate.ftl?alertIds="+alertIds+"&op=make","window","flushPage()",window);
					}else{
						alert("当前记录还未进行调查！");
						return false;
					}
				}
			}
		}
	}
	
	//批量更新初步调查日期
	function btnBatchUpdate_onClickCheck(button){
		var record = AStaffAcctTradS_dataset.firstUnit;
		var updateCount = 0;
		var recordUpdTlr;
		var approveStatus;
		var staffNumber;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				recordUpdTlr = record.getValue("recordUpdTlr");//记录修改人
				approveStatus = record.getValue("approveStatus");//记录状态
				staffNumber = record.getValue("staffNumber");//员工编号
				alertIds = record.getValue("alertId");//告警号
				if(staffNumber == ""){
					alert("告警号为:"+alertIds+"的记录员工编号为空，不可以修改！");
					return false;
				}
				if(approveStatus == "03"){
					alert('告警号为:'+alertIds+'的记录状态为"03-自查审核成功"，不可以修改！');
					return false;
				}
				if(approveStatus == "01"){
					alert('告警号为:'+alertIds+'的记录状态为"01-已下载"，但还未进行调查不可以修改！');
					return false;
				}
				if(approveStatus == "00" || recordUpdTlr == ""){
					alert(告警号为:'+alertIds+'的记录还未进行调查！');
					return false;
				}
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要修改的记录！");
			return false;
		}else{
			subwindow_floatWindowAudit.show();
		}
	}
	
	//确定更新按钮
	function btnSubmit_onClickCheck(){
		var checkDateChoose = AStaffAcctTradS_dataset.getValue("checkDateChoose");
		if(checkDateChoose.length == ''){
			alert("请选择初步调查日期！");
		   	return false;
		}
	    AStaffAcctTradS_dataset.setParameter("checkDateChoose",checkDateChoose);
		subwindow_floatWindowAudit.hide();
		return true;
	}
	
	function btnSubmit_postSubmit(button) {
		button.url="#";
		alert("更新初步调查日期成功！");
		btnCancel.click();
		flushPage();
	}
	
	//取消按钮
	function btnCancel_onClick(){
		subwindow_floatWindowAudit.close();
	}
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradS_dataset.flushData(AStaffAcctTradS_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>