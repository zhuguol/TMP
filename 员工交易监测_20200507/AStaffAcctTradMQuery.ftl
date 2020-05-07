<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="交易监测日报自查手工抽取">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradMQuery" init="false" submitMode="allchange" navigate="false" >
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
		      		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnUpdate" fieldStr="select,opr[200],ruleCode[100],dataDate[100],branCode[100],custNo[100],custName[100],custIdCertNo[100],ctnt[100],ctar[100],staffNumber[100],staffDepartment[100],staffJobTitle[100],reportDOrM[100],appearanceTime[100],checkDate[100],investigator[100],status[100],managerName[100],invesResultByOps[100],caseId[100],reportDate[100],potentialCaseType[100],feedbackDate[100],concludedType[100],feedbackFrom[100],comfirmedSusp[100],qcComment[100],alterFlag[100],alterUar[100]" width="100%" hasFrame="true" readonly="true"/>
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
		AStaffAcctTradMQuery_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradMQuery_interface_dataset.setValue("etlDateEnd",sysTxdate);
	}
	
	//设置客户编号链接
	function datatable_opr_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var alertIds = record.getValue("alertId");//告警号
			var approveStatus = record.getValue("approveStatus");//记录状态
			if(alertIds != ""){
				cell.innerHTML = "<a href=\"JavaScript:doDetail('" + alertIds + "')\">" + alertIds + "</a>";
			}else{
				cell.innerHTML = "&nbsp;";
			}
		}
	}
	
	//链接查看详细信息
	function doDetail(alertIds){
		showWin("客户交易明细","/fpages/hf/form/ftl/AStaffAcctTradInfo.ftl?alertIds="+alertIds,"window","flushPage()",window);
	}
	
	//详情按钮
	function btnSelect_onClickCheck(button){
		var record = AStaffAcctTradMQuery_dataset.firstUnit;
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
	
	//确认提交前校验
	function btnUpdate_onClickCheck(button){
		if(confirm("确认提交吗?")){
			var record = AStaffAcctTradMQuery_dataset.firstUnit;
			var updateCount = 0;
			var alertId;
			while(record){
				var temp = record.getValue("select");
				if(temp){
			    	alertId = record.getValue("alertId");
					updateCount ++;
				}
				record=record.nextUnit;
			}
			if(updateCount == 0){
				alert("请选择需要修改的记录！");
				return false;
			}
			return true;
		}
		return false;
	}
	
	//确认提交成功
	function btnUpdate_postSubmit(button) {
	    alert("确认提交成功");
	    flushPage();
	}
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradMQuery_dataset.flushData(AStaffAcctTradMQuery_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>