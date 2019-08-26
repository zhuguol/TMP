<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="" >
<table  width="1000px" align="left">
<tr>
<td width="100%"  valign="top" colspan="2">
<@CommonQueryMacro.CommonQuery id="AmlReportDataPackageQuery" init="false" submitMode="current" navigate="false">
<table width="100%">
  <tr>
		<td>
			<@CommonQueryMacro.Interface id="interface" label="上报数据包查询" colNm="4"/>
		</td>
</tr>
</table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr>
<tr>
<td width="600" valign="top">
<@CommonQueryMacro.CommonQuery id="AmlReportDataPackageQuery" mode="1" navigate="true" >
<table width="100%">
	<h5 align="center">上报文件包信息</h5>
	<tr>
  	<td><@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="10"/></td>
  </tr>
  <tr>
    <td>
    <@CommonQueryMacro.DataTable id="receiptFile" paginationbar="-,btExpSubFile" fieldStr="packName[220],workDate,crtDate[150],fileCount[60],isSub,subType[70],feedBackDate[150],isHashFeedBack"  width="750" readonly="true"  hasFrame="true" height="300"/>
    </td>
  </tr>
</table>
</@CommonQueryMacro.CommonQuery>
</td>
<td  width="600" valign="top">
<@CommonQueryMacro.CommonQuery id="AmlReportDataPackageQueryDetail" init="false" submitMode="all" navigate="false">
<table width="100%">
<h5 align="center">上报文件详细信息</h5>
  <tr>
  	<td><@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="10"/></td>
  </tr>
  <tr>
    <td>
    <@CommonQueryMacro.DataTable id="receiptFile1" paginationbar="-,btErr" fieldStr="id[270],totalrecords[60],sucrecords[60],falrecords[60]"  width="550" readonly="true"  hasFrame="true" height="300"/>
    </td>
  </tr>
  <tr>
  	<td>
	<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		<div align="center">
			<@CommonQueryMacro.Group id="group1" label="上报数据包查询详细"
			  fieldStr="id,brNo,workdate,crtTm,repFileName,repTm,filePack,repErrType,totalrecords,sucrecords,falrecords,isImpRep" colNm=4/>
			 </br>
		</div>
	 </@CommonQueryMacro.FloatWindow>
  	</td>
  </tr>
