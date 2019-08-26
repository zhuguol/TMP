<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额普通报文补录">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsColl2" init="false" submitMode="all" navigate="false" >
			
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btShenlin,-,btAdd,-,btCopyNew,-,btMod,-,btSaveTemp,-,btDel,-,btUnReport,-,btCirculation,-,btnUpload,-,btReport" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,brNo,brNoName[260],workDate,ctnm[200],ctid[200],csnm,ctnt[200],htdt[120],finn[260],firc[260],fict[160],finc[160],catp[220],ctac,tbnm,tbid[200],tbnt[200],tstm[150],tstp[150],tsct[200],tsdr,crpp[250],crtp,crat[150],traAmountCny[150],traAmountUsd[150],tdrc[150],cfin[250],cfct[160],cfic[200],tcnm[200],tcid[200],tcat[260],tcac[150],lstUpdTlr,lstUpdTm[150]"   width="100%"  height="480"  hasFrame="true" readonly="true"/>
		      		</td>
		    	</tr>
		    <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow" label="" height="140" width="500" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="选择流转部门编号" fieldStr="selectRolename"/>
        			 <br/>
      				<@CommonQueryMacro.Button id= "btConfirm"/>
      			</div>
     		 </@CommonQueryMacro.FloatWindow>
  			</td>
  		</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	<#assign v_roleName = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getDepartByUserId()>
	//初始化查询日期
	function initCallGetter_post() {
		AmlBHdsColl2_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBHdsColl2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		//非CIU部门隐藏随机申领按钮
		if("CIU"!='${v_roleName}'){
			document.getElementById('btShenlin').style.display="none";
		}
	}
	//初始化查询条件交易方式下拉框
	function tstp_DropDown_beforeOpen(dropDown){
    	BiTreeDataDicSelect_DropDownDataset.setParameter("codeType","TSTP");
    	BiTreeDataDicSelect_DropDownDataset.setParameter("headDataTypeNo","9999");
	}
	//初始化查询条件涉外收支交易分类与代码属性下拉框
 	function tsct_DropDown_beforeOpen(dropDown){
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("headDataTypeNo","02");
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("codeType","AML");
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
		showWin("大额普通报文明细","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id="+id+"&op=detail","window","flushPage()",window);
	}
	
	
	//新增按钮
	function btAdd_onClick(){
		showWin("大额普通报文新增","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?op=new","window","flushPage()",window);
	}
	
	//复制新增按钮
	function btCopyNew_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
		var chk=0;
		var id;
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要复制的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}
		showWin("大额普通报文复制新增","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id=" + id + "&op=copynew","window","flushPage()",window);
	}
	
	
	//修改按钮
	function btMod_onClickCheck(button){
	var record = AmlBHdsColl2_dataset.firstUnit;
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
		showWin("大额普通报文补录","/fpages/hf/ftl/AmlBHdsCollAdd2.ftl?id=" + id + "&op=mod","window","flushPage()",window);
		}
	}
	
	

		
   
   //撤销上报
   function btUnReport_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
		var chk=0;
		var recIds = "";
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    ticd = record.getValue("ticd");
	            var v_recStatus = record.getValue("recStatus");
				recIds+=ticd
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
			AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
		});
	}
	
	
	//申领任务
	function btShenlin_onClick(){
	    AMLVaildService.receiveTastNew(function(mgs){
			 alert(mgs);
			AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
		});
	}
		
		
	//流转
	function btCirculation_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
				var recStatus = record.getValue("recStatus");
				if(recStatus!='01'){
				   alert("非待补录数据不能进行流转操作！");
				   return false;
			    }
			    var sourceType = record.getValue("sourceType");
				if(sourceType!='0'){
				   alert("存在手工新增或人工导入的数据，不能进行流转操作！");
				   return false;
			    }
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要流转的记录！");
			return false;
		}else{
		  	return true;
		}
    }
    
	function btCirculation_onClick(){
		subwindow_signWindow.show();
	}
	
	//确认流转
	function btConfirm_onClickCheck(button){
		var selectRolename = AmlBHdsColl2_dataset.getValue("selectRolename");
	   	if (!selectRolename) {
	   		alert("请选择需要流转部门！");
	   		return false;
		}else{
			AmlBHdsColl2_dataset.setParameter("selectRolename",selectRolename);
			return true;
		}
	}	
	
	function btConfirm_postSubmit(button){
    	var retParam = button.returnParam;
    	alert(retParam.msg);
    	subwindow_signWindow.close();
    	AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
    }
    
    function btDel_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
				var recStatus = record.getValue("recStatus");
				if(recStatus!='01'&&recStatus!='02'&&recStatus!='99'){
				   alert("存在不符合确认不上报状态的数据！");
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
    
     function btDel_postSubmit(button){
    	var retParam = button.returnParam;
    	alert("操作成功！"+retParam.msg+"!");
    	AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
    }
    
    //批量上报
	function btReport_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
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
    	AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
    }
    
    
    //大额交易批量导入
	function btnUpload_onClick(){
		currentSubWin = openSubWin("pageWinId", "批量导入大额交易信息", "/fpages/hf/jsp/upload.jsp?fileflag=AMLBHds&workDate="+sysTxdate,"600","200");
	}
	
	function btSaveTemp_onClickCheck(button){
		var record = AmlBHdsColl2_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
				var recStatus = record.getValue("recStatus");
				if(recStatus!='01'&&recStatus!='99'){
				   alert("非待补录或暂存数据不能进行暂存操作！");
				   return false;
			    }
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要暂存的记录！");
			return false;
		}else{
		  	return true;
		}
	}
	
	function btSaveTemp_postSubmit(button){
		alert("暂存成功！");
		AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
	}
	
		//刷新数据
	function flushPage(){
		AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
	}
	
	//刷新数据
	/*
	function flushPage01(){
		if(confirm("继续补录下一条交易数据？")){
			var record = AmlBHdsColl2_dataset.firstUnit.nextUnit;
			while(record){
				var id = record.getValue("id");
				var ticd = record.getValue("ticd");
				var recStatus = record.getValue("recStatus");
				var v_subSuccess = record.getValue("subSuccess");
			    if((recStatus=='01'||recStatus=='99'||recStatus=='04')&&v_subSuccess!='1'){
			       break;
			    }
				record=record.nextUnit;
			}
		}else{
			AmlBHdsColl2_dataset.flushData(AmlBHdsColl2_dataset.pageIndex);
		}
	}
	*/
	
	</script>
</@CommonQueryMacro.page>