<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额普通报文批量补录">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsBatchInfo2" init="false" submitMode="all" navigate="false" >
			<script type='text/javascript' src='${contextPath}/dwr/interface/AMLVaildService.js'> </script>
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btMod,btReport" fieldStr="select,ticd[200],recStatus,repStatus,isComp,subSuccess,reportType,brNo,brNoName[260],workDate,ctnm[150],ctid[200],csnm,ctnt[180],htdt[120],finn[260],firc[200],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[180],tstm,tstp[150],tsct[200],tsdr,crpp,crtp,crat[150],cfin[150],cfct[150],cfic[200],tcnm[200],tcid[200],tcat[220],tcac,lstUpdTlr,lstUpdTm"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
		    <tr>
  		</tr>
		</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	    var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		function initCallGetter_post() {
			AmlBHdsBatchInfo2_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsBatchInfo2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			AmlBHdsBatchInfo2_interface_dataset.setValue("qrecStatus","01");
			AmlBHdsBatchInfo2_interface_dataset.setValue("qrepStatus","01");
			AmlBHdsBatchInfo2_interface_dataset.setValue("reportType","N");
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
		
		//链接查看详细信息
		function doDetail(id){
			showWin("大额普通报文明细","/fpages/hf/ftl/AmlBHdsBatchInfoAdd2.ftl?id="+id+"&op=detail","window","flushPage()",window);
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
		 
		 //修改按钮
		 /*
		function btMod_onClickCheck(button){
		var record = AmlBHdsBatchInfo2_dataset.firstUnit;
		
			var chk=0;
			var taskIdArr = new Array();
			var recIds = "";
			var delStatus="";
			var id;
			var recId="";
		   
			while(record){
			recId+= record.getValue("id");
			recId+="@";
				var temp = record.getValue("select");
				if(temp){
				    id = record.getValue("id");
					taskIdArr[chk] = record.getValue("id");
					recStatus=record.getValue("recStatus");
					var v_subSuccess =record.getValue("subSuccess");
					if(recIds == ""){
						recIds += taskIdArr[chk];
					}else{
						recIds += "@" + taskIdArr[chk];
					}
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
			}else{
			    if(recStatus!='01'&&recStatus!='02'&&recStatus!='99'){
			       alert("该条信息记录状态不能补录，请确认！");
			       return false;
			    }
			    if(v_subSuccess=="1"){
				    alert("所选信息是【已上报并接收成功回执】的交易，不能补录！");
					return false;
			   }
			showWin("大额交易信息管理修改","/fpages/hf/ftl/AmlBHdsBatchInfoAdd2.ftl?id=" + id + "&op=mod&recId="+recId,"window","flushPage()",window);
			}
	}*/
	
	
	
	function btMod_onClickCheck(button){
		var record = AmlBHdsBatchInfo2_dataset.firstUnit;
		if(!record){
			alert("请选择一条需要修改的记录！");
			return false;
		}
		var id = record.getValue("id");
		
		var qworkDateStart = formatDate(AmlBHdsBatchInfo2_interface_dataset.getValue("qworkDateStart"));
		var qworkDateEnd = formatDate(AmlBHdsBatchInfo2_interface_dataset.getValue("qworkDateEnd"));
		var qrecStatus = AmlBHdsBatchInfo2_interface_dataset.getValue("qrecStatus");
		var qrepStatus = AmlBHdsBatchInfo2_interface_dataset.getValue("qrepStatus");
		var crcd = AmlBHdsBatchInfo2_interface_dataset.getValue("crcd");   //大额交易特征代码
		var ticd  = AmlBHdsBatchInfo2_interface_dataset.getValue("ticd");  //业务标识号
		var csnm  = AmlBHdsBatchInfo2_interface_dataset.getValue("csnm");  //客户号
		var ctnm  = AmlBHdsBatchInfo2_interface_dataset.getValue("ctnm");  //客户名称
		var ctnt  = AmlBHdsBatchInfo2_interface_dataset.getValue("ctnt");  //客户国籍
		var catp  = AmlBHdsBatchInfo2_interface_dataset.getValue("catp");  //账户类型
		var ctac  = AmlBHdsBatchInfo2_interface_dataset.getValue("ctac");  //账号
		var citp  = AmlBHdsBatchInfo2_interface_dataset.getValue("citp");  //客户身份证件/证明文件类型
		var ctid  = AmlBHdsBatchInfo2_interface_dataset.getValue("ctid");  //客户证件号码
		var finn  = AmlBHdsBatchInfo2_interface_dataset.getValue("finn");  //金融机构网点名称
		var finc  = AmlBHdsBatchInfo2_interface_dataset.getValue("finc");  //金融机构网点代码
		var rltp  = AmlBHdsBatchInfo2_interface_dataset.getValue("rltp");  //金融机构网点与大额交易的关系
		var firc  = AmlBHdsBatchInfo2_interface_dataset.getValue("firc");  //金融机构网点所在地区行政区划代码
		var tbnm  = AmlBHdsBatchInfo2_interface_dataset.getValue("tbnm");  //交易代办人姓名
		var tbit  = AmlBHdsBatchInfo2_interface_dataset.getValue("tbit");  //交易代办人身份证件/证明文件类型
		var tbid  = AmlBHdsBatchInfo2_interface_dataset.getValue("tbid");  //代办人身份证件/证明文件号码
		var tbnt  = AmlBHdsBatchInfo2_interface_dataset.getValue("tbnt");  //代办人国籍
		var cfin  = AmlBHdsBatchInfo2_interface_dataset.getValue("cfin");  //对方金融机构网点名称
		var cfct  = AmlBHdsBatchInfo2_interface_dataset.getValue("cfct");  //对方金融机构代码网点类型
		var cfic  = AmlBHdsBatchInfo2_interface_dataset.getValue("cfic");  //对方金融机构网点代码
		var tcnm  = AmlBHdsBatchInfo2_interface_dataset.getValue("tcnm");  //交易对手姓名
		var tcat  = AmlBHdsBatchInfo2_interface_dataset.getValue("tcat");  //交易对手账户类型
		var tcac  = AmlBHdsBatchInfo2_interface_dataset.getValue("tcac");  //交易对手账号
		var tcit  = AmlBHdsBatchInfo2_interface_dataset.getValue("tcit");  //交易对手证件类型
		var tcid  = AmlBHdsBatchInfo2_interface_dataset.getValue("tcid");  //交易对手证件号码
		var tstm  = formatDate(AmlBHdsBatchInfo2_interface_dataset.getValue("tstm"));  //交易日期
		var tstp  = AmlBHdsBatchInfo2_interface_dataset.getValue("tstp");  //交易方式
		var tsct  = AmlBHdsBatchInfo2_interface_dataset.getValue("tsct");  //涉外收支交易分类与代码
		var tsdr  = AmlBHdsBatchInfo2_interface_dataset.getValue("tsdr");  //资金收付标识
		var crtp  = AmlBHdsBatchInfo2_interface_dataset.getValue("crtp");  //币种
		var cratUp  = AmlBHdsBatchInfo2_interface_dataset.getValue("cratUp");    //交易金额上限
		var cratDown  = AmlBHdsBatchInfo2_interface_dataset.getValue("cratDown");//交易金额下限
		var crpp  = AmlBHdsBatchInfo2_interface_dataset.getValue("crpp");   //资金用途
		var trcd  = AmlBHdsBatchInfo2_interface_dataset.getValue("trcd");   //交易发生地国别
		var trcdSuffix = AmlBHdsBatchInfo2_interface_dataset.getValue("trcdSuffix"); //交易发生地区域
		var reportType = AmlBHdsBatchInfo2_interface_dataset.getValue("reportType"); //报文类型
		var qsourceType = AmlBHdsBatchInfo2_interface_dataset.getValue("qsourceType"); //数据来源
		
		
		var url = encodeURI(encodeURI("/fpages/hf/ftl/AmlBHdsBatchInfoAdd2.ftl?id="+id+"&op=mod&qworkDateStart="+qworkDateStart+
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
				"&finn="+finn+
				"&finc="+finc+
				"&rltp="+rltp+
				"&firc="+firc+
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
				"&qsourceType="+qsourceType
				));
		
		showWin("大额交易信息管理修改",url,"window","flushPage()",window);
	}
	
	
	
	//批量上报
	function btReport_onClickCheck(button){
		var record = AmlBHdsBatchInfo2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
				var recStatus = record.getValue("recStatus");
				if(recStatus!='01'&&recStatus!='02'&&recStatus!='99'){
				   alert("存在不符合上报状态的数据！");
				   return false;
			    }
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要上报的记录！");
			return false;
		}else{
		  	return true;
		}
    }
    
    function btReport_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlBHdsBatchInfo2_dataset.flushData(AmlBHdsBatchInfo2_dataset.pageIndex);
    }
    
    
	//刷新数据
	function flushPage(){
		AmlBHdsBatchInfo2_dataset.flushData(AmlBHdsBatchInfo2_dataset.pageIndex);
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
	</script>
</@CommonQueryMacro.page>