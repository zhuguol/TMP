<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="300号文上传审核">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="CheckfilesFor300" init="false" submitMode="all">
	<table align="left"  width="100%">
		<tr>
   			<td align="center"  colspan="2">
   				<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" colNm=4 showButton="true" />
        	</td>
        </tr>
		<tr>
			<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
  		<tr>
      		<td colspan="2">
          		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove" fieldStr="select,oper[80],department[80],fileName[260],dataNum[80],fileTime,uploadPerson,uploadTime[145],updatePerson[80],updateTime[145],checkPerson[80],checkTime[145],checkStatus,checkMessage[300]" width="100%"  readonly="true"/><br />
        	</td>
        </tr>
        <tr>
		   <td >
		   <@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="200" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      <div align="center">
		      <@CommonQueryMacro.GroupBox id="group2" label="审核信息" expand="true">
				<table frame="void" class="grouptable" width="100%">
					<tr>
						<td width="20%" colspan="1" align="right" nowrap class="labeltd">审核状态</td>
						<td width="30%" class="datatd"><@CommonQueryMacro.SingleField fId="approveStatusChoose"/></td>			
					</tr>
					<tr>
						<td width="20%" colspan="1" align="right" nowrap class="labeltd">审核说明</td>
						 <td width="30%" class="datatd"><@CommonQueryMacro.SingleField fId="approveResultChoose"/></td>			
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
</td>
</tr>
</table>
<script language="javascript">
	//下载定位一条记录
    function datatable_oper_onRefresh(cell,value,record) {
        if(record){
	   		var fileName = record.getValue("fileName");
	   		if(fileName!=""){
	   			cell.innerHTML= "<center><a href=\"JavaScript:downloads('"+fileName+"')\">下载</a></center>";
	  	  }
	    }
    }
	
	 function btApprove_onClickCheck(button){
		var hasSelected = false;
		var hasAudit = false;
		var record = CheckfilesFor300_dataset.getFirstRecord();
		
		while(record){
			var v_selected = record.getValue("select");
			var v_approveStatus = record.getValue("checkStatus");
			if( v_selected == true ){
				hasSelected=true;
				if (v_approveStatus == "01") {
					//hasAudit = true;
					alert("请不要重复审核已审核通过数据！");
	   				return false;
				}
			}
			record=record.getNextRecord();
	   	}
		
	   	if (!hasSelected) {
	   		alert("请选择相应的记录！");
	   		return false;
	   	}
	   	subwindow_floatWindowAudit.show();
   	}
	   	
   	function btSubmit_onClickCheck() {
		var approveStatusChoose = CheckfilesFor300_dataset.getValue("approveStatusChoose");
	   	var approveResultChoose = CheckfilesFor300_dataset.getValue("approveResultChoose");
	   	if (!approveStatusChoose.length > 0) {
	   		alert("请选择审核结果！");
	   		return false;
	   	}
	   	if (approveStatusChoose == "02" && approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	CheckfilesFor300_dataset.setParameter("approveStatusChoose",approveStatusChoose);
	   	CheckfilesFor300_dataset.setParameter("approveResultChoose",approveResultChoose);
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
		CheckfilesFor300_dataset.flushData(CheckfilesFor300_dataset.pageIndex);
	}
	
	function downloads(fileName){
        window.location.href = encodeURI("${contextPath}/file300download/CheckFile300DownoLoadAction.do?fileName="+fileName);
    }

</script>
</@CommonQueryMacro.page>