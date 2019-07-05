<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑交易信息">
<#assign reportId=RequestParameters["reportId"]?default("")>
<#assign workDate=RequestParameters["workDate"]?default("")>
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlTradInfoAllThree" init="false" submitMode="all">
            <table width="100%">
                <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="false"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btConfirm" fieldStr="select,tradTime[130],interCustSort[130],finaOrgNoRelatoCust[350],finaOrgCode[150],custNo[120],custName[200],custIdType[250],custIdCertNo[220],custMetierIndt[250],custContactPatn[250],custDetailAddr[600],custOthrsContactPatn[250],custNatCode[200],openAcctDate[150],acctNo[120],acctType[250],bankCardType[220],bankCardNo[180],chargeName[200],chargeIdType[250],chargeIdCertNo[200],chargeNatCode[200],bussFlag[150],tradPlace[200],payMatchNoType[200],payMatchNo[250],tradType[120],overseaPayTradNoType[200],fundPayFlag[150],fundPayPurpos[200],ccyCd[180],cTraAmt[150],opsFinaOrgName[200],opsFinaOrgCodeType[200],opsFinaOrgCode[180],opsFinaOrgAreaCode[200],tradAdvsName[150],tradAdvsIdType[250],tradAdvsIdCertNo[250],tradAdvsAcctType[250],tradAdvsAcctNo[200],nonCotrTradType[200],nonCotrTradTypeCode[250],bankPayorgBussno[250],tradInfoRemark1[150],tradInfoRemark2[150]" width="100%" height="460" />
                    </td>
                </tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var reportId = "${reportId}";
	var workDate = "${workDate}";
	
	//工作日期
	function initCallGetter_post() {
		AmlTradInfoAllThree_interface_dataset.setValue("qtradTimeStart",sysTxdate);
		AmlTradInfoAllThree_interface_dataset.setValue("qtradTimeEnd",sysTxdate);
	}
	 //确认勾选
	function btConfirm_onClickCheck(button){
			var record = AmlTradInfoAllThree_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			var flag = false;
			while(record){
				var temp = record.getValue("select");
				if(temp){
			        recIds+=record.getValue("id");
			        recIds+="|";
					chk++;
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请至少选择一条记录！");
				return false;
			}else{
				AmlTradInfoAllThree_dataset.setParameter("reportId",reportId);
				AmlTradInfoAllThree_dataset.setParameter("workDate",workDate);
				return true;
			}
	   }
	   
	   
	   function btConfirm_postSubmit(button){
	    	var retParam = button.returnParam;
	    	alert("操作成功！"+retParam.msg+"!");
	    	closeWin(true);
       }
	   
	
</script>
</@CommonQueryMacro.page>