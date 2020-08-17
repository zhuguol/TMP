<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_level=RequestParameters["level"]?default("")>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTlrno()>
<@CommonQueryMacro.page title="申领">
<@CommonQueryMacro.CommonQuery id="CreditCardApplyInfo" init="false" submitMode="all" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="-,btDownload,-,btRandomShenlin" fieldStr="select,ftloperation[80],alarmDate,alarmNo,ruleName,riskLevel,isAlertm[120],custNo,custName,custCerttype,custCertno,custCategory,custPhoneno,custWorkunit,custIncome,creditCardcny,activeTimecny[150],creditCardusd,activeTimeusd[150],limitCny,limitAvailablecny,billingDate,billingAddress,repayDate,firstReducetime[150],transactorNo,proofResult,merchantResult,outboundResult[150],investigateResult,investigateReport,fcUar,messageResult,billStage[220],reduce,cardFreeze,approveStatus,approveMemo,approveTlr,operatorTlr,openAlerttime[150],closeAlerttime[150],reOpenalertTime[150],reClosealertTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var level = "${v_level}";
var tlrno = "${v_tlrno}";
var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};

function initCallGetter_post() {
	CreditCardApplyInfo_interface_dataset.setValue("qalarmDateStart",sysTxdate);
	CreditCardApplyInfo_interface_dataset.setValue("qalarmDateEnd",sysTxdate);
}

function datatable1_ftloperation_onRefresh(cell, value, record){
    if(record!=null){
    	var id = record.getValue("id");
    	var operatorTlr = record.getValue("operatorTlr");
    	if(operatorTlr==tlrno){
    		cell.innerHTML = getButtonHtml(id,"editCreditCard","修改","icon-edit");
    	}else{
    		cell.innerHTML = getButtonHtml(id,"showCreditCard","详细","icon-view-detail");
    	}
    }
}

function showCreditCard(id) {
	locate(id);
	var url = "/fpages/creditcard/ftl/CreditCardDtl.ftl?op=detail&id="+id;
	showWin("详细",url,"window","flushPage()",window);
}

function editCreditCard(id) {
	locate(id);
	var q_qalarmDateStart  = CreditCardApplyInfo_interface_dataset.getValue("qalarmDateStart");
	var q_qalarmDateEnd  = CreditCardApplyInfo_interface_dataset.getValue("qalarmDateEnd");
	var qs = formatDate(q_qalarmDateStart);
	var qe = formatDate(q_qalarmDateEnd);
	var url = "/fpages/creditcard/ftl/CreditCardDtl.ftl?op=update&id="+id+"&level="+level+"&qs="+qs+"&qe="+qe;
	showWin("详细配置",url,"window","flushPage()",window);
}

function btRandomShenlin_onClick(button) {
	CreditCardDwrFunction.applyCase(level,function(data){
		if(data=="1"){
	 		easyMsg.info("已有用户正在进行申领，请稍后重试！");
			createTimer(2000);
	 	}else if(data=="2"){
	 		easyMsg.info("未查询到待申领的记录！");
			createTimer(2000);
	 	}else{//申领成功
	 		easyMsg.correct(data);
			CreditCardApplyInfo_dataset.flushData();
	 	}
	});
}

function btDownload_onClickCheck(){
	var record = CreditCardApplyInfo_dataset.firstUnit;
	var chk=0;
	var ids="";
	while(record){
		var temp = record.getValue("select");
		if(temp){
			chk++;
			var id = record.getValue("id");
			ids+=","+id;
		}
		record=record.nextUnit;
	}
	if(chk==0){
		easyMsg.warn("请选择需要导出的记录！");
   		createTimer(2000);
		return false;
	}else{
		ids = ids.substring(1);
   		CreditCardApplyInfo_dataset.setParameter("ids",ids);
	  	return true;
	}
}

function btDownload_onClick(){
	var ids = CreditCardApplyInfo_dataset.getParameter("ids");
	window.location.href =  encodeURI(encodeURI("${contextPath}/filedownload/CreditCardAction.do?reportId=PageSelect"+
				"&ids="+ids));
}

//定位一条记录
function locate(id) {
    var record = CreditCardApplyInfo_dataset.find(["id"], [id]);
    if (record) {
        CreditCardApplyInfo_dataset.setRecord(record);
    }
}

function flushPage() {
    CreditCardApplyInfo_dataset.flushData(CreditCardApplyInfo_dataset.pageIndex);
    createTimer(2000);
}

var timer = null;
function createTimer(time){
	window.clearTimeout(timer);
	timer = window.setTimeout(function(){
	try{
		easyMsg.close();
		top.easyMsg.close();
	}catch(e){}},time);//刷新时间 
}

function formatDate(date){
	 if(date!=""){
	 	var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y+''+m+''+d;
	 }else{
	    return "";
    }
}

/*
function btShenlin_onClickCheck(button){
	var hasSelected = false;
	var hasAudit = false;
	var record = CreditCardApplyInfo_dataset.getFirstRecord();
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
   		CreditCardApplyInfo_dataset.setParameter("ids",ids);
   	}
   	return true;
}

function btShenlin_postSubmit(button) {
	easyMsg.correct("申领成功！");
	createTimer(2000);
	CreditCardApplyInfo_dataset.flushData();
}
*/
</script>
</@CommonQueryMacro.page>