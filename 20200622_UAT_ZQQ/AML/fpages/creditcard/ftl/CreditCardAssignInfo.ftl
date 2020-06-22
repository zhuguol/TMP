<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_level=RequestParameters["level"]?default("")>
<@CommonQueryMacro.page title="申领">
<@CommonQueryMacro.CommonQuery id="CreditCardAssignInfo" init="false" submitMode="all" navigate="false" >
<table align="left"  width="100%">
	<tr>
		<td colspan="2">
			<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="8" labelwidth="150"/>
		</td>
	</tr>

	<tr>
		<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
		</td>
	</tr>

	<tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btAssign" fieldStr="select,ftloperation[80],alarmDate,alarmNo,ruleName,riskLevel,isAlertm[120],custNo,custName,custCerttype,custCertno,custCategory,custPhoneno,custWorkunit,custIncome,creditCardcny,activeTimecny[150],creditCardusd,activeTimeusd[150],mallimitCny,mallimitAvailablecny,billingDate,billingAddress,repayDate,pbcScore,firstReducetime[150],transactorNo,proofResult,merchantResult,outboundResult[150],investigateResult,investigateReport,fcUar,messageResult,billStage[220],reduce,cardFreeze,approveStatus,approveMemo,approveTlr,operatorTlr,openAlerttime[150],closeAlerttime[150],reOpenalertTime[150],reClosealertTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
	<tr>
		<td colspan="2">
		<@CommonQueryMacro.FloatWindow id="signWindow" label="" height="140" width="500" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
			<div align="center">
				<@CommonQueryMacro.Group id="group1" label="选择需要分派的操作员编号" fieldStr="selectTlrno"/>
				 <br/>
				<@CommonQueryMacro.Button id= "btConfirm"/>
			</div>
	 </@CommonQueryMacro.FloatWindow>
	</td>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var level = "${v_level}";

function datatable1_ftloperation_onRefresh(cell, value, record){
    if(record!=null){
    	var id = record.getValue("id");
    	cell.innerHTML = getButtonHtml(id,"showCreditCard","详细","icon-view-detail");
    }
}

function showCreditCard(id) {
	locate(id);
	var url = "/fpages/creditcard/ftl/CreditCardDtl.ftl?op=detail&id="+id;
	showWin("详细",url,"window","flushPage()",window);
}

//分派
function btAssign_onClickCheck(button){
	var record = CreditCardAssignInfo_dataset.firstUnit;
	var chk=0;
	while(record){
		var temp = record.getValue("select");
		if(temp){
			chk++;
		}
		record=record.nextUnit;
	}
	if(chk==0){
		easyMsg.warn("请选择要分派的记录！");
   		createTimer(2000);
		return false;
	}else{
		subwindow_signWindow.show();
	  	return true;
	}
}

//确认
function btConfirm_onClickCheck(button){
	var selectTlrno = CreditCardAssignInfo_dataset.getValue("selectTlrno");
   	if (!selectTlrno) {
   		easyMsg.warn("请选择需要分派的操作员编号！");
   		createTimer(2000);
   		return false;
	}else{
		CreditCardAssignInfo_dataset.setParameter("selectTlrno",selectTlrno);
		return true;
	}
}	

function btConfirm_postSubmit(button) {
	easyMsg.correct("分派成功！");
	createTimer(2000);
	subwindow_signWindow.close();
	CreditCardAssignInfo_dataset.flushData(CreditCardAssignInfo_dataset.pageIndex);
}

//定位一条记录
function locate(id) {
    var record = CreditCardAssignInfo_dataset.find(["id"], [id]);
    if (record) {
        CreditCardAssignInfo_dataset.setRecord(record);
    }
}

function flushPage() {
    CreditCardAssignInfo_dataset.flushData(CreditCardAssignInfo_dataset.pageIndex);
}

var timer = null;
function createTimer(time){
	window.clearTimeout(timer);
	timer = window.setTimeout(function(){
	try{
		easyMsg.close();
	}catch(e){}},time);//刷新时间 
}
</script>
</@CommonQueryMacro.page>