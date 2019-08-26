<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑数据信息">
<#assign op=RequestParameters["op"]?default("")>
<#assign id=RequestParameters["id"]?default("")>
<#assign reportId=RequestParameters["reportId"]?default("")>
<script type='text/javascript' src='${contextPath}/dwr/interface/AMLReportDel.js'> </script>
<table width="100%" align="center" >
     <tr>
      	<td>
		    <@CommonQueryMacro.GroupBox id="guoup1" label="可疑报文主体信息" expand="true">
			<table width="100%" >
			 	<tr>			      	
			      	<td>
					    <@CommonQueryMacro.CommonQuery id="AmlBSDsCollInfo2" init="true" submitMode="all" navigate="false" insertOnEmpty="true">
							<table width="100%" >
							 	<tr>
							      	<td  align="left">
											<table frame=void class="grouptable" width="100%">
												<tr>
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">可疑案件编号</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="bsid"/></td>
												</tr>
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
													<td width="25%" colspan="1" align="right" nowrap class="labeltd">填报人</td>
													<td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="rpnm"/></td>
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
                <@CommonQueryMacro.CommonQuery id="AmlBSCusUpload2"   init="true" submitMode="all" navigate="false"  >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
								<@CommonQueryMacro.DataTable id ="CustDatatable" paginationbar="btAdd_Cust,-,btModCust,-,btDel_Cust"  readonly="false"
								fieldStr="select,csnm[150],reportId,workDate,isComp,ywtx,senm[200],setp[250],seid[250],cttp[250],sctl[250],sear[250],seei[250],stnt[200],sevc[250],rgcp[250],srnm[250],srit[250],critDesc[300],srid[200]"  width="100%" />
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
                <@CommonQueryMacro.CommonQuery id="AmlBSTransUpload2"   init="true" submitMode="all" navigate="false" insertOnEmpty="true" >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
                               <@CommonQueryMacro.DataTable id ="TransactionDatatable" paginationbar="btAdd_Trans,-,btChoose_Trans,-,btModTrans,-,btBatchCheck,-,btDel_Trans,-,btnUpload"   readonly="false"
                               fieldStr="select,ticd[250],reportId,workDate,isComp,csnm[150],ctnm[200],citp[200],ctid[120],catp[220],ctac[120],oatm[200],catm[200],tstm[200],trcd[200],trcdSuffix[200],tstp[230],tsct[200],tsdr[80],crsp[250],crtp[150],crat[100],cfin[250],cfct[200],cfic[150],cfrc[200],cfrcSuffix[250],tcnm[250],tcit[200],tcid[150],tcat[250],tcac[150],ccpdt" width="100%" />
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
                <@CommonQueryMacro.CommonQuery id="AmlBsFileUpload2"   init="true" submitMode="all" navigate="false" insertOnEmpty="true" >
                    <table width="100%" align="left" cellpadding="2">
                        <tr>
                            <td>
                                 <@CommonQueryMacro.DataTable id ="FileDatatable" paginationbar="btnUpload02,-,btDel_Files"  width="100%"  readonly="false" fieldStr="select,reportId,workDate,filename[500],filesize,uploadtlr,uploadtm[160]" />
                            </td>
                        </tr>
                    </table>
                </@CommonQueryMacro.CommonQuery>
            </@CommonQueryMacro.GroupBox>
        </td>
    </tr>
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSDsCollInfo2" init="false" submitMode="all" navigate="false" insertOnEmpty="true">                               
                <table width="100%" align="left" cellpadding="2">
                    <tr>
                        <td align="center" style="padding-left:10px;padding-top:6px;" colspan="3">
                            <#if (op=="new") || (op=="update")>
                           		<@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
                                <@CommonQueryMacro.Button id="btSubmit"/>&nbsp; &nbsp;
                            </#if>
                                <@CommonQueryMacro.Button id="btBack"/>
                        </td>
                    </tr>
                </table>
            </@CommonQueryMacro.CommonQuery>
        <td>                                                
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
    
    	AmlBSDsCollInfo2_dataset.setValue("reportId",reportId);
    	
		if(op=="new"){
		  AmlBSDsCollInfo2_dataset.setValue("id",id);
		  //初始化客户和交易不可见（必须先添加报文信息）
		  
	      document.getElementById('cust').style.display="none";
	      document.getElementById('trans').style.display="none";
	      document.getElementById('files').style.display="none";
	      document.getElementById('btSubmit').style.display="none";
		  
    	  //初始化
		  AmlBSDsCollInfo2_dataset.setValue("workDate",sysTxdate);
		  AmlBSDsCollInfo2_dataset.setValue("reportType","N");  //设置报文类型为普通报文
		  AmlBSDsCollInfo2_dataset.setValue("fict","00");
        }
		var stcr = AmlBSDsCollInfo2_dataset.getValue("stcr");
		var stcrReadOnlyFlag = true;
		if("new"==op || "update"==op) {
			stcrReadOnlyFlag = false;
		}
        checkbox_datadic.init("AML","STCR","multiCheckboxSTCR",stcr,stcrReadOnlyFlag);
        if(op=='detail'){
        	//详细页面设置只读、按钮隐藏
        	AmlBSDsCollInfo2_dataset.setAllFieldsReadOnly(true);
            document.getElementById('btAdd_Trans').style.display="none";
            document.getElementById('btBatchCheck').style.display="none";
            document.getElementById('btModTrans').style.display="none";
            document.getElementById('btModCust').style.display="none";
            document.getElementById('btAdd_Cust').style.display="none";
            document.getElementById('btDel_Trans').style.display="none";
            document.getElementById('btDel_Cust').style.display="none";
            document.getElementById('btDel_Files').style.display="none";
            document.getElementById('btnUpload').style.display="none";
            document.getElementById('btnUpload02').style.display="none";
            document.getElementById('btChoose_Trans').style.display="none";
        }
    }
    
    //上报
    function btSubmit_onClickCheck(button) {
		//可疑特征
		var stcrs = checkbox_datadic.getCheckVal("STCR");
		var num = checkbox_datadic.getCheckedNum("STCR");
		if(num == 0) {
			alert("可疑交易特征不能为空！");
			return false;
		}
		if(num > 6) {
			alert("可疑交易特征不能超过6个！");
			return false;
		}
		AmlBSDsCollInfo2_dataset.setValue("stcr",stcrs);
		return true;
	}
	
    function btSubmit_postSubmit(button){
        alert("上报成功!");
        closeWin(true);
    }
    
    //暂存
    function btSave_onClickCheck(button) {
        var stcrs = checkbox_datadic.getCheckVal("STCR");
		var num = checkbox_datadic.getCheckedNum("STCR");
		if(num == 0) {
			alert("可疑交易特征不能为空！");
			return false;
		}
		if(num > 6) {
			alert("可疑交易特征不能超过6个！");
			return false;
		}
		AmlBSDsCollInfo2_dataset.setValue("stcr",stcrs);
		return true;
	}
	
	function btSave_postSubmit(button){
	   if(document.getElementById('cust').style.display=="none"){
		     if(confirm("保存成功，是否继续补录可疑客户和交易信息！")){
		    	  document.getElementById('cust').style.display="";
			      document.getElementById('trans').style.display="";
			      document.getElementById('files').style.display="";
			      document.getElementById('btSubmit').style.display="";
			      flushPage();
		     }else{
		     	alert("暂存成功!");
		     	closeWin(true);
		     }
	   }else{
	  	  alert("暂存成功!");
	      closeWin(true);
	   }
    }
    
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
    //新增客户
    function btAdd_Cust_onClick(){
    	var workDate = AmlBSDsCollInfo2_dataset.getValue("workDate");
    	showWin("可疑主体客户信息","/fpages/hf/ftl/AmlBSCusUploadInfo2.ftl?op=new&reportId="+reportId+"&workDate="+formatDate(workDate),"window","flushCustData()",window);
    }
    
    //补录客户
	function btModCust_onClickCheck(button){
		var record = AmlBSCusUpload2_dataset.firstUnit;
		var chk=0;
		var id;
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要修改的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}
		showWin("可疑主体客户信息","/fpages/hf/ftl/AmlBSCusUploadInfo2.ftl?id=" + id + "&op=mod","window","flushCustData()",window);
	}
	
	 //删除客户
	function btDel_Cust_onClickCheck(button){
		var record = AmlBSCusUpload2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要删除的记录！");
			return false;
		}else{
		  	return true;
		}
	}
	
	function btDel_Cust_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlBSCusUpload2_dataset.flushData(AmlBSCusUpload2_dataset.pageIndex);
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
    //新增交易
    function btAdd_Trans_onClick(){
    	var workDate = AmlBSDsCollInfo2_dataset.getValue("workDate");
    	showWin("可疑主体交易信息","/fpages/hf/ftl/AmlBSTransUploadInfo2.ftl?op=new&reportId="+reportId+"&workDate="+formatDate(workDate),"window","flushTransData()",window);
    }
    
    //选择可疑交易
	function btChoose_Trans_onClick(button){
		var workDate = formatDate(AmlBSDsCollInfo2_dataset.getValue("workDate"));
		showWin("选择可疑交易","/fpages/hf/ftl/AmlBSTrans.ftl?reportId="+reportId+"&workDate="+workDate,"window","flushTransData()",window);
	}
    
    //补录交易
	function btModTrans_onClickCheck(button){
		var record = AmlBSTransUpload2_dataset.firstUnit;
		var chk=0;
		var id;
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要修改的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}
		showWin("可疑主体交易信息","/fpages/hf/ftl/AmlBSTransUploadInfo2.ftl?id=" + id + "&op=mod","window","flushTransData()",window);
	}
	
	 //删除交易
	function btDel_Trans_onClickCheck(button){
		var record = AmlBSTransUpload2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要删除的记录！");
			return false;
		}else{
		  	return true;
		}
	}
	
	function btDel_Trans_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlBSTransUpload2_dataset.flushData(AmlBSTransUpload2_dataset.pageIndex);
    }
	
    //批量校验交易信息
	function btBatchCheck_onClickCheck(button){
		var record = AmlBSTransUpload2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要校验的记录！");
			return false;
		}else{
		  	return true;
		}
    }
    
    //批量校验结果返回
    function btBatchCheck_postSubmit(button){
    	var retParam = button.returnParam;
    	alert(retParam.msg+"!");
    	AmlBSTransUpload2_dataset.flushData(AmlBSTransUpload2_dataset.pageIndex);
    }
    
    //交易批量导入
	function btnUpload_onClick(){
		currentSubWin = openSubWin("pageWinId", "批量导入交易信息", "/fpages/hf/jsp/uploadBS.jsp?fileflag=AMLBsTrans&reportId="+reportId+"&workDate="+formatDate(AmlBSDsCollInfo2_dataset.getValue("workDate")),"550","200","",true,flushTransDatatable(),false);
	}

    
	
	//附件模块
	//上传附件
	function btnUpload02_onClick(){
		currentSubWin = openSubWin("pageWinId1", "上传附件", "/fpages/hf/jsp/upload01.jsp?fileflag=AMLBsDoc&reportId="+reportId+"&workDate="+formatDate(AmlBSDsCollInfo2_dataset.getValue("workDate")),"550","200","",true,flushFileDatatable(),false);
	}
	function refresh(){
        AmlBsFileUpload2_dataset.flushData(1);
    }
	//将文件名称变为链接
	function FileDatatable_filename_onRefresh(cell, value, record){
		if(record){
			var filename = record.getValue("filename");
			cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:download('"+filename+"')\">"+filename+"</a> ";
		}
	}
	
	//点击文件链接下载文件
	function download(fileURL){
		window.location.href = "${contextPath}/filedownload/FileDownloadAction.do?downloadinfo="+encodeURI(encodeURI(fileURL));
	}
	
	
	 //删除附件
	function btDel_Files_onClickCheck(button){
		var record = AmlBsFileUpload2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要删除的记录！");
			return false;
		}else{
		  	return true;
		}
	}
	
	function btDel_Files_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlBsFileUpload2_dataset.flushData(AmlBsFileUpload2_dataset.pageIndex);
    }
	
    //刷新数据
    function flushPage(){
    	AmlBSDsCollInfo2_dataset.flushData(1);
        AmlBSCusUpload2_dataset.flushData(1);
        AmlBSTransUpload2_dataset.flushData(1);
        AmlBsFileUpload2_dataset.flushData(1);
    }
    //刷新客户信息
    function flushCustData(){
    	AmlBSCusUpload2_dataset.flushData(AmlBSCusUpload2_dataset.pageIndex);
    }
    //刷新交易信息
    function flushTransData(){
    	AmlBSTransUpload2_dataset.flushData(AmlBSTransUpload2_dataset.pageIndex);
    }
    
    //jsp页面关闭的时候刷新
    function flushFileDatatable(){
		AmlBsFileUpload2_dataset.flushData(1);
	}
	
	function flushTransDatatable(){
		AmlBSTransUpload2_dataset.flushData(1);
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
