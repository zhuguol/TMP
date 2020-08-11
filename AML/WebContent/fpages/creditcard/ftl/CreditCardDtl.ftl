<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_op = RequestParameters["op"]?default("")>
<#assign v_id = RequestParameters["id"]?default("")>
<#assign v_ids = RequestParameters["ids"]?default("")>
<#assign v_level = RequestParameters["level"]?default("")>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTlrno()>
<@CommonQueryMacro.page title="申领">
<link rel="stylesheet" type="text/css" href="${contextPath}/fpages/creditcard/css/proof.css">
<@CommonQueryMacro.CommonQuery id="CreditCardDtl" init="true" submitMode="current" navigate="false" >
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top" >
			<table width="100%" cellpadding="0" cellspacing="0" id="">
				<tr>
					<td width="100%">
					<@CommonQueryMacro.GroupBox id="groupbox1" label="报警信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">告警号</td>
							   <td width="30%" class="datatd" >
							   	<@CommonQueryMacro.SingleField fId="alarmNo"/> 
							   </td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">规则名称</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="ruleName"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">风险层级</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="riskLevel"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">是否当月产生过告警</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="isAlertm"/></td>	
						   </tr>
						</table>
					</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%">
				   <@CommonQueryMacro.GroupBox id="groupbox2" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custNo"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">持卡人名称</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custName"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">持卡人性別</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custGender"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd"></td>
							   <td width="30%" class="datatd" ></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户证件类型</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custCerttype"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custCertno"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户层级</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custCategory"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户手机号</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custPhoneno"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户的工作单位信息</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custWorkunit"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">收入</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="custIncome"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">信用卡卡号（人民币）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="creditCardcny"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">卡片激活时间（人民币）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="activeTimecny"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">信用卡卡号（美元）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="creditCardusd"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">卡片激活时间（美元）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="activeTimeusd"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">信用额度（人民币）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="limitCny"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">可用额度（人民币）</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="limitAvailablecny"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">账单日</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="billingDate"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">账单地址</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="billingAddress"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">还款日</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="repayDate"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd"></td>
							   <td width="30%" class="datatd" ></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">最近一次降额时间</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="firstReducetime"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">客户开卡经办销售工号</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="transactorNo"/></td>	
						   </tr>
						</table>
				   </@CommonQueryMacro.GroupBox>
				   </td>
				</tr>
				<tr>
					<td width="100%">
					<@CommonQueryMacro.GroupBox id="groupbox3" label="Result" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">凭证验证结果</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="proofResult"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">商户验证结果</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="merchantResult"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">外呼结果</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="outboundResult"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">调查结果</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="investigateResult"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">调查报告</td>
							   <td width="80%" colspan="3" class="datatd" ><@CommonQueryMacro.SingleField fId="investigateReport"/></td>
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">FC-UAR</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="fcUar"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd"></td>
							   <td width="30%" class="datatd" ></td>	
						   </tr>
						</table>
					</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
					<td width="100%">
					<@CommonQueryMacro.GroupBox id="groupbox4" label="Mitigation Result" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">短信结果</td>
							   <td width="30%" class="datatd"><@CommonQueryMacro.SingleField fId="messageResult"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">账户禁止措施</td>
							   <td width="30%" class="datatd"><@CommonQueryMacro.SingleField fId="billStage"/></td>	
						   </tr>
						   <tr>
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">降额</td>
							   <td width="30%" class="datatd"><@CommonQueryMacro.SingleField fId="reduce"/></td>			
							   <td width="20%" colspan="1" align="right" nowrap class="labeltd">卡片冻结</td>
							   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="cardFreeze"/></td>	
						   </tr>
						</table>
					</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
			</table>
		</td>
		<td width="25%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="25%" id="">
						<@CommonQueryMacro.GroupBox id="guoup3" label="系统信息" expand="true">
							<table frame=void class="grouptable" width="100%">
								<tr>
									<td width="20%" align="right" nowrap class="labeltd" width="25%">Open alert time</td>
									<td width="30%" class="datatd" width="25%">
										<@CommonQueryMacro.SingleField fId="openAlerttime" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd" width="25%">Close alert time</td>
									<td width="30%" class="datatd" width="25%">
										<@CommonQueryMacro.SingleField fId="closeAlerttime" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">Re-open alert time</td>
									<td width="30%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="reOpenalertTime" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">Re-close alert time</td>
									<td width="30%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="reClosealertTime" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">操作员ID</td>
									<td width="30%" class="datatd">
										<@CommonQueryMacro.SingleField fId="operatorTlr" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">审核员ID</td>
									<td width="30%" class="datatd">
										<@CommonQueryMacro.SingleField fId="approveTlr" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">审核结果</td>
									<td width="30%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="approveStatus" />
									</td>
								</tr>
								<tr>
									<td width="20%" align="right" nowrap class="labeltd">审核说明</td>
									<td width="30%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="approveMemo" />
									</td>
								</tr>
							</table>
						</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="3">
			<center>
				<@CommonQueryMacro.Button id="btTrade"/>&nbsp; &nbsp;
				<@CommonQueryMacro.Button id="btMsg"/>&nbsp; &nbsp;
				<@CommonQueryMacro.Button id="btCancel"/>&nbsp; &nbsp;
				<#if v_op =="check">
					<@CommonQueryMacro.Button id="btApprove"/>&nbsp; &nbsp;
				</#if>
				<#if v_op =="update">
					<@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
					<@CommonQueryMacro.Button id="btNext"/>&nbsp; &nbsp;
					<@CommonQueryMacro.Button id="btGetProof"/>&nbsp; &nbsp;
				</#if>
				<@CommonQueryMacro.Button id="btProof"/>&nbsp; &nbsp;
			</center>
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
				<@CommonQueryMacro.Button id= "btBack"/>
				</@CommonQueryMacro.GroupBox>
			</div>
		 </@CommonQueryMacro.FloatWindow>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<@CommonQueryMacro.CommonQuery id="CreditCardTradeInfo" init="true" submitMode="current">
	<@CommonQueryMacro.FloatWindow id="floatWindowTrade" label="" width="1420" height="710" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		<fieldset name='guoupTrade' style="padding: 6px;">
		<legend align="center">交易信息</legend>
		    <table width="100%">
		        <tr>
		            <td colspan="2">
		 	         <@CommonQueryMacro.DataTable id="datatable2"  paginationbar="-,btSendMsg,-,btTradeBack" fieldStr="select,custNo,alarmNo,tradeDate,tradeTime,tradeCur,tradeAmt,tradeCity,mccCode,merchantName,merchantId,terminalId,posEntrymode,applePay"  width="100%" hasFrame="true" readonly="false" height="605" pagination="true"/>
		            </td>
		        </tr> 
		    </table>
		</fieldset>
	</@CommonQueryMacro.FloatWindow>
