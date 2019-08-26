<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑交易入库提交">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlBSUplaodHisQuery" init="false" submitMode="all">
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
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="-,btApprove" fieldStr="workDate,reportId,recStatus,reportType[120],brno,finm[200],firc[250],fict[200],ficd[200],stcr[200],ssdg[200],lstUpdTlr,lstUpdTm"  width="100%"  height="480"  hasFrame="true" readonly="true" />
                    </td>
                </tr>
              <tr>
		      		<td >
		      		<@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="700" height="200" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      			<div align="center">
		        			<@CommonQueryMacro.GroupBox id="group2" label="提交信息" expand="true">
				  					<table frame="void" class="grouptable" width="100%">
									<tr>
									   <td width="50%" colspan="1" align="right" nowrap class="labeltd">提交比例</td>
									   <td width="50%" class="datatd" id="submitProportion"><@CommonQueryMacro.SingleField fId="submitProportion"/></td>	
									   <td width="50%" colspan="1" align="right" nowrap class="labeltd">请输入数值为大于等于“0”，小于等于“100”之间的数值</td>		
						   			</tr>
						   			<tr>
									   <td width="50%" colspan="1" align="right" nowrap class="labeltd">提交说明</td>
									   <td width="50%" class="datatd" id="submitExplain"><@CommonQueryMacro.SingleField fId="submitExplain"/></td>			
						   			</tr>
						   			
						   			</table>
				    		<@CommonQueryMacro.Button id= "btSubmit"/>
				    		<@CommonQueryMacro.Button id= "btCancel"/>
				    		</@CommonQueryMacro.GroupBox>
		      			</div>
		     		 </@CommonQueryMacro.FloatWindow>
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
		document.getElementById("submitExplain").setAttribute("colspan",2);
		document.getElementById("editor_submitExplain").style.width="100%";
		AmlBSUplaodHisQuery_interface_dataset.setValue("qworkDateStart",sysTxdate);
		AmlBSUplaodHisQuery_interface_dataset.setValue("qworkDateEnd",sysTxdate);
	}  
	//刷新数据
	function flushPage(){
		AmlBSUplaodHisQuery_dataset.flushData(1);
	}
	
	function btApprove_onClickCheck(button){
		var test = AmlBSUplaodHisQuery_dataset.length;
		var qworkDateStart = AmlBSUplaodHisQuery_interface_dataset.getValue("qworkDateStart");
		var qworkDateEnd = AmlBSUplaodHisQuery_interface_dataset.getValue("qworkDateEnd");
		var creatUser = AmlBSUplaodHisQuery_interface_dataset.getValue("creatUser");
		AmlBHdsBakService.BScalculateRatio(qworkDateStart,qworkDateEnd,creatUser,function(mgs){
			document.getElementById("editor_submitExplain").value=mgs;
		}); 
		
		subwindow_floatWindowAudit.show();
	}
	   	
	function btSubmit_onClickCheck() {

		var submitProportion = AmlBSUplaodHisQuery_dataset.getValue("submitProportion");

		if (!submitProportion.length > 0) {
			alert("请输入提交比例！");
			return false;
		}
		AmlBSUplaodHisQuery_dataset.setParameter("submitProportion",submitProportion);
			subwindow_floatWindowAudit.hide();
		}
		
		
	function btSubmit_postSubmit() {
		alert("提交成功");
		flushPage();
	}
		
	function btCancel_onClick(){
	   subwindow_floatWindowAudit.close();
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