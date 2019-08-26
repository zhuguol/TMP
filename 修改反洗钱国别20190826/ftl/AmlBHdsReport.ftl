
<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as
CommonQueryMacro>
<@CommonQueryMacro.page title="大额管理">
<@CommonQueryMacro.CommonQuery id="AmlBHdsReport" init="false" submitMode="all" navigate="false" >
<script type='text/javascript' src='${contextPath}/dwr/interface/AMLVaildService.js'> </script>
<table align="left" width="95%">
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
			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btReport,-,btUnReport" fieldStr="select,ticd,recStatus,repStatus,isDel,subSuccess,reportType,brNo,brNoName[150],workDate,ctnm[150],ctid[200],csnm,ctnt[180],htdt[120],finn[120],firc[200],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[180],tstm,tstp[150],tsct[200],tsdr,crpp,crtp,crat[150],cfin[150],cfct[150],cfic[200],tcnm[200],tcid[200],tcat[220],tcac,lstUpdTlr,lstUpdTm"   width="100%"  readonly="true"/>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

<script language="JavaScript">
        var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
	    //工作日期
		function initCallGetter_post() {
			AmlBHdsReport_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsReport_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			AmlBHdsReport_interface_dataset.setValue("qisDel","0");
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
		
		 
		 function datatable1_ticd_onRefresh(cell,value,record) {
			if (record) {
				var id = record.getValue("id");
				var ticd = record.getValue("ticd");
				cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + ticd + "</a>"
			} else {
				cell.innerHTML="&nbsp;";
			}
		}
		
		//详细信息
		function doDetail(id){
			showWin("大额交易信息管理明细","/fpages/hf/ftl/AmlBHdsCollAdd.ftl?id=" + id + "&op=detail","window","flushPage()",window);
		}
		
		 
		function locate(id) {
			var record = ebankCustRoleMng_dataset.find(["id"],[id]);
			if (record) {
				ebankCustRoleMng_dataset.setRecord(record);
			}
	    } 
	    //上报
	   function btReport_onClickCheck(button){
			var record = AmlBHdsReport_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			while(record){
				var temp = record.getValue("select");
				if(temp){
				    id = record.getValue("id");
		            var v_recStatus = record.getValue("recStatus");
					recIds+=record.getValue("id");
			        recIds+="|";
					chk++;
					if(v_recStatus!="02"){
					    alert("只能上报【已补录待上报】数据！");
						return false;
					}
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请选择要上报的记录！");
				return false;
			}else{
				updateReport(recIds,0);	
			}
	   }
	   //撤销上报
	   function btUnReport_onClickCheck(button){
			var record = AmlBHdsReport_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			while(record){
				var temp = record.getValue("select");
				if(temp){
				    id = record.getValue("id");
		            var v_recStatus = record.getValue("recStatus");
					recIds+=record.getValue("id");
			        recIds+="|";
					chk++;
					 if(v_recStatus!="03"){
					    alert("只能撤销上报【已上报待校验】数据！");
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
				AmlBHdsReport_dataset.flushData(AmlBHdsReport_dataset.pageIndex);
			});
		}
</script>
</@CommonQueryMacro.page>