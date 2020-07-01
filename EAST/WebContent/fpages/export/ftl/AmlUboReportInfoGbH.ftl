<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="GB有豁免权实际受益人历史报表信息">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="AmlUboReportInfoGbH" init="false" submitMode="all">
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
          		<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnDownLoad" fieldStr="dataDate[100],custNo[120],custName[150],pName[150],pIdty[150],pIdno[150],pIdep[150],addresss[180],lob[150]" width="100%" readonly="true"/><br />
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
	//数据日期(年/月)
	function initCallGetter_post() {
		AmlUboReportInfoGbH_interface_dataset.setValue("dataDateStart",sysTxdate);
		AmlUboReportInfoGbH_interface_dataset.setValue("dataDateEnd",sysTxdate);
	}
	//下载
	function btnDownLoad_onClick(){
		var dataDateStart = AmlUboReportInfoGbH_interface_dataset.getValue("dataDateStart");
		var dataDateEnd = AmlUboReportInfoGbH_interface_dataset.getValue("dataDateEnd");
		var tableName = "AmlUboReportInfoGbH";
		document.getElementById("btnDownLoad").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlUboReportAction.do?dataDateStart="+dataDateStart+"&dataDateEnd="+dataDateEnd+"&tableName="+tableName;
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
		PrivAction.getExportFlag("AmlUboReportInfoGbH",function(data){
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