<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="">
<@CommonQueryMacro.CommonQuery id="AStaffAcctTradActualTimeQuery" init="false" insertOnEmpty="true" submitMode="allchange" navigate="false">
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
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">MI Index</td>
							    	<td width="50%" colspan="2" align="center" nowrap class="labeltd">Description</td>
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">Query Results</td>
								</tr>
								<tr>	
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">Report Period</td>
							    	<td width="50%" colspan="2" align="center" nowrap class="labeltd">The data report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="center" id="tdreportPeriod"><@CommonQueryMacro.SingleField fId="reportPeriod"/></td>
								</tr>
						   		<tr>
							   		<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case to FCTM</td>
							   		<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume refer to FCTM after OPS inverstigation</td>
							  		<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseToFCTM"><@CommonQueryMacro.SingleField fId="caseToFCTM"/></td>	
						  	 	</tr>
						   		<tr>
							   		<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case to GB/GF</td>
							   		<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume refer to GB/GF after OPS inverstigation</td>
							  		<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseToGBGF"><@CommonQueryMacro.SingleField fId="caseToGBGF"/></td>	
						  	 	</tr>
						   		<tr>
						   			<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case to HOST</td>
									<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume refer to HOST after OPS inverstigation</td>
									<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseToHOST"><@CommonQueryMacro.SingleField fId="caseToHOST"/></td>
						   		</tr>
						   		<tr>
									<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case to COO</td>
									<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume refer to loB COO after OPS inverstigation</td>
									<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseToCOO"><@CommonQueryMacro.SingleField fId="caseToCOO"/></td>
						   		</tr>
						   		<tr>
						   			<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Closed by FCTM(FCR)</td>
									<td width="50%" colspan="1" align="center" nowrap class="labeltd">The case volume close by FCTM(FCR) in report period</td>
									<td width="25%" colspan="2" class="datatd" align="center" id="tdcaseClosedByFCTMFCR"><@CommonQueryMacro.SingleField fId="caseClosedByFCTMFCR"/></td>
						   		</tr>
								<tr>
						    		<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Closed by FCTM(SAFE)</td>
						    		<td width="50%" colspan="1" align="center" nowrap class="labeltd">The case volume close by FCTM(SAFE) in report period</td>
						    		<td width="25%" colspan="2" class="datatd" align="center" id="tdcaseClosedByFCTMSAFE"><@CommonQueryMacro.SingleField fId="caseClosedByFCTMSAFE"/></td>
								</tr>
								<tr>
						    		<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Closed by GB/GF</td>
						    		<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume close by GB/GF in report period</td>
						    		<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseClosedByGBGF"><@CommonQueryMacro.SingleField fId="caseClosedByGBGF"/></td>  
								</tr>
								<tr>   
						    		<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Closed by HOST</td>
									<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume close by HOST in report period</td>
						    		<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseClosedByHOST"><@CommonQueryMacro.SingleField fId="caseClosedByHOST"/></td> 
								</tr>
								<tr>   
									<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Closed by COO</td>
									<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume close by loB COO in report period</td>
						    		<td width="25%" colspan="1" class="datatd" align="center" id="tdcaseClosedByCOO"><@CommonQueryMacro.SingleField fId="caseClosedByCOO"/></td> 
								</tr>
								<tr>
									<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Pending by FCTM</td>
							    	<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume Pending FCTM feedback in report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="center" id="tdcasePendingByFCTM"><@CommonQueryMacro.SingleField fId="casePendingByFCTM"/></td>
							    </tr>
								<tr>
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Pending by GB/GF</td>
							    	<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume Pending GB/GF feedback in report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="center" id="tdcasePendingByGBGF"><@CommonQueryMacro.SingleField fId="casePendingByGBGF"/></td>  
							    </tr>
								<tr>
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Pending by HOST</td>
									<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume Pending HOST feedback in report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="center" id="tdcasePendingByHOST"><@CommonQueryMacro.SingleField fId="casePendingByHOST"/></td>
								</tr>
								<tr>
							    	<td width="25%" colspan="1" align="center" nowrap class="labeltd">Case Pending by COO</td>
							    	<td width="50%" colspan="2" align="center" nowrap class="labeltd">The case volume Pending COO feedback in report period</td>
							    	<td width="25%" colspan="1" class="datatd" align="center" id="tdcasePendingByCOO"><@CommonQueryMacro.SingleField fId="casePendingByCOO"/></td>
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
		AStaffAcctTradActualTimeQuery_interface_dataset.setValue("etlDateStart",sysTxdate);
		//交易结束日期
		AStaffAcctTradActualTimeQuery_interface_dataset.setValue("etlDateEnd",sysTxdate);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("reportPeriod",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseToFCTM",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseToGBGF",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseToHOST",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseToCOO",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseClosedByFCTMFCR",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseClosedByFCTMSAFE",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseClosedByGBGF",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseClosedByHOST",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("caseClosedByCOO",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("casePendingByFCTM",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("casePendingByGBGF",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("casePendingByHOST",true);
		AStaffAcctTradActualTimeQuery_dataset.setFieldReadOnly("casePendingByCOO",true);
	}
</script>
</@CommonQueryMacro.page>