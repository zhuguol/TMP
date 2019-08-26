<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑重发报文补录">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlRBSDsColl2" init="false" submitMode="current">
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
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btMod,btUnReport" fieldStr="select,oper,workDate,reportId,recStatus,reportType[120],brno,finm[200],firc[250],fict[200],ficd[200],stcr[200],ssdg[200],lstUpdTlr,lstUpdTm"  width="100%"  height="480"  hasFrame="true" readonly="true" />
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
		AmlRBSDsColl2_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlRBSDsColl2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
	}
	//初始化详细链接
	function datatable_oper_onRefresh(cell,value,record) {
		var id = record.getValue("id");
		var reportId = record.getValue("reportId");
		var workDate = formatDate(record.getValue("workDate"));
		var doDetail = " <a href=\"JavaScript:doDetail('"+id+"','"+reportId+"','"+workDate+"')\">详细</a> ";
        cell.innerHTML= "<center>"+doDetail+"</center>";
	}
	//详细
	function doDetail(id,reportId,workDate) {
		showWin("可疑重发报文详细","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=detail&reportId="+reportId+"&id="+id+"&workDate="+workDate,"window","flushPage()",window);
	}
	//补录
	function btMod_onClickCheck(button){
		var record = AmlRBSDsColl2_dataset.firstUnit;
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
		showWin("可疑重发报文补录","/fpages/hf/ftl/AmlBSDsCollInfo2.ftl?op=update&reportId="+reportId+"&id="+id+"&workDate="+formatDate(workDate),"window","flushPage()",window);
		}
	}
	
	   //撤销上报
	   function btUnReport_onClickCheck(button){
			var record = AmlRBSDsColl2_dataset.firstUnit;
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
					 if(v_recStatus!="05"){
					    alert("只能撤销上报【已上报待打包】数据！");
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
			AmlRBSDsColl2_dataset.flushData(AmlRBSDsColl2_dataset.pageIndex);
		});
	}
	
	//刷新数据
	function flushPage(){
		AmlRBSDsColl2_dataset.flushData(AmlRBSDsColl2_dataset.pageIndex);
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