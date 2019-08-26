<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑数据信息">
<#assign op=RequestParameters["op"]?default("")>
<#assign id=RequestParameters["id"]?default("")>
<#assign reportId=RequestParameters["reportId"]?default("")>
<#assign workDate=RequestParameters["workDate"]?default("")>
<script type='text/javascript' src='${contextPath}/dwr/interface/AMLReportDel.js'> </script>
<table width="100%" align="center" >
     <tr>
      	<td>
		    <@CommonQueryMacro.GroupBox id="guoup1" label="可疑报文主体信息" expand="true">
			<table width="100%" >
			 	<tr>			      	
			      	<td>
					    <@CommonQueryMacro.CommonQuery id="AmlBSUploadBakApproveInfo" init="true" submitMode="all" navigate="false" insertOnEmpty="true">
							<table width="100%" >
							 	<tr>
							      	<td  align="left">
											<table frame=void class="grouptable" width="100%">
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构名称</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="finm"/></td>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构所在地区行政区划代码</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="firc"/></td>
												</tr>
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构代码</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="ficd"/></td>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构代码类型</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="fict"/></td>
													
												</tr>
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">工作日期</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="workDate"/></td>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">可疑程度</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="ssdg"/></td>
												</tr>
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">可疑报文类型</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="reportType"/></td>
												</tr>
												<tr>
													<td colspan="1" align="right" nowrap class="labeltd">可疑交易特征</td>
													<td colspan="3" class="datatd"><div id="multiCheckboxSTCR" style="height:150px;width:928px;overflow:auto;line-height:24px;"></div></td>
												</tr>
												<tr>
													<td>&nbsp; &nbsp;</td>
												</tr>
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">采取措施</td>
													<td width="85%" colspan="3" class="datatd"><@CommonQueryMacro.SingleField fId="tkms"/></td>
												</tr>
												<tr>
													<td>&nbsp; &nbsp;</td>
												</tr>
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">可疑行为描述</td>
													<td width="85%" colspan="3" class="datatd"><@CommonQueryMacro.SingleField fId="ssds"/></td>
												</tr>
											</table>
							        </td>
							    </tr>			   
							</table>
						</@CommonQueryMacro.CommonQuery>
			       	</td>
				</tr>
			</table>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
    <tr>
        <td id="cust">
            <@CommonQueryMacro.GroupBox id="guoup1" label="可疑主体客户信息" expand="true">
                <@CommonQueryMacro.CommonQuery id="AmlBSCusUpload2Bak"   init="true" submitMode="all" navigate="false"  >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
								<@CommonQueryMacro.DataTable id ="CustDatatable" paginationbar=""  readonly="false"
								fieldStr="select,csnm[150],reportId,workDate,isComp,senm[200],setp[250],seid[250],cttp[250],sctl[250],sear[250],seei[250],stnt[200],sevc[250],rgcp[250],srnm[250],srit[250],critDesc[300],srid[200]"  width="100%" />
                            </td>
                        </tr>
                    </table>
                </@CommonQueryMacro.CommonQuery>
            </@CommonQueryMacro.GroupBox>
        </td>
    </tr>    
    <tr>
        <td id="trans">
            <@CommonQueryMacro.GroupBox id="guoup1" label="可疑主体交易信息" expand="true">
                <@CommonQueryMacro.CommonQuery id="AmlBSTransUpload2Bak"   init="true" submitMode="all" navigate="false" insertOnEmpty="true" >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
                               <@CommonQueryMacro.DataTable id ="TransactionDatatable" paginationbar=""   readonly="false"
                               fieldStr="select,ticd[250],reportId,workDate,isComp,csnm[150],ctnm[200],citp[200],ctid[120],catp[220],ctac[120],oatm[150],catm[150],tstm[200],trcd[200],trcdSuffix[200],tstp[230],tsct[200],tsdr[80],crsp[250],crtp[150],crat[100],cfin[250],cfct[200],cfic[150],cfrc[200],cfrcSuffix[250],tcnm[250],tcit[200],tcid[150],tcat[250],tcac[150]" width="100%" />
                            </td>
                        </tr>
                    </table>
                </@CommonQueryMacro.CommonQuery>
            </@CommonQueryMacro.GroupBox>
        </td>
    </tr>
     <tr>
        <td id="files">
            <@CommonQueryMacro.GroupBox id="guoup1" label="可疑报文附件信息" expand="true">
                <@CommonQueryMacro.CommonQuery id="AmlBsFileUpload2Bak"   init="true" submitMode="all" navigate="false" insertOnEmpty="true" >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
                                 <@CommonQueryMacro.DataTable id ="FileDatatable" paginationbar=""  width="100%"  readonly="false" fieldStr="select,reportId,workDate,filename[500],filesize,uploadtlr,uploadtm[160]" />
                            </td>
                        </tr>
                    </table>
                </@CommonQueryMacro.CommonQuery>
            </@CommonQueryMacro.GroupBox>
        </td>
    </tr>
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSUploadBakApproveInfo" init="false" submitMode="all" navigate="false" insertOnEmpty="true">                               
                <table width="100%" align="left" cellpadding="2">
                    <tr>
                        <td align="center" style="padding-left:10px;padding-top:6px;" colspan="3">
                        </td>
                    </tr>
                </table>
            </@CommonQueryMacro.CommonQuery>
        <td>                                                
    </tr>
    <tr>
		<td align="left" colspan="3">
			<center>
			<@CommonQueryMacro.Button id="btApprove"/>
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
		</td>
	</tr>
	
	 <tr>
		<td >
		  <@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="200" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		  <div align="center">
		     <@CommonQueryMacro.GroupBox id="group2" label="审核信息" expand="true">
			<table frame="void" class="grouptable" width="100%">
				<tr>
					<td width="25%" colspan="1" align="right" nowrap class="labeltd">审核状态</td>
					<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveStatusChoose"/></td>			
				</tr>
				<tr>
					<td width="25%" colspan="1" align="right" nowrap class="labeltd">审核说明</td>
					<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveResultChoose"/></td>			
				</tr>
				<tr>
					<td width="25%" id="specialTypeLable" colspan="1" align="right" nowrap class="labeltd">生成特殊报文类型</td>
					<td width="25%" class="datatd" id="specialType"><@CommonQueryMacro.SingleField fId="specialType"/></td>			
				</tr>
			</table>
			<@CommonQueryMacro.Button id= "btSubmit"/>
			<@CommonQueryMacro.Button id= "btCancel"/>
			</@CommonQueryMacro.GroupBox>
		 </div>
		 </@CommonQueryMacro.FloatWindow>
	  </td>
  	</tr>
