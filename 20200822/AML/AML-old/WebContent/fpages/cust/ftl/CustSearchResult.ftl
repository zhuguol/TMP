<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="检索结果">
<@CommonQueryMacro.CommonQuery id="CustSearchResultP" init="false" submitMode="all" navigate="false" >
<table align="left" id="CustSearchResultP" width="100%">
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
			<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnDownLoadP" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

<@CommonQueryMacro.CommonQuery id="CustSearchResultL" init="false" submitMode="all" navigate="false" >
<table align="left" id="CustSearchResultL" width="100%">
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnDownLoadL" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250],legalCertNo[200],legalName[250]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

<@CommonQueryMacro.CommonQuery id="CustSearchResultC" init="false" submitMode="all" navigate="false" >
<table align="left" id="CustSearchResultC" width="100%">
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
			<@CommonQueryMacro.DataTable id ="datatable2" paginationbar="btnDownLoadC" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};
	var tableName = "";
	function initCallGetter_post() {
		//个人信息
		CustSearchResultP_interface_dataset.setValue("qDateStart",sysTxdate);
		CustSearchResultP_interface_dataset.setValue("qDateEnd",sysTxdate);
		CustSearchResultP_interface_dataset.setValue("qTypeData","01");
		//法人信息
		CustSearchResultL_interface_dataset.setValue("qDateStart",sysTxdate);
		CustSearchResultL_interface_dataset.setValue("qDateEnd",sysTxdate);
		CustSearchResultL_interface_dataset.setValue("qTypeData","02");
		//公司信息
		CustSearchResultC_interface_dataset.setValue("qDateStart",sysTxdate);
		CustSearchResultC_interface_dataset.setValue("qDateEnd",sysTxdate);
		CustSearchResultC_interface_dataset.setValue("qTypeData","03");
		document.getElementById('CustSearchResultP').style.display = "";
		document.getElementById('CustSearchResultL').style.display = "none";
		document.getElementById('CustSearchResultC').style.display = "none";
	}
	
	//下拉选事件
	function qTypeData_DropDown_onSelect(dropDown,record,editor){
		if(record[0] == "01"){
			CustSearchResultP_interface_dataset.setValue("qTypeData","01");
			CustSearchResultL_interface_dataset.setValue("qTypeData","01");
			CustSearchResultC_interface_dataset.setValue("qTypeData","01");
			document.getElementById('CustSearchResultP').style.display = "";
			document.getElementById('CustSearchResultL').style.display = "none";
			document.getElementById('CustSearchResultC').style.display = "none";
		}else if(record[0] == "02"){
			CustSearchResultP_interface_dataset.setValue("qTypeData","02");
			CustSearchResultL_interface_dataset.setValue("qTypeData","02");
			CustSearchResultC_interface_dataset.setValue("qTypeData","02");
			document.getElementById('CustSearchResultP').style.display = "none";
			document.getElementById('CustSearchResultL').style.display = "";
			document.getElementById('CustSearchResultC').style.display = "none";
		}else if(record[0] == "03"){
			CustSearchResultP_interface_dataset.setValue("qTypeData","03");
			CustSearchResultL_interface_dataset.setValue("qTypeData","03");
			CustSearchResultC_interface_dataset.setValue("qTypeData","03");
			document.getElementById('CustSearchResultP').style.display = "none";
			document.getElementById('CustSearchResultL').style.display = "none";
			document.getElementById('CustSearchResultC').style.display = "";
		}
	}
	
	//个人信息数据下载
	function btnDownLoadP_onClick(){
		if(confirm("确认下载数据吗?")){
			//开始日期
			var qDateStart = CustSearchResultP_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEnd = CustSearchResultP_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeData = CustSearchResultP_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNo = CustSearchResultP_interface_dataset.getString("qBatchNo");
			if(qDateStart == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEnd == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeData == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNo == ''){
				qBatchNo = "";
			}
			//下载模板名
			tableName = "CustSearchResult";
			document.getElementById("btnDownLoadP").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStart+
			"&qDateEnd="+qDateEnd+
			"&qTypeData="+qTypeData+
			"&qBatchNo"+qBatchNo+
			"&tableName="+tableName));
		}
		return false;
	}
	
	//法人信息数据下载
	function btnDownLoadL_onClick(){
		if(confirm("确认下载数据吗?")){
			//开始日期
			var qDateStart = CustSearchResultL_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEnd = CustSearchResultL_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeData = CustSearchResultL_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNo = CustSearchResultL_interface_dataset.getString("qBatchNo");
			if(qDateStart == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEnd == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeData == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNo == ''){
				qBatchNo = "";
			}
			//下载模板名
			tableName = "CustSearchResult";
			document.getElementById("btnDownLoadL").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStart+
			"&qDateEnd="+qDateEnd+
			"&qTypeData="+qTypeData+
			"&qBatchNo"+qBatchNo+
			"&tableName="+tableName));
		}
		return false;
	}
	
	//公司信息数据下载
	function btnDownLoadC_onClick(){
		if(confirm("确认下载数据吗?")){
			//开始日期
			var qDateStart = CustSearchResultC_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEnd = CustSearchResultC_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeData = CustSearchResultC_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNo = CustSearchResultC_interface_dataset.getString("qBatchNo");
			if(qDateStart == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEnd == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeData == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNo == ''){
				qBatchNo = "";
			}
			//下载模板名
			tableName = "CustSearchResult";
			document.getElementById("btnDownLoadC").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStart+
			"&qDateEnd="+qDateEnd+
			"&qTypeData="+qTypeData+
			"&qBatchNo"+qBatchNo+
			"&tableName="+tableName));
		}
		return false;
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
		PrivAction.getExportFlag(tableName,function(data){
			exportCallBack(data);
		});
	}
		
	function exportCallBack(data){
		if(data!=null){
			if(document.getElementById("btnDownLoadP").style.display == "none"){
				document.getElementById("btnDownLoadP").style.display = "";
			}
			if(document.getElementById("btnDownLoadL").style.display == "none"){
				document.getElementById("btnDownLoadL").style.display = "";
			}
			if(document.getElementById("btnDownLoadC").style.display == "none"){
				document.getElementById("btnDownLoadC").style.display = "";
			}
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>