<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额新增报文不上报审核">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsCollApprove" init="false" submitMode="all" navigate="false" >
			<table align="left"  width="100%">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="8"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
					</td>
		    	</tr>
		    	<tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btApprove,btUNApprove" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,workDate,csnm,ctnm[200],ctnt[200],catp[200],ctac[200],citp[220],ctid[200],finc[120],cbct[220],cbcn[200],rlfc[300],tbnm,tbit[220],tbid[200],tbnt[200],cfin[250],cfct[160],cfic[200],tcnm[200],tcat[260],tcac[150],tcit[200],tcid[200],tstm[150],tstp[150],tsct[200],tsdr,crtp,crat[150],traAmountCny[150],traAmountUsd[150],crpp[300],trcd[150],trcdSuffix[150],lstUpdTlr,lstUpdTm[150]"   width="100%" height="480"  hasFrame="true" readonly="true"/>
		      		</td>
		    	</tr>
		    	<tr>
		      		<td >
		      		<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      			<div align="center">
		      				<@CommonQueryMacro.Group id="group2" label="审核信息"
		        			  fieldStr="approveResultChoose" colNm=2/>
		        			  <br />
		        			<@CommonQueryMacro.Button id= "btSubmit"/>
		        			<@CommonQueryMacro.Button id= "btCancel"/>
		      			</div>
		     		 </@CommonQueryMacro.FloatWindow>
		  			</td>
  				</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
	//工作日期
	function initCallGetter_post() {
		AmlBHdsCollApprove_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBHdsCollApprove_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		AmlBHdsCollApprove_interface_dataset.setValue("qrecStatus","00");
		AmlBHdsCollApprove_interface_dataset.setFieldReadOnly("qrecStatus",true);
	}
		
	//交易标识号链接
	function datatable1_ticd_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			var ticd = record.getValue("ticd");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + ticd + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
		
	//详细信息
	function doDetail(id){
		showWin("大额新增报文明细","/fpages/hfaml3/ftl/bh/AmlBHdsCollAdd.ftl?id=" + id + "&op=detail"+ "&opFromAmlBHdsCollApprove=flag","window","flushPage()",window);
	}
		
	//审核通过按钮
	function btApprove_onClickCheck(button){
		var hasSelected = false;
		var hasAudit = false;
		var record = AmlBHdsCollApprove_dataset.getFirstRecord();
		var recIds = "";
		while(record){
			var v_selected = record.getValue("select");
			var id = record.getValue("id");
			if( v_selected == true ){
				hasSelected=true;
				recIds+=id
	        	recIds+="|";
			}
			record=record.getNextRecord();
	   	}
	   	if (!hasSelected) {
	   		alert("请选择相应的记录！");
	   		return false;
	   	}
	   	approveUNReport(recIds,"01","");//01-审核通过
   	}
	   	
	   	
   	//审核通过或不通过后台更新状态
   	function approveUNReport(ids,approveStatusChoose,approveResultChoose){
		HfAmlDwrService.approveUNReport(ids,approveStatusChoose,approveResultChoose,function(mgs){
		alert(mgs);
		AmlBHdsCollApprove_dataset.flushData(AmlBHdsCollApprove_dataset.pageIndex);
		});
	}
		
	//审核不通过按钮
	function btUNApprove_onClick(){
	   	subwindow_floatWindowAudit.show();
   	}
   	
   	//确认审核不通过
   	function btSubmit_onClickCheck() {
   		var hasSelected = false;
		var hasAudit = false;
		var record = AmlBHdsCollApprove_dataset.getFirstRecord();
		var recIds = "";
		while(record){
			var v_selected = record.getValue("select");
			var id = record.getValue("id");
			if( v_selected == true ){
				hasSelected=true;
				recIds+=id
	        	recIds+="|";
			}
			record=record.getNextRecord();
	   	}
	   	if (!hasSelected) {
	   		alert("请选择相应的记录！");
	   		return false;
	   	}
	   	
	   	var approveResultChoose = AmlBHdsCollApprove_dataset.getValue("approveResultChoose");
	   	if (approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	    approveUNReport(recIds,"02",approveResultChoose);//02-审核不通过
		subwindow_floatWindowAudit.close();
	}
	
		
	function btCancel_onClick(){
       subwindow_floatWindowAudit.close();
    }
	    
	    
	//刷新数据
	function flushPage(){
		AmlBHdsCollApprove_dataset.flushData(AmlBHdsCollApprove_dataset.pageIndex);
	}
	</script>
</@CommonQueryMacro.page>