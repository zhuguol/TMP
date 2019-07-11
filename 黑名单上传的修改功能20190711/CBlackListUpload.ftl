<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单上传">
		<@CommonQueryMacro.CommonQuery id="CBlackListUpload" init="false" submitMode="current" navigate="false" >
			<table align="left"  width="100%">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="4"/>
					</td>
				</tr>

				<tr>
					<td valign="top">
						<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
					</td>
		    	</tr>

		    	<tr >
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd,-,btDel,-,importBN,-,exportBN,-,detailBN" fieldStr="opr,id[50],etlDate,serial[80],issuPboc[120],notice[150],targetName[400],dob[200],alias[400],nationality[300],others[200],worldCheck[200],remark[200]"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
		     <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="操作信息"
        			  fieldStr="etlDate,serial[100],issuPboc[120],notice[100],targetName[200],dob[100],alias[100],nationality[100],others[100],worldCheck[100],remark[100]" colNm=4/>
        			 <br/>
      				<@CommonQueryMacro.Button id= "btSave"/>
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
			CBlackListUpload_interface_dataset.setValue("etlDateStart",sysTxdate);
			CBlackListUpload_interface_dataset.setValue("etlDateEnd",sysTxdate);
		}
	
	
	
	var qtableName="CBlackListUpload";
	
	//导出excel
	function exportBN_onClick(){
		var etlDateStart = CBlackListUpload_interface_dataset.getString("etlDateStart");
		var etlDateEnd = CBlackListUpload_interface_dataset.getString("etlDateEnd");
		var notice= CBlackListUpload_interface_dataset.getString("notice");
		if(etlDateStart==''){
		alert("请选择批处理起始日期");
		return false;
		}
	    if(etlDateEnd==''){
		alert("请选择批处理终止日期");
		return false;
		}
		document.getElementById("exportBN").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/CBlackListUploadDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd+"&notice="+notice+"&qtableName="+qtableName;
	}
	
	
	

	//定位一条记录
	function locate(id,etlDate) {
		var record =CBlackListUpload_dataset.find(["id","etlDate"],[id,etlDate]);
		if(record) {
			CBlackListUpload_dataset.setRecord(record);
		}
	}
	

		//添加修改按钮
	function datatable_opr_onRefresh(cell, value, record){
		if (record) {
		     //当存在记录时
			var id = record.getValue("id");
			cell.innerHTML="<center><a href=\"JavaScript:openDtl('"+id+"')\">修改</a></center>";
		} else {
		     //当不存在记录时
		 cell.innerHTML="&nbsp;";
		}
	}
	
	function openDtl(id,type){
		locate(id);
		CBlackListUpload_dataset.setFieldReadOnly("etlDate", true);
		subwindow_signWindow.show();
	}
	
			//新增
	function btAdd_onClick(){
		CBlackListUpload_dataset.setFieldReadOnly("etlDate", false);
		subwindow_signWindow.show();
	}
	//保存按钮
	function btSave_postSubmit(button) {
		button.url="#";
		alert("保存成功！");
		subwindow_signWindow.close();
		//刷新
		CBlackListUpload_dataset.flushData(CBlackListUpload_dataset.pageIndex);
	}
	
		//删除
	function btDel_onClickCheck(button) {
		if(confirm("确认删除该条记录?")){
			return true;
		}else{
			return false;
		}
	}
	
	function btDel_postSubmit(button) {
		alert("删除成功！");
		CBlackListUpload_dataset.flushData(CBlackListUpload_dataset.pageIndex);
	}
	

//清空窗口内容。	
   function signWindow_floatWindow_beforeClose(subwindow){
		CBlackListUpload_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow){
		return false;
	}

	//黑名单拆分详细

   	function detailBN_onClick(){
  		if(confirm("确认对查询信息进行拆分吗，请确认拆分日期为同一天")){
  		var etlDateStart = CBlackListUpload_interface_dataset.getString("etlDateStart");
		var etlDateEnd = CBlackListUpload_interface_dataset.getString("etlDateEnd");
		var notice= CBlackListUpload_interface_dataset.getString("notice");
		PrivAction.getBNdetail("CBlackListUpload",etlDateStart,etlDateEnd,notice,selectFunction);	
		return true;
		}else{
			return false;
		}			
   	}
   	
   	function selectFunction(msg){
	   	if(msg=="数据已拆分过,确认要继续拆分吗？"){
	   	  if(confirm(msg)){
	   	  	var etlDateStart = CBlackListUpload_interface_dataset.getString("etlDateStart");
			var etlDateEnd = CBlackListUpload_interface_dataset.getString("etlDateEnd");
			var notice= CBlackListUpload_interface_dataset.getString("notice");
	   	   PrivAction.addAndDelSplistHis("CBlackListSplitConfirm",etlDateStart,etlDateEnd,notice,selectFunction2);	
		   return true;
			}else{
			return false;
			}	
	   	}else{
	   	  alert(msg);
	   	}		
	}	
	
	   function selectFunction2(msg){
	    	alert(msg);
	   }
	
//导入数据

    var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	function importBN_onClick(){
		currentSubWin = openSubWin("pageWinId", "批量导入黑名单源信息", "/fpages/hf/jsp/uploadBN.jsp?fileflag=CBlackListUpload&workDate="+sysTxdate,"600","200");
		
	    CBlackListUpload_dataset.flushData(CBlackListUpload_dataset.pageIndex);
	}
	
    //旋转
    var timer = null;
	function createTimerIfNull(){
		if(timer==null){
			timer = window.setInterval(function(){
			try{
				getExportStatus();
			}catch(e){}},500);//刷新时间 
		}
	}
	
	function getExportStatus(){
		PrivAction.getExportFlag(qtableName,function(data){
				exportCallBack(data);
			});
	}
		
	function exportCallBack(data){
		if(data!=null){
			document.getElementById("exportBN").style.display = "";
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}

	</script>
</@CommonQueryMacro.page>