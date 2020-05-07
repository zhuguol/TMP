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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnCancel" fieldStr="alertId[100],bussFlag[100],acctType[100],acctNo[100],bankCardType[100],bankCardNo[100],tstm[100],tradPlace[100],payMatchNoType[100],tradType[100],nonCotrTradType[100],nonCotrTradTypeCode[100],fundPayFlag[100],fundPayPurpos[100],ccyCd[100],tradAmt[100],cnyTradAmt[100],opsFinaOrgName[100],opsFinaOrgAreaCode[100],tradAdvsName[100],tradAdvsIdCertNo[100],tradAdvsAcctNo[100],tbnm[100],tbid[100]" width="100%" hasFrame="true" readonly="true"/>
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