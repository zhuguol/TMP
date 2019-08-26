<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="" >
 <link rel="stylesheet" type="text/css" href="${contextPath}/templets/updata/uploadify.css">   
    <script type="text/javascript" src="${contextPath}/templets/updata/jquery.uploadify-3.1.min.js"></script>   
    <script type="text/javascript" src="${contextPath}/templets/updata/initUploadifyForReceipts.js"></script>  
<table width="100%" align="left">
	<tr>
		<td width="100%"valign="top">
			<@CommonQueryMacro.CommonQuery id="AMLReceiptPackImport" init="false" submitMode="all" navigate="false">
				<table width="100%">
  					<tr>
						<td>
							<@CommonQueryMacro.Interface id="interface" label="回执信息查询" />
						</td>
					</tr>
				</table>
			</@CommonQueryMacro.CommonQuery>
		</td>		
	</tr>
	<tr>
		<td width="100%" style="padding-left: 8px;padding-top: 20px;" valign="top">
			<div  id="importMsg" style="font-size: 12px;width: 99%;height:70px;overflow: auto;border: 1px solid #ededed;display: none;"></div>
		</td>
	</tr>
	<tr>
		<td width="100%" valign="top"  colspan="2" >
			<@CommonQueryMacro.CommonQuery id="AMLReceiptPackImport" mode="1" navigate="false">
				<table width="100%">
					<tr>
  						<td><@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="10"/></td>
  					</tr>
  					<tr>
    					<td>
    						<@CommonQueryMacro.DataTable id="receiptFile" paginationbar="btnUpload" fieldStr="currentfile[110],workdate[90],id[270],reportType,totalrecords,crtTm[120],isImpRep,repFileName[400],repErrType,repTm[150]"   hasFrame="true"  width="" readonly="true"/>
    					</td>
  					</tr>
				</table>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
	<td>
<!--		<input type="file" name="uploadify" id="uploadify" /> -->
	</td>
	</tr>
</table>
<script type="text/javascript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};
	
	/*
     $(document).ready(function() {	
	       var swf='${contextPath}/templets/updata/uploadify.swf?var=' + (new Date()).getTime();
	       var uploader='${contextPath}/scripts/UploadifyForReceipt?someKey="a"';	  
		   initUploadifyForReceipt(getDatasetByID('AMLReceiptPackImport_dataset'),swf,uploader);
     });
	*/
	function initCallGetter_post(){
		//executeImport.disable(true);
		//interface里查询的设置工作日期默认当天
		AMLReceiptPackImport_interface_dataset.setValue("qworkdateStart",sysTxdate);
		AMLReceiptPackImport_interface_dataset.setValue("qworkdateEnd",sysTxdate);
//		AMLReceiptPackImport_interface_dataset.setValue("qbusiType","02");
//		AMLReceiptPackImport_interface_dataset.setValue("qappType","AML");
	}

     	//定位一条记录
	function locate(id) {
		var record = AMLReceiptFileImportEntry_dataset.find(["id"],[id]);
		if (record) {
			AMLReceiptFileImportEntry_dataset.setRecord(record);
		}
	}



	function AMLReceiptPackImport_dataset_flushDataPost(dataset) {
		var record = AMLReceiptPackImport_dataset.firstUnit;
		var bl = false;
		while(record){
			var isImpRep = record.getValue("isImpRep");
			var isSub = record.getValue("isSub");
			if(isImpRep=='N' && isSub =='N'){
				bl = true;
				break;
			}
			record=record.nextUnit;
		}
	}



     //当系统刷新单元格的内容时被触发
	function AMLReceiptPackImport_id_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			cell.innerHTML = "<center><a href=\"JavaScript:showDetail('"+id+"')\">"+value+"</a></center>";
		}else{
			//记录不存在的时候
			cell.innerHTML = "&nbsp;";
		}
	}

    /* function executeImport_onClickCheck(button){
     	document.getElementById("importMsg").style.display = "";
     	document.getElementById("importMsg").innerHTML = "<font color='green'><br/>&nbsp;&nbsp;回执导入开始执行...</font>";
     	return true;
     }*/

  
	
	function receiptFile_backfilename_onRefresh(cell, value, record){
		if(record){
			var isImpRep = record.getValue("isImpRep");
			var id = record.getValue("id");
			if(isImpRep == "1"){
//				var backfileurl = record.getValue("backfileurl");
//				cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:downLoad('"+backfileurl+"')\">"+value+"</a>";
				cell.innerHTML = "已上传";
			} else {
//				cell.innerHTML = "<input type=\"button\" onclick=\"fileupload('"+id+"');\" value=\"文件上传\"/>";
				cell.innerHTML = "<input type=\"file\" name=\"uploadify\" id=\"uploadify\" />";
			}
		}else{
			cell.innerHTML = "";
		}
	}
	
	function btnUpload_onClick(){
		currentSubWin = openSubWin("pageWinId1", "导入文件", "/fpages/hf/jsp/download.jsp?fileflag=feedback","500","180");
	}
	
	function btnImport_onClick(){
		currentSubWin = openSubWin("pageWinId1", "导入文件", "/fpages/hf/jsp/import.jsp?fileflag=feedback","500","180");
	}
</script>
</@CommonQueryMacro.page>