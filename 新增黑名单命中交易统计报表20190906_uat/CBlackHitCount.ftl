<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单命中交易统计报表">
		<@CommonQueryMacro.CommonQuery id="CBlackHitCount" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="exportBN" fieldStr="searchDate[250],queriesNum[150],hitsNum[150]" width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
	<script language="JavaScript">
		//下载
		function exportBN_onClick(){	
			var etlDateStart = CBlackHitCount_interface_dataset.getString("etlDateStart");
			var etlDateEnd = CBlackHitCount_interface_dataset.getString("etlDateEnd");
			if(etlDateStart==''){
				alert("请选择黑名单检索起始时间(年/月)");
				return false;
			}
		    if(etlDateEnd==''){
				alert("请选择黑名单检索终止时间(年/月)");
				return false;
			}	
			document.getElementById("exportBN").style.display = "none";
			createTimerIfNull();	
			window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/CBlackHitCountDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd));
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
			PrivAction.getExportFlag("CBlackHitCount",function(data){
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