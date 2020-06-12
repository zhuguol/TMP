<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="AmlCaseSummaryReport报表">
	<@CommonQueryMacro.CommonQuery id="AmlCaseSummaryReport" init="false" submitMode="allchange" navigate="false" >
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnDownLoad" fieldStr="dataDate[200],id[200],idDesc[250],sumNum[200]" width="100%" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMM")};   
	var tableName = "";
	//交易日期初始化
	function initCallGetter_post() {
		AmlCaseSummaryReport_interface_dataset.setValue("etlDateStart",sysTxdate);
		AmlCaseSummaryReport_interface_dataset.setValue("etlDateEnd",sysTxdate);
	}

	//数据下载
	function btnDownLoad_onClick(){
		//统计起始日期
   		var etlDateStart = AmlCaseSummaryReport_interface_dataset.getString("etlDateStart");
		//统计结束日期
		var etlDateEnd = AmlCaseSummaryReport_interface_dataset.getString("etlDateEnd");
		if(etlDateStart == ''){
			alert("请选择统计起始日期(年/月)");
			return false;
		}
		if(etlDateEnd == ''){
			alert("请选择统计结束日期(年/月)");
			return false;
		}
		//下载模板名
		tableName = "AmlCaseSummaryReport";
		document.getElementById("btnDownLoad").style.display = "none";//将下载按钮置为无效
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlAlertCaseSixDownloadAction.do?etlDateStart="
		+etlDateStart+"&etlDateEnd="+etlDateEnd+"&tableName="+tableName;
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
			if(document.getElementById("btnDownLoad").style.display == "none"){
				document.getElementById("btnDownLoad").style.display = "";
			}else{
				document.getElementById("btnDownLoad").style.display = "";
			}
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>