</@CommonQueryMacro.CommonQuery>
<@CommonQueryMacro.CommonQuery id="CreditCardMsgDtl" init="false" submitMode="current">
	<@CommonQueryMacro.FloatWindow id="floatWindowMsg" label="" width="720" height="360" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		<fieldset name='guoupTrade' style="padding: 6px;">
		<legend align="center">短信信息</legend>
		    <table width="100%">
		        <tr>
		           <td width="20%" colspan="1" align="right" nowrap class="labeltd">短信模板</td>
				   <td width="30%" class="datatd" ><@CommonQueryMacro.SingleField fId="msgType"/></td>			
				   <td width="50%" colspan="2" class="datatd">
				   		
				   </td>
		        </tr>
		        <tr>
		        	<td width="20%" colspan="1" align="right" nowrap class="labeltd">短信内容</td>
		            <td width="80%" colspan="3" class="datatd">
				   		<@CommonQueryMacro.SingleField fId="msgInfo"/>
				   </td>
		        </tr>
		        <tr>
		        	<td width="20%" colspan="1" align="right" nowrap class="labeltd">服务内容</td>
		            <td width="80%" colspan="3" class="datatd">
				   		<@CommonQueryMacro.SingleField fId="serverInfo"/>
				   </td>
		        </tr>
		        <tr>
					<td align="left" colspan="4">
						<center>
							<@CommonQueryMacro.Button id="btSubmitMsg"/>&nbsp; &nbsp;
							<@CommonQueryMacro.Button id="btCancelMsg"/>&nbsp; &nbsp;
						</center>
					</td>
				</tr>
		    </table>
		</fieldset>
	</@CommonQueryMacro.FloatWindow>
</@CommonQueryMacro.CommonQuery>
<@CommonQueryMacro.CommonQuery id="CreditCardMsgInfo" init="true" submitMode="current">
	<@CommonQueryMacro.FloatWindow id="floatWindowMsgList" label="" width="1530" height="710" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		<fieldset name='guoupTrade' style="padding: 6px;">
		<legend align="center">短信信息</legend>
		    <table width="100%">
		        <tr>
		            <td colspan="2">
		 	         <@CommonQueryMacro.DataTable id="datatable3"  paginationbar="-,btDelete" fieldStr="select,msgType,msgInfo,serverInfo,status,saveTime[120],sendTime[120]"  width="100%" hasFrame="true" readonly="false" height="605" pagination="true"/>
		            </td>
		        </tr> 
		    </table>
		</fieldset>
	</@CommonQueryMacro.FloatWindow>
