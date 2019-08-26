<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="可疑普通报文审核">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSDsCollApprove2" init="false" submitMode="current">
            <table width="100%">
                <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="false"/>
                    </td>
                </tr> 
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btApprove" fieldStr="select,oper,workDate,lstUpdTlr,lstUpdTm[120],approveStatus,approveResult[220],reportId,bsid[100],recStatus,reportType[120],brno,finm[200],firc[250],fict[200],ficd[200],stcr[200],ssdg[200]"  width="100%"  height="480"  hasFrame="true" readonly="true" />
                    </td>
                </tr>
                
                <tr>
		      		<td >
		      		<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="700" height="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      			<div align="center">
		        			<@CommonQueryMacro.Group id="group1" label="可疑报文审核"  fieldStr="approveStatusChoose,approveResultChoose" colNm=2/>
	        			 	<br />
				    		<@CommonQueryMacro.Button id= "btSubmit"/>
				    		<@CommonQueryMacro.Button id= "btCancel"/>
		      			</div>
		     		 </@CommonQueryMacro.FloatWindow>
		  			</td>
  				</tr>
  				
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//工作日期
	function initCallGetter_post() {
		AmlBSDsCollApprove2_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBSDsCollApprove2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
	}
	//初始化详细链接
	function datatable_oper_onRefresh(cell,value,record) {
		var id = record.getValue("id");
		var reportId = record.getValue("reportId");
		var workDate = formatDate(record.getValue("workDate"));
		var doDetail = " <a href=\"JavaScript:doDetail('"+id+"','"+reportId+"','"+workDate+"')\">详细</a> ";
        cell.innerHTML= "<center>"+doDetail+"</center>";
	}
	//详细
	function doDetail(id,reportId,workDate) {
		showWin("可疑普通报文详细","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=detail&reportId="+reportId+"&id="+id+"&workDate="+workDate,"window","flushPage()",window);
	}
	
  function btApprove_onClickCheck(button){
 		var tlrno = "${v_tlrno}";
		var hasSelected = false;
		var isOnePerson = false;
		var record = AmlBSDsCollApprove2_dataset.getFirstRecord();
		while(record){
			var v_selected = record.getValue("select");
			var lstUpdTlr = record.getValue("lstUpdTlr");
			if( v_selected == true ){
				hasSelected=true;
				if (lstUpdTlr == tlrno) {
					isOnePerson = true;
				}
			}
			record=record.getNextRecord();
	   	}
	   	if (!hasSelected) {
	   		alert("请选择相应的记录！");
	   		return false;
	   	}
	   	if (isOnePerson) {
	   		alert("记录存在由您修改的记录,审核和修改不能同一人！");
	   		return false;
	   	}
	   	subwindow_floatWindowAudit.show();
   	}
   	
   	function btSubmit_onClickCheck() {
		var approveStatusChoose = AmlBSDsCollApprove2_dataset.getValue("approveStatusChoose");
	   	var approveResultChoose = AmlBSDsCollApprove2_dataset.getValue("approveResultChoose");
	   	if (!approveStatusChoose.length > 0) {
	   		alert("请选择审核结果！");
	   		return false;
	   	}
	   	if (approveStatusChoose == "02" && approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>1000){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	AmlBSDsCollApprove2_dataset.setParameter("approveStatusChoose",approveStatusChoose);
	   	AmlBSDsCollApprove2_dataset.setParameter("approveResultChoose",approveResultChoose);
		subwindow_floatWindowAudit.hide();
	}
	
	
	function btSubmit_postSubmit() {
		alert("审核成功");
		flushPage();
	}
	
	function btCancel_onClick(){
       subwindow_floatWindowAudit.close();
    }
	    
	    
	//刷新数据
	function flushPage(){
		AmlBSDsCollApprove2_dataset.flushData(1);
	}
	
	function formatDate(date){
		 if(date!=""){
		 	var y = date.getFullYear();
		    var m = date.getMonth() + 1;
		    m = m < 10 ? '0' + m : m;
		    var d = date.getDate();
		    d = d < 10 ? ('0' + d) : d;
		    return y+''+m+''+d;
		 }
		 else{
		    return "";
	    }
	}
	
</script>
</@CommonQueryMacro.page>