<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额修改报文补录">
		<@CommonQueryMacro.CommonQuery id="AmlCBHdsColl" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btMod,-,btReport,-,btUnReport" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,workDate,csnm,ctnm[200],ctnt[200],catp[200],ctac[200],citp[220],ctid[200],finc[120],cbct[220],cbcn[200],rlfc[300],tbnm,tbit[220],tbid[200],tbnt[200],cfin[250],cfct[160],cfic[200],tcnm[200],tcat[260],tcac[150],tcit[200],tcid[200],tstm[150],tstp[150],tsct[200],tsdr,crtp,crat[150],traAmountCny[150],traAmountUsd[150],crpp[300],trcd[150],trcdSuffix[150],lstUpdTlr,lstUpdTm[150]"   width="100%" height="480"  hasFrame="true" readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//初始化查询日期
	function initCallGetter_post() {
		AmlCBHdsColl_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlCBHdsColl_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		AmlCBHdsColl_interface_dataset.setValue("reportType",'C');
		AmlCBHdsColl_interface_dataset.setFieldReadOnly("reportType",true);
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
		showWin("大额修改报文明细","/fpages/hfaml3/ftl/bh/AmlCBHdsCollAdd.ftl?id="+id+"&op=detail","window","flushPage()",window);
	}
	
	//补录按钮
	function btMod_onClickCheck(button){
		var record = AmlCBHdsColl_dataset.firstUnit;
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
		showWin("大额修改报文补录","/fpages/hfaml3/ftl/bh/AmlCBHdsCollAdd.ftl?id=" + id + "&op=mod","window","flushPage()",window);
		}
	}
	
   //撤销上报
   function btUnReport_onClickCheck(button){
		var record = AmlCBHdsColl_dataset.firstUnit;
		var chk=0;
		var recIds = "";
		while(record){
			var temp = record.getValue("select");
			if(temp){
	            var v_recStatus = record.getValue("recStatus");
				recIds+=record.getValue("id");
		        recIds+="|";
				chk++;
				if(v_recStatus!="05"){
				    alert("只能撤销上报【校验通过】数据！");
					return false;
				}
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要撤销上报的记录！");
			return false;
		}else{
			updateReport(recIds);	
		}
   }

   function updateReport(ids){
		HfAmlDwrService.updateUnReport(ids,function(mgs){
			alert(mgs);
			AmlCBHdsColl_dataset.flushData(AmlCBHdsColl_dataset.pageIndex);
		});
	}
   
    
    
    //批量上报
	function btReport_onClickCheck(button){
		var record = AmlCBHdsColl_dataset.firstUnit;
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
    	AmlCBHdsColl_dataset.flushData(AmlCBHdsColl_dataset.pageIndex);
    }
	
	//刷新数据
	function flushPage(){
		AmlCBHdsColl_dataset.flushData(AmlCBHdsColl_dataset.pageIndex);
	}
	</script>
</@CommonQueryMacro.page>