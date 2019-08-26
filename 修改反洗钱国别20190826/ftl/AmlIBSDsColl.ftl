<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑补正报文补录">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlIBSDsColl" init="false" submitMode="current">
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
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btMod,-,btReport,-,btUnReport" fieldStr="select,oper,reportId,recStatus,repStatus,issubsuccess,reportType[120],brno,workDate,finm[150],firc[200],ficd,ssdg[260],tkms[220],ssds[220],errMsg[300],lstUpdTlr,lstUpdTm" width="100%" />
                    </td>
                </tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
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
		showWin("可疑补正报文详细","/fpages/hf/ftl/AmlBSDsCollInfo.ftl?op=detail&reportId="+reportId+"&id="+id+"&workDate="+formatDate(workDate),"window","flushPage()",window);
	}
	//修改
	function btMod_onClickCheck(button){
		var record = AmlIBSDsColl_dataset.firstUnit;
		var chk=0;
		var taskIdArr = new Array();
		var recIds = "";
		var delStatus="";
		var id;
	   
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
			     workDate = record.getValue("workDate");
			    var v_recStatus = record.getValue("recStatus");
			    reportId = record.getValue("reportId");
				taskIdArr[chk] = record.getValue("id");
				recStatus=record.getValue("recStatus");
				var v_subSuccess =record.getValue("issubsuccess");
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
		showWin("可疑普通报文补录","/fpages/hf/ftl/AmlBSDsCollInfo.ftl?op=update&reportId="+reportId+"&id="+id+"&workDate="+sysTxdate,"window","flushPage()",window);
		}
	}
	
	//上报
	   function btReport_onClickCheck(button){
			var record = AmlIBSDsColl_dataset.firstUnit;
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
	   }
	   //撤销上报
	   function btUnReport_onClickCheck(button){
			var record = AmlIBSDsColl_dataset.firstUnit;
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
			AmlIBSDsColl_dataset.flushData(AmlIBSDsColl_dataset.pageIndex);
		});
	}
	//刷新数据
	function flushPage(){
		AmlIBSDsColl_dataset.flushData(1);
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