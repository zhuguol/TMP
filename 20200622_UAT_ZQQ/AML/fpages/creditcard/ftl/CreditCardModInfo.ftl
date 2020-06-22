<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_level=RequestParameters["level"]?default("")>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTlrno()>
<@CommonQueryMacro.page title="处理">
<@CommonQueryMacro.CommonQuery id="CreditCardModInfo" init="false" submitMode="all" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="ftloperation[80],alarmDate,alarmNo,ruleName,riskLevel,isAlertm[120],custNo,custName,custCerttype,custCertno,custCategory,custPhoneno,custWorkunit,custIncome,creditCardcny,activeTimecny[150],creditCardusd,activeTimeusd[150],mallimitCny,mallimitAvailablecny,billingDate,billingAddress,repayDate,pbcScore,firstReducetime[150],transactorNo,proofResult,merchantResult,outboundResult[150],investigateResult,investigateReport,fcUar,messageResult,billStage[220],reduce,cardFreeze,approveStatus,approveMemo,approveTlr,operatorTlr,openAlerttime[150],closeAlerttime[150],reOpenalertTime[150],reClosealertTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var level = "${v_level}";
var tlrno = "${v_tlrno}";

function datatable1_ftloperation_onRefresh(cell, value, record){
    if(record!=null){
    	var id = record.getValue("id");
    	cell.innerHTML = getButtonHtml(id,"showCreditCard","修改","icon-edit");
    }
}

function showCreditCard(id) {
	locate(id);
	var ids = getIds(id);
	var operatorTlr = CreditCardModInfo_dataset.getValue("operatorTlr");
	var url;
	if(tlrno==operatorTlr){
		url = "/fpages/creditcard/ftl/CreditCardApplyDtl.ftl?op=update&id="+id+"&ids="+ids;
	}else{
		url = "/fpages/creditcard/ftl/CreditCardApplyDtl.ftl?op=detail&id="+id;
	}
	showWin("详细配置",url,"window","flushPage()",window);
}

//定位一条记录
function locate(id) {
    var record = CreditCardModInfo_dataset.find(["id"], [id]);
    if (record) {
        CreditCardModInfo_dataset.setRecord(record);
    }
}

function getIds(now_id){
	var record = CreditCardModInfo_dataset.getFirstRecord();
	var ids = "";
	while(record){
		var id = record.getValue("id");
		if(id!=now_id){
			ids = ids + "," + id;
		}
		record=record.getNextRecord();
   	}
   	if(ids==""){
   		return ids;
   	}else{
   		return ids.substring(1);
   	}
}

function flushPage() {
    CreditCardModInfo_dataset.flushData(CreditCardModInfo_dataset.pageIndex);
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