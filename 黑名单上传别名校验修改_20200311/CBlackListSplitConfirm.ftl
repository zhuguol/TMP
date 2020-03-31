<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单拆分确认表">
	<@CommonQueryMacro.CommonQuery id="CBlackListSplitConfirm" init="false" submitMode="allchange" navigate="false" >
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
		    	<td colspan="2" >
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd,-,btDel,-,importBN,-,exportBN,-,confirmSplitYes,-,selectYes" fieldStr="select,opr[50],uid[150],etlDate,serial[50],issuPboc,notice[200],targetName[400],dob[120],alias[400],nationality[200],others[100],worldCheck[180],splitType[100],keyWords[200],retName[200],status[100],confirm[100],confirmTime[100]"   width="100%"  readonly="true"/>
		      	</td>
		    </tr>
		    <tr>
      			<td colspan="2">
      				<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      					<div align="center">
      						<@CommonQueryMacro.Group id="group1" label="操作信息"
        			  		fieldStr="uid,etlDate,serial,issuPboc,notice,targetName,dob,alias,nationality,others[100],worldCheck[100],splitType[100],keyWords[100],retName[100]" colNm=4/>
        			 		<br/>
      						<@CommonQueryMacro.Button id= "btSave"/>
      					</div>
     		 		</@CommonQueryMacro.FloatWindow>
  				</td>
  			</tr> 
		 	<tr>
      			<td colspan="2">
      				<@CommonQueryMacro.FloatWindow id="signWindow1" label="" width="300px" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      					<div align="center">
      						<@CommonQueryMacro.Group id="group1" label="请选择确认"
        			  		fieldStr="radio[200]" colNm=2/>
        					<br/>
      						<@CommonQueryMacro.Button id= "confirmBlackName"/>
      					</div>
     		 		</@CommonQueryMacro.FloatWindow>
  				</td>
  			</tr>   
  			<tr>
      			<td colspan="2">
      				<@CommonQueryMacro.FloatWindow id="signWindow2" label="" width="300px" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      					<div align="center">
      						<@CommonQueryMacro.Group id="group1" label="请选择确认"
        			  		fieldStr="radio[200]" colNm=2/>
        			 		<br/>
      						<@CommonQueryMacro.Button id= "confirmBNSelect"/>
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
		CBlackListSplitConfirm_interface_dataset.setValue("etlDateStart",sysTxdate);
		CBlackListSplitConfirm_interface_dataset.setValue("etlDateEnd",sysTxdate);
	}
	
	var qtableName="CBlackListSplitConfirm";	
	//导出excel
	function exportBN_onClick(){
		var etlDateStart = CBlackListSplitConfirm_interface_dataset.getString("etlDateStart");
		var etlDateEnd = CBlackListSplitConfirm_interface_dataset.getString("etlDateEnd");
		var notice= CBlackListSplitConfirm_interface_dataset.getString("notice");
		var keyWords=CBlackListSplitConfirm_interface_dataset.getString("keyWords");
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
		window.location.href = "${contextPath}/filedownload/CBlackListUploadDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd+"&notice="+notice+"&qtableName="+qtableName+"&keyWords="+keyWords;
	}
	
	//定位一条记录
	function locate(id) {
		var record = CBlackListSplitConfirm_dataset.find(["id"],[id]);
		if (record) {
			CBlackListSplitConfirm_dataset.setRecord(record);
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
	function openDtl(id){
		locate(id);
		CBlackListSplitConfirm_dataset.setFieldReadOnly("uid", true);
		CBlackListSplitConfirm_dataset.setFieldReadOnly("etlDate", true);
		flag = true;
		subwindow_signWindow.show();
	}

	//新增
	function btAdd_onClick(){
		CBlackListSplitConfirm_dataset.setFieldReadOnly("uid", false);
		CBlackListSplitConfirm_dataset.setFieldReadOnly("etlDate", false);
		CBlackListSplitConfirm_dataset.setValue("etlDate", sysTxdate);
		flag = false;
		subwindow_signWindow.show();
	}
	
    function confirmSplitYes_onClick(){
		subwindow_signWindow1.show();
	}
	//保存按钮
	function btSave_postSubmit(button) {
		button.url="#";
		subwindow_signWindow.close();
		alert("保存成功！");
		if(flag){
			flag = false;
			//刷新
			CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
		}
	}
	
	//删除
	function btDel_onClickCheck(button){
		if(confirm("确认删除选择的记录吗?")){
			var hasBctlSelected = false;
			var bctlRecord = CBlackListSplitConfirm_dataset.getFirstRecord();
			while(bctlRecord){
				var v_selected = bctlRecord.getValue("select");
				if( v_selected == true ){
					hasBctlSelected = true;
				}			
				bctlRecord = bctlRecord.getNextRecord();
	   		}
   			if(!hasBctlSelected) {
	   			alert("至少选择一条拆分信息！");
	   			return false;
	   		}
			return true;
		}else{
			return false;
		}
	}
	
	function btDel_postSubmit(button) {
		alert("删除成功！");
		CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
	}
	

	//清空窗口内容。	
    function signWindow_floatWindow_beforeClose(subwindow){
		CBlackListSplitConfirm_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow){
		return false;
	}

	//黑名单按批拆分确认
  	function selectFunction(msg){
		 easyMsg.info(msg,{ title:"信息提示"});
		 CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
	}
	//黑名单按勾选拆分确认
   	function selectYes_onClick(){
  	    var hasBctlSelected = false;
		var bctlRecord =CBlackListSplitConfirm_dataset.getFirstRecord();
		while(bctlRecord){
			var v_selected = bctlRecord.getValue("select");
			if( v_selected == true ){
				hasBctlSelected=true;
			}
			bctlRecord=bctlRecord.getNextRecord();
	   	}
	   	if (!hasBctlSelected) {
	   		alert("至少选择一条拆分信息！");
	   		return false;
	   	}
	  	subwindow_signWindow2.show(); 			
   	}
	function selectYes_postSubmit(button){
		alert("保存成功！");
		CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
	}

	//导入数据
    var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	function importBN_onClick(){
		currentSubWin = openSubWin("pageWinId", "批量导入黑名拆分信息", "/fpages/hf/jsp/CSplitConfirmBN.jsp?fileflag=CBlackListSplitConfirm&workDate="+sysTxdate,"600","200");
	}
	//点击全部确认
	function confirmBlackName_onClickCheck(button){
		if (CBlackListSplitConfirm_dataset.getValue("radio")=="") {
			alert("请选择一个确认按钮");
			return false;
		}else{
			CBlackListSplitConfirm_dataset.setParameter("radioNames",CBlackListSplitConfirm_dataset.getValue("radio")); 
		}
	}
	//选择确认后点击确定
	function confirmBlackName_postSubmit(button) {
		button.url="#";
		alert("确认成功！");
		subwindow_signWindow1.close();
		CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
	}
	function confirmBNSelect_onClickCheck(){
		if (CBlackListSplitConfirm_dataset.getValue("radio")=="") {
			alert("请选择一个确认按钮");
			return false;
		}else{
			CBlackListSplitConfirm_dataset.setParameter("radioname",CBlackListSplitConfirm_dataset.getValue("radio")); 
		}
	}
	
	function confirmBNSelect_postSubmit(button) {
	    alert("确认成功");
		subwindow_signWindow2.close();	
		CBlackListSplitConfirm_dataset.flushData(CBlackListSplitConfirm_dataset.pageIndex);
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
	   var etlDate = CBlackListSplitConfirm_dataset.getValue("etlDate"); 
	   //retName
   	   var retName = CBlackListSplitConfirm_dataset.getValue("retName"); 
       if(etlDate==''){
       		alert("请填写批处理日期！");
            return false;
       }
       if(retName==''){
       		alert("请填写检查搜索名称！");
            return false;
       }
       return true;
	}
</script>
</@CommonQueryMacro.page>