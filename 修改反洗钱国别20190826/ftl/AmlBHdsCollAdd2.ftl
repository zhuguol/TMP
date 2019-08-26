<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易">
<#assign opFromAmlBHdsCollApprove2=RequestParameters["opFromAmlBHdsCollApprove2"]?default("")>
<@CommonQueryMacro.CommonQuery id="AmlBHdsCollAdd2" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdbrNo"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdreportType"><@CommonQueryMacro.SingleField fId="reportType"/></td>		
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdricd"><@CommonQueryMacro.SingleField fId="ricd"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构名称</td>
							   <td width="25%" width="25%" class="datatd" id="tdrinm"><@CommonQueryMacro.SingleField fId="rinm"/></td>	
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期<font color="red"> *</font></td>
								<td width="25%" width="25%" class="datatd" id="tdhtdt"><@CommonQueryMacro.SingleField fId="htdt"/></td>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易特征代码<font color="red"> *</font></td>
								<td width="25%" width="25%" class="datatd" id="tdcrcd"><@CommonQueryMacro.SingleField fId="crcd"/></td>
							</tr>
						</table> </@CommonQueryMacro.GroupBox>
					</td>
				</tr>
				<tr>
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="客户信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号<font color="red"> *</font></td>
							<td width="25%" width="25%" class="datatd" id="tdcsnm"><@CommonQueryMacro.SingleField fId="csnm"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称<font color="red"> *</font></td>
						   <td width="25%" width="25%" class="datatd" id="tdctnm"><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍<font color="red"> *</font></td>
						    <td width="25%" width="25%" class="datatd" id="tdctnt"><@CommonQueryMacro.SingleField fId="ctnt"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型<font color="red"> *</font></td>
						   <td width="25%" width="25%" class="datatd" id="tdcatp"><@CommonQueryMacro.SingleField fId="catp"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号<font color="red"> *</font></td>
						   <td width="25%" width="25%" class="datatd" id="tdctac"><@CommonQueryMacro.SingleField fId="ctac"/></td>	
						 </tr>
						 <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型<font color="red"> *</font></td>
						   <td width="25%" width="25%" class="datatd" id="tdcitp"><@CommonQueryMacro.SingleField fId="citp"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="aoitp"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码<font color="red"> *</font></td>
						    <td width="25%" width="25%" class="datatd" id="tdctid"><@CommonQueryMacro.SingleField fId="ctid"/></td>
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
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点名称<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdfinn"><@CommonQueryMacro.SingleField fId="finn"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdfinc"><@CommonQueryMacro.SingleField fId="finc"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdrltp"><@CommonQueryMacro.SingleField fId="rltp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdfirc"><@CommonQueryMacro.SingleField fId="firc"/></td>	
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码类型<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdfict"><@CommonQueryMacro.SingleField fId="fict"/></td>
									</tr>	
									</table> 
						  </FIELDSET>
						  <FIELDSET style="padding: 6px;" expand="true">
						  <LEGEND>代办人信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人姓名</td>
										<td width="25%" width="25%" class="datatd" id="tdtbnm"><@CommonQueryMacro.SingleField fId="tbnm"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易代办人身份证件号码</td>
										<td width="25%" width="25%" class="datatd" id="tdtbid"><@CommonQueryMacro.SingleField fId="tbid"/></td>	
									</tr>
									<tr>
									   	<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtbit"><@CommonQueryMacro.SingleField fId="tbit"/></td>
										<td width="25%" width="25%" id="tbitDescLable" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型进一步说明</td>	 
										<td width="25%" width="25%" class="datatd" id="tbitDesc"><@CommonQueryMacro.SingleField fId="boitp"/></td>		
									  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人国籍</td>
										<td width="25%" width="25%" class="datatd" id="tdtbnt"><@CommonQueryMacro.SingleField fId="tbnt"/></td>    
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易对手信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcfin"><@CommonQueryMacro.SingleField fId="cfin"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点类型<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcfct"><@CommonQueryMacro.SingleField fId="cfct"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcfic"><@CommonQueryMacro.SingleField fId="cfic"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtcnm"><@CommonQueryMacro.SingleField fId="tcnm"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtcat"><@CommonQueryMacro.SingleField fId="tcat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtcac"><@CommonQueryMacro.SingleField fId="tcac"/></td>
										
									</tr>	
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtcit"><@CommonQueryMacro.SingleField fId="tcit"/></td>
										<td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型进一步说明</td>
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="coitp"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码<font color="red"> *</font></td>
									    <td width="25%" width="25%"class="datatd" id="tdtcid"><@CommonQueryMacro.SingleField fId="tcid"/></td>	
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%"  colspan="1" align="right" nowrap class="labeltd">主键信息</td>
										<td width="75%"  colspan="3" class="datatd" id="tdpkinfo"><@CommonQueryMacro.SingleField fId="pkinfo"/></td>
									</tr>  
									<tr>
									    <td width="25%"  colspan="1" align="right" nowrap class="labeltd">业务标识号<font color="red"> *</font></td>
										<td width="25%"  colspan="3" class="datatd" id="tdticd"><@CommonQueryMacro.SingleField fId="ticd"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易日期<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtstm"><@CommonQueryMacro.SingleField fId="tstm"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式<font color="red"> *</font></td>
									    <td width="25%" width="25%" class="datatd" id="tdtstp"><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码<font color="red"> *</font></td>
									    <td width="25%" width="25%" class="datatd" id="tdtsct"><@CommonQueryMacro.SingleField fId="tsct"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd" id="tdtsdr"><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcrtp"><@CommonQueryMacro.SingleField fId="crtp"/></td>																		
									</tr>									
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcrat"><@CommonQueryMacro.SingleField fId="crat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd" id="tdcrpp"><@CommonQueryMacro.SingleField fId="crpp"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcd"><@CommonQueryMacro.SingleField fId="trcd"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd" id="tdtrcdSuffix"><@CommonQueryMacro.SingleField fId="trcdSuffix"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向国别</td>
									   <td width="25%" width="25%" class="datatd" id="tdtdrc"><@CommonQueryMacro.SingleField fId="tdrc"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向区域</td>
									   <td width="25%" width="25%" class="datatd" id="tdtdrcSuffix"><@CommonQueryMacro.SingleField fId="tdrcSuffix"/></td>
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
		<td align="left" colspan="3">
			<center>
			 <#if (opFromAmlBHdsCollApprove2 =="flag" )>
			 <@CommonQueryMacro.Button id="btApprove"/>&nbsp; &nbsp;
			 <@CommonQueryMacro.Button id="btUNApprove"/>
			 </#if>
			<@CommonQueryMacro.Button id="btSaveTemp"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btReport"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btDel"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
		</td>
	</tr>
	<tr>
		<td >
		  <@CommonQueryMacro.FloatWindow id="floatWindowAudit" label="" width="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
		  <div align="center">
		      <@CommonQueryMacro.Group id="group2" label="审核信息"
		      fieldStr="approveResultChoose" colNm=2/>
		       <br />
		     <@CommonQueryMacro.Button id= "btSubmit"/>
		     <@CommonQueryMacro.Button id= "btCancel"/>
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
		var citp1 = AmlBHdsCollAdd2_dataset.getValue("citp");
		if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
     		document.getElementById("citpDesc").style.display="";
     		document.getElementById("citpDescLable").style.display="";
       		AmlBHdsCollAdd2_dataset.setFieldReadOnly("citpDesc", false);
  		}
  		//详细页面设置只读
		if(op=="detail"||op=="alldetail"){
			document.getElementById('btSave').style.display="none";
			document.getElementById('btSaveTemp').style.display="none";
			document.getElementById('btReport').style.display="none";   
			document.getElementById('btDel').style.display="none";
			//AmlBHdsCollAdd2_dataset.setReadOnly(true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("brNo", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("reportType", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ricd", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("rinm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("htdt", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("crcd", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("csnm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ctnm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ctnt", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("catp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ctac", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("citp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("aoitp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ctid", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("finn", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("finc", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("rltp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("firc", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("fict", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tbnm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tbid", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tbit", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("boitp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tbnt", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("cfin", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("cfct", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("cfic", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tcnm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tcat", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tcac", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tcit", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("coitp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("pkinfo", true);//20171212 add by ywc
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tcid", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("ticd", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tstm", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tstp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tsct", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tsdr", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("crtp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("crat", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("crpp", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcd", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrc", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("approveStatusChoose", false);
			AmlBHdsCollAdd2_dataset.setFieldReadOnly("approveResultChoose", false);
		}
		//修改页面部分字段不可修改
		if(op=="mod"){
	  		iddescDisplay();   //初始化证件类型进一步说明的填写框
	  		var codeName = '${v_branchcode}'+'-'+'${v_branchName}';
	  		AmlBHdsCollAdd2_dataset.setValue("brNo",'${v_branchcode}');  //初始化机构号
      		AmlBHdsCollAdd2_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
       		AmlBHdsCollAdd2_dataset.setValue("rinm",'${v_branchName}');  //初始化报告机构名称
       		AmlBHdsCollAdd2_dataset.setValue("rinmName",codeName);
       		AmlBHdsCollAdd2_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("ricd",true);       //报告机构编码不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("rinm",true);       //报告机构名称不可修改
		   
		   	
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("csnm",true);       //客户号不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("reportType",true); //报文类型不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("htdt",true);       //大额交易发生日期不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("tstm",true);       //交易日期不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("crcd",true);       //大额交易特征代码不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("ticd",true);       //业务标识号不可修改
		   	AmlBHdsCollAdd2_dataset.setFieldReadOnly("pkinfo",true);       //主键信息不可修改  add by yang 20171212
		   	
	   		var trcd = AmlBHdsCollAdd2_dataset.getValue("trcd");
       		if(trcd!="CHN" && trcd!="Z01" && trcd!="Z02" && trcd!="Z03"){
           		AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true); 
       		}
       		var tdrc = AmlBHdsCollAdd2_dataset.getValue("tdrc");
	       if(tdrc!="CHN" && tdrc!="Z01" && tdrc!="Z02" && tdrc!="Z03"){
	           AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true); 
	       }
		}
		//新增页面
		if(op=="new"||op=="bubao"||op=='copynew'){
			iddescDisplay();
		  //隐藏状态栏
		  document.getElementById('xitong').style.display="none";
		  document.getElementById("citpDesc").style.display="none";
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tcitDesc").style.display="none";
	      document.getElementById("citpDescLable").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      document.getElementById("tcitDescLable").style.display="none";
       
	      var codeName = '${v_branchcode}'+'-'+'${v_branchName}';
	      AmlBHdsCollAdd2_dataset.setValue("brNo",'${v_branchcode}');  //初始化机构号
	      AmlBHdsCollAdd2_dataset.setValue("ricd",'${v_reportCode}');//初始化报告机构编码
	      AmlBHdsCollAdd2_dataset.setValue("rinm",'${v_branchName}');//初始化报告机构名称
	      AmlBHdsCollAdd2_dataset.setValue("rinmName",codeName);
	      AmlBHdsCollAdd2_dataset.setValue("fict","00");//金融机构网点代码类型  目前暂定填写“00”
	      AmlBHdsCollAdd2_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
	      AmlBHdsCollAdd2_dataset.setFieldReadOnly("reportType",true);
	      AmlBHdsCollAdd2_dataset.setFieldReadOnly("ricd",true);
	      AmlBHdsCollAdd2_dataset.setFieldReadOnly("rinm",true);
		}
		if(op=="detail" || op=="del"){
		  iddescDisplay();
		}
		if(op=="mod"||op=="detail"){
			AMLVaildService.location(location_id,function(data){
				if(data!=null){
					for(var i=0;i<data.length;i++){
						var node = document.getElementById("editor_"+data[i]);
						node.style.background = "red"; 
					}
				}
			});
		}
	}
	
	
	//【客户身份证件/证明文件类型】 【交易对手证件类型】【代办人身份证件类型】为[19：其他类个人身份有效证件]或者[29：其他类机构代码]时 页面初始化要显示类型进一步说明否则不显示
	function iddescDisplay(){
	   var citp = AmlBHdsCollAdd2_dataset.getValue("citp");
	   var tbit = AmlBHdsCollAdd2_dataset.getValue("tbit");
	   var tcit = AmlBHdsCollAdd2_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlBHdsCollAdd2_dataset.setFieldReadOnly("citpDesc", false);
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
	   
	   var tbnm = AmlBHdsCollAdd2_dataset.getValue("tbnm");  //交易代办人姓名
	   var tbit = AmlBHdsCollAdd2_dataset.getValue("tbit");  //交易代办人证件类型
	   var tbid = AmlBHdsCollAdd2_dataset.getValue("tbid");  //交易代办人证件号码
	   var tbnt = AmlBHdsCollAdd2_dataset.getValue("tbnt");  //交易代办人国籍
	   var crpp = AmlBHdsCollAdd2_dataset.getValue("crpp");  //资金用途
	   if(tbnm==""||tbnm==null){
	   		AmlBHdsCollAdd2_dataset.setValue("tbnm","@N");
	   }
	   if(tbit==""||tbit==null){
	   		AmlBHdsCollAdd2_dataset.setValue("tbit","@N");
	   }
	   if(tbid==""||tbid==null){
	   		AmlBHdsCollAdd2_dataset.setValue("tbid","@N");
	   }
	   if(tbnt==""||tbnt==null){
	   		AmlBHdsCollAdd2_dataset.setValue("tbnt","@N");
	   }
	   if(crpp==""||crpp==null){
	   		AmlBHdsCollAdd2_dataset.setValue("crpp","@N");
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
		
     //客户身份证件/证明文件类型
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("citpDescLable").style.display="";
		    document.getElementById("citpDesc").style.display="";
		    AmlBHdsCollAdd2_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlBHdsCollAdd2_dataset.setValue("citpDesc","");
	  }
	  return true;
	}

	//代办人身份证件类型
	function tbit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	      document.getElementById("tbitDesc").style.display="";
	      document.getElementById("tbitDescLable").style.display="";
	      AmlBHdsCollAdd2_dataset.getField("tbitDesc").require=true;    
	  }else{
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      AmlBHdsCollAdd2_dataset.setValue("tbitDesc","");
	  }
	  return true;
	}
	
	//代办人身份证件类型
	function tcit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	    document.getElementById("tcitDesc").style.display="";
	    document.getElementById("tcitDescLable").style.display="";
	    AmlBHdsCollAdd2_dataset.getField("tcitDesc").require=true;     
	  }else{
	    document.getElementById("tcitDesc").style.display="none";
	    document.getElementById("tcitDescLable").style.display="none";
	    AmlBHdsCollAdd2_dataset.setValue("tcitDesc","");
	  }
	  return true;
	}
	
	//交易方向
	function tdrc_DropDown_onSelect(dropDown,record,editor){
	  var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	  var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";	  
      if(!b1 &&　!b2){
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffix","000000");
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffixName","000000");
           AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);     
      }
      if(b1){
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffix","");
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffixName","");
           AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);
      }
      if(b2){
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffix","");
           AmlBHdsCollAdd2_dataset.setValue("tdrcSuffixName","");
           AmlBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", false);
      }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsCollAdd2_dataset.setValue("trcdSuffix","000000");
          AmlBHdsCollAdd2_dataset.setValue("trcdSuffixName","000000");
          AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBHdsCollAdd2_dataset.setValue("trcdSuffix","");
           AmlBHdsCollAdd2_dataset.setValue("trcdSuffixName","");
           AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBHdsCollAdd2_dataset.setValue("trcdSuffix","");
           AmlBHdsCollAdd2_dataset.setValue("trcdSuffixName","");
           AmlBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	
	//暂存校验
	function btSaveTemp_onClickCheck(button) {
   	   var htdt = formatDate(AmlBHdsCollAdd2_dataset.getValue("htdt")); 
       AmlBHdsCollAdd2_dataset.setValue("workDate",htdt);
       var tstm = formatDate(AmlBHdsCollAdd2_dataset.getValue("tstm")); 
       if(htdt!=tstm){
            alert("大额交易发生日期和交易日期不一致！");
            return false;
       }
   }
	
 	//保存校验
    function btSave_onClickCheck(button) {
   	   var htdt = formatDate(AmlBHdsCollAdd2_dataset.getValue("htdt")); 
       AmlBHdsCollAdd2_dataset.setValue("workDate",htdt);
        var tstm = formatDate(AmlBHdsCollAdd2_dataset.getValue("tstm")); 
       if(htdt!=tstm){
            alert("大额交易发生日期和交易日期不一致！");
            return false;
       }
       
       var citpdesc = AmlBHdsCollAdd2_dataset.getValue("citpDesc"); 
       AmlBHdsCollAdd2_dataset.setValue("citpDesc",citpdesc);
       //交易发生地为国内,交易发生地区不能为空
       var trcd = AmlBHdsCollAdd2_dataset.getValue("trcd"); 
       var trcdSuffix = AmlBHdsCollAdd2_dataset.getValue("trcdSuffix"); 
       if(trcd=="CHN" || trcd=="Z01" || trcd=="Z02" || trcd=="Z03"){
            if(trcdSuffix==""){
            alert("交易发生地为国内,交易发生地区不能为空");
            return false;
            }     
       }
       
       //交易方向国别为国内,交易方向地区不能为空
       var tdrcSuffix = AmlBHdsCollAdd2_dataset.getValue("tdrcSuffix"); 
       var tdrc = AmlBHdsCollAdd2_dataset.getValue("tdrc");
       if(tdrc=="CHN" || tdrc=="Z01" || tdrc=="Z02" || tdrc=="Z03"){
            if(tdrcSuffix==""){
            alert("交易方向国别为国内,交易方向地区不能为空");
            return false;
            }     
       }
       return true;
	}
	
	function btSaveTemp_postSubmit(button){
		alert("保存成功！");
		closeWin(true);
	}
	
	function btBack_onClick() {
		closeWin();
	}
  
	//上报
	function btReport_onClickCheck(button) {
	   var htdt = formatDate(AmlBHdsCollAdd2_dataset.getValue("htdt")); 
	   AmlBHdsCollAdd2_dataset.setValue("workDate",htdt);
	   
	    var tstm = formatDate(AmlBHdsCollAdd2_dataset.getValue("tstm")); 
       if(htdt!=tstm){
            alert("大额交易发生日期和交易日期不一致！");
            return false;
       }
       
        var citpdesc = AmlBHdsCollAdd2_dataset.getValue("citpDesc"); 
       AmlBHdsCollAdd2_dataset.setValue("citpDesc",citpdesc);
       //交易发生地为国内,交易发生地区不能为空
       var trcd = AmlBHdsCollAdd2_dataset.getValue("trcd"); 
       var trcdSuffix = AmlBHdsCollAdd2_dataset.getValue("trcdSuffix"); 
       if(trcd=="CHN" || trcd=="Z01" || trcd=="Z02" || trcd=="Z03"){
            if(trcdSuffix==""){
            alert("交易发生地为国内,交易发生地区不能为空");
            return false;
            }     
       }
       
       //交易方向国别为国内,交易方向地区不能为空
       var tdrcSuffix = AmlBHdsCollAdd2_dataset.getValue("tdrcSuffix"); 
       var tdrc = AmlBHdsCollAdd2_dataset.getValue("tdrc");
       if(tdrc=="CHN" || tdrc=="Z01" || tdrc=="Z02" || tdrc=="Z03"){
            if(tdrcSuffix==""){
            alert("交易方向国别为国内,交易方向地区不能为空");
            return false;
            }     
       }
    }
    
	function btReport_postSubmit(button){
		var retParam = button.returnParam;
    	var msg0=retParam.msg0;
    	var msg1=retParam.msg1;
    	if(msg0.length == 0){
	    	if(op=='new'||op=='bubao'||op=='copynew'){
		    	alert("上报成功！");
				closeWin(true);
		    }else{
			    if(confirm("上报成功！是否继续补录下一条交易数据？")){
			    		 var reportType = AmlBHdsCollAdd2_dataset.getValue("reportType");
						 AMLVaildService.getNextDate(reportType,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlBHdsCollAdd2_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd2_dataset.flushData();
						 	}else{
						 		alert("当前所有交易都已补录完成！");
						 		closeWin(true);
						 	}
						});
				}else{
					closeWin(true);
				}
		    }
    	}else{
    	  wrnAlert(msg1);
    	  var field=msg0.split("    ");
    	  setStyle();
    	  for(var i=0; i < field.length ;i+=2){
				var node = document.getElementById("editor_"+trim(field[i]));
				node.style.background = "red"; 
				document.getElementById("td"+trim(field[i])).title=trim(field[i+1]);
			}
    	}
	}
	
	 //删除
	function btDel_onClickCheck(button){
	    var ticd = AmlBHdsCollAdd2_dataset.getValue("ticd");
	    doDelete(ticd);		
	}
	
	function doDelete(ticd){
     	if(window.confirm("是否确认不上报？")){
	    	AMLVaildService.deleteAmlBH(ticd,function(num){
	    	    alert(num);
	    	    closeWin(true);
	    	});
    	}else{
    	   return false;
    	}
	}
	
	
	function AmlBHdsCollAdd2_dataset_afterChange(dataset,field){
	   if(field.name=="htdt"){
			var htdt = formatDate(dataset.getValue("htdt"));
			AmlBHdsBakService.JudgeReportType(htdt,"BH",function(mgs){
				if (mgs) {
						AmlBHdsCollAdd2_dataset.setValue("reportType",mgs);
				}
			});
			AmlBHdsCollAdd2_dataset.setValue("workDate",htdt);
		}
		  //根据已输入的主体客户号 自动显示客户信息
		if(field.name=="csnm"){
			var csnm = dataset.getValue("csnm");
			PrivAction.getAMLBSCust(csnm,function(List_cust){
				if (List_cust && List_cust.length > 0) {
				
					AmlBHdsCollAdd2_dataset.setValue("ctnm",List_cust[0].CUST_NAME == null?"":Trim(List_cust[0].CUST_NAME));
					AmlBHdsCollAdd2_dataset.setValue("ctnt",List_cust[0].CUST_NAT_CODE == null?"":Trim(List_cust[0].CUST_NAT_CODE));
					//AmlBHdsCollAdd2_dataset.setValue("catp",List_cust[0].CATP == null?"":Trim(List_cust[0].CATP));
					//AmlBHdsCollAdd2_dataset.setValue("ctac",List_cust[0].CTAC == null?"":Trim(List_cust[0].CTAC));
					AmlBHdsCollAdd2_dataset.setValue("citp",List_cust[0].CUST_ID_TYPE == null?"":Trim(List_cust[0].CUST_ID_TYPE));
					//AmlBHdsCollAdd2_dataset.setValue("aoitp",List_cust[0].AOITP == null?"":Trim(List_cust[0].AOITP));
					AmlBHdsCollAdd2_dataset.setValue("ctid",List_cust[0].CUST_ID_CERT_NO == null?"":Trim(List_cust[0].CUST_ID_CERT_NO));
					
				} else {
					AmlBHdsCollAdd2_dataset.setValue("ctnm","");
					AmlBHdsCollAdd2_dataset.setValue("ctnt","");
					AmlBHdsCollAdd2_dataset.setValue("catp","");
					AmlBHdsCollAdd2_dataset.setValue("ctac","");
					AmlBHdsCollAdd2_dataset.setValue("citp","");
					AmlBHdsCollAdd2_dataset.setValue("aoitp","");
					AmlBHdsCollAdd2_dataset.setValue("ctid","");
					
					
				}
			});
		}
		//根据已输入的交易对手账号 自动显示客户信息
		//if(field.name=="tcac"){
		//	var tcac = dataset.getValue("tcac");
		//	PrivAction.getAMLBHdsTcac(tcac,function(List_cust){
		//		if (List_cust && List_cust.length > 0) {
		//		
		//			AmlBHdsCollAdd2_dataset.setValue("cfin",List_cust[0].CFIN == null?"":List_cust[0].CFIN);
		//			AmlBHdsCollAdd2_dataset.setValue("cfct",List_cust[0].CFCT == null?"":List_cust[0].CFCT);
		//			AmlBHdsCollAdd2_dataset.setValue("cfic",List_cust[0].CFIC == null?"":List_cust[0].CFIC);
		//			AmlBHdsCollAdd2_dataset.setValue("tcnm",List_cust[0].TCNM == null?"":List_cust[0].TCNM);
		//			AmlBHdsCollAdd2_dataset.setValue("tcat",List_cust[0].TCAT == null?"":List_cust[0].TCAT);
		//			AmlBHdsCollAdd2_dataset.setValue("tcit",List_cust[0].TCIT == null?"":List_cust[0].TCIT);
		//			AmlBHdsCollAdd2_dataset.setValue("coitp",List_cust[0].COITP == null?"":List_cust[0].COITP);
		//			AmlBHdsCollAdd2_dataset.setValue("tcid",List_cust[0].TCID == null?"":List_cust[0].TCID);
		//			
		//		} else {
		//			AmlBHdsCollAdd2_dataset.setValue("cfin","");
		//			AmlBHdsCollAdd2_dataset.setValue("cfct","");
		//			AmlBHdsCollAdd2_dataset.setValue("cfic","");
		//			AmlBHdsCollAdd2_dataset.setValue("tcnm","");
		//			AmlBHdsCollAdd2_dataset.setValue("tcat","");
		//			AmlBHdsCollAdd2_dataset.setValue("tcit","");
		//			AmlBHdsCollAdd2_dataset.setValue("coitp","");
		//			AmlBHdsCollAdd2_dataset.setValue("tcid","");
		//			
		//		}
		//	});
		//}
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
	
	
	
	function btBack_onClick() {
		closeWin(true);
	}
	
	//审核通过按钮
	function btApprove_onClickCheck(button){
		var recIds = AmlBHdsCollAdd2_dataset.getValue("id")+"|";
	   	approveUNReport(recIds,"01","");//01-审核通过
   	}
   	
   	
   	//审核通过或不通过后台更新状态
   	function approveUNReport(ids,approveStatusChoose,approveResultChoose){
		AMLVaildService.approveUNReport(ids,approveStatusChoose,approveResultChoose,function(mgs){
		if(confirm("审核成功！是否继续审核下一条交易数据？")){
						 AMLVaildService.getNextApproveDate(function(id){
						 	if(id!=null){
							 	AmlBHdsCollAdd2_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd2_dataset.flushData();
						 	}else{
						 		alert("当前所有数据都已审核完成！");
						 		closeWin(true);
						 	}
						});
				}else{
					closeWin(true);
				}
		});
	}
	
	//审核不通过按钮
	function btUNApprove_onClick(){
	   	subwindow_floatWindowAudit.show();
   	}
   	
   	//确认审核不通过
   	function btSubmit_onClickCheck() {
	   	var approveResultChoose = AmlBHdsCollAdd2_dataset.getValue("approveResultChoose");
	   	if (approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	var recIds = AmlBHdsCollAdd2_dataset.getValue("id")+"|";
	    approveUNReport(recIds,"02",approveResultChoose);//02-审核不通过
		subwindow_floatWindowAudit.close();
	}
		
	function btCancel_onClick(){
		subwindow_floatWindowAudit.close();
	}
	
	function btSave_postSubmit(button){
    	var retParam = button.returnParam;
    	var msg0=retParam.msg0;
    	var msg1=retParam.msg1;
    	if(msg0.length == 0){
	    	if(op=='new'||op=='bubao'||op=='copynew'){
		    	alert("确认成功！");
				closeWin(true);
		    }else{
			    if(confirm("确认成功！是否继续补录下一条交易数据？")){
			    		 var reportType = AmlBHdsCollAdd2_dataset.getValue("reportType");
						 AMLVaildService.getNextDate(reportType,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlBHdsCollAdd2_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd2_dataset.flushData();
						 	}else{
						 		alert("当前所有交易都已补录完成！");
						 		closeWin(true);
						 	}
						});
				}else{
					closeWin(true);
				}
		    }
    	}else{
    	  wrnAlert(msg1);
    	  var field=msg0.split("    ");
    	  setStyle();
    	  for(var i=0; i < field.length ;i+=2){
				var node = document.getElementById("editor_"+trim(field[i]));
				node.style.background = "red"; 
				document.getElementById("td"+trim(field[i])).title=trim(field[i+1]);
			}
    	}
    }
    function trim(s){
        return s.replace(/(^\s*)|(\s*$)/g, "");
    }
        
    function setStyle(){
	    document.getElementById("editor_brNo").style.background = "none";
	    document.getElementById("tdbrNo").removeAttribute("title");
	    document.getElementById("editor_reportType").style.background = "none";
	    document.getElementById("tdreportType").removeAttribute("title");
	    document.getElementById("editor_ricd").style.background = "none";
	    document.getElementById("tdricd").removeAttribute("title");
	    document.getElementById("editor_rinm").style.background = "none";
	    document.getElementById("tdrinm").removeAttribute("title");
	    document.getElementById("editor_htdt").style.background = "none";
	    document.getElementById("tdhtdt").removeAttribute("title");
	    document.getElementById("editor_crcd").style.background = "none";
	    document.getElementById("tdcrcd").removeAttribute("title");
	    document.getElementById("editor_csnm").style.background = "none";
	    document.getElementById("tdcsnm").removeAttribute("title");
	    document.getElementById("editor_ctnm").style.background = "none";
	    document.getElementById("tdctnm").removeAttribute("title");
	    document.getElementById("editor_ctnt").style.background = "none";
	    document.getElementById("tdctnt").removeAttribute("title");
	    document.getElementById("editor_catp").style.background = "none";
	    document.getElementById("tdcatp").removeAttribute("title");
	    document.getElementById("editor_ctac").style.background = "none";
	    document.getElementById("tdctac").removeAttribute("title");
	    document.getElementById("editor_citp").style.background = "none";
	    document.getElementById("tdcitp").removeAttribute("title");
	    document.getElementById("editor_aoitp").style.background = "none";
	    document.getElementById("citpDesc").removeAttribute("title");
	    document.getElementById("editor_ctid").style.background = "none";
	    document.getElementById("tdctid").removeAttribute("title");
	    document.getElementById("editor_finn").style.background = "none";
	    document.getElementById("tdfinn").removeAttribute("title");
	    document.getElementById("editor_finc").style.background = "none";
	    document.getElementById("tdfinc").removeAttribute("title");
	    document.getElementById("editor_rltp").style.background = "none";
	    document.getElementById("tdrltp").removeAttribute("title");
	    document.getElementById("editor_firc").style.background = "none";
	    document.getElementById("tdfirc").removeAttribute("title");
	    document.getElementById("editor_fict").style.background = "none";
	    document.getElementById("tdfict").removeAttribute("title");
	    document.getElementById("editor_tbnm").style.background = "none";
	    document.getElementById("tdtbnm").removeAttribute("title");
	    document.getElementById("editor_tbid").style.background = "none";
	    document.getElementById("tdtbid").removeAttribute("title");
	    document.getElementById("editor_tbit").style.background = "none";
	    document.getElementById("tdtbit").removeAttribute("title");
	    document.getElementById("editor_boitp").style.background = "none";
	    document.getElementById("tbitDesc").removeAttribute("title");
	    document.getElementById("editor_tbnt").style.background = "none";
	    document.getElementById("tdtbnt").removeAttribute("title");
	    document.getElementById("editor_cfin").style.background = "none";
	    document.getElementById("tdcfin").removeAttribute("title");
	    document.getElementById("editor_cfct").style.background = "none";
	    document.getElementById("tdcfct").removeAttribute("title"); 
	    document.getElementById("editor_cfic").style.background = "none";
	    document.getElementById("tdcfic").removeAttribute("title");
	    document.getElementById("editor_tcnm").style.background = "none";
	    document.getElementById("tdtcnm").removeAttribute("title");
	    document.getElementById("editor_tcat").style.background = "none";
	    document.getElementById("tdtcat").removeAttribute("title");
	    document.getElementById("editor_tcac").style.background = "none";
	    document.getElementById("tdtcac").removeAttribute("title");
	    document.getElementById("editor_tcit").style.background = "none";
	    document.getElementById("tdtcit").removeAttribute("title");
	    document.getElementById("editor_coitp").style.background = "none";
	    document.getElementById("tcitDesc").removeAttribute("title");
	    document.getElementById("editor_tcid").style.background = "none";
	    document.getElementById("tdtcid").removeAttribute("title");
	    document.getElementById("editor_ticd").style.background = "none";
	    document.getElementById("tdticd").removeAttribute("title");
	    document.getElementById("editor_tstm").style.background = "none";
	    document.getElementById("tdtstm").removeAttribute("title");
	    document.getElementById("editor_tstp").style.background = "none";
	    document.getElementById("tdtstp").removeAttribute("title");
	    document.getElementById("editor_tsct").style.background = "none";
	    document.getElementById("tdtsct").removeAttribute("title"); 
	    document.getElementById("editor_tsdr").style.background = "none";
	    document.getElementById("tdtsdr").removeAttribute("title");
	    document.getElementById("editor_crtp").style.background = "none";
	    document.getElementById("tdcrtp").removeAttribute("title");
	    document.getElementById("editor_crat").style.background = "none";
	    document.getElementById("tdcrat").removeAttribute("title");
	    document.getElementById("editor_crpp").style.background = "none";
	    document.getElementById("tdcrpp").removeAttribute("title");
	    document.getElementById("editor_trcd").style.background = "none";
	    document.getElementById("tdtrcd").removeAttribute("title");
	    document.getElementById("editor_trcdSuffix").style.background = "none";
	    document.getElementById("tdtrcdSuffix").removeAttribute("title");
	    document.getElementById("editor_tdrc").style.background = "none";
	    document.getElementById("tdtdrc").removeAttribute("title");
	    document.getElementById("editor_tdrcSuffix").style.background = "none";
	    document.getElementById("tdtdrcSuffix").removeAttribute("title");  
    }
    //字符串前后去空格
    function Trim(str){ 

             return str.replace(/(^\s*)|(\s*$)/g, ""); 
     }
</script>
</@CommonQueryMacro.page>