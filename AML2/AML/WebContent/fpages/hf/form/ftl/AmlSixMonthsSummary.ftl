<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="AmlSixMonthsSummary报表">
	<@CommonQueryMacro.CommonQuery id="AmlSixMonthsSummaryBranch" init="false" submitMode="allchange" navigate="false" >
		<table align="left" id="AmlSixMonthsSummaryBranch" width="100%">
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnDownLoadB" fieldStr="dataDate[100],levelNo[150],levelName[150],sccToFcr[200],sccToMis[200],sccToSafe[200],sccTotal[200]" width="100%" height="600" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
	<@CommonQueryMacro.CommonQuery id="AmlSixMonthsSummaryDepartment" init="false" submitMode="allchange" navigate="false" >
		<table align="left" id="AmlSixMonthsSummaryDepartment" width="100%">
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
					<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnDownLoadD" fieldStr="dataDate[100],levelNo[150],sccToFcr[200],sccToMis[200],sccToSafe[200],sccTotal[200]" width="100%" height="600" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyy")};   
	var tableName = "";
	//交易日期初始化
	function initCallGetter_post() {
		AmlSixMonthsSummaryBranch_interface_dataset.setValue("dataYears",sysTxdate);
		AmlSixMonthsSummaryBranch_interface_dataset.setValue("dataDates","01");
		AmlSixMonthsSummaryBranch_interface_dataset.setValue("dataFlags","01");
		AmlSixMonthsSummaryDepartment_interface_dataset.setValue("dataYears",sysTxdate);
		AmlSixMonthsSummaryDepartment_interface_dataset.setValue("dataDates","01");
		AmlSixMonthsSummaryDepartment_interface_dataset.setValue("dataFlags","02");
		document.getElementById('AmlSixMonthsSummaryBranch').style.display = "";
		document.getElementById('AmlSixMonthsSummaryDepartment').style.display="none";
	}
	
	//下拉选事件
	function dataFlags_DropDown_onSelect(dropDown,record,editor){
		if(record[0] == "01"){
			AmlSixMonthsSummaryBranch_interface_dataset.setValue("dataFlags","01");
			AmlSixMonthsSummaryDepartment_interface_dataset.setValue("dataFlags","01");
			document.getElementById('AmlSixMonthsSummaryBranch').style.display = "";
			document.getElementById('AmlSixMonthsSummaryDepartment').style.display="none";
		}else{
			AmlSixMonthsSummaryBranch_interface_dataset.setValue("dataFlags","02");
			AmlSixMonthsSummaryDepartment_interface_dataset.setValue("dataFlags","02");
			document.getElementById('AmlSixMonthsSummaryBranch').style.display = "none";
			document.getElementById('AmlSixMonthsSummaryDepartment').style.display="";
		}
	}

	//数据下载
	function btnDownLoadB_onClick(){
		//年/月
   		var dataYears = AmlSixMonthsSummaryBranch_interface_dataset.getString("dataYears");
		//上下半年
		var dataDates = AmlSixMonthsSummaryBranch_interface_dataset.getString("dataDates");
		//报表类型
		var dataFlags = AmlSixMonthsSummaryBranch_interface_dataset.getString("dataFlags");
		if(dataYears == ''){
			alert('请选择"年/月"！');
			return false;
		}
		if(dataDates == ''){
			alert('请选择"上下半年"！');
			return false;
		}
		if(dataFlags == ''){
			alert('请选择"报表类型"！');
			return false;
		}
		if(dataDates == "01"){
			dataYears = dataYears + "A";
		}else{
			dataYears = dataYears + "B";
		}
		//下载模板名
		tableName = "AmlSixMonthsSummary";
		document.getElementById("btnDownLoadB").style.display = "none";//将下载按钮置为无效
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlAlertCaseSixDownloadAction.do?dataYears="
		+dataYears+"&dataFlags="+dataFlags+"&tableName="+tableName;
	}
	
	//数据下载
	function btnDownLoadD_onClick(){
		//年/月
   		var dataYears = AmlSixMonthsSummaryDepartment_interface_dataset.getString("dataYears");
		//上下半年
		var dataDates = AmlSixMonthsSummaryDepartment_interface_dataset.getString("dataDates");
		//报表类型
		var dataFlags = AmlSixMonthsSummaryDepartment_interface_dataset.getString("dataFlags");
		if(dataYears == ''){
			alert('请选择"年/月"！');
			return false;
		}
		if(dataDates == ''){
			alert('请选择"上下半年"！');
			return false;
		}
		if(dataFlags == ''){
			alert('请选择"报表类型"！');
			return false;
		}
		if(dataDates == "01"){
			dataYears = dataYears + "A";
		}else{
			dataYears = dataYears + "B";
		}
		//下载模板名
		tableName = "AmlSixMonthsSummary";
		document.getElementById("btnDownLoadD").style.display = "none";//将下载按钮置为无效
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlAlertCaseSixDownloadAction.do?dataYears="
		+dataYears+"&dataFlags="+dataFlags+"&tableName="+tableName;
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
			if(document.getElementById("btnDownLoadB").style.display == "none"){
				document.getElementById("btnDownLoadB").style.display = "";
			}else{
				document.getElementById("btnDownLoadD").style.display = "";
			}
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>