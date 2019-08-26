<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBHdsHisAddThree" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top">
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
									    <td width="25%"  colspan="1" align="right" nowrap class="labeltd">主键信息</td>
										<td width="75%"  colspan="3" class="datatd" id="tdpkinfo"><@CommonQueryMacro.SingleField fId="pkinfo"/></td>
									</tr>  
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
		<td width="25%" width="25%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="25%" id="xitong">
						<@CommonQueryMacro.GroupBox id="guoup3" label="系统信息" expand="true">
							<table frame=void class="grouptable" width="100%">
								<tr>
									<td width="25%" align="right" nowrap class="labeltd" width="25%">数据来源</td>
									<td width="25%" class="datatd" width="25%">
										<@CommonQueryMacro.SingleField fId="sourceType" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd" width="25%">记录状态</td>
									<td width="25%" class="datatd" width="25%">
										<@CommonQueryMacro.SingleField fId="recStatus" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">回执状态</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="repStatus" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">创建时间</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="crtTm" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">最后操作人</td>
									<td width="25%" class="datatd">
										<@CommonQueryMacro.SingleField fId="lstUpdTlr" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">最后更新时间</td>
									<td width="25%" class="datatd">
										<@CommonQueryMacro.SingleField fId="lstUpdTm" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">审核状态</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="approveStatus" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">审核说明</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="approveResult" />
									</td>
								</tr>
								<tr ><td>&nbsp; &nbsp;</td></tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">回执错误信息</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="errmsg" />
									</td>
								</tr>
							</table>
						</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="3">
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	function initCallGetter_post(){
		//详细页面设置只读、其他按钮全部屏蔽
		if(op=="detail"){
			AmlBHdsHisAddThree_dataset.setReadOnly(true);
		}
	}
	
	
	
	function btBack_onClick() {
		closeWin();
	}
	
	
  
</script>
</@CommonQueryMacro.page>