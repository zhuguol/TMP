<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑上报文件生成">
<script type='text/javascript' src='${contextPath}/dwr/interface/AMLReportFile.js'> </script>
		<@CommonQueryMacro.CommonQuery id="AMLReportSubFileInfoBH" init="false" submitMode="current" >
			<table align="left"  width="100%">
			    <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%" colNm="6"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
                    </td>
                </tr> 
                <tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id="datatable1" title="上报数据文件详细"  fieldStr="filePack[260],currentfile[160],xmlFileCount[90],workdate[160],crtTm[160],isImpRep[100],oper[120]"  width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
		<iframe id="amlDownloadFrame" style="display:none"></iframe>
<script language="JavaScript">

	function initCallGetter_post() {
		AMLReportSubFileInfoBH_interface_dataset.setValue("qcurrentfile",'BH');
	}
	
	function datatable1_filepack_onRefresh(cell,value,record) {
		  var workdate = record.getValue("workdate");
		  var filepackName = record.getValue("filePack");
		  var doDetail= "<a href=\"Javascript:downloadFilePack('"+workdate+"','"+filepackName+"')\">"+filepackName+"</a> ";
		  cell.innerHTML= doDetail;
	}
	function datatable1_oper_onRefresh(cell,value,record) {
	    var filepackName = record.getValue("filePack");
		var doDetail= "";
		var isImpRep = record.getValue("isImpRep");
		if(isImpRep == 'Y'){
			doDetail+="回退";
		}else{
		    doDetail+= "<a href=\"JavaScript:backFile('"+filepackName+"')\">回退</a> ";
		}
		cell.innerHTML=doDetail;
	}
	
	 function downloadFilePack(workdate,filepackName) {
		var url = "${contextPath}/AMLReportDownload?workdate="+workdate+"&filepackName="+filepackName;
		$("#amlDownloadFrame").attr("src",url);
	}
	
	function backFile(filePack){
		if(window.confirm('确定要将文件：['+filePack+'.zip]进行回退操作吗？')){
			AMLReportFile.delGenAMLFile(filePack,{
				callback:execDelGenAMLFileCallback,
				errorHandler:function(msg,exc){
				AMLReportSubFileInfoBH_dataset.flushData();
				alert("回退文件失败，错误信息:"+msg);}
			});
		}
	}
	
	//回退文件后
	function execDelGenAMLFileCallback(datas) {
		AMLReportSubFileInfoBH_dataset.flushData();
		alert("回退上报文件成功！");
	}
</script>
</@CommonQueryMacro.page>
