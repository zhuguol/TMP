<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额报文查询">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsQuery2" init="false" submitMode="all" navigate="true" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btDownload" fieldStr="ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,brNo,brNoName[260],roleName,workDate,ctnm[250],ctid[200],csnm,ctnt[200],htdt[120],finn[260],firc[260],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[200],tstm[150],tstp[150],tsct[200],tsdr,crpp[250],crtp,crat[150],traAmountCny[150],traAmountUsd[150],cfin[250],cfct[160],cfic[200],tcnm[200],tcid[200],tcat[260],tcac[150],lstUpdTlr,lstUpdTm[150]"   width="100%"  height="480"  hasFrame="true" readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
		var page = "${statics["com.huateng.report.constants.AMLConstants"].REPORT_APP_TYPE_AML}";
		var startDateFlag = sysTxdate;
		var endDateFlag = sysTxdate;
		//工作日期
		function initCallGetter_post() {
			
			AmlBHdsQuery2_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsQuery2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			
			window.setInterval(show,200);
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
			showWin("大额报文详细信息","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id=" + id + "&op=alldetail","window","flushPage()",window);
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
		 
		//刷新数据
		function flushPage(){
			AmlBHdsQuery2_dataset.flushData(AmlBHdsQuery2_dataset.pageIndex);
		}
		
		
		function btDownload_onClick(){
			window.document.getElementById("btDownload").disabled = true;
			createTimerIfNull();
			var qworkDateStart = formatDate(AmlBHdsQuery2_interface_dataset.getValue("qworkDateStart"));
			var qworkDateEnd = formatDate(AmlBHdsQuery2_interface_dataset.getValue("qworkDateEnd"));
			var crcd = AmlBHdsQuery2_interface_dataset.getValue("crcd");
			var qrecStatus = AmlBHdsQuery2_interface_dataset.getValue("qrecStatus");
			var qrepStatus = AmlBHdsQuery2_interface_dataset.getValue("qrepStatus");
			var qsourceType = AmlBHdsQuery2_interface_dataset.getValue("qsourceType");
			var qisDel = AmlBHdsQuery2_interface_dataset.getValue("qisDel");
			var qticd = AmlBHdsQuery2_interface_dataset.getValue("qticd");
			var ctac = AmlBHdsQuery2_interface_dataset.getValue("ctac");
			var csnm = AmlBHdsQuery2_interface_dataset.getValue("csnm");
			var ctid = AmlBHdsQuery2_interface_dataset.getValue("ctid");
			var tsct = AmlBHdsQuery2_interface_dataset.getValue("tsct");
			var tstp = AmlBHdsQuery2_interface_dataset.getValue("tstp");
			var crtp = AmlBHdsQuery2_interface_dataset.getValue("crtp");
			var cratUp = AmlBHdsQuery2_interface_dataset.getValue("cratUp");
			if(cratUp==undefined || cratUp=="" || cratUp==null){  
     			cratUp = "";  
			}
			var cratDown = AmlBHdsQuery2_interface_dataset.getValue("cratDown");
			if(cratDown==undefined || cratDown=="" || cratDown==null){  
     			cratDown = "";  
			}
			var qisUndo = AmlBHdsQuery2_interface_dataset.getValue("qisUndo");
			var qlstUpdTlr = AmlBHdsQuery2_interface_dataset.getValue("qlstUpdTlr");
			var sourceFlag = 2;
			
			window.location.href = "${contextPath}/filedownload/AmlBHdsQuery2DownoloadAction.do?qworkDateStart="+qworkDateStart+"&qworkDateEnd="+qworkDateEnd+"&crcd="+crcd+"&qrecStatus="+qrecStatus+"&qrepStatus="+qrepStatus+"&qsourceType="+qsourceType+"&qisDel="+qisDel+"&qticd="+qticd+"&ctac="+ctac+"&csnm="+csnm+"&ctid="+ctid+"&tsct="+tsct+"&tstp="+tstp+"&crtp="+crtp+"&cratUp="+cratUp+"&cratDown="+cratDown+"&sourceFlag="+sourceFlag+"&qisUndo="+qisUndo+"&qlstUpdTlr="+qlstUpdTlr;
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
		//判断查询日期是否变化，如果变化 判断查询开始日期和当前日期是否相差90天，是弹出提示框，否不提示
		
		
		function show(){
			var size = 90;
			var qworkDateStart =AmlBHdsQuery2_interface_dataset.getValue("qworkDateStart");
			var qworkDateEnd =AmlBHdsQuery2_interface_dataset.getValue("qworkDateEnd");
			var sysDate = new Date();
			
			if ( startDateFlag != formatDate(qworkDateStart) || endDateFlag != formatDate(qworkDateEnd)) {
				
				var iDays = (qworkDateEnd - qworkDateStart) > 0 ? (sysDate - qworkDateStart):(sysDate - qworkDateEnd);
				if(size < iDays/1000/60/60/24){
				
					alert("您所选择的日期大于"+size+"天，查询速度可能过慢请耐心等待！");
				}
				startDateFlag = formatDate(qworkDateStart);
				endDateFlag = formatDate(qworkDateEnd);
			}
			
			
		} 
	</script>
</@CommonQueryMacro.page>