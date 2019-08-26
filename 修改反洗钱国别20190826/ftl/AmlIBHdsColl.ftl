<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额补正报文补录">
		<@CommonQueryMacro.CommonQuery id="AmlIBHdsColl" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btMod,-,btReport,-,btUnReport" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,brNo,brNoName[260],workDate,ctnm[250],ctid[200],csnm,ctnt[200],htdt[120],finn[260],firc[260],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[200],tstm[150],tstp[150],tsct[200],tsdr,crpp[250],crtp,crat[150],traAmountCny[150],traAmountUsd[150],cfin[250],cfct[160],cfic[200],tcnm[200],tcid[200],tcat[260],tcac[150],lstUpdTlr,lstUpdTm[150]"   width="100%"  height="480"  hasFrame="true"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		//function initCallGetter_post() {
		//	AmlIBHdsColl_interface_dataset.setValue("qworkDateStart",sysTxdate);
		//	AmlIBHdsColl_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		//}
		
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
			showWin("大额交易信息管理明细","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id=" + id + "&op=detail","window","flushPage()",window);
		}
		
		//修改按钮
		function btMod_onClickCheck(button){
		var record = AmlIBHdsColl_dataset.firstUnit;
			var chk=0;
			var taskIdArr = new Array();
			var recIds = "";
			var delStatus="";
			var id;
		   
			while(record){
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
			showWin("大额交易信息管理修改","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id=" + id + "&op=mod","window","flushPage()",window);
			}
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
		 
	//批量上报
	function btReport_onClickCheck(button){
		var record = AmlIBHdsColl_dataset.firstUnit;
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
		
	 //上报
	 function btReport_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlIBHdsColl_dataset.flushData(AmlIBHdsColl_dataset.pageIndex);
     }	
	   //撤销上报
	   function btUnReport_onClickCheck(button){
			var record = AmlIBHdsColl_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			while(record){
				var temp = record.getValue("select");
				if(temp){
				    id = record.getValue("ticd");
		            var v_recStatus = record.getValue("recStatus");
					recIds+=record.getValue("ticd");
			        recIds+="|";
					chk++;
					if(v_recStatus!="05"){
					    alert("只能撤销上报【已上报】数据！");
						return false;
				    }
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请选择要撤销上报的记录！");
				return false;
			}else{
				updateReport(recIds,1);	
			}
	   }
	   
	   	function updateReport(ids,flag){
			AMLVaildService.updateReport(ids,flag,function(mgs){
				alert(mgs);
				AmlIBHdsColl_dataset.flushData(AmlIBHdsColl_dataset.pageIndex);
			});
		}
		
		
	//刷新数据
	function flushPage(){
		AmlIBHdsColl_dataset.flushData(AmlIBHdsColl_dataset.pageIndex);
	}
		 
	</script>
</@CommonQueryMacro.page>