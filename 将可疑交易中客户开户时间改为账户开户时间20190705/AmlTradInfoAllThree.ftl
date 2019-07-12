<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="全量交易信息">
<#assign reportId=RequestParameters["reportId"]?default("")>
<#assign workDate=RequestParameters["workDate"]?default("")>
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlTradInfoAllThree" init="false" submitMode="current">
            <table width="100%">
                <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="true"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btDownload" fieldStr="tradTime[130],interCustSort[130],finaOrgNoRelatoCust[350],finaOrgCode[150],custNo[120],custName[200],custIdType[250],custIdCertNo[220],custMetierIndt[250],custContactPatn[250],custDetailAddr[600],custOthrsContactPatn[250],custNatCode[200],openAcctDate[150],acctNo[120],acctType[250],bankCardType[220],bankCardNo[180],chargeName[200],chargeIdType[250],chargeIdCertNo[200],chargeNatCode[200],bussFlag[150],tradPlace[200],payMatchNoType[200],payMatchNo[250],tradType[120],overseaPayTradNoType[200],fundPayFlag[150],fundPayPurpos[200],ccyCd[180],cTraAmt[150],opsFinaOrgName[200],opsFinaOrgCodeType[200],opsFinaOrgCode[180],opsFinaOrgAreaCode[200],tradAdvsName[150],tradAdvsIdType[250],tradAdvsIdCertNo[250],tradAdvsAcctType[250],tradAdvsAcctNo[200],nonCotrTradType[200],nonCotrTradTypeCode[250],bankPayorgBussno[250],tradInfoRemark1[150],tradInfoRemark2[150],ccpdt"  width="100%"  height="480"  hasFrame="true" readonly="true" />
                    </td>
                </tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var page = "${statics["com.huateng.report.constants.AMLConstants"].REPORT_APP_TYPE_AML}";
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var reportId = "${reportId}";
	var workDate = "${workDate}";
	
	//工作日期
	function initCallGetter_post() {
		AmlTradInfoAllThree_interface_dataset.setValue("qtradTimeStart",sysTxdate);
		AmlTradInfoAllThree_interface_dataset.setValue("qtradTimeEnd",sysTxdate);
	}
		
	function btDownload_onClick(){
		window.document.getElementById("btDownload").disabled = true;
		createTimerIfNull();
		var qworkDateStart = formatDate(AmlTradInfoAllThree_interface_dataset.getValue("qtradTimeStart"));
		var qworkDateEnd = formatDate(AmlTradInfoAllThree_interface_dataset.getValue("qtradTimeEnd"));
		var qcustNo = AmlTradInfoAllThree_interface_dataset.getValue("qcustNo");
		var qticd = AmlTradInfoAllThree_interface_dataset.getValue("qticd");
		window.location.href = "${contextPath}/filedownload/AmlTradInfoAllDownoloadAction.do?qticd="+qticd+"&qcustNo="+qcustNo+"&qworkDateStart="+qworkDateStart+"&qworkDateEnd="+qworkDateEnd;
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