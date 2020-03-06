<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="可疑报送抽样调查情况表">
	<@CommonQueryMacro.CommonQuery id="AmlCustMxInfo" init="true" navigate="false" >
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
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btChecker,-,btCancel" fieldStr="custNum[250],tradeNum[250],tradeType[250],tradeDate[250],filler1,filler2,filler3" width="100%" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>

<script language="JavaScript">
	var op = "${RequestParameters["op"]?default('')}";
	var id = "${RequestParameters["id"]?default('')}"; 
	/*
	function initCallGetter_post(){
		DWREngine.setAsync(false);
		AmlCustMxInfo_interface_dataset.setValue("custNums",id);
		
		if(id!=""){
			AmlCustMxInfo_dataset.flushData(AmlCustMxInfo_dataset.pageIndex);
		}
		DWREngine.setAsync(true);
	}
	*/
	//刷新数据
	function flushPage(){
		AmlCustInfo_dataset.flushData(AmlCustInfo_dataset.pageIndex);
	}
	
	function btCancel_onClick() {
		closeWin(true);
	}
</script>
</@CommonQueryMacro.page>