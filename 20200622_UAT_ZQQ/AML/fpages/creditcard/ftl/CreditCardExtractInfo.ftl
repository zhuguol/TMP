<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_level=RequestParameters["level"]?default("")>
<@CommonQueryMacro.page title="申领">
<@CommonQueryMacro.CommonQuery id="CreditCardExtractInfo" init="false" submitMode="all" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btExtrat" fieldStr="select,ftloperation[80],alarmDate,alarmNo,ruleName,riskLevel,isAlertm[120],custNo,custName,custCerttype,custCertno,custCategory,custPhoneno,custWorkunit,custIncome,creditCardcny,activeTimecny[150],creditCardusd,activeTimeusd[150],mallimitCny,mallimitAvailablecny,billingDate,billingAddress,repayDate,pbcScore,firstReducetime[150],transactorNo,proofResult,merchantResult,outboundResult[150],investigateResult,investigateReport,fcUar,messageResult,billStage[220],reduce,cardFreeze,approveStatus,approveMemo,approveTlr,operatorTlr,openAlerttime[150],closeAlerttime[150],reOpenalertTime[150],reClosealertTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
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

function btExtrat_onClickCheck(button){
	var hasSelected = false;
	var hasAudit = false;
	var record = CreditCardExtractInfo_dataset.getFirstRecord();
	var ids = "";
	while(record){
		var v_selected = record.getValue("select");
		if( v_selected == true ){
			hasSelected = true;
			var id = record.getValue("id");
			ids = ids + "," + id;
		}
		record=record.getNextRecord();
   	}
   	if (!hasSelected) {
   		easyMsg.warn("请选择相应的记录！");
   		createTimer(3000);
   		return false;
   	}else{
   		ids = ids.substring(1);
   		CreditCardExtractInfo_dataset.setParameter("ids",ids);
   	}
   	return true;
}

function btExtrat_postSubmit(button) {
	easyMsg.correct("提交成功！");
	createTimer(2000);
	CreditCardExtractInfo_dataset.flushData();
}

//定位一条记录
function locate(id) {
    var record = CreditCardExtractInfo_dataset.find(["id"], [id]);
    if (record) {
        CreditCardExtractInfo_dataset.setRecord(record);
    }
}

function flushPage() {
    CreditCardExtractInfo_dataset.flushData(CreditCardExtractInfo_dataset.pageIndex);
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