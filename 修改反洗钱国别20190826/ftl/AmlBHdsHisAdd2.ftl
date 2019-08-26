<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBHdsHisAdd2" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top">
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
							<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="csnm"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
						    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnt"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="catp"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="ctac"/></td>	
						 </tr>
						 <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="citp"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="aoitp"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctid"/></td>
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
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="finn"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="finc"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="rltp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="firc"/></td>	
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码类型</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="fict"/></td>
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
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfin"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点类型</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfct"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfic"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcnm"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcac"/></td>
										
									</tr>	
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcit"/></td>
										<td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型进一步说明</td>
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="coitp"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcid"/></td>	
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
									    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tsct"/></td>  
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
		<td align="left" colspan="3">
			<center>
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
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
		var citp1 = AmlBHdsHisAdd2_dataset.getValue("citp");
		if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
     		document.getElementById("citpDesc").style.display="";
     		document.getElementById("citpDescLable").style.display="";
       		AmlBHdsHisAdd2_dataset.setFieldReadOnly("citpDesc", false);
  		}
  		//详细页面设置只读
		if(op=="detail"){
			iddescDisplay();
			AmlBHdsHisAdd2_dataset.setReadOnly(true);
		}
	}
	
	//【客户身份证件/证明文件类型】 【交易对手证件类型】【代办人身份证件类型】为[19：其他类个人身份有效证件]或者[29：其他类机构代码]时 页面初始化要显示类型进一步说明否则不显示
	function iddescDisplay(){
	   var citp = AmlBHdsHisAdd2_dataset.getValue("citp");
	   var tbit = AmlBHdsHisAdd2_dataset.getValue("tbit");
	   var tcit = AmlBHdsHisAdd2_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlBHdsHisAdd2_dataset.setFieldReadOnly("citpDesc", false);
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
		closeWin();
	}
	
	
  
</script>
</@CommonQueryMacro.page>