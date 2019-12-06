<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额新增报文详细">
<#assign opFromAmlBHdsCollApprove=RequestParameters["opFromAmlBHdsCollApprove"]?default("")>
<@CommonQueryMacro.CommonQuery id="AmlBHdsCollAdd" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top" >
			<table width="100%" cellpadding="0" cellspacing="0" id="bhdetail">
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
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdricd"><@CommonQueryMacro.SingleField fId="ricd"/></td>	
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期<font color="red"> *</font></td>
							   <td width="25%" width="25%" class="datatd" id="tdhtdt"><@CommonQueryMacro.SingleField fId="htdt"/></td>		
						   </tr>
						   <tr>
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
							<td width="25%" width="25%" class="datatd" id="tdcsnm"><@CommonQueryMacro.SingleField fId="csnm"/>
								<div id="oldcsnm" style="display:none;">
									<font color="red">
										原客户号:<@CommonQueryMacro.SingleField fId="csnmold"/>
									</font>
								</div>
							</td>
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
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码<font color="red"> *</font></td>
									   <td width="25%" width="25%" class="datatd" id="tdfinc"><@CommonQueryMacro.SingleField fId="finc"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构与客户的关系<font color="red"> *</font></td>
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
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdticd"><@CommonQueryMacro.SingleField fId="ticd"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易时间<font color="red"> *</font></td>
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
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式<font color="red"> *</font></td>
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
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdtsdr"><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd" id="tdcrpp"><@CommonQueryMacro.SingleField fId="crpp"/></td>
									</tr>	
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种<font color="red"> *</font></td>
										<td width="25%" width="25%" class="datatd" id="tdcrtp"><@CommonQueryMacro.SingleField fId="crtp"/></td>		
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额<font color="red"> *</font></td>
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
		<td align="left" colspan="3">
			<center>
			 <#if (opFromAmlBHdsCollApprove =="flag" )>
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
	var location_id = "${RequestParameters["id"]?default('')}"; 
	
	var inf = "${RequestParameters["inf"]?default('')}";
	var qs = "${RequestParameters["qs"]?default('')}";
	var qe = "${RequestParameters["qe"]?default('')}";
	var qticd = "${RequestParameters["qticd"]?default('')}";
	
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	<#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
	<#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
	<#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
		function initCallGetter_post(){
	  		//详细页面设置只读、其他按钮全部屏蔽
			if(op=="detail"||op=="alldetail"){
				setReadOnly();
			}
			//修改页面部分字段不可修改
			if(op=="mod"){
	      		AmlBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
	      		AmlBHdsCollAdd_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
			   	AmlBHdsCollAdd_dataset.setFieldReadOnly("ricd",true);       //报告机构编码不可修改
			   	AmlBHdsCollAdd_dataset.setFieldReadOnly("ticd",true);       //业务标识号不可修改
			   	AmlBHdsCollAdd_dataset.setFieldReadOnly("reportType",true); //报文类型不可修改
			   	AmlBHdsCollAdd_dataset.setFieldReadOnly("csnm",true);       //客户号不可修改
			   	AmlBHdsCollAdd_dataset.setFieldReadOnly("htdt",true);       //大额交易发生日期不可修改
		   		AmlBHdsCollAdd_dataset.setFieldReadOnly("crcd",true);       //大额交易特征代码不可修改
		   		AmlBHdsCollAdd_dataset.setFieldReadOnly("tstm",true);       //交易时间不可修改
			}
			//新增/复制新增页面
			if(op=="new"||op=='copynew'){
			  document.getElementById('xitong').style.display="none";      //隐藏状态栏
			  document.getElementById('btDel').style.display="none";
			  AmlBHdsCollAdd_dataset.setValue("brNo",'${v_branchcode}');  //初始化机构号
		      AmlBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
		      AmlBHdsCollAdd_dataset.setValue("reportType","N");         //初始化报文类型   N-新增报文
		      
		      AmlBHdsCollAdd_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
		      AmlBHdsCollAdd_dataset.setFieldReadOnly("reportType",true); //报文类型只读
		      AmlBHdsCollAdd_dataset.setFieldReadOnly("ricd",true);      //报告机构编码不可修改
			}
			
			//解析回执错误信息，进行高亮提示
			if(op=="mod"){
				HfAmlDwrService.locationBH(location_id,function(data){
					if(data!=null){
						for(var i=0;i<data.length;i++){
							var node = document.getElementById("editor_"+data[i]);
							if(node!=null){
								node.style.background = "red"; 
							}
						}
					}
				});
			}
			
			var csnmold = AmlBHdsCollAdd_dataset.getValue("csnmold");
			if(csnmold!=""){
				$("#oldcsnm").show();
			}
		}
	
	function ctvc_DropDown_beforeOpen(dropdown){
		ctvc_DropDown.cached=false;
	}
	
    //客户身份证件/证明文件类型下拉框联动
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsCollAdd_dataset.setValue("aoitp", "@N");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("aoitp", true);
	  }else{
	  		AmlBHdsCollAdd_dataset.setValue("aoitp", "");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("aoitp", false);
	  }
	  ctvcSelect_DropDownDataset.setParameter("citp", record[0]);//通过证件类型调整客户行业下拉框为对公/对私
	  return true;
	}

	//代办人身份证件类型下拉框联动
	function tbit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsCollAdd_dataset.setValue("boitp", "@N");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("boitp", true);
	  }else{
	  		AmlBHdsCollAdd_dataset.setValue("boitp", "");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("boitp", false);
	  }
	  return true;
	}
	
	//交易对手身份证件类型下拉框联动
	function tcit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsCollAdd_dataset.setValue("coitp", "@N");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("coitp", true);
	  }else{
	  		AmlBHdsCollAdd_dataset.setValue("coitp", "");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("coitp", false);
	  }
	  return true;
	}
	
	//客户银行卡类型下拉框联动
	function cbct_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="90"){
		    AmlBHdsCollAdd_dataset.setValue("ocbt", "@N");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("ocbt", true);
	  }else{
	  		AmlBHdsCollAdd_dataset.setValue("ocbt", "");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("ocbt", false);
	  }
	  return true;
	}
	
	//非柜台交易方式下拉框联动
	function octt_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="99"){
		    AmlBHdsCollAdd_dataset.setValue("ooct", "@N");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("ooct", true);
	  }else{
	  		AmlBHdsCollAdd_dataset.setValue("ooct", "");
	   	    AmlBHdsCollAdd_dataset.setFieldReadOnly("ooct", false);
	  }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsCollAdd_dataset.setValue("trcdSuffix","000000");
          AmlBHdsCollAdd_dataset.setValue("trcdSuffixName","000000");
          AmlBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBHdsCollAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsCollAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBHdsCollAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsCollAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	//对方金融机构下拉框联动
	function cfrc_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsCollAdd_dataset.setValue("cfrcSuffix","000000");
          AmlBHdsCollAdd_dataset.setValue("cfrcSuffixName","000000");
          AmlBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", true);     
      }
       if(b1){
           AmlBHdsCollAdd_dataset.setValue("cfrcSuffix","");
           AmlBHdsCollAdd_dataset.setValue("cfrcSuffixName","");
           AmlBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", true);	
      }
      if(b2){
           AmlBHdsCollAdd_dataset.setValue("cfrcSuffix","");
           AmlBHdsCollAdd_dataset.setValue("cfrcSuffixName","");
           AmlBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", false);
      }
	  return true;
	}
	
	
	//暂存校验
	function btSaveTemp_onClickCheck(button) {
   	   return saveChecke();
   }
   
	//暂存
	function btSaveTemp_postSubmit(button){
		alert("暂存成功！");
		closeWin(true);
	}
	
	//确认补录完成校验
	function btSave_onClickCheck(button) {
   	   return saveChecke();
   }
	
	//确认补录完成
    function btSave_postSubmit(button){
    	var retParam = button.returnParam;
    	var msg0=retParam.msg0;
    	var msg1=retParam.msg1;
    	if(msg0.length == 0){
	    	if(op=='new'||op=='copynew'){
		    	alert("确认成功！");
				closeWin(true);
		    }else{
			    if(confirm("确认成功！是否继续补录下一条交易数据？")){
			    		 var reportType = AmlBHdsCollAdd_dataset.getValue("reportType");
						 //HfAmlDwrService.getNextBHData(reportType,function(id){
						 HfAmlDwrService.getNextBHData2(reportType,inf,qs,qe,qticd,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlBHdsCollAdd_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd_dataset.flushData();
					    		AmlBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
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
    	  for(var i=0; i < field.length;i+=2){
				var node = document.getElementById("editor_"+trim(field[i]));
				node.style.background = "red"; 
				document.getElementById("td"+trim(field[i])).title=trim(field[i+1]);
			}
    	}
    }
	
	//上报校验
	function btReport_onClickCheck(button) {
   	   return saveChecke();
   }
	
	//上报
	function btReport_postSubmit(button){
		var retParam = button.returnParam;
    	var msg0=retParam.msg0;
    	var msg1=retParam.msg1;
    	if(msg0.length == 0){
	    	if(op=='new'||op=='copynew'){
		    	alert("上报成功！");
				closeWin(true);
		    }else{
			    if(confirm("上报成功！是否继续补录下一条交易数据？")){
			    		 var reportType = AmlBHdsCollAdd_dataset.getValue("reportType");
						 //HfAmlDwrService.getNextBHData(reportType,function(id){
						 HfAmlDwrService.getNextBHData2(reportType,inf,qs,qe,qticd,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlBHdsCollAdd_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd_dataset.flushData();
					    		AmlBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
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
	
	 //确认不上报
	function btDel_onClickCheck(button){
	    var id = AmlBHdsCollAdd_dataset.getValue("id");
	    doDelete(id);		
	}
	
	function doDelete(id){
     	if(window.confirm("是否确认不上报？")){
	    	HfAmlDwrService.deleteAmlBH(id,function(num){
	    	     alert(num);
	    	     closeWin(true);
	    	});
    	}else{
    	   return false;
    	}
	}
	
	function btBack_onClick() {
		closeWin(true);
	}
	
	//每次设置高亮前先清除原来的样式
	function setStyle(){
		document.getElementById("editor_brNo").style.background="none";
		document.getElementById("editor_reportType").style.background="none";
		document.getElementById("editor_ricd").style.background="none";
		document.getElementById("editor_htdt").style.background="none";
		document.getElementById("editor_crcd").style.background="none";
		document.getElementById("editor_csnm").style.background="none";
		document.getElementById("editor_ctnm").style.background="none";
		document.getElementById("editor_ctnt").style.background="none";
		document.getElementById("editor_ctvc").style.background="none";
		document.getElementById("editor_cctl").style.background="none";
		document.getElementById("editor_ccei").style.background="none";
		document.getElementById("editor_citp").style.background="none";
		document.getElementById("editor_aoitp").style.background="none";
		document.getElementById("editor_ctid").style.background="none";
		document.getElementById("editor_ctar").style.background="none";
		document.getElementById("editor_finc").style.background="none";
		document.getElementById("editor_rlfc").style.background="none";
		document.getElementById("editor_catp").style.background="none";
		document.getElementById("editor_ctac").style.background="none";
		document.getElementById("editor_oatm").style.background="none";
		document.getElementById("editor_cbct").style.background="none";
		document.getElementById("editor_ocbt").style.background="none";
		document.getElementById("editor_cbcn").style.background="none";
		document.getElementById("editor_tbnm").style.background="none";
		document.getElementById("editor_tbit").style.background="none";
		document.getElementById("editor_boitp").style.background="none";
		document.getElementById("editor_tbid").style.background="none";
		document.getElementById("editor_tbnt").style.background="none";
		document.getElementById("editor_ticd").style.background="none";
		document.getElementById("editor_tstm").style.background="none";
		document.getElementById("editor_trcd").style.background="none";
		document.getElementById("editor_trcdSuffix").style.background="none";
		document.getElementById("editor_rpmt").style.background="none";
		document.getElementById("editor_rpmn").style.background="none";
		document.getElementById("editor_tstp").style.background="none";
		document.getElementById("editor_octt").style.background="none";
		document.getElementById("editor_ooct").style.background="none";
		document.getElementById("editor_ocec").style.background="none";
		document.getElementById("editor_bptc").style.background="none";
		document.getElementById("editor_tsct").style.background="none";
		document.getElementById("editor_tsdr").style.background="none";
		document.getElementById("editor_crpp").style.background="none";
		document.getElementById("editor_crtp").style.background="none";
		document.getElementById("editor_crat").style.background="none";
		document.getElementById("editor_cfin").style.background="none";
		document.getElementById("editor_cfct").style.background="none";
		document.getElementById("editor_cfic").style.background="none";
		document.getElementById("editor_tcnm").style.background="none";
		document.getElementById("editor_cfrc").style.background="none";
		document.getElementById("editor_cfrcSuffix").style.background="none";
		document.getElementById("editor_tcit").style.background="none";
		document.getElementById("editor_coitp").style.background="none";
		document.getElementById("editor_tcid").style.background="none";
		document.getElementById("editor_tcat").style.background="none";
		document.getElementById("editor_tcac").style.background="none";
		document.getElementById("editor_rotf1").style.background="none";
		document.getElementById("editor_rotf2").style.background="none";
		
		$(".datatd").removeAttr("title");
    }
    
     function trim(s){
        return s.replace(/(^\s*)|(\s*$)/g, "");
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
	
	
	//审核通过按钮
	function btApprove_onClickCheck(button){
		var recIds = AmlBHdsCollAdd_dataset.getValue("id")+"|";
	   	approveUNReport(recIds,"01","");//01-审核通过
   	}
   	
   	//审核通过或不通过后台更新状态
   	function approveUNReport(ids,approveStatusChoose,approveResultChoose){
		HfAmlDwrService.approveUNReport(ids,approveStatusChoose,approveResultChoose,function(mgs){
		if(confirm("审核成功！是否继续审核下一条交易数据？")){
						 HfAmlDwrService.getNextApproveData(function(id){
						 	if(id!=null){
							 	AmlBHdsCollAdd_dataset.setParameter("id",id);
					    		AmlBHdsCollAdd_dataset.flushData();
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
	   	var approveResultChoose = AmlBHdsCollAdd_dataset.getValue("approveResultChoose");
	   	if (approveResultChoose.length < 1) {
	   		alert("审核结果不通过，审核说明必须填写！");
	   		return false;
	   	}
	   	if(approveResultChoose.replace(/[^\x00-\xff]/g, "***").length>256){  //中文和中文符号转为3个字符
		   	alert("审核说明过长，请修改！");
		   	return false;
	   	}
	   	var recIds = AmlBHdsCollAdd_dataset.getValue("id")+"|";
	    approveUNReport(recIds,"02",approveResultChoose);//02-审核不通过
		subwindow_floatWindowAudit.close();
	}
	
	
	function setReadOnly(){
		document.getElementById('btSave').style.display="none";
		document.getElementById('btSaveTemp').style.display="none";
		document.getElementById('btReport').style.display="none";
		document.getElementById('btDel').style.display="none";
		AmlBHdsCollAdd_dataset.setFieldReadOnly("brNo", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("reportType", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ricd", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rinm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("htdt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("crcd", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("csnm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctvc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cctl", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctar", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ccei", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctnm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctnt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("catp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctac", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("citp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("aoitp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ctid", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("finn", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("finc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rlfc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rltp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("firc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("fict", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("oatm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cbct", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ocbt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cbcn", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tbnm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tbid", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tbit", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("boitp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tbnt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cfin", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cfct", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cfic", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tcnm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tcat", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tcac", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tcit", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("coitp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tcid", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ticd", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tstm", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tstp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tsct", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("tsdr", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("crtp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("crat", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("crpp", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("trcd", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", true);
		
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rpmt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rpmn", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("octt", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ooct", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("ocec", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("bptc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cfrc", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rotf1", true);
		AmlBHdsCollAdd_dataset.setFieldReadOnly("rotf2", true);
	}
	
	function saveChecke(){
	   //大额发生日期
	   var htdt = formatDate(AmlBHdsCollAdd_dataset.getValue("htdt")); 
	   //大额交易特征代码
   	   var crcd = AmlBHdsCollAdd_dataset.getValue("crcd"); 
   	   //客户号
   	   var csnm = AmlBHdsCollAdd_dataset.getValue("csnm"); 
   	   //业务标识号
   	   var ticd = AmlBHdsCollAdd_dataset.getValue("ticd");
   	   //交易时间	 
       var tstm = formatDate(AmlBHdsCollAdd_dataset.getValue("tstm")); 
       if(htdt==''){
       		alert("请填写大额交易发生日期！");
            return false;
       }
       if(crcd==''){
       		alert("请填写大额交易特征代码！");
            return false;
       }
       if(csnm==''){
       		alert("请填写客户号！");
            return false;
       }
       if(ticd==''){
       		alert("请填写业务标识号！");
            return false;
       }
       if(tstm==''){
       		alert("请填写交易时间！");
            return false;
       }
       if(htdt!=tstm){
            alert("大额交易发生日期和交易时间不一致！");
            return false;
       }
       return true;
	}
	
	function AmlBHdsCollAdd_dataset_afterChange(dataset,field){
//		if(field.name=="csnm"||field.name=="htdt"){
		if(field.name=="htdt"){
			var csnm = dataset.getValue("csnm");
			var htdt = dataset.getValue("htdt")==""?"":dataset.getValue("htdt").Format("yyyyMMdd");
			if(csnm!=""&&htdt!=""){
				HfAmlDwrService.getACustInfoGridH(csnm,htdt,function(List_cust){
					if (List_cust!=null && List_cust.length > 0) {
						AmlBHdsCollAdd_dataset.setValue("csnm",List_cust[0].CSNM + "G" + List_cust[0].GRID_NO);
						AmlBHdsCollAdd_dataset.setValue("csnmold",List_cust[0].CSNM_OLD == null?"@N":Trim(List_cust[0].CSNM_OLD));
						AmlBHdsCollAdd_dataset.setValue("ctnm",List_cust[0].CTNM == null?"@N":Trim(List_cust[0].CTNM));
						AmlBHdsCollAdd_dataset.setValue("citp",List_cust[0].CITP == null?"@N":Trim(List_cust[0].CITP));
						AmlBHdsCollAdd_dataset.setValue("ctid",List_cust[0].CTID == null?"@N":Trim(List_cust[0].CTID));
						AmlBHdsCollAdd_dataset.setValue("aoitp",List_cust[0].AOITP == null?"@N":Trim(List_cust[0].AOITP));
						AmlBHdsCollAdd_dataset.setValue("ctnt",List_cust[0].CTNT == null?"@N":Trim(List_cust[0].CTNT));
						AmlBHdsCollAdd_dataset.setValue("ctvc",List_cust[0].CTVC == null?"@N":Trim(List_cust[0].CTVC));
						AmlBHdsCollAdd_dataset.setValue("cctl",List_cust[0].CCTL == null?"@N":Trim(List_cust[0].CCTL));
						AmlBHdsCollAdd_dataset.setValue("ctar",List_cust[0].CTAR == null?"@N":Trim(List_cust[0].CTAR));
						AmlBHdsCollAdd_dataset.setValue("ccei",List_cust[0].CCEI == null?"@N":Trim(List_cust[0].CCEI));
					} else {
						AmlBHdsCollAdd_dataset.setValue("csnmold","");
					}
				});
			}
		}
		
		if(field.name=="csnmold"){
			var csnmold = dataset.getValue("csnmold");
			if(csnmold!=""){
				$("#oldcsnm").show();
			}else{
				$("#oldcsnm").hide();
			}
		}
	}
	
	var csnm_flag;
	
	$("#editor_csnm").blur(function() {
		if(op!="new"){
			return;
		}
		
		var csnm = AmlBHdsCollAdd_dataset.getValue("csnm");
		if(csnm_flag==csnm){
			return;
		}
		
		var htdt = AmlBHdsCollAdd_dataset.getValue("htdt")==""?"":AmlBHdsCollAdd_dataset.getValue("htdt").Format("yyyyMMdd");
		if(csnm!=""&&htdt!=""){
			HfAmlDwrService.getACustInfoGridH(csnm,htdt,function(List_cust){
				if (List_cust!=null && List_cust.length > 0) {
					AmlBHdsCollAdd_dataset.setValue("csnm",List_cust[0].CSNM + "G" + List_cust[0].GRID_NO);
					AmlBHdsCollAdd_dataset.setValue("csnmold",List_cust[0].CSNM_OLD == null?"@N":Trim(List_cust[0].CSNM_OLD));
					AmlBHdsCollAdd_dataset.setValue("ctnm",List_cust[0].CTNM == null?"@N":Trim(List_cust[0].CTNM));
					AmlBHdsCollAdd_dataset.setValue("citp",List_cust[0].CITP == null?"@N":Trim(List_cust[0].CITP));
					AmlBHdsCollAdd_dataset.setValue("ctid",List_cust[0].CTID == null?"@N":Trim(List_cust[0].CTID));
					AmlBHdsCollAdd_dataset.setValue("aoitp",List_cust[0].AOITP == null?"@N":Trim(List_cust[0].AOITP));
					AmlBHdsCollAdd_dataset.setValue("ctnt",List_cust[0].CTNT == null?"@N":Trim(List_cust[0].CTNT));
					AmlBHdsCollAdd_dataset.setValue("ctvc",List_cust[0].CTVC == null?"@N":Trim(List_cust[0].CTVC));
					AmlBHdsCollAdd_dataset.setValue("cctl",List_cust[0].CCTL == null?"@N":Trim(List_cust[0].CCTL));
					AmlBHdsCollAdd_dataset.setValue("ctar",List_cust[0].CTAR == null?"@N":Trim(List_cust[0].CTAR));
					AmlBHdsCollAdd_dataset.setValue("ccei",List_cust[0].CCEI == null?"@N":Trim(List_cust[0].CCEI));
				} else {
					AmlBHdsCollAdd_dataset.setValue("csnmold","");
				}
				csnm_flag = AmlBHdsCollAdd_dataset.getValue("csnm");
			});
		}	
	});
	
	//字符串前后去空格
    function Trim(str){ 
     	return str.replace(/(^\s*)|(\s*$)/g, ""); 
    }
    
    //日期格式化
    Date.prototype.Format = function(fmt){
        var o = {
            "M+": this.getMonth()+1,
            "d+": this.getDate(),
            "H+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "S+": this.getMilliseconds()
        };
        //因为date.getFullYear()出来的结果是number类型的,所以为了让结果变成字符串型，下面有两种方法：
        if(/(y+)/.test(fmt)){
            //第一种：利用字符串连接符“+”给date.getFullYear()+""，加一个空字符串便可以将number类型转换成字符串。
            fmt=fmt.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length));
        }
        for(var k in o){
            if (new RegExp("(" + k +")").test(fmt)){
                //第二种：使用String()类型进行强制数据类型转换String(date.getFullYear())，这种更容易理解。
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(String(o[k]).length)));
            }
        }
        return fmt;
    };
</script>
</@CommonQueryMacro.page>