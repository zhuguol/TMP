<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="批量日志">
<@CommonQueryMacro.CommonQuery id="CustBatchLog" init="false" submitMode="all" navigate="false" >
<table align="left"  width="100%">
	<tr>
		<td colspan="2">
			<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="8" labelwidth="150"/>
		</td>
	</tr>

	<tr>
		<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
		</td>
	</tr>

	<tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="batchDate[120],startTime[150],endTime[150],batchNo[150],perResult[120],legalResult[120],companyResult[120]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};

	function initCallGetter_post() {
		CustBatchLog_interface_dataset.setValue("qDateStart",sysTxdate);
		CustBatchLog_interface_dataset.setValue("qDateEnd",sysTxdate);
	}
</script>
</@CommonQueryMacro.page>