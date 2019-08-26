<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额报文查询">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsQuery" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btDownload" fieldStr="ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,workDate,csnm,ctnm[200],ctnt[200],catp[200],ctac[200],citp[220],ctid[200],finc[120],cbct[220],cbcn[200],rlfc[300],tbnm,tbit[220],tbid[200],tbnt[200],cfin[250],cfct[160],cfic[200],tcnm[200],tcat[260],tcac[150],tcit[200],tcid[200],tstm[150],tstp[150],tsct[200],tsdr,crtp,crat[150],traAmountCny[150],traAmountUsd[150],crpp[300],trcd[150],trcdSuffix[150],lstUpdTlr,lstUpdTm[150]"   width="100%" height="480"  hasFrame="true" readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	 	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
		var page = "${statics["com.huateng.report.constants.AMLConstants"].REPORT_APP_TYPE_AML}";
		//工作日期
		function initCallGetter_post() {
			AmlBHdsQuery_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsQuery_interface_dataset.setValue("qworkDateEnd",sysTxdate);
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
		
		function btDownload_onClick(){
			window.document.getElementById("btDownload").disabled = true;
			createTimerIfNull();
			var qworkDateStart = formatDate(AmlBHdsQuery_interface_dataset.getValue("qworkDateStart"));
			var qworkDateEnd = formatDate(AmlBHdsQuery_interface_dataset.getValue("qworkDateEnd"));
			var qrecStatus = AmlBHdsQuery_interface_dataset.getValue("qrecStatus");
			var qrepStatus = AmlBHdsQuery_interface_dataset.getValue("qrepStatus");
			var crcd = AmlBHdsQuery_interface_dataset.getValue("crcd");   //大额交易特征代码
			var ticd  = AmlBHdsQuery_interface_dataset.getValue("ticd");  //业务标识号
			var csnm  = AmlBHdsQuery_interface_dataset.getValue("csnm");  //客户号
			var ctnm  = AmlBHdsQuery_interface_dataset.getValue("ctnm");  //客户名称
			var ctnt  = AmlBHdsQuery_interface_dataset.getValue("ctnt");  //客户国籍
			var catp  = AmlBHdsQuery_interface_dataset.getValue("catp");  //账户类型
			var ctac  = AmlBHdsQuery_interface_dataset.getValue("ctac");  //账号
			var citp  = AmlBHdsQuery_interface_dataset.getValue("citp");  //客户身份证件/证明文件类型
			var ctid  = AmlBHdsQuery_interface_dataset.getValue("ctid");  //客户证件号码
			var finc  = AmlBHdsQuery_interface_dataset.getValue("finc");  //金融机构网点代码
			
			var cbct  = AmlBHdsQuery_interface_dataset.getValue("cbct");  //客户银行卡类型
			var cbcn  = AmlBHdsQuery_interface_dataset.getValue("cbcn");  //客户银行卡号码
			var rlfc  = AmlBHdsQuery_interface_dataset.getValue("rlfc");  //金融机构与客户的关系
			
			var tbnm  = AmlBHdsQuery_interface_dataset.getValue("tbnm");  //交易代办人姓名
			var tbit  = AmlBHdsQuery_interface_dataset.getValue("tbit");  //交易代办人身份证件/证明文件类型
			var tbid  = AmlBHdsQuery_interface_dataset.getValue("tbid");  //代办人身份证件/证明文件号码
			var tbnt  = AmlBHdsQuery_interface_dataset.getValue("tbnt");  //代办人国籍
			var cfin  = AmlBHdsQuery_interface_dataset.getValue("cfin");  //对方金融机构网点名称
			var cfct  = AmlBHdsQuery_interface_dataset.getValue("cfct");  //对方金融机构代码网点类型
			var cfic  = AmlBHdsQuery_interface_dataset.getValue("cfic");  //对方金融机构网点代码
			var tcnm  = AmlBHdsQuery_interface_dataset.getValue("tcnm");  //交易对手姓名
			var tcat  = AmlBHdsQuery_interface_dataset.getValue("tcat");  //交易对手账户类型
			var tcac  = AmlBHdsQuery_interface_dataset.getValue("tcac");  //交易对手账号
			var tcit  = AmlBHdsQuery_interface_dataset.getValue("tcit");  //交易对手证件类型
			var tcid  = AmlBHdsQuery_interface_dataset.getValue("tcid");  //交易对手证件号码
			var tstm  = formatDate(AmlBHdsQuery_interface_dataset.getValue("tstm"));  //交易日期
			var tstp  = AmlBHdsQuery_interface_dataset.getValue("tstp");  //交易方式
			var tsct  = AmlBHdsQuery_interface_dataset.getValue("tsct");  //涉外收支交易分类与代码
			var tsdr  = AmlBHdsQuery_interface_dataset.getValue("tsdr");  //资金收付标识
			var crtp  = AmlBHdsQuery_interface_dataset.getValue("crtp");  //币种
			var cratUp  = AmlBHdsQuery_interface_dataset.getValue("cratUp")== undefined?"":AmlBHdsQuery_interface_dataset.getValue("cratUp");    //交易金额上限
			var cratDown  = AmlBHdsQuery_interface_dataset.getValue("cratDown")== undefined?"":AmlBHdsQuery_interface_dataset.getValue("cratDown");//交易金额下限
			var crpp  = AmlBHdsQuery_interface_dataset.getValue("crpp");   //资金用途
			var trcd  = AmlBHdsQuery_interface_dataset.getValue("trcd");   //交易发生地国别
			var trcdSuffix = AmlBHdsQuery_interface_dataset.getValue("trcdSuffix"); //交易发生地区域
			var reportType = AmlBHdsQuery_interface_dataset.getValue("reportType"); //报文类型
			var qsourceType = AmlBHdsQuery_interface_dataset.getValue("qsourceType"); //数据来源
			var qlstUpdTlr = AmlBHdsQuery_interface_dataset.getValue("qlstUpdTlr"); //最后更新人 add by zqq 20190624
			
			window.location.href =  encodeURI(encodeURI("${contextPath}/filedownload/AmlBHdsQueryDownoloadAction.do?qworkDateStart="+qworkDateStart+
					"&qworkDateEnd="+qworkDateEnd+
					"&qrecStatus="+qrecStatus+
					"&qrepStatus="+qrepStatus+
					"&crcd="+crcd+
					"&ticd="+ticd+
					"&csnm="+csnm+
					"&ctnm="+ctnm+
					"&ctnt="+ctnt+
					"&catp="+catp+
					"&ctac="+ctac+
					"&citp="+citp+
					"&ctid="+ctid+
					"&finc="+finc+
					"&cbct="+cbct+
					"&cbcn="+cbcn+
					"&rlfc="+rlfc+
					"&tbnm="+tbnm+
					"&tbit="+tbit+
					"&tbid="+tbid+
					"&tbnt="+tbnt+
					"&cfin="+cfin+
					"&cfct="+cfct+
					"&cfic="+cfic+
					"&tcnm="+tcnm+
					"&tcat="+tcat+
					"&tcac="+tcac+
					"&tcit="+tcit+
					"&tcid="+tcid+
					"&tstm="+tstm+
					"&tstp="+tstp+
					"&tsct="+tsct+
					"&tsdr="+tsdr+
					"&crtp="+crtp+
					"&cratUp="+cratUp+
					"&cratDown="+cratDown+
					"&crpp="+crpp+
					"&trcd="+trcd+
					"&trcdSuffix="+trcdSuffix+
					"&reportType="+reportType+
					"&qsourceType="+qsourceType+
					"&qlstUpdTlr="+qlstUpdTlr));
		}
		
		//详细信息
		function doDetail(id){
			showWin("大额报文详细信息","/fpages/hfaml3/ftl/bh/AmlBHdsCollAdd.ftl?id=" + id + "&op=alldetail","window","flushPage()",window);
		}
		
		//刷新数据
		function flushPage(){
			AmlBHdsQuery_dataset.flushData(AmlBHdsQuery_dataset.pageIndex);
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
		
		
		//导出的刷新监控
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