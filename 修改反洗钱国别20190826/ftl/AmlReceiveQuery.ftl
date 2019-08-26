<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额申领查询">
		<@CommonQueryMacro.CommonQuery id="AmlReceiveQuery" init="false" submitMode="all" navigate="false" >
			<script type='text/javascript' src='${contextPath}/dwr/interface/AMLVaildService.js'> </script>
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btDownload" fieldStr="etlDate,custNo,custName[200],custIdType[200],custIdCertNo[200],custMetierIndt[200],custContactPatn[250],custNatCode[200],custOpenAcctDate[150],acctNo[120],acctType[250],bankCardType[250],bankCardNo,finaOrgNoRelatoCust[350],chargeName[200],chargeIdType[200],chargeIdCertNo[200],chargeNatCode[200],tradTime[120],tradPlace,bussFlag[150],payMatchNoType[200],payMatchNo,tradType[200],overseaPayTradNoType[200],fundPayFlag,fundPayPurpos,ccyCd,cTradAmt,opsFinaOrgName[250],opsFinaOrgCodeType[250],opsFinaOrgCode[250],opsFinaOrgAreaCode[250],tradAdvsName[250],tradAdvsIdType[250],tradAdvsIdCertNo[250],tradAdvsAcctType[250],tradAdvsAcctNo[250],nonCotrTradType[150],nonCotrTradTypeCode[200],bankPayorgBussno[200],nationCode,interCustSort[120],dealQueue,transCharacter,orgCode,cnyTradAmt[120],usdTradAmt[120],bTradTypeCode[120],tradInfoRemark1,tradInfoRemark2"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
		//工作日期
		function initCallGetter_post() {
			AmlReceiveQuery_interface_dataset.setValue("qetlDate",sysTxdate);
		}
			
		function btDownload_onClick(){
			window.document.getElementById("btDownload").disabled = true;
			createTimerIfNull();
			var qetlDate = formatDate(AmlReceiveQuery_interface_dataset.getValue("qetlDate"));
			var qcustNo = AmlReceiveQuery_interface_dataset.getValue("qcustNo");
			var qbussFlag = AmlReceiveQuery_interface_dataset.getValue("qbussFlag");
			var sourceFlag = 3;
			window.location.href = "${contextPath}/filedownload/AmlReceiveQueryDownoloadAction.do?qbussFlag="+qbussFlag+"&qcustNo="+qcustNo+"&qetlDate="+qetlDate+"&sourceFlag="+sourceFlag;
		}
		
		
		function formatDate(date){
			 if(date!=""){
			 	var y = date.getFullYear();
			    var m = date.getMonth() + 1;
			    m = m < 10 ? '0' + m : m;
			    var d = date.getDate();
			    d = d < 10 ? ('0' + d) : d;
			    return y+''+m+''+d;
			 }
			 else{
			    return "";
		    }
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
			PrivAction.getExportFlag(page,function(data){
					exportCallBack(data);
				});
		}
			
		function exportCallBack(data){
			if(data!=null){
				window.document.getElementById("btDownload").disabled = false;
				if(timer!=null){
					window.clearInterval(timer);
					timer=null;
				}
			}
		}
	</script>
</@CommonQueryMacro.page>