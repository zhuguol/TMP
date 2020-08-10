<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="文件上传">
<@CommonQueryMacro.CommonQuery id="CustUploadFileInfo" init="false" submitMode="all" navigate="false" >
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btnUpload" fieldStr="batchNo[150],certNum[150],name[250],uploadTlr[150],uploadTime[150]"   width="100%" height="480" hasFrame="true" readonly="true"/>
  		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};

	function initCallGetter_post() {
		CustUploadFileInfo_interface_dataset.setValue("qDateStart",sysTxdate);
		CustUploadFileInfo_interface_dataset.setValue("qDateEnd",sysTxdate);
	}
	
	//导入
	function btnUpload_onClick(){
		currentSubWin = openSubWin("pageWinId", "导入检索信息", "/fpages/cust/jsp/importCust.jsp","600","200");
	}
	
	function flushPage() {
	    CustUploadFileInfo_dataset.flushData(CustUploadFileInfo_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>