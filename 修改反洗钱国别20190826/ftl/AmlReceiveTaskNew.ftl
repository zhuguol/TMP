<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易分派">
		<@CommonQueryMacro.CommonQuery id="AmlReceiveTaskNew" init="false" submitMode="all" navigate="false" >
			<script type='text/javascript' src='${contextPath}/dwr/interface/AMLVaildService.js'> </script>
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btReceive,-,btUnSave,-,btReceiveAll" fieldStr="select,brNo[160],workDate[200],roleName[200],csnm[200],num[160],lstUpdTlr[160]" width="100%"  height="480"  hasFrame="true"  readonly="true"/>
		      		</td>
		    	</tr>
		   <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow" label="" height="140" width="500" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="选择需要分派的操作员编号" fieldStr="selectTlrno"/>
        			 <br/>
      				<@CommonQueryMacro.Button id= "btConfirm"/>
      			</div>
     		 </@CommonQueryMacro.FloatWindow>
  			</td>
  		</tr>
  		
  		   <tr>
      		<td colspan="2">
      		<@CommonQueryMacro.FloatWindow id="signWindow02" label="" height="140" width="500" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
      			<div align="center">
      				<@CommonQueryMacro.Group id="group1" label="选择需要分派的操作员编号" fieldStr="selectTlrno"/>
        			 <br/>
      				<@CommonQueryMacro.Button id= "btConfirm02"/>
      			</div>
     		 </@CommonQueryMacro.FloatWindow>
  			</td>
  		</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//工作日期
	function initCallGetter_post() {
		AmlReceiveTaskNew_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlReceiveTaskNew_interface_dataset.setValue("qworkDateEnd",sysTxdate);
	}
		
	//分派
	function btReceive_onClickCheck(button){
		var record = AmlReceiveTaskNew_dataset.firstUnit;
		var chk=0;
		while(record){
			var temp = record.getValue("select");
			if(temp){
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要分派的记录！");
			return false;
		}else{
		  	return true;
		}
    }
    
	function btReceive_onClick(){
		subwindow_signWindow.show();
	}
	
	//确认
	function btConfirm_onClickCheck(button){
		var selectTlrno = AmlReceiveTaskNew_dataset.getValue("selectTlrno");
	   	if (!selectTlrno) {
	   		alert("请选择需要分派的操作员编号！");
	   		return false;
		}else{
			AmlReceiveTaskNew_dataset.setParameter("selectTlrno",selectTlrno);
			return true;
		}
	}	
	
	function btConfirm_postSubmit(button){
    	alert("分派成功！");
    	subwindow_signWindow.close();
    	AmlReceiveTaskNew_dataset.flushData(AmlReceiveTaskNew_dataset.pageIndex);
    }
    
    //反暂存
	function btUnSave_onClickCheck(button){
		var record = AmlReceiveTaskNew_dataset.firstUnit;
		var chk=0;
		var csnm="";
		var lstUpdTlr="";
		var workDate="";
		var recId="";
		while(record){
			var temp = record.getValue("select");
			if(temp){
			    workDate=record.getValue("workDate");
			    lstUpdTlr=record.getValue("lstUpdTlr");
			    csnm=record.getValue("csnm");
			    if(lstUpdTlr.length==0){
			      alert("请选择已分配的信息！");
			     return false;
			    }
			    recId+=workDate+"|"+lstUpdTlr+"|"+csnm+"|"+"@"
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要反暂存的信息！");
			return false;
		}else{
		  	doUpdate(recId);
		}
    }
    
    function doUpdate(recId){
     	if(window.confirm("是否确认反暂存？")){
	    	AMLVaildService.unSave(recId,function(num){
	    	   alert(num);
	    	});
    	}else{
    	   return false;
    	}
    	AmlReceiveTaskNew_dataset.flushData(1);
	}
	
	//一键分派
	function btReceiveAll_onClick(){
		subwindow_signWindow02.show();
	}
	
	
	//确认一键分派
	function btConfirm02_onClickCheck(button){
		var selectTlrno = AmlReceiveTaskNew_dataset.getValue("selectTlrno");
		var brNo = AmlReceiveTaskNew_dataset.getValue("brNo");
		var roleName = AmlReceiveTaskNew_dataset.getValue("roleName");
	   	if (!selectTlrno) {
	   		alert("请选择需要分派的操作员编号！");
	   		return false;
		}else{
			if(window.confirm("确认将所有未申领交易分派给一个操作员用户？")){
		    	AMLVaildService.receiveAllNew(selectTlrno,brNo,roleName,function(msg){
		    	   alert(msg);
		    	   subwindow_signWindow02.close();
		    	   AmlReceiveTaskNew_dataset.flushData(AmlReceiveTaskNew_dataset.pageIndex);
		    	   return true;
		    	});
	    	}else{
	    	   return false;
	    	}
		}
	}	
	
	function btConfirm02_postSubmit(button){
    	alert("一键分派成功！");
    	subwindow_signWindow.close();
    	AmlReceiveTaskNew_dataset.flushData(AmlReceiveTaskNew_dataset.pageIndex);
    }
	
	</script>
</@CommonQueryMacro.page>