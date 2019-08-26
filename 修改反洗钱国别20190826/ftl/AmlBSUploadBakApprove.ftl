<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑交易入库详情查看">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSUploadBakApprove" init="false" submitMode="current">
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
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="-,btApprove" fieldStr="select,oper,workDate,reportId,recStatus,reportType[120],brno,finm[200],firc[250],fict[200],ficd[200],stcr[200],ssdg[200],approveUpdTlr,approveUpdTm,filler2,filler3,lstUpdTlr,lstUpdTm"  width="100%"  height="480"  hasFrame="true" readonly="true" />
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
									   <td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveResultChoose"/></td>			
						   			</tr>
						   			<tr>
									   <td width="25%" id="specialTypeLable" colspan="1" align="right" nowrap class="labeltd">生成特殊报文类型</td>
									   <td width="25%" class="datatd" id="specialType"><@CommonQueryMacro.SingleField fId="specialType"/></td>			
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
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//工作日期
	function initCallGetter_post() {
		AmlBSUploadBakApprove_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBSUploadBakApprove_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		
		document.getElementById('specialType').style.display="none";
		document.getElementById('specialTypeLable').style.display="none";
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
		showWin("可疑交易入库详情查看","/fpages/hf/ftl/AmlBSUploadBakApproveInfo.ftl?op=detail&reportId="+reportId+"&id="+id+"&workDate="+workDate,"window","flushPage()",window);
	}
	
	
	function btApprove_onClickCheck(button){
			var hasSelected = false;
			var hasAudit = false;
			var record = AmlBSUploadBakApprove_dataset.getFirstRecord();
			while(record){
				var v_selected = record.getValue("select");
				var v_approveStatus = record.getValue("filler2");
				if( v_selected == true ){
					hasSelected=true;
					if (v_approveStatus != "00") {
						hasAudit = true;
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

			var approveStatusChoose = AmlBSUploadBakApprove_dataset.getValue("approveStatusChoose");
		   	var approveResultChoose = AmlBSUploadBakApprove_dataset.getValue("approveResultChoose");
		   	var specialType = AmlBSUploadBakApprove_dataset.getValue("specialType");
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
		   	/*
		   	if (approveStatusChoose == "02" && specialType.length < 1) {
		   		alert("审核结果不通过，必须选择生成特殊报文类型！");
		   		return false;
		   	}
		   	*/
		   	AmlBSUploadBakApprove_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		   	AmlBSUploadBakApprove_dataset.setParameter("approveResultChoose",approveResultChoose);
		    AmlBSUploadBakApprove_dataset.setParameter("specialType",specialType);
			subwindow_floatWindowAudit.hide();
		}
		
		
		function btSubmit_postSubmit() {
			alert("审核成功");
			flushPage();
		}
		
		function btCancel_onClick(){
	       subwindow_floatWindowAudit.close();
	    }
	    
	    /*3号令上线 2号令自查不通过不需要生成特殊报文*/
	    /*
		function approveStatusChoose_DropDown_onSelect(dropDown,record,editor){
		  if(record[0]=="02"){
		 	 document.getElementById('specialType').style.display="";
			 document.getElementById('specialTypeLable').style.display="";
		  }else{
		  	 document.getElementById('specialType').style.display="none";
			 document.getElementById('specialTypeLable').style.display="none";
		  }
		  return true;
		}
		*/
	
	//刷新数据
	function flushPage(){
		AmlBSUploadBakApprove_dataset.flushData(1);
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
	
	function guid(){
	    return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		    var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
		    return v.toString(16);
	    });
    }
</script>
</@CommonQueryMacro.page>