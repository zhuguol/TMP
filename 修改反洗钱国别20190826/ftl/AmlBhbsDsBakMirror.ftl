<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBhbsDsBakMirror" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="50%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="reportType"/></td>		
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ricd"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构名称</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="rinm"/></td>	
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="htdt"/></td>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易特征代码</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="crcd"/></td>
							</tr>
						</table> </@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							<td width="25%" width="25%" class="datatd" id ="csnm"><@CommonQueryMacro.SingleField fId="csnm"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						   <td width="25%" width="25%" class="datatd" id ="ctnm"><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
						    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ctnt"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="catp"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ctac"/></td>	
						 </tr>
						 <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="citp"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="aoitp"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ctid"/></td>
						</tr>
						</table> </@CommonQueryMacro.GroupBox>
				   </td>
				</tr>
				<tr>
				   <td width="25%"> <@CommonQueryMacro.GroupBox id="groupbox1" label="大额交易特征信息" expand="true">
						<FIELDSET style="padding: 6px;" expand="true">
							<LEGEND>金融机构网点信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点名称</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finn"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finc"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="rltp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="firc"/></td>	
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码类型</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="fict"/></td>
									</tr>	
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
						  <LEGEND>代办人信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人姓名</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbnm"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件号码</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbid"/></td>	
									</tr>
									<tr>
									   	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbit"/></td>
										<td width="25%" width="25%" id="tbitDescLable" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型进一步说明</td>	 
										<td width="25%" width="25%" class="datatd" id="tbitDesc"><@CommonQueryMacro.SingleField fId="boitp"/></td>		
									  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人国籍</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbnt"/></td>    
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易对手信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cfin"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cfct"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cfic"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tcnm"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tcat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tcac"/></td>
										
									</tr>	
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tcit"/></td>
										<td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型进一步说明</td>
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="coitp"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd"><@CommonQueryMacro.SingleField fId="tcid"/></td>	
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ticd"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易日期</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tstm"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tsct"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="crtp"/></td>																		
									</tr>									
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="crat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="crpp"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcd"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcdSuffix"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向国别</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tdrc"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向区域</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tdrcSuffix"/></td>
									</tr>
									</table> 
							 </FIELDSET>
						</@CommonQueryMacro.GroupBox>
			       </td>
			  </tr>	
			</table>
		</td>
		<td width="50%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="原报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="reportType"/></td>		
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ricd"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构名称</td>
							   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="rinm"/></td>	
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="htdt"/></td>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易特征代码</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="crcd"/></td>
							</tr>
						</table> </@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="custNo"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="custName"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
						    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="custNatCode"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="acctType"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="acctNo"/></td>	
						 </tr>
						 <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="custIdType"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="custIdTypeDesc"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="custIdCertNo"/></td>
						</tr>
						</table> </@CommonQueryMacro.GroupBox>
				   </td>
				</tr>
				<tr>
				   <td width="25%"> <@CommonQueryMacro.GroupBox id="groupbox1" label="大额交易特征信息" expand="true">
						<FIELDSET style="padding: 6px;" expand="true">
							<LEGEND>金融机构网点信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点名称</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finaOrgName"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finaOrgCode"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finaOrgNoRelatoCust"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finaOrgAreaCode"/></td>	
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码类型</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="finaOrgCodeType"/></td>
									</tr>	
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
						  <LEGEND>代办人信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人姓名</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="chargeName"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件号码</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="chargeIdCertNo"/></td>	
									</tr>
									<tr>
									   	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="chargeIdType"/></td>
										<td width="25%" width="25%" id="tbitDescLable" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型进一步说明</td>	 
										<td width="25%" width="25%" class="datatd" id="tbitDesc"><@CommonQueryMacro.SingleField fId="chargeIdTypeDesc"/></td>		
									  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人国籍</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="chargeNatCode"/></td>    
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易对手信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="opsFinaOrgName"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="opsFinaOrgCodeType"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="opsFinaOrgCode"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradAdvsName"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradAdvsAcctType"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradAdvsAcctNo"/></td>
										
									</tr>	
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradAdvsIdType"/></td>
										<td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型进一步说明</td>
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="tradAdvsIdTypeDesc"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd"><@CommonQueryMacro.SingleField fId="tradAdvsIdCertNo"/></td>	
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="bussFlag"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易日期</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradTime"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tradType"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="overseaPayTradNoType"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="fundPayFlag"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ccyCd"/></td>																		
									</tr>									
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cTradAmt"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="fundPayPurpos"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcdLar"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcdSuffixLar"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向国别</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tdrcLar"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向区域</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tdrcSuffixLar"/></td>
									</tr>
									</table> 
							 </FIELDSET>
						</@CommonQueryMacro.GroupBox>
			       </td>
			  </tr>	
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="3">
			<center>
			 <@CommonQueryMacro.Button id="btApprove"/>&nbsp; &nbsp;
			 <@CommonQueryMacro.Button id="btUNApprove"/>
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
		</td>
	</tr>
	<tr>
		<td >
		 <@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="500" height="200" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		      			<div align="center">
		        			<@CommonQueryMacro.GroupBox id="group2" label="审核信息" expand="true">
				  					<table frame="void" class="grouptable" width="100%">
						   			<tr>
									   <td width="25%" colspan="1" align="right" nowrap class="labeltd">审核说明</td>
									   <td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="approveResultChoose"/></td>			
						   			</tr>
						   			<!--
						   			<tr>
									   <td width="25%" id="specialTypeLable" colspan="1" align="right" nowrap class="labeltd">生成特殊报文类型</td>
									   <td width="25%" class="datatd" id="specialType"><@CommonQueryMacro.SingleField fId="specialType"/></td>			
						   			</tr>
						   			-->
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
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	var location_id = "${RequestParameters["id"]?default('')}"; 
	<#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
	<#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
	<#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
	function initCallGetter_post(){
		var citp1 = AmlBhbsDsBakMirror_dataset.getValue("citp");
		
		if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
     		document.getElementById("citpDesc").style.display="";
     		document.getElementById("citpDescLable").style.display="";
       		AmlBhbsDsBakMirror_dataset.setFieldReadOnly("citpDesc", false);
  		}
  		//对比镜像
  		if(AmlBhbsDsBakMirror_dataset.getValue("csnm") != AmlBhbsDsBakMirror_dataset.getValue("custNo")) {
  			document.getElementById("editor_csnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("ctnm") != AmlBhbsDsBakMirror_dataset.getValue("custName")) {
  			document.getElementById("editor_ctnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("ctnt") != AmlBhbsDsBakMirror_dataset.getValue("custNatCode")) {
  			document.getElementById("editor_ctnt").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("catp") != AmlBhbsDsBakMirror_dataset.getValue("acctType")) {
  			document.getElementById("editor_catp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("ctac") != AmlBhbsDsBakMirror_dataset.getValue("acctNo")) {
  			document.getElementById("editor_ctac").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("citp") != AmlBhbsDsBakMirror_dataset.getValue("custIdType")) {
  			document.getElementById("editor_citp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("aoitp") != AmlBhbsDsBakMirror_dataset.getValue("custIdTypeDesc")) {
  			document.getElementById("editor_aoitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("ctid") != AmlBhbsDsBakMirror_dataset.getValue("custIdCertNo")) {
  			document.getElementById("editor_ctid").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("finn") != AmlBhbsDsBakMirror_dataset.getValue("finaOrgName")) {
  			document.getElementById("editor_finn").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("finc") != AmlBhbsDsBakMirror_dataset.getValue("finaOrgCode")) {
  			document.getElementById("editor_finc").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("rltp") != AmlBhbsDsBakMirror_dataset.getValue("finaOrgNoRelatoCust")) {
  			document.getElementById("editor_rltp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("firc") != AmlBhbsDsBakMirror_dataset.getValue("finaOrgAreaCode")) {
  			document.getElementById("editor_firc").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("fict") != AmlBhbsDsBakMirror_dataset.getValue("finaOrgCodeType")) {
  			document.getElementById("editor_fict").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tbnm") != AmlBhbsDsBakMirror_dataset.getValue("chargeName")) {
  			document.getElementById("editor_tbnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tbid") != AmlBhbsDsBakMirror_dataset.getValue("chargeIdCertNo")) {
  			document.getElementById("editor_tbid").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tbit") != AmlBhbsDsBakMirror_dataset.getValue("chargeIdType")) {
  			document.getElementById("editor_tbit").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("boitp") != AmlBhbsDsBakMirror_dataset.getValue("chargeIdTypeDesc")) {
  			document.getElementById("editor_boitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tbnt") != AmlBhbsDsBakMirror_dataset.getValue("chargeNatCode")) {
  			document.getElementById("editor_tbnt").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("cfin") != AmlBhbsDsBakMirror_dataset.getValue("opsFinaOrgName")) {
  			document.getElementById("editor_cfin").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("cfct") != AmlBhbsDsBakMirror_dataset.getValue("opsFinaOrgCodeType")) {
  			document.getElementById("editor_cfct").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("cfic") != AmlBhbsDsBakMirror_dataset.getValue("opsFinaOrgCode")) {
  			document.getElementById("editor_cfic").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tcnm") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsName")) {
  			document.getElementById("editor_tcnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tcat") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsAcctType")) {
  			document.getElementById("editor_tcat").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tcac") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsAcctNo")) {
  			document.getElementById("editor_tcac").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tcit") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsIdType")) {
  			document.getElementById("editor_tcit").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("coitp") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsIdTypeDesc")) {
  			document.getElementById("editor_coitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tcid") != AmlBhbsDsBakMirror_dataset.getValue("tradAdvsIdCertNo")) {
  			document.getElementById("editor_tcid").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("ticd") != AmlBhbsDsBakMirror_dataset.getValue("bussFlag")) {
  			document.getElementById("editor_ticd").style.color = "red";
  		}
  		if(formatDate(AmlBhbsDsBakMirror_dataset.getValue("tstm")) != formatDate(AmlBhbsDsBakMirror_dataset.getValue("tradTime"))) {
  			document.getElementById("editor_tstm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tstp") != AmlBhbsDsBakMirror_dataset.getValue("tradType")) {
  			document.getElementById("editor_tstp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tsct") != AmlBhbsDsBakMirror_dataset.getValue("overseaPayTradNoType")) {
  			document.getElementById("editor_tsct").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tsdr") != AmlBhbsDsBakMirror_dataset.getValue("fundPayFlag")) {
  			document.getElementById("editor_tsdr").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("crtp") != AmlBhbsDsBakMirror_dataset.getValue("ccyCd")) {
  			document.getElementById("editor_crtp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("crat") != AmlBhbsDsBakMirror_dataset.getValue("cTradAmt")) {
  			document.getElementById("editor_crat").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("crpp") != AmlBhbsDsBakMirror_dataset.getValue("fundPayPurpos")) {
  			document.getElementById("editor_crpp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("trcd") != AmlBhbsDsBakMirror_dataset.getValue("trcdLar")) {
  			document.getElementById("editor_trcd").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("trcdSuffix") != AmlBhbsDsBakMirror_dataset.getValue("trcdSuffixLar")) {
  			document.getElementById("editor_trcdSuffix").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tdrc") != AmlBhbsDsBakMirror_dataset.getValue("tdrcLar")) {
  			document.getElementById("editor_tdrc").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirror_dataset.getValue("tdrcSuffix") != AmlBhbsDsBakMirror_dataset.getValue("tdrcSuffixLar")) {
  			document.getElementById("editor_tdrcSuffix").style.color = "red";
  		}
  		
  		//详细页面设置只读
		if(op=="detail"){
			iddescDisplay();
			
			//AmlBhbsDsBakMirror_dataset.setReadOnly(true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("brNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("reportType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ricd", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("rinm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("htdt", true);
			
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("crcd", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("csnm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ctnm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ctnt", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("catp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ctac", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("citp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("aoitp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ctid", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finn", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("rltp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("firc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("fict", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tbnm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tbid", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tbit", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("boitp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tbnt", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("cfin", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("cfct", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("cfic", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tcnm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tcat", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tcac", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tcit", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("coitp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tcid", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ticd", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tstm", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tstp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tsct", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tsdr", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("crtp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("crat", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("crpp", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("trcd", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("trcdSuffix", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tdrc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tdrcSuffix", true);
			
			
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custName", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custNatCode", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("acctType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("acctNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custIdType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custIdTypeDesc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("custIdCertNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finaOrgName", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finaOrgCode", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finaOrgNoRelatoCust", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finaOrgAreaCode", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("finaOrgCodeType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("chargeName", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("chargeIdCertNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("chargeIdType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("chargeIdTypeDesc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("chargeNatCode", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("opsFinaOrgName", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("opsFinaOrgCodeType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("opsFinaOrgCode", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsName", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsAcctType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsAcctNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsIdType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsIdTypeDesc", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradAdvsIdCertNo", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("bussFlag", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradTime", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tradType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("overseaPayTradNoType", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("fundPayFlag", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("ccyCd", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("cTradAmt", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("fundPayPurpos", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("trcdLar", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("trcdSuffixLar", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tdrcLar", true);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("tdrcSuffixLar", true);
			
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("approveStatusChoose", false);
			AmlBhbsDsBakMirror_dataset.setFieldReadOnly("approveResultChoose", false);
		}
	}
	
	//【客户身份证件/证明文件类型】 【交易对手证件类型】【代办人身份证件类型】为[19：其他类个人身份有效证件]或者[29：其他类机构代码]时 页面初始化要显示类型进一步说明否则不显示
	function iddescDisplay(){
	   var citp = AmlBhbsDsBakMirror_dataset.getValue("citp");
	   var tbit = AmlBhbsDsBakMirror_dataset.getValue("tbit");
	   var tcit = AmlBhbsDsBakMirror_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlBhbsDsBakMirror_dataset.setFieldReadOnly("citpDesc", false);
	   }else{
	      document.getElementById("citpDesc").style.display="none";
	      document.getElementById("citpDescLable").style.display="none";
	   }
	   if(tbit=="19" || tbit=="29"){
	      document.getElementById("tbitDesc").style.display="";
	      document.getElementById("tbitDescLable").style.display="";
	   }else{
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	   }
	   if(tcit=="19" || tcit=="29"){
	      document.getElementById("tcitDesc").style.display="";
	      document.getElementById("tcitDescLable").style.display="";
	   }else{
	      document.getElementById("tcitDesc").style.display="none";
	      document.getElementById("tcitDescLable").style.display="none";
	   }
	}
	
	//交易类型属性下拉框
	function tstp_DropDown_beforeOpen(dropDown){
	    BiTreeDataDicSelect_DropDownDataset.setParameter("codeType","TSTP");
	    BiTreeDataDicSelect_DropDownDataset.setParameter("headDataTypeNo","9999");
	}
	
	//涉外收支交易分类与代码属性下拉框
 	function tsct_DropDown_beforeOpen(dropDown){
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("headDataTypeNo","02");
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("codeType","AML");
	 }
	
	function btBack_onClick() {
		closeWin(true);
	}
	
	
	//审核通过按钮
	function btApprove_onClickCheck(button){
		var recId = AmlBhbsDsBakMirror_dataset.getValue("id");
		var filler2 = AmlBhbsDsBakMirror_dataset.getValue("filler2");
	   	var ticd = AmlBhbsDsBakMirror_dataset.getValue("ticd");
		approve(recId,"01","","",filler2,ticd);//01-审核通过
   	}
   	
   	//审核不通过按钮
	function btUNApprove_onClick(){
	   	subwindow_floatWindowAudit.show();
   	}
   	
   	//确认审核不通过
	function btSubmit_onClickCheck() {
	   	var approveResultChoose = AmlBhbsDsBakMirror_dataset.getValue("approveResultChoose");
	   	var specialType = AmlBhbsDsBakMirror_dataset.getValue("specialType");
	   	var filler2 = AmlBhbsDsBakMirror_dataset.getValue("filler2");
	   	var ticd = AmlBhbsDsBakMirror_dataset.getValue("ticd");
	   	if (approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	/*
	   	if (specialType.length < 1) {
	   		alert("审核结果不通过，必须选择生成特殊报文类型！");
	   		return false;
	   	}
	   	*/
	    var recId = AmlBhbsDsBakMirror_dataset.getValue("id");
    	approve(recId,"02",approveResultChoose,specialType,filler2,ticd);//02-审核不通过
		subwindow_floatWindowAudit.hide();
	}
	
	//审核通过或不通过后台更新状态
   	function approve(id,approveStatusChoose,approveResultChoose,specialType,filler2,ticd){
		AMLVaildService.approveZC(id,approveStatusChoose,approveResultChoose,specialType,filler2,ticd,function(mgs){
			if(mgs==''){
				if(confirm("审核成功！是否继续审核下一条交易数据？")){
				 AMLVaildService.getNextApproveZCDate(function(id){
				 	if(id!=null){
					 	AmlBhbsDsBakMirror_dataset.setParameter("id",id);
			    		AmlBhbsDsBakMirror_dataset.flushData();
				 	}else{
				 		alert("当前所有数据都已审核完成！");
				 		closeWin(true);
				 	}
				});
				}else{
					closeWin(true);
				}
			}else{
				alert(mgs);
			}
		});
	}
	
	function approveStatusChoose_DropDown_onSelect(dropDown,record,editor){
		  if(record[0]=="02"){
		 	 document.getElementById('specialType').style.display="";
			 document.getElementById('specialTypeLable').style.display="";
		  }else{
		  	 document.getElementById('specialType').style.display="none";
			 document.getElementById('specialTypeLable').style.display="none";
		  }
		  return true;
	}
	function btBack_onClick() {
		closeWin(true);
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
  
</script>
</@CommonQueryMacro.page>