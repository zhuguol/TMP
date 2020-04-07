<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单批处理状态表">
		<@CommonQueryMacro.CommonQuery id="CBlackBatchStatus" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="exportBN" fieldStr="etlDate[100],etlName[120],notice[200],beginTime[200],endTime[200],status,transNum[100]"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
		var yesterdayDate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getLastDate()?string("yyyyMMdd")};   
		//工作日期
		function initCallGetter_post() {
			CBlackBatchStatus_interface_dataset.setValue("etlDateStart",yesterdayDate);
			CBlackBatchStatus_interface_dataset.setValue("etlDateEnd",sysTxdate);
		}
		var qtableName="CBlackBatchStatus";
	
		//下载
		function exportBN_onClick(){	
			var etlDateStart = CBlackBatchStatus_interface_dataset.getString("etlDateStart");
			var etlDateEnd = CBlackBatchStatus_interface_dataset.getString("etlDateEnd");
			var notice= CBlackBatchStatus_interface_dataset.getString("notice");
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
			window.location.href = "${contextPath}/filedownload/CBlackListUploadDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd+"&qtableName="+qtableName+"&notice="+notice;
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
	</script>
</@CommonQueryMacro.page>