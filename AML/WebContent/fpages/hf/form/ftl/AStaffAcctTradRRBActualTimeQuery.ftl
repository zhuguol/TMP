<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="">
<@CommonQueryMacro.CommonQuery id="AStaffAcctTradRRBActualTimeQuery" init="false" insertOnEmpty="true" submitMode="allchange" navigate="false">
<table width="100%" cellpadding="2">
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
		<td width="75%" valign="top" >
			<table width="100%" cellpadding="0" cellspacing="0" id="bhdetail">
				<tr>
				    <td width="25%">
				   		<@CommonQueryMacro.GroupBox id="groupbox1" label="实时信息" expand="true">
							<table frame="void" class="grouptable" width="100%">
								<tr>
							    	<td width="25%" colspan="1" align="left" nowrap class="labeltd">MI Index</td>
							    	<td width="50%" colspan="2" align="left" nowrap class="labeltd">Description</td>
							    	<td width="25%" colspan="1" align="left" nowrap class="labeltd">Query Results</td>
								</tr>
								<tr>	
							    	<td width="25%" colspan="1" align="left" nowrap class="labeltd">Report Period</td>
							    	<td width="50%" colspan="2" align="left" nowrap class="labeltd">The data report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="left" id="tdreportPeriod"><@CommonQueryMacro.SingleField fId="reportPeriod"/></td>
								</tr>
						   		<tr>
							   		<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case to FCTM</td>
							   		<td width="50%" colspan="2" align="left" nowrap class="labeltd">The case volume refer to FCTM after OPS inverstigation</td>
							  		<td width="25%" colspan="1" class="datatd" align="left" id="tdcaseToFCTM"><@CommonQueryMacro.SingleField fId="caseToFCTM"/></td>	
						  	 	</tr>
						   		<tr>
							   		<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case to President</td>
							   		<td width="50%" colspan="2" align="left" nowrap class="labeltd">The case volume refer to President after OPS investigation</td>
							  		<td width="25%" colspan="1" class="datatd" align="left" id="tdcaseToPresident"><@CommonQueryMacro.SingleField fId="caseToPresident"/></td>	
						  	 	</tr>
						   		<tr>
						   			<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case Closed by FCTM</td>
									<td width="50%" colspan="2" align="left" nowrap class="labeltd">The case volume close by FCTM in report period</td>
									<td width="25%" colspan="1" class="datatd" align="left" id="tdcaseClosedByFCTM"><@CommonQueryMacro.SingleField fId="caseClosedByFCTM"/></td>
						   		</tr>
						   		<tr>
									<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case Closed by President</td>
									<td width="50%" colspan="2" align="left" nowrap class="labeltd">The case volume close by President in report period</td>
									<td width="25%" colspan="1" class="datatd" align="left" id="tdcaseClosedByPresident"><@CommonQueryMacro.SingleField fId="caseClosedByPresident"/></td>
						   		</tr>
						   		<tr>
						   			<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case Pending by FCTM</td>
									<td width="50%" colspan="1" align="left" nowrap class="labeltd">The case volume pending FCTM feedback in report period</td>
									<td width="25%" colspan="2" class="datatd" align="left" id="tdcasePendingByFCTM"><@CommonQueryMacro.SingleField fId="casePendingByFCTM"/></td>
						   		</tr>
								<tr>
						    		<td width="25%" colspan="1" align="left" nowrap class="labeltd">Case Pending by President</td>
						    		<td width="50%" colspan="1" align="left" nowrap class="labeltd">The case volume pending President feedback in report period</td>
						    		<td width="25%" colspan="2" class="datatd" align="left" id="tdcasePendingByPresident"><@CommonQueryMacro.SingleField fId="casePendingByPresident"/></td>
								</tr>
							</table> 
						</@CommonQueryMacro.GroupBox>
				    </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	//获取系统日期
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	//页面初始化
	function initCallGetter_post(){
  		//交易起始日期
		AStaffAcctTradRRBActualTimeQuery_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradRRBActualTimeQuery_interface_dataset.setValue("etlDateEnd",sysTxdate);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("reportPeriod",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("caseToFCTM",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("caseToPresident",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("caseClosedByFCTM",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("caseClosedByPresident",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("casePendingByFCTM",true);
		AStaffAcctTradRRBActualTimeQuery_dataset.setFieldReadOnly("casePendingByPresident",true);
	}
</script>
</@CommonQueryMacro.page>