</table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr></table>
<iframe id="filedownloadfrm"  style="display: none;"></iframe>
<script type="text/javascript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};
	
	function initCallGetter_post(){
		//interface里查询的设置工作日期默认当天
		btErr.disable(true);
		btExpSubFile.disable(true);
		//btExpRepFile.disable(true);
		AmlReportDataPackageQuery_interface_dataset.setValue("qworkdateStart",sysTxdate);
		AmlReportDataPackageQuery_interface_dataset.setValue("qworkdateEnd",sysTxdate);
//		AmlReportDataPackageQuery_interface_dataset.setValue("qbusiType","02");
	}

     	//定位一条记录
	function locate(id) {
		var record = AmlReportDataPackageQueryDetail_dataset.find(["id"],[id]);
		if (record) {
			AmlReportDataPackageQueryDetail_dataset.setRecord(record);
		}
	}

	function qappType_DropDown_beforeOpen(dropDown){
	     var type=AmlReportDataPackageQuery_interface_dataset.getValue("qbusiType");
	     if(type.length>0){
	     	AppTypeSelect_DropDownDataset.setParameter("type",type);
	     }
	     qappType_DropDown.cached=false;
	}
	function qbusiType_DropDown_onSelect(dropDown,record,editor){
	    var selId=record.getValue("data");
	    var oldId = AmlReportDataPackageQuery_interface_dataset.getValue("qbusiType");
	    if(selId!=oldId){
	    	AmlReportDataPackageQuery_interface_dataset.setValue2("qappType","");
	   	}
	    return true;
	}


     //当系统刷新单元格的内容时被触发
	function receiptFile1_id_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			cell.innerHTML = "<center><a href=\"JavaScript:showDetail('"+id+"')\">"+value+"</a></center>";
		}else{
			//记录不存在的时候
			cell.innerHTML = "&nbsp;";
		}
	}

    function showDetail(id){
    	locate(id);
    	var tid = AmlReportDataPackageQueryDetail_dataset.getValue("id");
    	var errType= AmlReportDataPackageQueryDetail_dataset.getValue("repErrType");
    	var isImpRep = AmlReportDataPackageQueryDetail_dataset.getValue("isImpRep");
    	showNWindow();
    }

	function showNWindow(){
	  	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("id",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("apptype",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("currentFileName1",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("brNo",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("workdate",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("crtTm",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("repFileName",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("repTm",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("filePack",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("repErrType",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("totalrecords",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("sucrecords",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("falrecords",true);
	   	AmlReportDataPackageQueryDetail_dataset.setFieldReadOnly("isImpRep",true);
	   	subwindow_signWindow.show();
	}
    		//关浮动窗口,释放dataset
	function signWindow_floatWindow_beforeClose(subwindow) {
		AmlReportDataPackageQueryDetail_dataset.cancelRecord();
		return true;
    }
    
    function signWindow_floatWindow_beforeHide(subwindow) {
		return signWindow_floatWindow_beforeClose(subwindow);
    }

    function AmlReportDataPackageQueryDetail_dataset_afterScroll(dataset){
	  	var currentFile = AmlReportDataPackageQueryDetail_dataset.getValue("currentFile");
		var repErrType = AmlReportDataPackageQueryDetail_dataset.getValue("repErrType");
	    if (currentFile != "TT" && (repErrType == "01" || repErrType == "02")) {
			btErr.disable(false);
		} else {
			btErr.disable(true);
		}
	}

	function AmlReportDataPackageQuery_dataset_afterScroll(dataset){
		var pname = dataset.getValue("packName");
	    if(pname!=null&&pname.length>0){
	    	AmlReportDataPackageQueryDetail_dataset.setParameter("packname",pname);
	    	btExpSubFile.disable(false);
	    }else{
	    	AmlReportDataPackageQueryDetail_dataset.setParameter("packname","");
	    	btExpSubFile.disable(true);
	    }
	    AmlReportDataPackageQueryDetail_dataset.flushData(1);
	  	var sub = dataset.getValue("isHashFeedBack");
	    if (sub =='Y') {
			//btExpRepFile.disable(false);
		} else {
			//btExpRepFile.disable(true);
		}
	}

	function btErr_onClick(){
		var repErrType = AmlReportDataPackageQueryDetail_dataset.getValue("repErrType");
		var id = AmlReportDataPackageQueryDetail_dataset.getValue("id");
		if (repErrType == "01") {
			var paramMap = new Map();
		   	paramMap.put("recId", id);
		   	loadPageWindows("userWin", "回执文件信息", "/fpages/businquery/ftl/ReportAlreadySubInfo.ftl", paramMap, "winZone");
		} else {
			var paramMap = new Map();
		   	paramMap.put("recId", id);
		   	loadPageWindows("userWin", "回执文件信息", "/fpages/businquery/ftl/ReportAlreadySubInfoRecordErr.ftl", paramMap, "winZone");
		}
	}

	function downloadFile(type){
		 var apptype=AmlReportDataPackageQuery_dataset.getValue("appType");
		 var filepackName = AmlReportDataPackageQuery_dataset.getValue("packName");
		 var workdate = AmlReportDataPackageQuery_dataset.getValue("workDate");
		 var url = "${contextPath}/AMLReportDownload?workdate="+workdate+"&filepackName="+filepackName;
		 document.getElementById("filedownloadfrm").src = url;
	}

	function btExpSubFile_onClickCheck(button){
		downloadFile("send");
       	return false;
  	}
	/*
	function btExpRepFile_onClickCheck(button){
		downloadFile("feedback");
       	return false;
	}*/


</script>
</@CommonQueryMacro.page>