</@CommonQueryMacro.CommonQuery>

<@CommonQueryMacro.CommonQuery id="CreditCardProof" init="true" submitMode="current">
<@CommonQueryMacro.FloatWindow id="floatWindowProof" label="" width="800" height="720" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
	<div class="proof">
		<ul id="proof-ul">	    
		</ul>
	</div>
	<div style="width:100px;margin:10px auto;vertical-align: middle;clear:both;"><@CommonQueryMacro.Button id="btCancelProof"/></div>
</@CommonQueryMacro.FloatWindow>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var op = "${v_op}";
var tlrno = "${v_tlrno}";
var level = "${v_level}";
var qs = "${RequestParameters["qs"]?default('')}";
var qe = "${RequestParameters["qe"]?default('')}";
var msgid = "${v_id}";

function initCallGetter_post(){
	if(op=="detail"||op=="check"){
		CreditCardDtl_dataset.setAllFieldsReadOnly(true);
		window.document.getElementById("btSendMsg").disabled = true;
	}
	if(op=="check"){
		CreditCardDtl_dataset.setFieldReadOnly("approveStatusChoose",false);
		CreditCardDtl_dataset.setFieldReadOnly("approveMemoChoose",false);
	}
	CreditCardDtl_dataset.setFieldRequired("investigateResult",true);
	
	//交易高亮
	var indexBackGround = 0;
	var record = CreditCardTradeInfo_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("selectBackGround");
		if( v_selected == true ){
//			document.getElementById("datagrid-row-r1-2-"+indexBackGround).style.background="yellow";
			var nodes = document.getElementById("datagrid-row-r1-2-"+indexBackGround).children;
			for(var i=0;i<nodes.length;i++){
				nodes[i].style.background="#FFFF80";
			}
		}
		record=record.getNextRecord();
		indexBackGround++;
	}
}

/*
function datatable2_tradeamt_onHeaderClick(table,cell){
	
}

function datatable2_onDbClick(table,record,index){
	var v_selected = CreditCardTradeInfo_dataset.getValue("selectBackGround");
	var nodes = document.getElementById("datagrid-row-r1-2-"+index).children;
	if(v_selected){
		CreditCardTradeInfo_dataset.setValue("selectBackGround",false);
		for(var i=0;i<nodes.length;i++){
			nodes[i].style.background="#fafafa";
		}
	}else{
		CreditCardTradeInfo_dataset.setValue("selectBackGround",true);
		for(var i=0;i<nodes.length;i++){
			nodes[i].style.background="#FFFF80";
		}
	}
}


function datatable3_ftloperation_onRefresh(cell, value, record){
	if(record!=null){
		var id = record.getValue("id");
		cell.innerHTML = getButtonHtml(id,"editCreditCard","删除","icon-delete");
	}
}
*/
function btTrade_onClick(button) {
    subwindow_floatWindowTrade.show();
//    CreditCardTradeInfo_dataset.flushData();
}
function btTradeBack_onClick(button) {
	subwindow_floatWindowTrade.close();
}
function btSendMsg_onClick(button) {
    subwindow_floatWindowMsg.show();
    CreditCardMsgDtl_dataset.flushData();
}

function btCancelMsg_onClick(button) {
	subwindow_floatWindowMsg.close();
}
function btMsg_onClick(button) {
	subwindow_floatWindowMsgList.show();
}

function btProof_onClick(button) {
	subwindow_floatWindowProof.show();
}

function btCancelProof_onClick(button) {
	subwindow_floatWindowProof.close();
}

function btProof_onClickCheck(button){
	if(CreditCardProof_dataset.length==0){
		easyMsg.warn("还未上传凭证！");
   		createTimer(2000);
		return false;
	}
	return true;
}

function btSendMsg_onClickCheck(button){
	var flag = true;
	var record = CreditCardTradeInfo_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("select");
		if( v_selected == true ){
			flag = false;
		}
		record=record.getNextRecord();
	}
	
	if(flag){
		easyMsg.warn("请选择相应的记录！");
   		createTimer(2000);
		return false;
	}
	return true;
}

function btCancel_onClick(button) {
    closeWin(true);
}

