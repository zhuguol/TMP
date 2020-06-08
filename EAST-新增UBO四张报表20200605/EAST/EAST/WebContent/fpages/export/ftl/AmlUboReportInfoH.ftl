<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="UBO实际受益人历史报表信息">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="AmlUboReportInfoH" init="false" submitMode="all">
	<table align="left"  width="100%">
		<tr>
   			<td align="center"  colspan="2">
   				<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" colNm=4 showButton="true" />
        	</td>
        </tr>
		<tr>
			<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
  		<tr>
      		<td colspan="2">
          		<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnDownLoad" fieldStr="dataDate[100],custNo[120],custName[150],pName[150],pIdty[150],pIdno[150],pIdep[150],address[180],lob[150]" width="100%"  readonly="true"/><br />
        	</td>
        </tr>
   </table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr>
</table>
<script language="javascript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMM")};   
	var qtableName = "";
	//交易日期初始化
	function initCallGetter_post() {
		AmlUboReportInfoH_interface_dataset.setValue("dataDates",sysTxdate);
	}
	//下载
	function btnDownLoad_onClick(){
		var dataDates = AmlUboReportInfoH_interface_dataset.getValue("dataDates");
		var tableName = "AmlUboReportInfoH";
		document.getElementById("btnDownLoad").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlUboReportAction.do?dataDates="+dataDates+"&tableName="+tableName;
	}
	
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
		PrivAction.getExportFlag("AmlUboReportInfoH",function(data){
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