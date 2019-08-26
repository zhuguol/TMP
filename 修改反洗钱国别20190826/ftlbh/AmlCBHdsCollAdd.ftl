<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额修改报文详细">
<@CommonQueryMacro.CommonQuery id="AmlCBHdsCollAdd" init="true" insertOnEmpty="true" navigate="false">
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
									<td width="25%" align="right" nowrap class="labeltd">抽样审核人</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="approveUpdTlr" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">抽样审核状态</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="filler2" />
									</td>
								</tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">抽样审核说明</td>
									<td width="25%" nowrap class="datatd">
										<@CommonQueryMacro.SingleField fId="filler3" />
									</td>
								</tr>
								<tr ><td>&nbsp; &nbsp;</td></tr>
								<tr>
									<td width="25%" align="right" nowrap class="labeltd">回执/人工补正信息</td>
									<td width="25%" nowrap class="datatd"><@CommonQueryMacro.SingleField fId="errmsg" /></td>
								</tr>
								<tr ><td>&nbsp; &nbsp;</td></tr>
								<tr>
									<td width="25%" id="mirsLable" align="right" nowrap class="labeltd">人工补正标识</td>
									<td width="25%" nowrap class="datatd" id="mirs"><@CommonQueryMacro.SingleField fId="mirs" /></td>
								</tr>
								<tr>
									<td width="25%" id="tmlmLable" align="right" nowrap class="labeltd">人工补正完成时限</td>
									<td width="25%" nowrap class="datatd" id="tmlm"><@CommonQueryMacro.SingleField fId="tmlm" /></td>
								</tr>
								<tr>
									<td width="25%" id="rqdsLable" align="right" nowrap class="labeltd">人工补正填写要求</td>
									<td width="25%" nowrap class="datatd" id="rqds"><@CommonQueryMacro.SingleField fId="rqds" /></td>
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
			<@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btReport"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btBack"/>
			</center>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	var location_id = "${RequestParameters["id"]?default('')}"; 
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	<#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
	function initCallGetter_post(){
  		//详细页面设置只读、其他按钮全部屏蔽
		if(op=="detail"){
			document.getElementById('btSave').style.display="none";
			document.getElementById('btReport').style.display="none";
			AmlCBHdsCollAdd_dataset.setReadOnly(true);
		}
		//修改页面部分字段不可修改
		if(op=="mod"){
			AmlCBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
      		AmlCBHdsCollAdd_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
		   	AmlCBHdsCollAdd_dataset.setFieldReadOnly("ricd",true);       //报告机构编码不可修改
		   	AmlCBHdsCollAdd_dataset.setFieldReadOnly("ticd",true);       //业务标识号不可修改
		   	AmlCBHdsCollAdd_dataset.setFieldReadOnly("reportType",true); //报文类型不可修改
		   	AmlCBHdsCollAdd_dataset.setFieldReadOnly("csnm",true);       //客户号不可修改
		   	AmlCBHdsCollAdd_dataset.setFieldReadOnly("htdt",true);       //大额交易发生日期不可修改
	   		AmlCBHdsCollAdd_dataset.setFieldReadOnly("crcd",true);       //大额交易特征代码不可修改
	   		AmlCBHdsCollAdd_dataset.setFieldReadOnly("tstm",true);       //交易时间不可修改
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
	}
	
	
	function ctvc_DropDown_beforeOpen(dropdown){
		ctvc_DropDown.cached=false;
	}
	
    //客户身份证件/证明文件类型下拉框联动
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlCBHdsCollAdd_dataset.setValue("aoitp", "@N");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("aoitp", true);
	  }else{
	  		AmlCBHdsCollAdd_dataset.setValue("aoitp", "");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("aoitp", false);
	  }
	  ctvcSelect_DropDownDataset.setParameter("citp", record[0]);//通过证件类型调整客户行业下拉框为对公/对私
	  return true;
	}

	//代办人身份证件类型下拉框联动
	function tbit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlCBHdsCollAdd_dataset.setValue("boitp", "@N");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("boitp", true);
	  }else{
	  		AmlCBHdsCollAdd_dataset.setValue("boitp", "");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("boitp", false);
	  }
	  return true;
	}
	
	//交易对手身份证件类型下拉框联动
	function tcit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="119999"&&record[0]!="129999"&&record[0]!="619999"&&record[0]!="629999"){
		    AmlCBHdsCollAdd_dataset.setValue("coitp", "@N");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("coitp", true);
	  }else{
	  		AmlCBHdsCollAdd_dataset.setValue("coitp", "");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("coitp", false);
	  }
	  return true;
	}
	
	//客户银行卡类型下拉框联动
	function cbct_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="90"){
		    AmlCBHdsCollAdd_dataset.setValue("ocbt", "@N");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("ocbt", true);
	  }else{
	  		AmlCBHdsCollAdd_dataset.setValue("ocbt", "");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("ocbt", false);
	  }
	  return true;
	}
	
	//非柜台交易方式下拉框联动
	function octt_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="99"){
		    AmlCBHdsCollAdd_dataset.setValue("ooct", "@N");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("ooct", true);
	  }else{
	  		AmlCBHdsCollAdd_dataset.setValue("ooct", "");
	   	    AmlCBHdsCollAdd_dataset.setFieldReadOnly("ooct", false);
	  }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlCBHdsCollAdd_dataset.setValue("trcdSuffix","000000");
          AmlCBHdsCollAdd_dataset.setValue("trcdSuffixName","000000");
          AmlCBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlCBHdsCollAdd_dataset.setValue("trcdSuffix","");
           AmlCBHdsCollAdd_dataset.setValue("trcdSuffixName","");
           AmlCBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlCBHdsCollAdd_dataset.setValue("trcdSuffix","");
           AmlCBHdsCollAdd_dataset.setValue("trcdSuffixName","");
           AmlCBHdsCollAdd_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	//对方金融机构下拉框联动
	function cfrc_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlCBHdsCollAdd_dataset.setValue("cfrcSuffix","000000");
          AmlCBHdsCollAdd_dataset.setValue("cfrcSuffixName","000000");
          AmlCBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", true);     
      }
       if(b1){
           AmlCBHdsCollAdd_dataset.setValue("cfrcSuffix","");
           AmlCBHdsCollAdd_dataset.setValue("cfrcSuffixName","");
           AmlCBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", true);	
      }
      if(b2){
           AmlCBHdsCollAdd_dataset.setValue("cfrcSuffix","");
           AmlCBHdsCollAdd_dataset.setValue("cfrcSuffixName","");
           AmlCBHdsCollAdd_dataset.setFieldReadOnly("cfrcSuffix", false);
      }
	  return true;
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
			    		 var reportType = AmlCBHdsCollAdd_dataset.getValue("reportType");
						 HfAmlDwrService.getNextBHData(reportType,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlCBHdsCollAdd_dataset.setParameter("id",id);
					    		AmlCBHdsCollAdd_dataset.flushData();
					    		AmlCBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
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
			    		 var reportType = AmlCBHdsCollAdd_dataset.getValue("reportType");
						 HfAmlDwrService.getNextBHData(reportType,function(id){
						 	if(id!=null){
						 	    setStyle();
							 	AmlCBHdsCollAdd_dataset.setParameter("id",id);
					    		AmlCBHdsCollAdd_dataset.flushData();
					    		AmlCBHdsCollAdd_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
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
		
	    document.getElementById("tdbrNo").removeAttribute("title");
		document.getElementById("tdreportType").removeAttribute("title");
		document.getElementById("tdricd").removeAttribute("title");
		document.getElementById("tdhtdt").removeAttribute("title");
		document.getElementById("tdcrcd").removeAttribute("title");
		document.getElementById("tdcsnm").removeAttribute("title");
		document.getElementById("tdctnm").removeAttribute("title");
		document.getElementById("tdctnt").removeAttribute("title");
		document.getElementById("tdctvc").removeAttribute("title");
		document.getElementById("tdcctl").removeAttribute("title");
		document.getElementById("tdccei").removeAttribute("title");
		document.getElementById("tdcitp").removeAttribute("title");
		document.getElementById("tdaoitp").removeAttribute("title");
		document.getElementById("tdctid").removeAttribute("title");
		document.getElementById("tdctar").removeAttribute("title");
		document.getElementById("tdfinc").removeAttribute("title");
		document.getElementById("tdrlfc").removeAttribute("title");
		document.getElementById("tdcatp").removeAttribute("title");
		document.getElementById("tdctac").removeAttribute("title");
		document.getElementById("tdoatm").removeAttribute("title");
		document.getElementById("tdcbct").removeAttribute("title");
		document.getElementById("tdocbt").removeAttribute("title");
		document.getElementById("tdcbcn").removeAttribute("title");
		document.getElementById("tdtbnm").removeAttribute("title");
		document.getElementById("tdtbit").removeAttribute("title");
		document.getElementById("tdboitp").removeAttribute("title");
		document.getElementById("tdtbid").removeAttribute("title");
		document.getElementById("tdtbnt").removeAttribute("title");
		document.getElementById("tdticd").removeAttribute("title");
		document.getElementById("tdtstm").removeAttribute("title");
		document.getElementById("tdtrcd").removeAttribute("title");
		document.getElementById("tdtrcdSuffix").removeAttribute("title");
		document.getElementById("tdrpmt").removeAttribute("title");
		document.getElementById("tdrpmn").removeAttribute("title");
		document.getElementById("tdtstp").removeAttribute("title");
		document.getElementById("tdoctt").removeAttribute("title");
		document.getElementById("tdooct").removeAttribute("title");
		document.getElementById("tdocec").removeAttribute("title");
		document.getElementById("tdbptc").removeAttribute("title");
		document.getElementById("tdtsct").removeAttribute("title");
		document.getElementById("tdtsdr").removeAttribute("title");
		document.getElementById("tdcrpp").removeAttribute("title");
		document.getElementById("tdcrtp").removeAttribute("title");
		document.getElementById("tdcrat").removeAttribute("title");
		document.getElementById("tdcfin").removeAttribute("title");
		document.getElementById("tdcfct").removeAttribute("title");
		document.getElementById("tdcfic").removeAttribute("title");
		document.getElementById("tdtcnm").removeAttribute("title");
		document.getElementById("tdcfrc").removeAttribute("title");
		document.getElementById("tdcfrcSuffix").removeAttribute("title");
		document.getElementById("tdtcit").removeAttribute("title");
		document.getElementById("tdcoitp").removeAttribute("title");
		document.getElementById("tdtcid").removeAttribute("title");
		document.getElementById("tdtcat").removeAttribute("title");
		document.getElementById("tdtcac").removeAttribute("title");
		document.getElementById("tdrotf1").removeAttribute("title");
		document.getElementById("tdrotf2").removeAttribute("title");
    }
    
     function trim(s){
        return s.replace(/(^\s*)|(\s*$)/g, "");
    }
</script>
</@CommonQueryMacro.page>