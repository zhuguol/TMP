<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="客户交易明细">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradInfo" init="true" navigate="false" >
		<table align="left"  width="100%">
			<tr>
				<td valign="top">
					<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
				</td>
		    </tr>
		    <tr>
		    	<td colspan="2">
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnCancel" fieldStr="alertId[150],bussFlag[180],acctType[100],acctNo[100],bankCardType[100],bankCardNo[150],tstm[90],tradPlace[90],payMatchNoType[120],tradType[90],nonCotrTradType[100],nonCotrTradTypeCode[100],fundPayFlag[100],fundPayPurpos[100],ccyCd[100],tradAmt[120],cnyTradAmt[120],opsFinaOrgName[150],opsFinaOrgAreaCode[100],tradAdvsName[100],tradAdvsIdCertNo[150],tradAdvsAcctNo[120],tbnm[100],tbid[120]" width="100%" height="500" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//返回按钮
	function btnCancel_onClick() {
		closeWin(true);
	}
</script>
</@CommonQueryMacro.page>