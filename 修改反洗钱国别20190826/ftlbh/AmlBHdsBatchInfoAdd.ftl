<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBHdsBatchInfoAdd" init="true" insertOnEmpty="true" navigate="false">
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
		<td align="left" colspan="3">
			<center>
			<@CommonQueryMacro.Button id="btSaveTemp"/>&nbsp; &nbsp;
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
  		//详细页面设置只读
		if(op=="detail"){
			document.getElementById('btSaveTemp').style.display="none";
			AmlBHdsBatchInfoAdd_dataset.setReadOnly(true);
		}
		//修改页面部分字段不可修改
		if(op=="mod"){
       		AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ricd",true);       //报告机构编码不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("rinm",true);       //报告机构名称不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ticd",true);       //业务标识号不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("csnm",true);       //客户号不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("reportType",true); //报文类型不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("htdt",true);       //大额交易发生日期不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("crcd",true);       //大额交易特征代码不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("tstm",true);       //交易时间不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("crtp",true);       //币种不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("crat",true);       //交易金额不可修改
		   	AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("tsdr",true);       //资金收付标志不可修改
		}
	}
	
	function ctvc_DropDown_beforeOpen(dropdown){
		ctvc_DropDown.cached=false;
	}
	
    //客户身份证件/证明文件类型下拉框联动
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsBatchInfoAdd_dataset.setValue("aoitp", "@N");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("aoitp", true);
	  }else{
	  		AmlBHdsBatchInfoAdd_dataset.setValue("aoitp", "");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("aoitp", false);
	  }
	  ctvcSelect_DropDownDataset.setParameter("citp", record[0]);//通过证件类型调整客户行业下拉框为对公/对私
	  return true;
	}

	//代办人身份证件类型下拉框联动
	function tbit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsBatchInfoAdd_dataset.setValue("boitp", "@N");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("boitp", true);
	  }else{
	  		AmlBHdsBatchInfoAdd_dataset.setValue("boitp", "");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("boitp", false);
	  }
	  return true;
	}
	
	//交易对手身份证件类型下拉框联动
	function tcit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlBHdsBatchInfoAdd_dataset.setValue("coitp", "@N");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("coitp", true);
	  }else{
	  		AmlBHdsBatchInfoAdd_dataset.setValue("coitp", "");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("coitp", false);
	  }
	  return true;
	}
	
	//客户银行卡类型下拉框联动
	function cbct_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="90"){
		    AmlBHdsBatchInfoAdd_dataset.setValue("ocbt", "@N");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ocbt", true);
	  }else{
	  		AmlBHdsBatchInfoAdd_dataset.setValue("ocbt", "");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ocbt", false);
	  }
	  return true;
	}
	
	//非柜台交易方式下拉框联动
	function octt_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="99"){
		    AmlBHdsBatchInfoAdd_dataset.setValue("ooct", "@N");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ooct", true);
	  }else{
	  		AmlBHdsBatchInfoAdd_dataset.setValue("ooct", "");
	   	    AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("ooct", false);
	  }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffix","000000");
          AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffixName","000000");
          AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsBatchInfoAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	//对方金融机构下拉框联动
	function cfrc_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffix","000000");
          AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffixName","000000");
          AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("cfrcSuffix", true);     
      }
       if(b1){
           AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffix","");
           AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffixName","");
           AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("cfrcSuffix", true);	
      }
      if(b2){
           AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffix","");
           AmlBHdsBatchInfoAdd_dataset.setValue("cfrcSuffixName","");
           AmlBHdsBatchInfoAdd_dataset.setFieldReadOnly("cfrcSuffix", false);
      }
	  return true;
	}
	
	function btSaveTemp_postSubmit(button){
    	var retParam = button.returnParam;
    	alert(retParam.msg);
    	closeWin(true);
    }
	
	function btBack_onClick() {
		closeWin(true);
	}
	
</script>
</@CommonQueryMacro.page>