<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="TransactionVolume">
	<@CommonQueryMacro.CommonQuery id="TransactionVolumeByBranch" init="false" submitMode="allchange" navigate="false" >
		<table align="left" id="TransactionVolumeByBranch" width="100%">
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="exportBNB" fieldStr="searchDate[120],branch[100],branchName[150],tradCount[150],tradAmt[150]" width="100%" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
	<@CommonQueryMacro.CommonQuery id="TransactionVolumeByLob" init="false" submitMode="allchange" navigate="false" >
		<table align="left" id="TransactionVolumeByLob" width="100%">
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
					<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="exportBNL" fieldStr="searchDate[120],lob[100],tradCount[150],tradAmt[150]" width="100%" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMM")};   
	var qtableName = "";
	//交易日期初始化
	function initCallGetter_post() {
		TransactionVolumeByBranch_interface_dataset.setValue("searchDateStart",sysTxdate);
		TransactionVolumeByBranch_interface_dataset.setValue("searchDateEnd",sysTxdate);
		TransactionVolumeByBranch_interface_dataset.setValue("branchOrLob","01");
		TransactionVolumeByLob_interface_dataset.setValue("searchDateStart",sysTxdate);
		TransactionVolumeByLob_interface_dataset.setValue("searchDateEnd",sysTxdate);
		TransactionVolumeByLob_interface_dataset.setValue("branchOrLob","02");
		document.getElementById('TransactionVolumeByBranch').style.display = "";
		document.getElementById('TransactionVolumeByLob').style.display="none";
	}
	
	//下拉选事件
	function branchOrLob_DropDown_onSelect(dropDown,record,editor){
		if(record[0] == "01"){
			TransactionVolumeByBranch_interface_dataset.setValue("branchOrLob","01");
			TransactionVolumeByLob_interface_dataset.setValue("branchOrLob","01");
			document.getElementById('TransactionVolumeByBranch').style.display = "";
			document.getElementById('TransactionVolumeByLob').style.display="none";
		}else{
			TransactionVolumeByBranch_interface_dataset.setValue("branchOrLob","02");
			TransactionVolumeByLob_interface_dataset.setValue("branchOrLob","02");
			document.getElementById('TransactionVolumeByBranch').style.display = "none";
			document.getElementById('TransactionVolumeByLob').style.display="";
		}
	}
	
	//下载
	function exportBNB_onClick(){
		var searchDateStart = TransactionVolumeByBranch_interface_dataset.getValue("searchDateStart");
		var searchDateEnd = TransactionVolumeByBranch_interface_dataset.getValue("searchDateEnd");
		if(searchDateStart == ''){
			alert("请选择检索起始时间(年/月)");
			return false;
		}
		if(searchDateEnd == ''){
			alert("请选择检索结束时间(年/月)");
			return false;
		}
		qtableName = "TransactionVolumeByBranch";
	    document.getElementById("exportBNB").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/CustAndTransDownloadAction.do?searchDateStart="+searchDateStart+"&searchDateEnd="+searchDateEnd+"&qtableName="+qtableName;
	}
	
	//下载
	function exportBNL_onClick(){
		var searchDateStart = TransactionVolumeByLob_interface_dataset.getValue("searchDateStart");
		var searchDateEnd = TransactionVolumeByLob_interface_dataset.getValue("searchDateEnd");
		if(searchDateStart == ''){
			alert("请选择检索起始时间(年/月)");
			return false;
		}
		if(searchDateEnd == ''){
			alert("请选择检索结束时间(年/月)");
			return false;
		}
		qtableName = "TransactionVolumeByLob";
	    document.getElementById("exportBNL").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/CustAndTransDownloadAction.do?searchDateStart="+searchDateStart+"&searchDateEnd="+searchDateEnd+"&qtableName="+qtableName;
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
			if(document.getElementById("exportBNB").style.display == "none"){
				document.getElementById("exportBNB").style.display = "";
			}else{
				document.getElementById("exportBNL").style.display = "";
			}
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>