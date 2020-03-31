<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单上传">
	<#assign type = RequestParameters["type"]?default("")>
		<@CommonQueryMacro.CommonQuery id="CBlackListUpload" init="false" submitMode="allchange" navigate="false" >
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
		    	<tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd,-,btDel,-,importBN,-,exportBN,-,detailBN" fieldStr="select,opr[50],id[50],etlDate,serial[80],issuPboc[120],notice[150],targetName[400],dob[200],alias[400],nationality[300],others[200],worldCheck[200],remark[200]"   width="100%"  readonly="true"/>
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
	var type = "${type}";
	//工作日期
	function initCallGetter_post() {
		CBlackListUpload_interface_dataset.setValue("etlDateStart",sysTxdate);
		CBlackListUpload_interface_dataset.setValue("etlDateEnd",sysTxdate);
		//if('make'!=type){
			//document.getElementById('importBN').style.display="none";
			//document.getElementById('exportBN').style.display="none";
			//document.getElementById('detailBN').style.display="none";
			//document.getElementById('btAdd').style.display="none";
			//document.getElementById('btDel').style.display="none";
			//document.getElementById('btSave').style.display="none";
		//}
	}
	var qtableName="CBlackListUpload";
	
	//导出excel
	function exportBN_onClick(){
		var etlDateStart = CBlackListUpload_interface_dataset.getString("etlDateStart");
		var etlDateEnd = CBlackListUpload_interface_dataset.getString("etlDateEnd");
		var notice = CBlackListUpload_interface_dataset.getString("notice");
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
		if(record){
			CBlackListUpload_dataset.setRecord(record);
		}
	}
	
	//添加修改按钮
	function datatable_opr_onRefresh(cell, value, record){
		if(record){
		    //当存在记录时
			var id = record.getValue("id");
			cell.innerHTML="<center><a href=\"JavaScript:openDtl('"+id+"')\">修改</a></center>";
		}else{
		    //当不存在记录时
		 	cell.innerHTML="&nbsp;";
		}
	}
	
	//新增与修改区分刷新页面,新增不刷新页面,修改刷新页面
	var flag = false;
	function openDtl(id,type){
		locate(id);
		CBlackListUpload_dataset.setFieldReadOnly("etlDate", true);
		flag = true;
		subwindow_signWindow.show();
	}
	//新增
	function btAdd_onClick(){
		CBlackListUpload_dataset.setFieldReadOnly("etlDate", false);
		CBlackListUpload_dataset.setValue("etlDate",sysTxdate);
		flag = false;
		subwindow_signWindow.show();
	}
		
	//保存按钮
	function btSave_postSubmit(button) {
		button.url="#";
		subwindow_signWindow.close();
		alert("保存成功！");
		if(flag){
			flag = false;
			//刷新
			CBlackListUpload_dataset.flushData(CBlackListUpload_dataset.pageIndex);
		}
	}
	
	//删除
	function btDel_onClickCheck(button) {
		if(confirm("确认删除该条记录?")){
			var selected = false;
			var record = CBlackListUpload_dataset.getFirstRecord();
			while(record){
				var v_selected = record.getValue("select");
				if( v_selected == true ){
					selected = true;
				}			
				record = record.getNextRecord();
	   		}
   			if(!selected) {
	   			alert("至少选择一条信息！");
	   			return false;
	   		}
			return true;
		}else{
			return false;
		}
	}
	//删除按钮
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
  		if(confirm("确认拆分 (请确保批处理日期为当前工作日)！")){
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
		if(msg=="message1"){
	   	  	if(confirm("数据已拆分过！确认要继续拆分吗？")){
	   	  		var etlDateStart = CBlackListUpload_interface_dataset.getString("etlDateStart");
				var etlDateEnd = CBlackListUpload_interface_dataset.getString("etlDateEnd");
				var notice= CBlackListUpload_interface_dataset.getString("notice");
	   	   		PrivAction.addAndDelSplistHis("CBlackListSplitConfirm",etlDateStart,etlDateEnd,notice,selectFunction2);	
		   		return true;
			}else{
				return false;
			}	
	   	}else if(msg=="message2"){
	   	  	alert("拆分失败，请确认批处理日期为同一批次！");
	   	}else if(msg=="message3"){
	   		alert("拆分完毕，请在黑名单拆分确认页面确认！");
	   	}else if(msg=="message4"){
	   		alert("无相关数据，请选择需要拆分的黑名单信息！");
	   	}		
	}	
	
	function selectFunction2(msg){
		if(msg=="message5"){
			alert("重新拆分完毕，请在黑名单拆分确认页面确认！");
		}else if(msg=="message4"){
	   		alert("无相关数据，请选择拆分信息！");
	   	}
	}
	
	//导入数据
    var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	function importBN_onClick(){
		//DWREngine.setAsync(false);
		currentSubWin = openSubWin("pageWinId", "批量导入黑名单源信息", "/fpages/hf/jsp/uploadBN.jsp?fileflag=CBlackListUpload&workDate="+sysTxdate,"600","200");
		//DWREngine.setAsync(true);
		//var node = document.getElementById("CBlackListUpload_interface_dataset_btnSubmit");
		//node.click();
	    //CBlackListUpload_dataset.flushData(CBlackListUpload_dataset.pageIndex);
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
	
	//保存按钮，数据校验
	function btSave_onClickCheck(button) {
   	   return saveChecke();
    }
    
    function saveChecke(){
	   //批处理日期
	   var etlDate = CBlackListUpload_dataset.getValue("etlDate"); 
	   //targetName
   	   var targetName = CBlackListUpload_dataset.getValue("targetName"); 
       if(etlDate==''){
       		alert("请填写批处理日期！");
            return false;
       }
       if(targetName==''){
       		alert("请填写Sanctions Targets Name！");
            return false;
       }
       return true;
	}
	
</script>
</@CommonQueryMacro.page>