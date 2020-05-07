<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.page title="员工交易监测日报">
	<@CommonQueryMacro.CommonQuery id="AStaffAcctTradM" init="false" submitMode="allchange" navigate="false" >
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
		    		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnSelect,-,btnUpdate,-,btnMould,-,btnDownLoad,-,btnUpload" fieldStr="select,opr[200],ruleCode[100],dataDate[100],branCode[100],custNo[100],custName[100],custIdCertNo[100],ctnt[100],ctar[100],staffNumber[100],staffDepartment[100],staffJobTitle[100],reportDOrM[100],appearanceTime[100],checkDate[100],investigator[100],status[100],managerName[100],invesResultByOps[100],caseId[100],reportDate[100],potentialCaseType[100],feedbackDate[100],concludedType[100],feedbackFrom[100],comfirmedSusp[100],qcComment[100],alterFlag[100],alterUar[100]" width="100%" hasFrame="true" readonly="true"/>
				</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var tlrno = "${v_tlrno}";
	//交易日期初始化
	function initCallGetter_post() {
		//交易起始日期
		AStaffAcctTradM_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradM_interface_dataset.setValue("etlDateEnd",sysTxdate);
		//员工编号
		AStaffAcctTradM_interface_dataset.setValue("staffNumbers","01");
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
		showWin("客户交易明细","/fpages/hf/form/ftl/AStaffAcctTradInfo.ftl?alertId="+alertId,"window","flushPage()",window);
	}
	
	//详情按钮
	function btnSelect_onClickCheck(button){
		var record = AStaffAcctTradM_dataset.firstUnit;
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
		showWin("告警信息、客户信息和调查信息","/fpages/hf/form/ftl/AStaffAcctTradMUpdate.ftl?alertIds="+alertIds+"&op=detail","window","flushPage()",window);
	}
	
	//修改页面
	function btnUpdate_onClickCheck(button){
		var record = AStaffAcctTradM_dataset.firstUnit;
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
				if(approveStatus == "03"){
					alert('当前记录状态为"03-自查审核成功"，不可以修改！');
					return false;
				}else{
					if(approveStatus == "00" || tlrno == recordUpdTlr){
			    		showWin("告警信息、客户信息和调查信息","/fpages/hf/form/ftl/AStaffAcctTradMUpdate.ftl?alertIds="+alertIds+"&op=update","window","flushPage()",window);
					}else{
						alert("当前记录的修改人与您匹配不上！");
						return false;
					}
				}
			}
		}
	}
	
	//邮件模板下载
	function btnMould_onClick(){
		var record = AStaffAcctTradM_dataset.firstUnit;
		var updateCount = 0;//选中的记录数
		var alertId = null;//告警号
		var custName = null;//员工姓名
		var staffNumber = null;//员工号
		var staffJobTitle = null;//员工职位
		var managerName = null;//直线经理名称
		var invesResultByOps = null;//初步调查结论
		var status = null;//调查阶段
		var url = null;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				alertId = record.getValue("alertId");//告警号
				custName = record.getValue("custName");//员工姓名
				staffNumber = record.getValue("staffNumber");//员工号
				staffJobTitle = record.getValue("staffJobTitle");//员工职位
				managerName = record.getValue("managerName");//直线经理名称
				invesResultByOps = record.getValue("invesResultByOps");//初步调查结论
				status = record.getValue("status");///调查阶段
				updateCount ++;
			}
			record = record.nextUnit;
		}
		if(updateCount == 0){
			alert("请选择需要生成邮件模板的记录！");
			return false;
		}else if(updateCount > 1){
			alert("只能选择一条记录生成邮件模板！");
			return false;
		}else{
			if(status != "03"){
				alert('调查阶段为"03-已上报GB/GF 指定部门"才能生成邮件模板！');
				return false;
			}else{
				url = encodeURI(encodeURI("/fpages/hf/jsp/AStaffAcctTradMould.jsp?alertId="+alertId+
				"&custName="+custName+
				"&staffNumber="+staffNumber+
				"&staffJobTitle="+staffJobTitle+
				"&managerName="+managerName+
				"&invesResultByOps="+invesResultByOps));
			}
			currentSubWin = openSubWin("pageWinId", "邮件模板信息", url ,"750","240");
		}
	}
	
	//数据下载
	function btnDownLoad_onClick(){
		if(confirm("确认下载数据吗?")){
			var arraySelected = new Array();　
			var AStaffAcctTradM = AStaffAcctTradM_dataset.getFirstRecord();
			while(AStaffAcctTradM){
				var selected = AStaffAcctTradM.getValue("select");
				var alertId = AStaffAcctTradM.getValue("alertId");
				var approveStatus = AStaffAcctTradM.getValue("approveStatus");
				var recordUpdTlr = AStaffAcctTradM.getValue("recordUpdTlr");
				if(selected == true){
					if(approveStatus == "00" || tlrno == recordUpdTlr){
						arraySelected.push(alertId);
					}else{
						alert("当前记录无法下载，请查看记录状态与记录修改人！");
						arraySelected = null;
						return false;
					}
				}			
				AStaffAcctTradM = AStaffAcctTradM.getNextRecord();
	   		}
	   		//交易起始日期
   			var etlDateStart = AStaffAcctTradM_interface_dataset.getString("etlDateStart");
			//交易结束日期
			var etlDateEnd = AStaffAcctTradM_interface_dataset.getString("etlDateEnd");
			//客户号
			var custNo = AStaffAcctTradM_interface_dataset.getString("custNos");
			//客户名称/姓名
			var custName = AStaffAcctTradM_interface_dataset.getString("custNames");
			//客户身份证件号码
			var custIdCertNo = AStaffAcctTradM_interface_dataset.getString("custIdCertNos");
			//记录状态
			var approveStatus = AStaffAcctTradM_interface_dataset.getString("approveStatuss");
			//员工编号
			var staffNumbers = AStaffAcctTradM_interface_dataset.getString("staffNumbers");
			//调查阶段
			var statuss = AStaffAcctTradM_interface_dataset.getString("statuss");
			//下载模板名
			var tableName = "AStaffAcctTradM";
			document.getElementById("btnDownLoad").style.display = "none";//将下载按钮置为无效
			createTimerIfNull();
			window.location.href = "${contextPath}/filedownload/AStaffAcctTradDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd+"&custNo="+custNo+"&custName="+custName+"&custIdCertNo="+custIdCertNo+"&approveStatus="+approveStatus+"&staffNumbers="+staffNumbers+"&arraySelected="+arraySelected+"&statuss="+statuss+"&tableName="+tableName;
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
		PrivAction.getExportFlag("AStaffAcctTradM",function(data){
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
		currentSubWin = openSubWin("pageWinId", "员工交易监测日报", "/fpages/hf/jsp/uploadAStaffAcctTradM.jsp?fileflag=AStaffAcctTradM","600","200");
	}
	
	//刷新数据
	function flushPage(){
		AStaffAcctTradM_dataset.flushData(AStaffAcctTradM_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>