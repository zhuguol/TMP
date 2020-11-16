<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="存量客户最新风险等级表">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="TbRiskNew2020" init="false" submitMode="all">
	<table align="left"  width="100%">
		<tr>
   			<td align="center"  colspan="2">
   				<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" colNm=4 showButton="true" />
        	</td>
        </tr>
		<tr>
			<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
  		<tr>
      		<td colspan="2">
          		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btRSPCsv" fieldStr="bankCode1[120],cstNo[120],openTime[120],closeTime[120],selfAccName[160],idNo[120],accType[120],riskCode[120],time[160],norm[120],orgCode[300]" width="100%"  readonly="true"/><br />
        	</td>
        </tr>
   </table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr>
</table>
<script language="javascript">

    function orgCode_DropDown_beforeOpen(dropDown){
	    BiTreeDataDicSelect_DropDownDataset.setParameter("codeType","ORGCODE");
	}

	function btXls_onClick(){
		var openTimeStart = formatDate(TbRiskNew2020_interface_dataset.getValue("openTimeStart"));
		var openTimeEnd = formatDate(TbRiskNew2020_interface_dataset.getValue("openTimeEnd"));
		//var orgCode = TbRiskNew2020_interface_dataset.getValue("orgCode");
		var flag = TbRiskNew2020_interface_dataset.getValue("flag");
		window.location.href="${contextPath}/filedownload/exportFile.do?fileType=xls&tbName=TB_RISK_NEW&openTimeStart="+openTimeStart+"&openTimeEnd="+openTimeEnd+"&flag="+flag;
	}
	
	//确认申请导出csv文件
	function btRSPCsv_onClickCheck(button){
		if(confirm("确认申请导出该查询条件下的数据?")){
			return true;
		}else{
			return false;
		}
	}
	
	function btRSPCsv_postSubmit(button){
		var retParam = button.returnParam;
		alert(retParam.msg);
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