<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="交易信息明细_按操作日期">
		<@CommonQueryMacro.CommonQuery id="AmlLarTradAllFormThree02" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btDownload" fieldStr="htdt[200],crcd[200],ctnm[200],cbcn[200],cbct[200],ccei[200],cctl[200],cfct[200],cfic[200],cfin[200],cfrc[200],citp[220],crat[200],crpp[200],crtp[200],csnm[200],ctac[200],ctid[200],ctnt[200],ctvc[260],finc[200],oatm[200],ocbt[200],ocec[200],octt[200],aoitp[240],ooct[200],rotf1[200],rotf2[200],rpmn[200],rpmt[200],tbid[200],tbit[200],catp[200],tbnm[200],tbnt[200],tcac[200],tcat[200],tcid[200],tcit[250],tcnm[200],ticd[200],tstm[200]"   height="480" width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
		var page = "${statics["com.huateng.report.constants.AMLConstants"].EXPORT_AML_FORM}";
		//工作日期
		function initCallGetter_post() {
			AmlLarTradAllFormThree02_interface_dataset.setValue("qlstUpdTmStart",sysTxdate);
			AmlLarTradAllFormThree02_interface_dataset.setValue("qlstUpdTmEnd",sysTxdate);
		}
		
		function btDownload_onClick(){
			window.document.getElementById("btDownload").disabled = true;
			createTimerIfNull();
			var qlstUpdTmStart = formatDate(AmlLarTradAllFormThree02_interface_dataset.getValue("qlstUpdTmStart"));
			var qlstUpdTmEnd = formatDate(AmlLarTradAllFormThree02_interface_dataset.getValue("qlstUpdTmEnd"));
			var branchNo = AmlLarTradAllFormThree02_interface_dataset.getValue("branchNo");
			var department = AmlLarTradAllFormThree02_interface_dataset.getValue("department");
			var qrecStatus = AmlLarTradAllFormThree02_interface_dataset.getValue("qrecStatus");
			var qreportType = AmlLarTradAllFormThree02_interface_dataset.getValue("qreportType");
			var qlstUpdTlr = AmlLarTradAllFormThree02_interface_dataset.getValue("qlstUpdTlr");
			var qtlrName = AmlLarTradAllFormThree02_interface_dataset.getValue("qtlrName");
				window.location.href = "${contextPath}/filedownload/AmlLarTradAllForm01DownloadAction.do?qlstUpdTmStart="+qlstUpdTmStart+"&qlstUpdTmEnd="+qlstUpdTmEnd+"&branchNo="+branchNo+"&department="+department+"&qrecStatus="+qrecStatus+"&qreportType="+qreportType+"&qlstUpdTlr="+qlstUpdTlr+"&qtlrName="+qtlrName;
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