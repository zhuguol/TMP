<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑普通报文补录">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSDsColl2" init="false" submitMode="current">
            <table width="100%">
                <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="false"/>
                    </td>
                </tr> 
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btAdd,-,btMod,-,btDel,-,btUnReport" fieldStr="select,oper,workDate,lstUpdTlr,lstUpdTm[120],approveStatus,approveResult[220],reportId,bsid[100],recStatus,reportType[120],brno,finm[200],firc[250],fict[200],ficd[200],stcr[200],ssdg[200]"  width="100%"  height="480"  hasFrame="true" readonly="true" />
                    </td>
                </tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//工作日期
	function initCallGetter_post() {
		AmlBSDsColl2_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBSDsColl2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
	}
	//初始化详细链接
	function datatable_oper_onRefresh(cell,value,record) {
		var id = record.getValue("id");
		var reportId = record.getValue("reportId");
		var workDate = formatDate(record.getValue("workDate"));
		var doDetail = " <a href=\"JavaScript:doDetail('"+id+"','"+reportId+"','"+workDate+"')\">详细</a> ";
        cell.innerHTML= "<center>"+doDetail+"</center>";
	}
	//新增
	function btAdd_onClick(button){
	   var id = guid();
	   var maxBatchNo = 0;
	   var reportId  = 0;
	   PrivAction.getMaxBatchNo(function(HbatchNo){
	     maxBatchNo = HbatchNo;
	     reportId = maxBatchNo+1;
		showWin("新增可疑普通报文信息","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=new&reportId="+reportId+"&id="+id+"&workDate="+sysTxdate,"window","flushPage()",window);
	   });
	    return true;
	}
	//详细
	function doDetail(id,reportId,workDate) {
		showWin("可疑普通报文详细","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=detail&reportId="+reportId+"&id="+id+"&workDate="+workDate,"window","flushPage()",window);
	}
	//补录
	function btMod_onClickCheck(button){
		var record = AmlBSDsColl2_dataset.firstUnit;
		var chk=0;
		var id;
		var reportId;
		var workDate;
		var v_recStatus;
	   
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
			    reportId = record.getValue("reportId");
			    workDate = record.getValue("workDate");
			    v_recStatus = record.getValue("recStatus");
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
			if(v_recStatus!='99'&&v_recStatus!='01'){
		       alert("该条信息记录状态不能补录，请确认！");
		       return false;
		    }
		showWin("可疑普通报文补录","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=update&reportId="+reportId+"&id="+id+"&workDate="+formatDate(workDate),"window","flushPage()",window);
		}
	}
	
	 //删除
	function btDel_onClickCheck(button){
		var record = AmlBSDsColl2_dataset.firstUnit;
		var chk=0;
		var reportId;
		var workDate;
	   
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    reportId = record.getValue("reportId");
				workDate = formatDate(record.getValue("workDate"));
	            var v_recStatus = record.getValue("recStatus");
				chk++;
			}
			record=record.nextUnit;
		}
		
		if(chk==0){
			alert("请选择要删除的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}else{
		    if(v_recStatus=="06"){
			    alert("所选信息记录状态是【已打包】，不能删除！");
				return false;
		    }
			doDelete(reportId,workDate);		
		}
	}
	
	function doDelete(id,workDate){
     	if(window.confirm("是否确定删除？")){
	    	PrivAction.deleteAmlBS(id,workDate,function(msg){
	    	    alert(msg);
	    	});
    	}else{
    	   return false;
    	}
    	AmlBSDsColl2_dataset.flushData(AmlBSDsColl2_dataset.pageIndex);
	}
	
	//上报
   /*function btReport_onClickCheck(button){
		var record = AmlBSDsColl2_dataset.firstUnit;
		var chk=0;
		var recIds = "";
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("reportId");
	            var v_recStatus = record.getValue("recStatus");
				recIds+=record.getValue("reportId");
				recIds+="#";
				recIds+=new Date(record.getValue("workDate")).getTime();
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
   }*/
   
   
	   //撤销上报
	   function btUnReport_onClickCheck(button){
			var record = AmlBSDsColl2_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			while(record){
				var temp = record.getValue("select");
				if(temp){
				    id = record.getValue("reportId");
		            var v_recStatus = record.getValue("recStatus");
					recIds+=record.getValue("reportId");
					recIds+="#";
					recIds+=new Date(record.getValue("workDate")).getTime();
			        recIds+="|";
					chk++;
					 if(v_recStatus!="03"){
					    alert("只能撤销上报【已上报待审核】数据！");
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
		AMLVaildService.updateBSReport(ids,flag,function(mgs){
			alert(mgs);
			AmlBSDsColl2_dataset.flushData(AmlBSDsColl2_dataset.pageIndex);
		});
	}
	//刷新数据
	function flushPage(){
		AmlBSDsColl2_dataset.flushData(1);
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
	
	function guid(){
	    return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		    var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
		    return v.toString(16);
	    });
    }
</script>
</@CommonQueryMacro.page>