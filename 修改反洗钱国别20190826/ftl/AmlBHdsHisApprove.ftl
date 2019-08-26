<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易查询">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsHisApprove" init="false" submitMode="all" navigate="false" >
			<table align="left"  width="100%">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="8"/>
					</td>
				</tr>

				<tr>
					<td valign="top">
						<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
					</td>
		    	</tr>

		    	<tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btDownload,-,btApprove" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,brNo,brNoName[260],workDate,ctnm[200],ctid[200],csnm,ctnt[200],htdt[120],finn[260],firc[260],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[200],tstm[150],tstp[150],tsct[200],tsdr,crpp[250],crtp,crat[150],traAmountCny[150],traAmountUsd[150],cfin[250],cfct[160],cfic[200],tcnm[200],tcid[200],tcat[260],tcac[150],lstUpdTm[150],lstUpdTlr,filler2,filler3[180],approveUpdTlr,approveUpdTm[120]"   width="100%"  height="480"  hasFrame="true"  readonly="true"/>
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
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var page = "${statics["com.huateng.report.constants.AMLConstants"].REPORT_APP_TYPE_AML}";
		//工作日期
		function initCallGetter_post() {
			AmlBHdsHisApprove_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsHisApprove_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			
			document.getElementById('specialType').style.display="none";
			document.getElementById('specialTypeLable').style.display="none";
		}
		
		//交易标识号链接
		function datatable1_ticd_onRefresh(cell,value,record) {
			if (record) {//当存在记录时
				var id = record.getValue("id");
				var ticd = record.getValue("ticd");
				cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + ticd + "</a>"
			} else {
				cell.innerHTML="&nbsp;";
			}
		}
		
		//详细信息
		function doDetail(id){
			//showWin("大额交易信息管理明细","/fpages/hf/ftl/AmlBHdsHisAdd.ftl?id=" + id + "&op=detail","window","flushPage()",window);
			showWin("大额交易信息管理明细","/fpages/hf/ftl/AmlBhbsDsBakMirror.ftl?id=" + id + "&op=detail","window","flushPage()",window);
		}
		
		//交易方式下拉框
		function tstp_DropDown_beforeOpen(dropDown){
	    	BiTreeDataDicSelect_DropDownDataset.setParameter("codeType","TSTP");
	    	BiTreeDataDicSelect_DropDownDataset.setParameter("headDataTypeNo","9999");
		}
		
		//涉外收支交易分类与代码属性下拉框
	 	function tsct_DropDown_beforeOpen(dropDown){
	        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("headDataTypeNo","02");
	        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("codeType","AML");
		 }
		 
		 function btApprove_onClickCheck(button){
			var hasSelected = false;
			var hasAudit = false;
			var record = AmlBHdsHisApprove_dataset.getFirstRecord();
			while(record){
				var v_selected = record.getValue("select");
				var v_approveStatus = record.getValue("filler2");
				if( v_selected == true ){
					hasSelected=true;
					if (v_approveStatus != "00") {
						hasAudit = true;
					}
				}
				record=record.getNextRecord();
		   	}
		   	if (!hasSelected) {
		   		alert("请选择相应的记录！");
		   		return false;
		   	}
		   	subwindow_floatWindowAudit.show();
	   	}
	   	
	   	function btSubmit_onClickCheck() {

			var approveStatusChoose = AmlBHdsHisApprove_dataset.getValue("approveStatusChoose");
		   	var approveResultChoose = AmlBHdsHisApprove_dataset.getValue("approveResultChoose");
		   	var specialType = AmlBHdsHisApprove_dataset.getValue("specialType");
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
		   	/*
		   	if (approveStatusChoose == "02" && specialType.length < 1) {
		   		alert("审核结果不通过，必须选择生成特殊报文类型！");
		   		return false;
		   	}
		   	*/
		   	AmlBHdsHisApprove_dataset.setParameter("approveStatusChoose",approveStatusChoose);
		   	AmlBHdsHisApprove_dataset.setParameter("approveResultChoose",approveResultChoose);
		    AmlBHdsHisApprove_dataset.setParameter("specialType",specialType);
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
	    
	    //刷新数据
		function flushPage(){
			AmlBHdsHisApprove_dataset.flushData(AmlBHdsHisApprove_dataset.pageIndex);
			document.getElementById('specialType').style.display="none";
			document.getElementById('specialTypeLable').style.display="none";
		}
		
		
		//大额自查审核页面导出
		function btDownload_onClick(){
			window.document.getElementById("btDownload").disabled = true;
			createTimerIfNull();
			var qworkDateStart = formatDate(AmlBHdsHisApprove_interface_dataset.getValue("qworkDateStart"));
			var qworkDateEnd = formatDate(AmlBHdsHisApprove_interface_dataset.getValue("qworkDateEnd"));
			var crcd = AmlBHdsHisApprove_interface_dataset.getValue("crcd");
			var qrecStatus = AmlBHdsHisApprove_interface_dataset.getValue("qrecStatus");
			var filler2 = AmlBHdsHisApprove_interface_dataset.getValue("filler2");
			var qsourceType = AmlBHdsHisApprove_interface_dataset.getValue("qsourceType");
			var qisDel = AmlBHdsHisApprove_interface_dataset.getValue("qisDel");
			var qticd = AmlBHdsHisApprove_interface_dataset.getValue("qticd");
			var ctac = AmlBHdsHisApprove_interface_dataset.getValue("ctac");
			var csnm = AmlBHdsHisApprove_interface_dataset.getValue("csnm");
			var ctid = AmlBHdsHisApprove_interface_dataset.getValue("ctid");
			var tsct = AmlBHdsHisApprove_interface_dataset.getValue("tsct");
			var tstp = AmlBHdsHisApprove_interface_dataset.getValue("tstp");
			var crtp = AmlBHdsHisApprove_interface_dataset.getValue("crtp");
			var cratUp = AmlBHdsHisApprove_interface_dataset.getValue("cratUp");
			if(cratUp==undefined || cratUp=="" || cratUp==null){  
     			cratUp = "";  
			}
			var cratDown = AmlBHdsHisApprove_interface_dataset.getValue("cratDown");
			if(cratDown==undefined || cratDown=="" || cratDown==null){  
     			cratDown = "";  
			}
			var sourceFlag = 2;
			
			window.location.href = "${contextPath}/filedownload/AmlBHdsHisApproveDownoloadAction.do?qworkDateStart="+qworkDateStart+"&qworkDateEnd="+qworkDateEnd+"&crcd="+crcd+"&qrecStatus="+qrecStatus+"&filler2="+filler2+"&qsourceType="+qsourceType+"&qisDel="+qisDel+"&qticd="+qticd+"&ctac="+ctac+"&csnm="+csnm+"&ctid="+ctid+"&tsct="+tsct+"&tstp="+tstp+"&crtp="+crtp+"&cratUp="+cratUp+"&cratDown="+cratDown+"&sourceFlag="+sourceFlag;
		}
		
		
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
		
		var timer = null;
		function createTimerIfNull(){
			if(timer==null){
				timer = window.setInterval(function(){
				try{
					getExportStatus();
				}catch(e){}},500);//刷新时间 
			}
		}
		
		function getExportStatus(){
			PrivAction.getExportFlag(page,function(data){
					exportCallBack(data);
				});
		}
			
		function exportCallBack(data){
			if(data!=null){
				window.document.getElementById("btDownload").disabled = false;
				if(timer!=null){
					window.clearInterval(timer);
					timer=null;
				}
			}
		}
	</script>
</@CommonQueryMacro.page>