</table>

<script language="javascript">
    var op = "${op}";
    var reportId = "${reportId}";
    var id = "${id}";
    <#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
    <#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
    <#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
    var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
    function initCallGetter_post(dataset) {
    
    	AmlBSUploadBakApproveInfo_dataset.setValue("reportId",reportId);
		var stcr = AmlBSUploadBakApproveInfo_dataset.getValue("stcr");
		var stcrReadOnlyFlag = true;
		if("new"==op || "update"==op) {
			stcrReadOnlyFlag = false;
		}
        checkbox_datadic.init("AML","STCR","multiCheckboxSTCR",stcr,stcrReadOnlyFlag);
        if(op=='detail'){
        	//详细页面设置只读、按钮隐藏
        	//AmlBSUploadBakApproveInfo_dataset.setAllFieldsReadOnly(true);
        	AmlBSCusUpload2Bak_dataset.setAllFieldsReadOnly(true);
        	AmlBSTransUpload2Bak_dataset.setAllFieldsReadOnly(true);
        	AmlBsFileUpload2Bak_dataset.setAllFieldsReadOnly(true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("finm", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("firc", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("ficd", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("fict", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("workDate", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("ssdg", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("reportType", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("tkms", true);
        	AmlBSUploadBakApproveInfo_dataset.setFieldReadOnly("ssds", true);
        	
        }
        
        document.getElementById('specialType').style.display="none";
		document.getElementById('specialTypeLable').style.display="none";
    }
    
    
	function btApprove_onClickCheck(button){
			
		   	subwindow_floatWindowAudit.show();
	   	}
	   	
	   		function btSubmit_onClickCheck() {

			var approveStatusChoose = AmlBSUploadBakApproveInfo_dataset.getValue("approveStatusChoose");
		   	var approveResultChoose = AmlBSUploadBakApproveInfo_dataset.getValue("approveResultChoose");
		   	var specialType = AmlBSUploadBakApproveInfo_dataset.getValue("specialType");
		   	if (!approveStatusChoose.length > 0) {
		   		alert("请选择审核结果！");
		   		return false;
		   	}
		   	if (approveStatusChoose == "02" && approveResultChoose.length < 1) {
		   		alert("审核结果不通过，审核说明必须填写！");
		   		return false;
		   	}
		   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
			   	alert("审核说明过长，请修改！");
			   	return false;
		   	}
		   	
		   	//if (approveStatusChoose == "02" && specialType.length < 1) {
		   	//	alert("审核结果不通过，必须选择生成特殊报文类型！");
		   	//	return false;
		   	//}
		   	
		   	AmlBSUploadBakApproveInfo_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		   	AmlBSUploadBakApproveInfo_dataset.setParameter("approveResultChoose",approveResultChoose);
		    AmlBSUploadBakApproveInfo_dataset.setParameter("specialType",specialType);
			subwindow_floatWindowAudit.hide();
		}
		
		
		function btSubmit_postSubmit() {
			alert("审核成功");
			flushPage();
		}
		
		function btCancel_onClick(){
	       subwindow_floatWindowAudit.close();
	    }
	    
	    /*3号令上线 2号令自查不通过不需要生成特殊报文*/
	    /*
		function approveStatusChoose_DropDown_onSelect(dropDown,record,editor){
		  if(record[0]=="02"){
		 	 document.getElementById('specialType').style.display="";
			 document.getElementById('specialTypeLable').style.display="";
		  }else{
		  	 document.getElementById('specialType').style.display="none";
			 document.getElementById('specialTypeLable').style.display="none";
		  }
		  return true;
		}
		*/
	
		
   
	
    
    //返回
    function btBack_onClick() {
        closeWin();
    }
    
    
    
    //客户信息模块
    //客户号链接
	function CustDatatable_csnm_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			var csnm = record.getValue("csnm");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail01('"+id+"')\">" + csnm + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	//链接查看详细信息
	function doDetail01(id){
		showWin("可疑主体客户信息","/fpages/hf/ftl/AmlBSCusUploadInfo2.ftl?id="+id+"&op=detail","window","flushCustData()",window);
	}
    
    //交易信息模块
    //业务标识号链接
	function TransactionDatatable_ticd_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var id = record.getValue("id");
			var ticd = record.getValue("ticd");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail02('"+id+"')\">" + ticd + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	//链接查看详细信息
	function doDetail02(id){
		showWin("可疑主体交易信息","/fpages/hf/ftl/AmlBSTransUploadInfo2.ftl?id="+id+"&op=detail","window","flushTransData()",window);
	}
    
	//将文件名称变为链接
	function FileDatatable_filename_onRefresh(cell, value, record){
		if(record){
			var filename = record.getValue("filename");
			cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:download('"+filename+"')\">"+filename+"</a> ";
		}
	}
	
	
    //刷新数据
    function flushPage(){
    	AmlBSUploadBakApproveInfo_dataset.flushData(1);
        AmlBSCusUpload2Bak_dataset.flushData(1);
        AmlBSTransUpload2Bak_dataset.flushData(1);
        AmlBsFileUpload2Bak_dataset.flushData(1);
    }
    //刷新客户信息
    function flushCustData(){
    	AmlBSCusUpload2Bak_dataset.flushData(AmlBSCusUpload2Bak_dataset.pageIndex);
    }
    //刷新交易信息
    function flushTransData(){
    	AmlBSTransUpload2Ba_dataset.flushData(AmlBSTransUpload2Ba_dataset.pageIndex);
    }
    
    //jsp页面关闭的时候刷新
    function flushFileDatatable(){
		AmlBsFileUpload2Bak_dataset.flushData(1);
	}
	
	function flushTransDatatable(){
		AmlBSTransUpload2Bak_dataset.flushData(1);
	}
	
	//时间类型转换
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
	
</script>
</@CommonQueryMacro.page>
