<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="回执/人工补正导入" >
<table width="100%" align="left">
	<tr>
		<td width="100%"valign="top">
			<@CommonQueryMacro.CommonQuery id="AMLReceiptFdacImport" init="false" submitMode="selected" navigate="false">
				<table width="100%">
  					<tr>
						<td>
							<@CommonQueryMacro.Interface id="interface" label="警告回执信息查询" />
						</td>
					</tr>
					<tr>
    					<td>
    						<@CommonQueryMacro.DataTable id="table1" paginationbar="btnImportReceipt" fieldStr="fileName[450],brno[150],importTlr[150],importTime[200]"   hasFrame="true"  width="" readonly="true"/>
    					</td>
  					</tr>
				</table>
			</@CommonQueryMacro.CommonQuery>
		</td>		
	</tr>
</table>
<iframe id="amlDownloadFrame" style="display:none"></iframe>
<script type="text/javascript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	function initCallGetter_post(){
		//interface里查询的设置工作日期默认当天
		//AMLReceiptFdacImport_interface_dataset.setValue("qworkdateStart",sysTxdate);
		//AMLReceiptFdacImport_interface_dataset.setValue("qworkdateEnd",sysTxdate);
	}
	
	function btnImportReceipt_onClick(){
		currentSubWin = openSubWin("pageWinId", "导入回执文件", "/fpages/hfaml3/jsp/importWarnReceipt.jsp?fileflag=feedback","500","180");
	}
	
	function table1_filename_onRefresh(cell,value,record) {
		var fileName = record.getValue("fileName");
  		var doDetail= "<a href=\"Javascript:downloadFilePack('"+fileName+"')\">"+fileName+"</a> ";
  		cell.innerHTML= doDetail;
	}
	
	function downloadFilePack(fileName) {
		var url = "${contextPath}/AmlWarnReceiptDownload?fileName="+fileName;
		$("#amlDownloadFrame").attr("src",url);
	}
</script>
</@CommonQueryMacro.page>