function btNext_onClick(button) {
	var id = CreditCardDtl_dataset.getValue("id");
	CreditCardDwrFunction.getNextCase(id,level,qs,qe,function(next_id){
		if(next_id!=null){
			flushAllDataset(next_id);
			easyMsg.correct("下一笔");
			createTimer(1000);
	 	}else{
	 		easyMsg.info("已经是最后一条！");
			createTimer(2000);
	 		window.document.getElementById("btNext").disabled = true;
	 	}
	});
}

function btApprove_onClickCheck(button){
	subwindow_floatWindowAudit.show();
}

function btBack_onClick(){
   subwindow_floatWindowAudit.close();
}

function btSave_needCheck(){
	return false;
}

function btSave_onClickCheck(button){
	var investigateResult = CreditCardDtl_dataset.getValue("investigateResult");
	if(investigateResult==null||investigateResult==undefined||investigateResult.trim()==""){
		easyMsg.warn("调查结果不能为空！");
		createTimer(2000);
   		return false;
	}
	return true;
}

function btSave_postSubmit(button) {
	var next_id = "";
	DWREngine.setAsync(false);
	var id = CreditCardDtl_dataset.getValue("id");
	CreditCardDwrFunction.getNextCase(id,level,qs,qe,function(next){
		if(next!=null){
			next_id = next;
			
	 	}
	});
	DWREngine.setAsync(true);
	
	if(next_id != ""){
		easyMsg.confirm("保存成功！是否下一笔?",function(){
			flushAllDataset(next_id);
		},function(){
			closeWin(true);
		},{okName:'确定',cancelName:'返回'});
	}else{
		easyMsg.correct("保存成功！");
		createTimer(2000);
 		window.document.getElementById("btNext").disabled = true;
 		CreditCardDtl_dataset.flushData();
	}
}

function btSubmitMsg_needCheck(){
	return false;
}

function btSubmitMsg_onClickCheck(button){
	var msgType = CreditCardMsgDtl_dataset.getValue("msgType");
	if(msgType==null||msgType==undefined||msgType.trim()==""){
		easyMsg.warn("短信模板不能为空！");
		createTimer(2000);
   		return false;
	}
	var serverInfo = CreditCardMsgDtl_dataset.getValue("serverInfo");
	if(serverInfo==null||serverInfo==undefined||serverInfo.trim()==""){
		easyMsg.warn("服务内容不能为空！");
		createTimer(2000);
   		return false;
	}
	return true;
}

function btSubmitMsg_postSubmit(button) {
	easyMsg.correct("保存成功！");
	createTimer(2000);
	subwindow_floatWindowMsg.close();
	subwindow_floatWindowTrade.close();
	CreditCardMsgInfo_dataset.flushData();
}

function CreditCardTradeInfo_dataset_afterScroll(dataset) {
	var id = dataset.getValue("id");
	
	var record = CreditCardTradeInfo_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("select");
		var v_id = record.getValue("id");
		if(id != v_id){
			if( v_selected == true ){
				record.setValue("select",false);
			}
		}
		record=record.getNextRecord();
	}	
}

function CreditCardMsgDtl_dataset_afterChange(dataset,field){
	if(field.fieldName == "msgType"){
		var msgType = dataset.getValue(field.fieldName);
		if(msgType=="NA"){
			subwindow_floatWindowMsg.close();
			return;
		}
		var obj = {
			"tradeAmt":CreditCardTradeInfo_dataset.getValue("tradeAmt"),
			"merchantName":CreditCardTradeInfo_dataset.getValue("merchantName"),
			"tradeDate":formatDate(CreditCardTradeInfo_dataset.getValue("tradeDate"))
		};
		CreditCardDwrFunction.getMsgInfoByType(msgType,obj,function(data){
			if(data!=null){
				CreditCardMsgDtl_dataset.setValue("msgInfo",data.msgInfo);
				CreditCardMsgDtl_dataset.setValue("serverInfo",data.serverInfo);
				CreditCardMsgDtl_dataset.setValue("phoneNo",CreditCardDtl_dataset.getValue("custPhoneno"));
		 	}
		});
	}
}

function btGetProof_onClick(){
	currentSubWin = openSubWin("pageWinId", "导入凭证信息", "/fpages/creditcard/jsp/importProof.jsp?msgid="+msgid,"600","200");
}

function flushPage() {
    CreditCardProof_dataset.flushData();
}

function CreditCardProof_dataset_flushDataPost(dataset){
	proof(dataset);
}

