<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_level=RequestParameters["level"]?default("")>
<@CommonQueryMacro.page title="审核">
<@CommonQueryMacro.CommonQuery id="CreditCardExtractApproveInfo" init="false" submitMode="all" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btApprove" fieldStr="select,ftloperation[80],alarmDate,alarmNo,ruleName,riskLevel,isAlertm[120],custNo,custName,custCerttype,custCertno,custCategory,custPhoneno,custWorkunit,custIncome,creditCardcny,activeTimecny[150],creditCardusd,activeTimeusd[150],mallimitCny,mallimitAvailablecny,billingDate,billingAddress,repayDate,pbcScore,firstReducetime[150],transactorNo,proofResult,merchantResult,outboundResult[150],investigateResult,investigateReport,fcUar,messageResult,billStage[220],reduce,cardFreeze,approveStatus,approveMemo,approveTlr,operatorTlr,openAlerttime[150],closeAlerttime[150],reOpenalertTime[150],reClosealertTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
	<tr>
		<td >
		<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="200" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
			<div align="center">
				<@CommonQueryMacro.GroupBox id="group2" label="审核信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" colspan="1" align="right" nowrap class="labeltd">审核状态</td>
							   <td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveStatusChoose"/></td>			
				   			</tr>
				   			<tr>
							   <td width="25%" colspan="1" align="right" nowrap class="labeltd">审核说明</td>
							   <td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveMemoChoose"/></td>			
				   			</tr>
			   			</table>
				<@CommonQueryMacro.Button id= "btSubmit"/>
				<@CommonQueryMacro.Button id= "btCancel"/>
				</@CommonQueryMacro.GroupBox>
			</div>
		 </@CommonQueryMacro.FloatWindow>
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
	var url = "/fpages/creditcard/ftl/CreditCardDtl.ftl?op=check&id="+id;
	showWin("详细",url,"window","flushPage()",window);
}

function btApprove_onClickCheck(button){
	var hasSelected = false;
	var hasAudit = false;
	var record = CreditCardExtractApproveInfo_dataset.getFirstRecord();
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
   		createTimer(2000);
   		return false;
   	}else{
   		ids = ids.substring(1);
   		CreditCardExtractApproveInfo_dataset.setParameter("ids",ids);
   		subwindow_floatWindowAudit.show();
   	}
   	return true;
}

//定位一条记录
function locate(id) {
    var record = CreditCardExtractApproveInfo_dataset.find(["id"], [id]);
    if (record) {
        CreditCardExtractApproveInfo_dataset.setRecord(record);
    }
}

function flushPage() {
    CreditCardExtractApproveInfo_dataset.flushData(CreditCardExtractApproveInfo_dataset.pageIndex);
}

function btCancel_onClick(){
   subwindow_floatWindowAudit.close();
}

function btSubmit_postSubmit() {
	easyMsg.correct("审核成功！");
	createTimer(2000);
	flushPage();
}

function btSubmit_onClickCheck() {

	var approveStatusChoose = CreditCardExtractApproveInfo_dataset.getValue("approveStatusChoose");
   	var approveMemoChoose = CreditCardExtractApproveInfo_dataset.getValue("approveMemoChoose");
   	
   	if (!approveStatusChoose.length > 0) {
   		alert("请选择审核结果！");
   		return false;
   	}
   	
   	if(approveMemoChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
	   	alert("审核说明过长，请修改！");
	   	return false;
   	}
   	
   	CreditCardExtractApproveInfo_dataset.setParameter("approveStatusChoose",approveStatusChoose);
   	CreditCardExtractApproveInfo_dataset.setParameter("approveMemoChoose",approveMemoChoose);
	subwindow_floatWindowAudit.hide();
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