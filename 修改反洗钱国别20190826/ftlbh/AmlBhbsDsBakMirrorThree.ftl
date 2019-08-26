<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易抽样审核详细页面">
<@CommonQueryMacro.CommonQuery id="AmlBhbsDsBakMirrorThree" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="50%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号</td>
							   <td width="25%" width="25%" class="datatd" id="tdbrNo"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
							   <td width="25%" width="25%" class="datatd" id="tdreportType"><@CommonQueryMacro.SingleField fId="reportType"/></td>	
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
							   <td width="25%" width="25%" class="datatd" id="tdricd"><@CommonQueryMacro.SingleField fId="ricd"/></td>	
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdhtdt"><@CommonQueryMacro.SingleField fId="htdt"/></td>		
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易特征代码</td>
								<td width="25%" width="25%" class="datatd" id="tdcrcd"><@CommonQueryMacro.SingleField fId="crcd"/></td>
							</tr>
						</table> </@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							<td width="25%" width="25%" class="datatd" id="tdcsnm"><@CommonQueryMacro.SingleField fId="csnm"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						    <td width="25%" width="25%" class="datatd" id="tdctnm"><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						 </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						    <td width="25%" width="25%" class="datatd" id="tdcitp"><@CommonQueryMacro.SingleField fId="citp"/></td>  
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户其他身份证件/证明文件类型</td>
						    <td width="25%" width="25%" class="datatd" id="tdaoitp"><@CommonQueryMacro.SingleField fId="aoitp"/></td> 
						</tr>
						 <tr>
							 <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
							 <td width="25%" width="25%" class="datatd" id="tdctnt"><@CommonQueryMacro.SingleField fId="ctnt"/></td>
							 <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户职业（对私）或客户行业（对公）</td>
							 <td width="25%" width="25%" class="datatd" id="tdctvc"><@CommonQueryMacro.SingleField fId="ctvc"/></td>
						</tr>
						<tr>
							<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户联系电话</td>
						    <td width="25%" width="25%" class="datatd" id="tdcctl"><@CommonQueryMacro.SingleField fId="cctl"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户其他联系方式</td>
						    <td width="25%" width="25%" class="datatd" id="tdccei"><@CommonQueryMacro.SingleField fId="ccei"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd" id="tdctid"><@CommonQueryMacro.SingleField fId="ctid"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户住址</td>
						    <td width="25%" width="25%" class="datatd" id="tdctar"><@CommonQueryMacro.SingleField fId="ctar"/></td>  
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
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd" id="tdfinc"><@CommonQueryMacro.SingleField fId="finc"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构与客户的关系</td>
									   <td width="25%" width="25%" class="datatd" id="tdrlfc"><@CommonQueryMacro.SingleField fId="rlfc"/></td>
									</tr>
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
							<LEGEND>客户账户信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdcatp"><@CommonQueryMacro.SingleField fId="catp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账号</td>
									   <td width="25%" width="25%" class="datatd" id="tdctac"><@CommonQueryMacro.SingleField fId="ctac"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户开立时间</td>
									   <td width="25%" width="25%" class="datatd" id="tdoatm"><@CommonQueryMacro.SingleField fId="oatm"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdcbct"><@CommonQueryMacro.SingleField fId="cbct"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡其他类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdocbt"><@CommonQueryMacro.SingleField fId="ocbt"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡号码</td>
									   <td width="25%" width="25%" class="datatd" id="tdcbcn"><@CommonQueryMacro.SingleField fId="cbcn"/></td>
									</tr>
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
						  <LEGEND>交易代办人信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人姓名</td>
										<td width="25%" width="25%" class="datatd" id="tdtbnm"><@CommonQueryMacro.SingleField fId="tbnm"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtbit"><@CommonQueryMacro.SingleField fId="tbit"/></td>	
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人其他身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdboitp"><@CommonQueryMacro.SingleField fId="boitp"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件/证明文件号码</td>
										<td width="25%" width="25%" class="datatd" id="tdtbid"><@CommonQueryMacro.SingleField fId="tbid"/></td>	
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人国籍</td>
										<td width="25%" width="25%" class="datatd" id="tdtbnt"><@CommonQueryMacro.SingleField fId="tbnt"/></td>
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易主体信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号</td>
										<td width="25%" width="25%" class="datatd" id="tdticd"><@CommonQueryMacro.SingleField fId="ticd"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易时间</td>
										<td width="25%" width="25%" class="datatd" id="tdtstm"><@CommonQueryMacro.SingleField fId="tstm"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcd"><@CommonQueryMacro.SingleField fId="trcd"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcdSuffix"><@CommonQueryMacro.SingleField fId="trcdSuffix"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">收付款方匹配号类型</td>
										<td width="25%" width="25%" class="datatd" id="tdrpmt"><@CommonQueryMacro.SingleField fId="rpmt"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">收付款方匹配号</td>
										<td width="25%" width="25%" class="datatd" id="tdrpmn"><@CommonQueryMacro.SingleField fId="rpmn"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdtstp"><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">非柜台交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdoctt"><@CommonQueryMacro.SingleField fId="octt"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">其他非柜台交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdooct"><@CommonQueryMacro.SingleField fId="ooct"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">非柜台交易方式的设备代码</td>
									    <td width="25%" width="25%" class="datatd" id="tdocec"><@CommonQueryMacro.SingleField fId="ocec"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">银行与支付机构之间的业务交易编码</td>
									    <td width="25%" width="25%" class="datatd" id="tdbptc"><@CommonQueryMacro.SingleField fId="bptc"/></td> 
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd" id="tdtsct"><@CommonQueryMacro.SingleField fId="tsct"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd" id="tdtsdr"><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd" id="tdcrpp"><@CommonQueryMacro.SingleField fId="crpp"/></td>
									</tr>	
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd" id="tdcrtp"><@CommonQueryMacro.SingleField fId="crtp"/></td>		
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
										<td width="25%" width="25%" class="datatd" id="tdcrat"><@CommonQueryMacro.SingleField fId="crat"/></td>
									</tr>
									</table> 
							 </FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易对手信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>
										<td width="25%" width="25%" class="datatd" id="tdcfin"><@CommonQueryMacro.SingleField fId="cfin"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点代码类型</td>
										<td width="25%" width="25%" class="datatd" id="tdcfct"><@CommonQueryMacro.SingleField fId="cfct"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd" id="tdcfic"><@CommonQueryMacro.SingleField fId="cfic"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名/名称</td>
										<td width="25%" width="25%" class="datatd" id="tdtcnm"><@CommonQueryMacro.SingleField fId="tcnm"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点</td>
										<td width="25%" width="25%" class="datatd" id="tdcfrc"><@CommonQueryMacro.SingleField fId="cfrc"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点地区行政区划代码</td>
										<td width="25%" width="25%" class="datatd" id="tdcfrcSuffix"><@CommonQueryMacro.SingleField fId="cfrcSuffix"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtcit"><@CommonQueryMacro.SingleField fId="tcit"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手其他身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdcoitp"><@CommonQueryMacro.SingleField fId="coitp"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd" id="tdtcid"><@CommonQueryMacro.SingleField fId="tcid"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtcat"><@CommonQueryMacro.SingleField fId="tcat"/></td>	
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd" id="tdtcac"><@CommonQueryMacro.SingleField fId="tcac"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易备注信息1</td>
										<td width="25%" width="25%" class="datatd" id="tdrotf1"><@CommonQueryMacro.SingleField fId="rotf1"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易备注信息2</td>
										<td width="25%" width="25%" class="datatd" id="tdrotf2"><@CommonQueryMacro.SingleField fId="rotf2"/></td>
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
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号</td>
							   <td width="25%" width="25%" class="datatd" id="tdbrNo"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
							   <td width="25%" width="25%" class="datatd" id="tdreportType"><@CommonQueryMacro.SingleField fId="reportType"/></td>	
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
							   <td width="25%" width="25%" class="datatd" id="tdricd"><@CommonQueryMacro.SingleField fId="ricd"/></td>	
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdhtdt"><@CommonQueryMacro.SingleField fId="htdt"/></td>		
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易特征代码</td>
								<td width="25%" width="25%" class="datatd" id="tdcrcd"><@CommonQueryMacro.SingleField fId="crcd"/></td>
							</tr>
						</table> </@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							<td width="25%" width="25%" class="datatd" id="tdcustNo"><@CommonQueryMacro.SingleField fId="custNo"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustName"><@CommonQueryMacro.SingleField fId="custName"/></td>
						 </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustIdType"><@CommonQueryMacro.SingleField fId="custIdType"/></td>  
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户其他身份证件/证明文件类型</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustIdTypeDesc"><@CommonQueryMacro.SingleField fId="custIdTypeDesc"/></td> 
						</tr>
						 <tr>
							 <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
							 <td width="25%" width="25%" class="datatd" id="tdcustNatCode"><@CommonQueryMacro.SingleField fId="custNatCode"/></td>
							 <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户职业（对私）或客户行业（对公）</td>
							 <td width="25%" width="25%" class="datatd" id="tdcustMetierIndt"><@CommonQueryMacro.SingleField fId="custMetierIndt"/></td>
						</tr>
						<tr>
							<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户联系电话</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustContactPatn"><@CommonQueryMacro.SingleField fId="custContactPatn"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户其他联系方式</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustOthrsContactPatn"><@CommonQueryMacro.SingleField fId="custOthrsContactPatn"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustIdCertNo"><@CommonQueryMacro.SingleField fId="custIdCertNo"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户住址</td>
						    <td width="25%" width="25%" class="datatd" id="tdcustDetailAddr"><@CommonQueryMacro.SingleField fId="custDetailAddr"/></td>  
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
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd" id="tdfinaOrgCode"><@CommonQueryMacro.SingleField fId="finaOrgCode"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构与客户的关系</td>
									   <td width="25%" width="25%" class="datatd" id="tdfinaOrgNoRelatoCust"><@CommonQueryMacro.SingleField fId="finaOrgNoRelatoCust"/></td>
									</tr>
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
							<LEGEND>客户账户信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdacctType"><@CommonQueryMacro.SingleField fId="acctType"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账号</td>
									   <td width="25%" width="25%" class="datatd" id="tdacctNo"><@CommonQueryMacro.SingleField fId="acctNo"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户开立时间</td>
									   <td width="25%" width="25%" class="datatd" id="tdcustOpenAcctDate"><@CommonQueryMacro.SingleField fId="custOpenAcctDate"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdbankCardType"><@CommonQueryMacro.SingleField fId="bankCardType"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡其他类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdbankCardTypeDesc"><@CommonQueryMacro.SingleField fId="bankCardTypeDesc"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户银行卡号码</td>
									   <td width="25%" width="25%" class="datatd" id="tdbankCardNo"><@CommonQueryMacro.SingleField fId="bankCardNo"/></td>
									</tr>
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
						  <LEGEND>交易代办人信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人姓名</td>
										<td width="25%" width="25%" class="datatd" id="tdchargeName"><@CommonQueryMacro.SingleField fId="chargeName"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdchargeIdType"><@CommonQueryMacro.SingleField fId="chargeIdType"/></td>	
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人其他身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdchargeIdTypeDesc"><@CommonQueryMacro.SingleField fId="chargeIdTypeDesc"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件/证明文件号码</td>
										<td width="25%" width="25%" class="datatd" id="tdchargeIdCertNo"><@CommonQueryMacro.SingleField fId="chargeIdCertNo"/></td>	
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人国籍</td>
										<td width="25%" width="25%" class="datatd" id="tdchargeNatCode"><@CommonQueryMacro.SingleField fId="chargeNatCode"/></td>
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易主体信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号</td>
										<td width="25%" width="25%" class="datatd" id="tdbussFlag"><@CommonQueryMacro.SingleField fId="bussFlag"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易时间</td>
										<td width="25%" width="25%" class="datatd" id="tdtradTime"><@CommonQueryMacro.SingleField fId="tradTime"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcdLar"><@CommonQueryMacro.SingleField fId="trcdLar"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcdSuffixLar"><@CommonQueryMacro.SingleField fId="trcdSuffixLar"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">收付款方匹配号类型</td>
										<td width="25%" width="25%" class="datatd" id="tdpayMatchNoType"><@CommonQueryMacro.SingleField fId="payMatchNoType"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">收付款方匹配号</td>
										<td width="25%" width="25%" class="datatd" id="tdpayMatchNo"><@CommonQueryMacro.SingleField fId="payMatchNo"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdtradType"><@CommonQueryMacro.SingleField fId="tradType"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">非柜台交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdnonCotrTradType"><@CommonQueryMacro.SingleField fId="nonCotrTradType"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">其他非柜台交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdotNonCortTradType"><@CommonQueryMacro.SingleField fId="otNonCortTradType"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">非柜台交易方式的设备代码</td>
									    <td width="25%" width="25%" class="datatd" id="tdnonCotrTradTypeCode"><@CommonQueryMacro.SingleField fId="nonCotrTradTypeCode"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">银行与支付机构之间的业务交易编码</td>
									    <td width="25%" width="25%" class="datatd" id="tdbankPayorgBussno"><@CommonQueryMacro.SingleField fId="bankPayorgBussno"/></td> 
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd" id="tdoverseaPayTradNoType"><@CommonQueryMacro.SingleField fId="overseaPayTradNoType"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd" id="tdfundPayFlag"><@CommonQueryMacro.SingleField fId="fundPayFlag"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd" id="tdfundPayPurpos"><@CommonQueryMacro.SingleField fId="fundPayPurpos"/></td>
									</tr>	
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd" id="tdccyCd"><@CommonQueryMacro.SingleField fId="ccyCd"/></td>		
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
										<td width="25%" width="25%" class="datatd" id="tdcTradAmt"><@CommonQueryMacro.SingleField fId="cTradAmt"/></td>
									</tr>
									</table> 
							 </FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易对手信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>
										<td width="25%" width="25%" class="datatd" id="tdopsFinaOrgName"><@CommonQueryMacro.SingleField fId="opsFinaOrgName"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点代码类型</td>
										<td width="25%" width="25%" class="datatd" id="tdopsFinaOrgCodeType"><@CommonQueryMacro.SingleField fId="opsFinaOrgCodeType"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd" id="tdopsFinaOrgCode"><@CommonQueryMacro.SingleField fId="opsFinaOrgCode"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名/名称</td>
										<td width="25%" width="25%" class="datatd" id="tdtradAdvsName"><@CommonQueryMacro.SingleField fId="tradAdvsName"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点</td>
										<td width="25%" width="25%" class="datatd" id="tdcfrc"><@CommonQueryMacro.SingleField fId="tdfinaarea"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点地区行政区划代码</td>
										<td width="25%" width="25%" class="datatd" id="tdopsFinaOrgAreaCode"><@CommonQueryMacro.SingleField fId="tdfinaareaSuffixLar"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtradAdvsIdType"><@CommonQueryMacro.SingleField fId="tradAdvsIdType"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手其他身份证件/证明文件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtradAdvsIdTypeDesc"><@CommonQueryMacro.SingleField fId="tradAdvsIdTypeDesc"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd" id="tdtradAdvsIdCertNo"><@CommonQueryMacro.SingleField fId="tradAdvsIdCertNo"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtradAdvsAcctType"><@CommonQueryMacro.SingleField fId="tradAdvsAcctType"/></td>	
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd" id="tdtradAdvsAcctNo"><@CommonQueryMacro.SingleField fId="tradAdvsAcctNo"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易备注信息1</td>
										<td width="25%" width="25%" class="datatd" id="tdtradInfoRemark1"><@CommonQueryMacro.SingleField fId="tradInfoRemark1"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易备注信息2</td>
										<td width="25%" width="25%" class="datatd" id="tdtradInfoRemark2"><@CommonQueryMacro.SingleField fId="tradInfoRemark2"/></td>
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
						   			<tr>
									   <td width="25%" id="specialTypeLable" colspan="1" align="right" nowrap class="labeltd">生成特殊报文类型</td>
									   <td width="25%" class="datatd" id="specialType"><@CommonQueryMacro.SingleField fId="specialType"/></td>			
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
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	var location_id = "${RequestParameters["id"]?default('')}"; 
	<#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
	<#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
	<#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
	function initCallGetter_post(){
	  		//对比镜像
  			if(AmlBhbsDsBakMirrorThree_dataset.getValue("csnm") != AmlBhbsDsBakMirrorThree_dataset.getValue("custNo")) {
  			document.getElementById("editor_csnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctnm") != AmlBhbsDsBakMirrorThree_dataset.getValue("custName")) {
  			document.getElementById("editor_ctnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctnt") != AmlBhbsDsBakMirrorThree_dataset.getValue("custNatCode")) {
  			document.getElementById("editor_ctnt").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("catp") != AmlBhbsDsBakMirrorThree_dataset.getValue("acctType")) {
  			document.getElementById("editor_catp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctac") != AmlBhbsDsBakMirrorThree_dataset.getValue("acctNo")) {
  			document.getElementById("editor_ctac").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("citp") != AmlBhbsDsBakMirrorThree_dataset.getValue("custIdType")) {
  			document.getElementById("editor_citp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("aoitp") != AmlBhbsDsBakMirrorThree_dataset.getValue("custIdTypeDesc")) {
  			document.getElementById("editor_aoitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctid") != AmlBhbsDsBakMirrorThree_dataset.getValue("custIdCertNo")) {
  			document.getElementById("editor_ctid").style.color = "red";
  		}

  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("finc") != AmlBhbsDsBakMirrorThree_dataset.getValue("finaOrgCode")) {
  			document.getElementById("editor_finc").style.color = "red";
  		}

  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tbnm") != AmlBhbsDsBakMirrorThree_dataset.getValue("chargeName")) {
  			document.getElementById("editor_tbnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tbid") != AmlBhbsDsBakMirrorThree_dataset.getValue("chargeIdCertNo")) {
  			document.getElementById("editor_tbid").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tbit") != AmlBhbsDsBakMirrorThree_dataset.getValue("chargeIdType")) {
  			document.getElementById("editor_tbit").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("boitp") != AmlBhbsDsBakMirrorThree_dataset.getValue("chargeIdTypeDesc")) {
  			document.getElementById("editor_boitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tbnt") != AmlBhbsDsBakMirrorThree_dataset.getValue("chargeNatCode")) {
  			document.getElementById("editor_tbnt").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cfin") != AmlBhbsDsBakMirrorThree_dataset.getValue("opsFinaOrgName")) {
  			document.getElementById("editor_cfin").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cfct") != AmlBhbsDsBakMirrorThree_dataset.getValue("opsFinaOrgCodeType")) {
  			document.getElementById("editor_cfct").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cfic") != AmlBhbsDsBakMirrorThree_dataset.getValue("opsFinaOrgCode")) {
  			document.getElementById("editor_cfic").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tcnm") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsName")) {
  			document.getElementById("editor_tcnm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tcat") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsAcctType")) {
  			document.getElementById("editor_tcat").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tcac") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsAcctNo")) {
  			document.getElementById("editor_tcac").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tcit") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsIdType")) {
  			document.getElementById("editor_tcit").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("coitp") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsIdTypeDesc")) {
  			document.getElementById("editor_coitp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tcid") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradAdvsIdCertNo")) {
  			document.getElementById("editor_tcid").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ticd") != AmlBhbsDsBakMirrorThree_dataset.getValue("bussFlag")) {
  			document.getElementById("editor_ticd").style.color = "red";
  		}
  		if(formatDate(AmlBhbsDsBakMirrorThree_dataset.getValue("tstm")) != formatDate(AmlBhbsDsBakMirrorThree_dataset.getValue("tradTime"))) {
  			document.getElementById("editor_tstm").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tstp") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradType")) {
  			document.getElementById("editor_tstp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tsct") != AmlBhbsDsBakMirrorThree_dataset.getValue("overseaPayTradNoType")) {
  			document.getElementById("editor_tsct").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("tsdr") != AmlBhbsDsBakMirrorThree_dataset.getValue("fundPayFlag")) {
  			document.getElementById("editor_tsdr").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("crtp") != AmlBhbsDsBakMirrorThree_dataset.getValue("ccyCd")) {
  			document.getElementById("editor_crtp").style.color = "red";
  		}
  	//
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("crat") != AmlBhbsDsBakMirrorThree_dataset.getValue("cTradAmt")) {
  			document.getElementById("editor_crat").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("crpp") != AmlBhbsDsBakMirrorThree_dataset.getValue("fundPayPurpos")) {
  			document.getElementById("editor_crpp").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("trcd") != AmlBhbsDsBakMirrorThree_dataset.getValue("trcdLar")) {
  			document.getElementById("editor_trcd").style.color = "red";
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("trcdSuffix") != AmlBhbsDsBakMirrorThree_dataset.getValue("trcdSuffixLar")) {
  			document.getElementById("editor_trcdSuffix").style.color = "red";
  		}

  		
  		//20181123新增3号令字段
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctvc") != AmlBhbsDsBakMirrorThree_dataset.getValue("custMetierIndt")) {
  			document.getElementById("editor_ctvc").style.color = "red";//客户职业（对私）或客户行业（对公）
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cctl") != AmlBhbsDsBakMirrorThree_dataset.getValue("custContactPatn")) {
  			document.getElementById("editor_cctl").style.color = "red";//客户联系电话
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ccei") != AmlBhbsDsBakMirrorThree_dataset.getValue("custOthrsContactPatn")) {
  			document.getElementById("editor_ccei").style.color = "red";//客户其他联系方式
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ctar") != AmlBhbsDsBakMirrorThree_dataset.getValue("custDetailAddr")) {
  			document.getElementById("editor_ctar").style.color = "red";//客户住址
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("rlfc") != AmlBhbsDsBakMirrorThree_dataset.getValue("finaOrgNoRelatoCust")) {
  			document.getElementById("editor_rlfc").style.color = "red";//金融机构与客户的关系
  		}
  		if(formatDate(AmlBhbsDsBakMirrorThree_dataset.getValue("oatm")) != formatDate(AmlBhbsDsBakMirrorThree_dataset.getValue("custOpenAcctDate"))) {
  			document.getElementById("editor_oatm").style.color = "red";//客户账户开立时间
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cbct") != AmlBhbsDsBakMirrorThree_dataset.getValue("bankCardType")) {
  			document.getElementById("editor_cbct").style.color = "red";//客户银行卡类型
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("ocbt") != AmlBhbsDsBakMirrorThree_dataset.getValue("bankCardTypeDesc")) {
  			document.getElementById("editor_ocbt").style.color = "red";//客户银行卡其他类型
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("cbcn") != AmlBhbsDsBakMirrorThree_dataset.getValue("bankCardNo")) {
  			document.getElementById("editor_cbcn").style.color = "red";//客户银行卡号码
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("rpmt") != AmlBhbsDsBakMirrorThree_dataset.getValue("payMatchNoType")) {
  			document.getElementById("editor_rpmt").style.color = "red";//收付款方匹配号类型
  		}
  		if(AmlBhbsDsBakMirrorThree_dataset.getValue("rpmn") != AmlBhbsDsBakMirrorThree_dataset.getValue("payMatchNo")) {
  			document.getElementById("editor_rpmn").style.color = "red";//收付款方匹配号
  		}
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("octt") != AmlBhbsDsBakMirrorThree_dataset.getValue("nonCotrTradType")) {
  			document.getElementById("editor_octt").style.color = "red";//非柜台交易方式
  		}
  		
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("ooct") != AmlBhbsDsBakMirrorThree_dataset.getValue("otNonCortTradType")) {
  			document.getElementById("editor_ooct").style.color = "red";//其他非柜台交易方式
  		}
    		
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("ocec") != AmlBhbsDsBakMirrorThree_dataset.getValue("nonCotrTradTypeCode")) {
  			document.getElementById("editor_ocec").style.color = "red";//非柜台交易方式的设备代码
  		}	
  	    		
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("bptc") != AmlBhbsDsBakMirrorThree_dataset.getValue("bankPayorgBussno")) {
  			document.getElementById("editor_bptc").style.color = "red";//银行与支付机构之间的业务交易编码
  		}		
 	    		
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("cfrc") != AmlBhbsDsBakMirrorThree_dataset.getValue("tdfinaarea")) {
  			document.getElementById("editor_cfrc").style.color = "red";//对方金融机构网点
  		}		
  	    if(AmlBhbsDsBakMirrorThree_dataset.getValue("cfrcSuffix") != AmlBhbsDsBakMirrorThree_dataset.getValue("tdfinaareaSuffixLar")) {
  			document.getElementById("editor_cfrcSuffix").style.color = "red";//对方金融机构网点地区行政区划代码
  		}	
  		  if(AmlBhbsDsBakMirrorThree_dataset.getValue("rotf1") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradInfoRemark1")) {
  			document.getElementById("editor_rotf1").style.color = "red";//交易备注信息1
  		}	
  			
 	  if(AmlBhbsDsBakMirrorThree_dataset.getValue("rotf2") != AmlBhbsDsBakMirrorThree_dataset.getValue("tradInfoRemark2")) {
  			document.getElementById("editor_rotf2").style.color = "red";//交易备注信息2
  		} 		  		
  		//详细页面设置只读
		if(op=="detail"){
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("brNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("reportType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ricd", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rinm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("htdt", true);
			
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("crcd", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("csnm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctnm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctnt", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("catp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctac", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("citp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("aoitp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctid", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finn", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rltp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("firc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("fict", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tbnm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tbid", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tbit", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("boitp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tbnt", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cfin", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cfct", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cfic", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tcnm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tcat", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tcac", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tcit", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("coitp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tcid", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ticd", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tstm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tstp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tsct", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tsdr", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("crtp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("crat", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("crpp", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("trcd", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("trcdSuffix", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdrc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdrcSuffix", true);
			
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custName", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custNatCode", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("acctType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("acctNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custIdType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custIdTypeDesc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custIdCertNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgName", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgCode", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgNoRelatoCust", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgAreaCode", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgCodeType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("chargeName", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("chargeIdCertNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("chargeIdType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("chargeIdTypeDesc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("chargeNatCode", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("opsFinaOrgName", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("opsFinaOrgCodeType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("opsFinaOrgCode", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsName", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsAcctType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsAcctNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsIdType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsIdTypeDesc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradAdvsIdCertNo", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bussFlag", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradTime", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("overseaPayTradNoType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("fundPayFlag", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ccyCd", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cTradAmt", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("fundPayPurpos", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("trcdLar", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("trcdSuffixLar", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdrcLar", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdrcSuffixLar", true);
			
			////20181123新增3号令字段
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custMetierIndt", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custContactPatn", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custOthrsContactPatn", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custDetailAddr", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("finaOrgNoRelatoCust", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("custOpenAcctDate", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bankCardType", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bankCardTypeDesc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bankCardNo", true);
			//
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("payMatchNoType", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("payMatchNo", true);	
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("nonCotrTradType", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("nonCotrTradTypeCode", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("otNonCortTradType", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bankPayorgBussno", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bankPayorgBussno", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdfinaarea", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tdfinaareaSuffixLar", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradInfoRemark1", true);	
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("tradInfoRemark2", true);	
		
		
		
			//原对应字段。
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctvc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cctl", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ccei", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ctar", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rlfc", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("oatm", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cbct", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ocbt", true);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cbcn", true);
			//
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rpmt", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rpmn", true);	
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("octt", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("octt", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ooct", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("bptc", true);

				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cfrc", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("ocec", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("cfrcSuffix", true);
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rotf1", true);	
				AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("rotf2", true);	
		
		
					
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("approveStatusChoose", false);
			AmlBhbsDsBakMirrorThree_dataset.setFieldReadOnly("approveResultChoose", false);
		}
	}
	
	
	function btBack_onClick() {
		closeWin();
	}
	
	
	//审核通过按钮
	function btApprove_onClickCheck(button){
		var recId = AmlBhbsDsBakMirrorThree_dataset.getValue("id");
		var filler2 = AmlBhbsDsBakMirrorThree_dataset.getValue("filler2");
	   	var ticd = AmlBhbsDsBakMirrorThree_dataset.getValue("ticd");
		approve(recId,"01","","",filler2,ticd);//01-审核通过
   	}
   	
   	//审核不通过按钮
	function btUNApprove_onClick(){
	   	subwindow_floatWindowAudit.show();
   	}
   	
   	//确认审核不通过
	function btSubmit_onClickCheck() {
	   	var approveResultChoose = AmlBhbsDsBakMirrorThree_dataset.getValue("approveResultChoose");
	   	var specialType = AmlBhbsDsBakMirrorThree_dataset.getValue("specialType");
	   	var filler2 = AmlBhbsDsBakMirrorThree_dataset.getValue("filler2");
	   	var ticd = AmlBhbsDsBakMirrorThree_dataset.getValue("ticd");
	   	if (approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	if (specialType.length < 1) {
	   		alert("审核结果不通过，必须选择生成特殊报文类型！");
	   		return false;
	   	}
	    var recId = AmlBhbsDsBakMirrorThree_dataset.getValue("id");
    	approve(recId,"02",approveResultChoose,specialType,filler2,ticd);//02-审核不通过
		subwindow_floatWindowAudit.hide();
	}
	
	//审核通过或不通过后台更新状态
   	function approve(id,approveStatusChoose,approveResultChoose,specialType,filler2,ticd){
		HfAmlDwrService.approveZC(id,approveStatusChoose,approveResultChoose,specialType,filler2,ticd,function(mgs){
			if(mgs==''){
				if(confirm("审核成功！是否继续审核下一条交易数据？")){
				 HfAmlDwrService.getNextApproveZCDate(function(id){
				 	if(id!=null){
					 	AmlBhbsDsBakMirrorThree_dataset.setParameter("id",id);
			    		AmlBhbsDsBakMirrorThree_dataset.flushData();
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