function proof(dataset){
	$("#proof-ul").children().remove();
	var record = CreditCardProof_dataset.getFirstRecord();
	while(record){
		var proofId = record.getValue("id");
		var proofName = record.getValue("proofName");
		var getTime = record.getValue("getTime");
		var html = "<li><div class='deatil'><h2>"+proofName+"</h2><p>上传时间：<br/>"+formatTime(getTime)+
			"</p><a href='Javascript:void(0);' onClick=\"Javascript:downloadfile('"+proofId+"')\">下载凭证</a>";
			if(op=="update"){
				html = html + "<br/><a href='Javascript:void(0);' onClick=\"Javascript:deletefile('"+proofId+"')\">删除凭证</a>";
			}
		html = html + "</div><img src='${contextPath}/proofImport/downloadproof.spring?downloadinfo=proof&proofId="+proofId+"' alt='图片展示失败'/></li>";
		$("#proof-ul").append(html);
		record=record.getNextRecord();
	}
}

function deletefile(proofId){
	easyMsg.confirm("是否确认删除?",function(){
		deleteProof(proofId);
	},function(){
		
	},{okName:'确定',cancelName:'返回'});
}

function deleteProof(proofId){
	DWREngine.setAsync(false);
	CreditCardDwrFunction.deleteProof(proofId,function(next){
		easyMsg.correct("删除成功！");
		createTimer(2000);
		CreditCardProof_dataset.flushData();
	});
	DWREngine.setAsync(true);
}

function downloadfile(proofId){
	window.location.href = "${contextPath}/proofImport/downloadproof.spring?downloadinfo=proof&proofId="+proofId;
}

function btSubmit_onClickCheck() {

	var approveStatusChoose = CreditCardDtl_dataset.getValue("approveStatusChoose");
   	var approveMemoChoose = CreditCardDtl_dataset.getValue("approveMemoChoose");
   	
   	if (!approveStatusChoose.length > 0) {
   		easyMsg.warn("请选择审核结果！");
   		createTimer(2000);
   		return false;
   	}
   	
   	if(approveMemoChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
	   	easyMsg.warn("审核说明过长，请修改！");
   		createTimer(2000);
	   	return false;
   	}
   	
   	CreditCardDtl_dataset.setParameter("approveStatusChoose",approveStatusChoose);
   	CreditCardDtl_dataset.setParameter("approveMemoChoose",approveMemoChoose);
	subwindow_floatWindowAudit.hide();
}

function btSubmit_postSubmit() {
	top.easyMsg.correct("审核成功！");
	closeWin(true);
}

function btDelete_onClick(button){
	var hasSelected = false;
	var hasAudit = false;
	var record = CreditCardMsgInfo_dataset.getFirstRecord();
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
   		easyMsg.warn("请选择需要删除的记录！");
   		createTimer(3000);
   		return false;
   	}else{
   		easyMsg.confirm("是否确认删除?",function(){
			ids = ids.substring(1);
   			deleteMessage(ids);
		},function(){
			
		},{okName:'确定',cancelName:'返回'});
   	}
}

function deleteMessage(ids){
	DWREngine.setAsync(false);
	CreditCardDwrFunction.deleteMsg(ids,function(next){
		easyMsg.correct("删除成功！");
		createTimer(2000);
		CreditCardMsgInfo_dataset.flushData();
	});
	DWREngine.setAsync(true);
}

function flushAllDataset(next_id){
	CreditCardDtl_dataset.setParameter("id",next_id);
	CreditCardDtl_dataset.flushData();
	CreditCardTradeInfo_dataset.setParameter("id",next_id);
	CreditCardTradeInfo_dataset.flushData();
	CreditCardMsgInfo_dataset.setParameter("id",next_id);
	CreditCardMsgInfo_dataset.flushData();
//	CreditCardMsgDtl_dataset.setParameter("id",next_id);
	CreditCardMsgDtl_dataset.flushData();
	CreditCardProof_dataset.setParameter("id",next_id);
	CreditCardProof_dataset.flushData();
}

function formatDate(date){
	 if(date!=""){
	 	var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y+'/'+m+'/'+d;
	 }
	 else{
	    return "";
    }
}

var timer = null;
function createTimer(time){
	window.clearTimeout(timer);
	timer = window.setTimeout(function(){
	try{
		easyMsg.close();
	}catch(e){}},time);//刷新时间 
}

function formatTime(date){
	 if(date!=""){
	 	var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    var h = date.getHours();
	    h = h < 10 ? ('0' + h) : h;
	    var mi = date.getMinutes();
	    mi = mi < 10 ? ('0' + mi) : mi;
	    var s = date.getSeconds();
	    s = s < 10 ? ('0' + s) : s;
	    return y+'/'+m+'/'+d+' '+h+':'+mi+':'+s;
	 }
	 else{
	    return "";
    }
}
</script>
</@CommonQueryMacro.page>