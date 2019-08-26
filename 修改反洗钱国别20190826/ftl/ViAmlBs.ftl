<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="全量交易信息">
<#assign reportId=RequestParameters["reportId"]?default("")>
<#assign workDate=RequestParameters["workDate"]?default("")>
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="ViAmlBs" init="false" submitMode="current">
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
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btDownload" fieldStr="reportId[100],workDate[130],aacgrp,axibr2m[220],isSubSuccess,recStatus,checkStatus,checkCustomer,checkTm,finm[200],firc[200],fict[200],ficd[200],stcr,ssdg,tkms,ssds,lstUpdTlr,senm[200],setp[220],seid[220],csnm,cttp,sctl,sear,seei[180],stnt[250],sevc[220],rgcp,srnm[220],srit[220],srid[220],catp[220],ctac[220],oatm[220],catm[220],tbnm[220],tbit[220],tbid[220],tbnt[220],tstm,trcd[250],trcdSuffix[250],ticd,tstp[220],tsct[250],tsdr[220],crsp[250],crtp[200],crat,cfin[200],cfct[200],cfic[200],cfrc[200],cfrcSuffix[200],tcnm[200],tcit[200],tcid[200],tcat[200],tcac[200]"  width="100%"  height="480"  hasFrame="true" readonly="true" />
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
		ViAmlBs_interface_dataset.setValue("qtradTimeStart",sysTxdate);
		ViAmlBs_interface_dataset.setValue("qtradTimeEnd",sysTxdate);
	}
		
	function btDownload_onClick(){
		window.document.getElementById("btDownload").disabled = true;
		createTimerIfNull();
		var qworkDateStart = formatDate(ViAmlBs_interface_dataset.getValue("qtradTimeStart"));
		var qworkDateEnd = formatDate(ViAmlBs_interface_dataset.getValue("qtradTimeEnd"));
		//var csnm = ViAmlBs_interface_dataset.getValue("csnm");
		//var ctac = ViAmlBs_interface_dataset.getValue("ctac");
		//var senm = ViAmlBs_interface_dataset.getValue("senm");
		//var aacgrp = ViAmlBs_interface_dataset.getValue("aacgrp");
		//var ficd = ViAmlBs_interface_dataset.getValue("ficd");
		var isSubSuccess = ViAmlBs_interface_dataset.getValue("isSubSuccess");
		var recStatus = ViAmlBs_interface_dataset.getValue("recStatus");
		var reportId = ViAmlBs_interface_dataset.getValue("reportId");
		
		//var sourceFlag = 2;
		//window.location.href = "${contextPath}/filedownload/AmlBSDownoloadAction.do?qworkDateStart="+qworkDateStart+"&qworkDateEnd="+qworkDateEnd+"&sourceFlag="+sourceFlag+"&csnm="+csnm+"&ctac="+ctac+"&senm="+encodeURI(encodeURI(senm))+"&aacgrp="+aacgrp+"&ficd="+ficd+"&isSubSuccess="+isSubSuccess+"&recStatus="+recStatus;
		window.location.href =encodeURI(encodeURI("${contextPath}/filedownload/AmlBSDownoloadAction.do?qworkDateStart="+qworkDateStart+"&qworkDateEnd="+qworkDateEnd+"&reportId="+reportId+"&isSubSuccess="+isSubSuccess+"&recStatus="+recStatus));
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