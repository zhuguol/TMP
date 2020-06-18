<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="AmlSixMonthsSummary报表">
	<@CommonQueryMacro.CommonQuery id="AmlSixMonthsSummaryRRB" init="false" submitMode="allchange" navigate="false" >
		<table align="left" width="100%">
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnDownLoad" fieldStr="dataDate[100],levelNo[150],sccToFcr[200],sccToMis[200],sccTotal[200]" width="100%" height="600" hasFrame="true" readonly="true"/>
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
		AmlSixMonthsSummaryRRB_interface_dataset.setValue("dataYears",sysTxdate);
		AmlSixMonthsSummaryRRB_interface_dataset.setValue("dataDates","01");
	}

	//数据下载
	function btnDownLoad_onClick(){
		//年/月
   		var dataYears = AmlSixMonthsSummaryRRB_interface_dataset.getString("dataYears");
		//上下半年
		var dataDates = AmlSixMonthsSummaryRRB_interface_dataset.getString("dataDates");
		if(dataYears == ''){
			alert('请选择"年/月"！');
			return false;
		}
		if(dataDates == ''){
			alert('请选择"上下半年"！');
			return false;
		}
		if(dataDates == "01"){
			dataYears = dataYears + "A";
		}else{
			dataYears = dataYears + "B";
		}
		//下载模板名
		tableName = "AmlSixMonthsSummaryRRB";
		document.getElementById("btnDownLoad").style.display = "none";//将下载按钮置为无效
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlAlertCaseSixRRBDownloadAction.do?dataYears="
		+dataYears+"&tableName="+tableName;
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
			document.getElementById("btnDownLoad").style.display = "";
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>