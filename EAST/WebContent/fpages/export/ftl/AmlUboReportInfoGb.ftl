<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="GB有豁免权实际受益人报表信息">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="AmlUboReportInfoGb" init="true" submitMode="all">
	<table align="left"  width="100%">
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
	//下载
	function btnDownLoad_onClick(){
		var tableName = "AmlUboReportInfoGb";
		document.getElementById("btnDownLoad").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/AmlUboReportAction.do?dataDates="+sysTxdate+"&tableName="+tableName;
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
		PrivAction.getExportFlag("AmlUboReportInfoGb",function(data){
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