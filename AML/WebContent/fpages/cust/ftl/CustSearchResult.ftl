<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="检索结果">
<@CommonQueryMacro.CommonQuery id="CustSearchResultP" init="false" submitMode="allchange" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnDownLoadP" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250],legalCertNo[200]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

<@CommonQueryMacro.CommonQuery id="CustSearchResultL" init="false" submitMode="allchange" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable2" paginationbar="btnDownLoadL" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250],legalCertNo[200],legalName[250]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

<@CommonQueryMacro.CommonQuery id="CustSearchResultC" init="false" submitMode="allchange" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable3" paginationbar="btnDownLoadC" fieldStr="uploadDate[120],batchNo[150],custNo[150],custName[250],legalCertNo[200]" width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};
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
			var qDateStartP = CustSearchResultP_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEndP = CustSearchResultP_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeDataP = CustSearchResultP_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNoP = CustSearchResultP_interface_dataset.getString("qBatchNo");
			if(qDateStartP == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEndP == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeDataP == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNoP == ''){
				qBatchNoP = "";
			}
			document.getElementById("btnDownLoadP").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStartP+"&qDateEnd="+qDateEndP+"&qTypeData="+qTypeDataP+"&qBatchNo="+qBatchNoP));
		}
		return false;
	}
	
	//法人信息数据下载
	function btnDownLoadL_onClick(){
		if(confirm("确认下载数据吗?")){
			//开始日期
			var qDateStartL = CustSearchResultL_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEndL = CustSearchResultL_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeDataL = CustSearchResultL_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNoL = CustSearchResultL_interface_dataset.getString("qBatchNo");
			if(qDateStartL == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEndL == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeDataL == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNoL == ''){
				qBatchNoL = "";
			}
			document.getElementById("btnDownLoadL").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStartL+"&qDateEnd="+qDateEndL+"&qTypeData="+qTypeDataL+"&qBatchNo="+qBatchNoL));
		}
		return false;
	}
	
	//公司信息数据下载
	function btnDownLoadC_onClick(){
		if(confirm("确认下载数据吗?")){
			//开始日期
			var qDateStartC = CustSearchResultC_interface_dataset.getString("qDateStart");
			//结束日期
			var qDateEndC = CustSearchResultC_interface_dataset.getString("qDateEnd");
			//检索结果类型
			var qTypeDataC = CustSearchResultC_interface_dataset.getString("qTypeData");
			//批次号
			var qBatchNoC = CustSearchResultC_interface_dataset.getString("qBatchNo");
			if(qDateStartC == ''){
				alert('请选择"开始日期"！');
				return false;
			}
			if(qDateEndC == ''){
				alert('请选择"结束日期"！');
				return false;
			}
			if(qTypeDataC == ''){
				alert('请选择"检索结果类型"！');
				return false;
			}
			if(qBatchNoC == ''){
				qBatchNoC = "";
			}
			document.getElementById("btnDownLoadC").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CustSearchResultDownloadAction.do?qDateStart="+qDateStartC+"&qDateEnd="+qDateEndC+"&qTypeData="+qTypeDataC+"&qBatchNo="+qBatchNoC));
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
		PrivAction.getExportFlag('CustSearchResult',function(data){
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