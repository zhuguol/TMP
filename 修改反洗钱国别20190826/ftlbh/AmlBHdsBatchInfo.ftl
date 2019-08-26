<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额新增报文批量补录">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsBatchInfo" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btMod,btReport" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,workDate,csnm,ctnm[200],ctnt[200],catp[200],ctac[200],citp[220],ctid[200],finc[120],cbct[220],cbcn[200],rlfc[300],tbnm,tbit[220],tbid[200],tbnt[200],cfin[250],cfct[160],cfic[200],tcnm[200],tcat[260],tcac[150],tcit[200],tcid[200],tstm[150],tstp[150],tsct[200],tsdr,crtp,crat[150],traAmountCny[150],traAmountUsd[150],crpp[300],trcd[150],trcdSuffix[150]"   width="100%" height="480"  hasFrame="true" readonly="true"/>
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
			AmlBHdsBatchInfo_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsBatchInfo_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			AmlBHdsBatchInfo_interface_dataset.setValue("qrecStatus","01");
			AmlBHdsBatchInfo_interface_dataset.setValue("qrepStatus","01");
			AmlBHdsBatchInfo_interface_dataset.setValue("reportType","N");
			AmlBHdsBatchInfo_interface_dataset.setFieldReadOnly("qrecStatus",true);
			AmlBHdsBatchInfo_interface_dataset.setFieldReadOnly("qrepStatus",true);
			AmlBHdsBatchInfo_interface_dataset.setFieldReadOnly("reportType",true);
			
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
		showWin("大额新增报文批量补录明细","/fpages/hfaml3/ftl/bh/AmlBHdsBatchInfoAdd.ftl?id="+id+"&op=detail","window","flushPage()",window);
	}
	
	function btMod_onClickCheck(button){
		var record = AmlBHdsBatchInfo_dataset.firstUnit;
		if(!record){
			alert("请选择一条需要修改的记录！");
			return false;
		}
		var id = record.getValue("id");
		
		var qworkDateStart = formatDate(AmlBHdsBatchInfo_interface_dataset.getValue("qworkDateStart"));
		var qworkDateEnd = formatDate(AmlBHdsBatchInfo_interface_dataset.getValue("qworkDateEnd"));
		var qrecStatus = AmlBHdsBatchInfo_interface_dataset.getValue("qrecStatus");
		var qrepStatus = AmlBHdsBatchInfo_interface_dataset.getValue("qrepStatus");
		var crcd = AmlBHdsBatchInfo_interface_dataset.getValue("crcd");   //大额交易特征代码
		var ticd  = AmlBHdsBatchInfo_interface_dataset.getValue("ticd");  //业务标识号
		var csnm  = AmlBHdsBatchInfo_interface_dataset.getValue("csnm");  //客户号
		var ctnm  = AmlBHdsBatchInfo_interface_dataset.getValue("ctnm");  //客户名称
		var ctnt  = AmlBHdsBatchInfo_interface_dataset.getValue("ctnt");  //客户国籍
		var catp  = AmlBHdsBatchInfo_interface_dataset.getValue("catp");  //账户类型
		var ctac  = AmlBHdsBatchInfo_interface_dataset.getValue("ctac");  //账号
		var citp  = AmlBHdsBatchInfo_interface_dataset.getValue("citp");  //客户身份证件/证明文件类型
		var ctid  = AmlBHdsBatchInfo_interface_dataset.getValue("ctid");  //客户证件号码
		var finc  = AmlBHdsBatchInfo_interface_dataset.getValue("finc");  //金融机构网点代码
		
		var cbct  = AmlBHdsBatchInfo_interface_dataset.getValue("cbct");  //客户银行卡类型
		var cbcn  = AmlBHdsBatchInfo_interface_dataset.getValue("cbcn");  //客户银行卡号码
		var rlfc  = AmlBHdsBatchInfo_interface_dataset.getValue("rlfc");  //金融机构与客户的关系
		
		var tbnm  = AmlBHdsBatchInfo_interface_dataset.getValue("tbnm");  //交易代办人姓名
		var tbit  = AmlBHdsBatchInfo_interface_dataset.getValue("tbit");  //交易代办人身份证件/证明文件类型
		var tbid  = AmlBHdsBatchInfo_interface_dataset.getValue("tbid");  //代办人身份证件/证明文件号码
		var tbnt  = AmlBHdsBatchInfo_interface_dataset.getValue("tbnt");  //代办人国籍
		var cfin  = AmlBHdsBatchInfo_interface_dataset.getValue("cfin");  //对方金融机构网点名称
		var cfct  = AmlBHdsBatchInfo_interface_dataset.getValue("cfct");  //对方金融机构代码网点类型
		var cfic  = AmlBHdsBatchInfo_interface_dataset.getValue("cfic");  //对方金融机构网点代码
		var tcnm  = AmlBHdsBatchInfo_interface_dataset.getValue("tcnm");  //交易对手姓名
		var tcat  = AmlBHdsBatchInfo_interface_dataset.getValue("tcat");  //交易对手账户类型
		var tcac  = AmlBHdsBatchInfo_interface_dataset.getValue("tcac");  //交易对手账号
		var tcit  = AmlBHdsBatchInfo_interface_dataset.getValue("tcit");  //交易对手证件类型
		var tcid  = AmlBHdsBatchInfo_interface_dataset.getValue("tcid");  //交易对手证件号码
		var tstm  = formatDate(AmlBHdsBatchInfo_interface_dataset.getValue("tstm"));  //交易日期
		var tstp  = AmlBHdsBatchInfo_interface_dataset.getValue("tstp");  //交易方式
		var tsct  = AmlBHdsBatchInfo_interface_dataset.getValue("tsct");  //涉外收支交易分类与代码
		var tsdr  = AmlBHdsBatchInfo_interface_dataset.getValue("tsdr");  //资金收付标识
		var crtp  = AmlBHdsBatchInfo_interface_dataset.getValue("crtp");  //币种
		var cratUp  = AmlBHdsBatchInfo_interface_dataset.getValue("cratUp");    //交易金额上限
		var cratDown  = AmlBHdsBatchInfo_interface_dataset.getValue("cratDown");//交易金额下限
		var crpp  = AmlBHdsBatchInfo_interface_dataset.getValue("crpp");   //资金用途
		var trcd  = AmlBHdsBatchInfo_interface_dataset.getValue("trcd");   //交易发生地国别
		var trcdSuffix = AmlBHdsBatchInfo_interface_dataset.getValue("trcdSuffix"); //交易发生地区域
		var reportType = AmlBHdsBatchInfo_interface_dataset.getValue("reportType"); //报文类型
		var qsourceType = AmlBHdsBatchInfo_interface_dataset.getValue("qsourceType"); //数据来源
		
		var url = encodeURI(encodeURI("/fpages/hfaml3/ftl/bh/AmlBHdsBatchInfoAdd.ftl?id="+id+"&op=mod&qworkDateStart="+qworkDateStart+
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
				"&qsourceType="+qsourceType
				));
		
		showWin("大额报文批量补录",url,"window","flushPage()",window);
	}
	
	
	
	//批量上报
	function btReport_onClickCheck(button){
		var record = AmlBHdsBatchInfo_dataset.firstUnit;
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
    	AmlBHdsBatchInfo_dataset.flushData(AmlBHdsBatchInfo_dataset.pageIndex);
    }
    
    
	//刷新数据
	function flushPage(){
		AmlBHdsBatchInfo_dataset.flushData(AmlBHdsBatchInfo_dataset.pageIndex);
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