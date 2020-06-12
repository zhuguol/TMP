<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="员工交易监测月报">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradMRRB" init="false" submitMode="allchange" navigate="false" >
		<table align="left"  width="100%">
			<tr>
				<td colspan="2">
					<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="4"/>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
				</td>
		    </tr>
		    <tr>
		    	<td colspan="2">
		    		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnUpdate,-,btnDownLoad,-,btnUpload" fieldStr="select,opr[150],ruleCode[80],dataDate[80],branCode[70],custNo[80],custName[90],custIdCertNo[130],ctnt[80],ctar[220],staffNumber[80],staffDepartment[110],staffJobTitle[100],reportDOrM[80],appearanceTime[150],checkDate[90],investigator[90],status[100],managerName[100],invesResultByOps[120],caseId[120],reportDate[90],potentialCaseType[120],feedbackDate[90],concludedType[120],feedbackFrom[150],comfirmedSusp[120],alterUar[150],alterFlag[120],approveStatus[120],recordUpdTlr[120]" width="100%" height="500" hasFrame="true" readonly="true"/>
				</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMM")};   
	var tlrno = "${v_tlrno}";
	//交易日期初始化
	function initCallGetter_post() {
		//交易起始日期
		AStaffAcctTradMRRB_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradMRRB_interface_dataset.setValue("etlDateEnd",sysTxdate);
		//员工编号
		AStaffAcctTradMRRB_interface_dataset.setValue("staffNumbers","01");
	}
	
	//设置客户编号链接
	function datatable_opr_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var alertId = record.getValue("alertId");//标识信息
			var approveStatus = record.getValue("approveStatus");//记录状态
			if(alertId != ""){
				cell.innerHTML = "<a href=\"JavaScript:doDetail('" + alertId + "')\">" + alertId + "</a>";
			}else{
				cell.innerHTML = "&nbsp;";
			}
		}
	}
	
	//链接查看详细信息
	function doDetail(alertId){
		showWin("客户交易明细","/fpages/hf/form/ftl/AStaffAcctTradInfoRRB.ftl?alertId="+alertId,"window","flushPage()",window);
	}
	
	//详情按钮
	function btnSelect_onClickCheck(button){
		var record = AStaffAcctTradMRRB_dataset.firstUnit;
		var updateCount = 0;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				alertIds = record.getValue("alertId");
				updateCount ++;
			}
			record=record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要查看详情的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录进行查看详情！");
			return false;
		}
		showWin("告警信息、客户信息和调查信息","/fpages/hf/form/ftl/AStaffAcctTradMRRBUpdate.ftl?alertIds="+alertIds+"&op=detail","window","flushPage()",window);
	}
	
	//修改页面
	function btnUpdate_onClickCheck(button){
		var record = AStaffAcctTradMRRB_dataset.firstUnit;
		var updateCount = 0;
		var alertIds;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				var recordUpdTlr = record.getValue("recordUpdTlr");//记录修改人
				var approveStatus = record.getValue("approveStatus");//记录状态
				var staffNumber = record.getValue("staffNumber");//员工编号
				alertIds = record.getValue("alertId");//告警号
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要修改的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录进行修改！");
			return false;
		}else{
			if(staffNumber == ""){
				alert("当前记录的员工编号为空，您不能进行修改操作！");
				return false;
			}else{
				if(approveStatus == "00" || tlrno == recordUpdTlr){
			    	showWin("告警信息、客户信息和调查信息","/fpages/hf/form/ftl/AStaffAcctTradMRRBUpdate.ftl?alertIds="+alertIds+"&op=update","window","flushPage()",window);
				}else{
					alert("当前记录的修改人与您匹配不上！");
					return false;
				}
			}
		}
	}
	
	//数据下载
	function btnDownLoad_onClick(){
		if(confirm("确认下载数据吗?")){
			var flag = false;
			var arraySelected = new Array();　
			var aStaffAcctTradMRRB = AStaffAcctTradMRRB_dataset.getFirstRecord();
			while(aStaffAcctTradMRRB){
				var selected = aStaffAcctTradMRRB.getValue("select");
				var alertId = aStaffAcctTradMRRB.getValue("alertId");
				var approveStatus = aStaffAcctTradMRRB.getValue("approveStatus");
				var status = aStaffAcctTradMRRB.getValue("status");
				var recordUpdTlr = aStaffAcctTradMRRB.getValue("recordUpdTlr");
				if(selected == true){
					flag = true;
					if(approveStatus == "00" || tlrno == recordUpdTlr){
						if(status == "02"){
							alert("告警号：'"+ alertId +"'的记录调查阶段为：'02-Closed by FCTM'不可以下载！");
							arraySelected = null;
							return false;
						}else if(status == "03"){
							alert("告警号：'"+ alertId +"'的记录调查阶段为：'03-Closed by President'不可以下载！");
							arraySelected = null;
							return false;
						}else if(status == "04"){
							alert("告警号：'"+ alertId +"'的记录调查阶段为：'04-Closed by VPHOST'不可以下载！");
							arraySelected = null;
							return false;
						}else{
							arraySelected.push(alertId);
						}
					}else{
						alert("请查看告警号为：'"+ alertId +"'的记录状态与记录修改人！");
						arraySelected = null;
						return false;
					}
				}			
				aStaffAcctTradMRRB = aStaffAcctTradMRRB.getNextRecord();
	   		}
	   		//交易起始日期
   			var etlDateStart = AStaffAcctTradMRRB_interface_dataset.getString("etlDateStart");
			//交易结束日期
			var etlDateEnd = AStaffAcctTradMRRB_interface_dataset.getString("etlDateEnd");
			//客户号
			var custNo = AStaffAcctTradMRRB_interface_dataset.getString("custNos");
			//客户名称/姓名
			var custName = AStaffAcctTradMRRB_interface_dataset.getString("custNames");
			//客户身份证件号码
			var custIdCertNo = AStaffAcctTradMRRB_interface_dataset.getString("custIdCertNos");
			//记录状态
			var approveStatus = AStaffAcctTradMRRB_interface_dataset.getString("approveStatuss");
			//员工编号
			var staffNumbers = AStaffAcctTradMRRB_interface_dataset.getString("staffNumbers");
			//告警号
			var alertIds = AStaffAcctTradMRRB_interface_dataset.getString("alertIds");
			//调查阶段
			var statuss = AStaffAcctTradMRRB_interface_dataset.getString("statuss");
			if(!flag){
				if(statuss == "02"){
					alert("调查阶段为：'02-Closed by FCTM'的记录不可以下载！");
					return false;
				}else if(statuss == "03"){
					alert("请查看告警号为：'03-Closed by President'的记录不可以下载！");
					return false;
				}else if(statuss == "04"){
					alert("请查看告警号为：'04-Closed by VPHOST'的记录不可以下载！");
					return false;
				}
			}
			//下载模板名
			var tableName = "AStaffAcctTradMRRB";
			document.getElementById("btnDownLoad").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = "${contextPath}/filedownload/AStaffAcctTradRRBDownloadAction.do?etlDateStart="+etlDateStart
			+"&etlDateEnd="+etlDateEnd+"&custNo="+custNo+"&custName="+custName+"&custIdCertNo="+custIdCertNo
			+"&approveStatus="+approveStatus+"&staffNumbers="+staffNumbers+"&arraySelected="+arraySelected
			+"&statuss="+statuss+"&alertIds="+alertIds+"&tableName="+tableName;
		}
		return false;
	}
	
	//下载等待
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
		PrivAction.getExportFlag("AStaffAcctTradMRRB",function(data){
			exportCallBack(data);
		});
	}
	
	function exportCallBack(data){
		if(data!=null){
			document.getElementById("btnDownLoad").style.display = "";
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
	
	//上传数据
	function btnUpload_onClick(){
		currentSubWin = openSubWin("pageWinId", "员工交易监测月报", "/fpages/hf/jsp/uploadAStaffAcctTradRRB.jsp?fileflag=AStaffAcctTradMRRB","600","200");
	}
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradMRRB_dataset.flushData(AStaffAcctTradMRRB_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>