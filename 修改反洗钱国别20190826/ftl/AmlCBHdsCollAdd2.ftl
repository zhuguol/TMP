<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlCBHdsCollAdd2" init="true" insertOnEmpty="true" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td width="75%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息" expand="true">
						<table frame="void" class="grouptable" width="100%">
						   <tr>
							   <td width="25%"  colspan="1" align="right" nowrap class="labeltd">主键信息</td>
							   <td width="75%"  colspan="3" class="datatd" id="tdpkinfo"><@CommonQueryMacro.SingleField fId="pkinfo"/></td>
							</tr> 
						   <tr>
							   <td width="25%"  colspan="1" align="right" nowrap class="labeltd">原业务标识号</td>
							   <td width="25%"  colspan="3" class="datatd" id="tdticd" ><font color="red">*</font><@CommonQueryMacro.SingleField fId="ticd"/></td>
						   </tr>
							<tr>
							<tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">机构号</td>
							   <td width="25%" width="25%" class="datatd" id="tdbrNo"><@CommonQueryMacro.SingleField fId="brNo"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
							   <td width="25%" width="25%" class="datatd" id="tdreportType"><@CommonQueryMacro.SingleField fId="reportType"/></td>		
						   </tr>
						   <tr>
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
							   <td width="25%" width="25%" class="datatd" id="tdricd"><@CommonQueryMacro.SingleField fId="ricd"/></td>			
							   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构名称</td>
							   <td width="25%" width="25%" class="datatd" id="tdrinm"><@CommonQueryMacro.SingleField fId="rinm"/></td>	
						   </tr>
						   <tr>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额交易发生日期</td>
								<td width="25%" width="25%" class="datatd" id="tdhtdt"><@CommonQueryMacro.SingleField fId="htdt"/></td>
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
						   <td width="25%" width="25%" class="datatd" id="tdctnm"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
						    <td width="25%" width="25%" class="datatd" id="tdctnt"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnt"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型</td>
						   <td width="25%" width="25%" class="datatd" id="tdcatp"><font color="red">*</font><@CommonQueryMacro.SingleField fId="catp"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号</td>
						   <td width="25%" width="25%" class="datatd" id="tdctac"><font color="red">*<@CommonQueryMacro.SingleField fId="ctac"/></td>	
						 </tr>
						 <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						   <td width="25%" width="25%" class="datatd" id="tdcitp"><font color="red">*</font><@CommonQueryMacro.SingleField fId="citp"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="aoitp"/></td>
						</tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd" id="tdctid"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctid"/></td>
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
									   <td width="25%" width="25%" class="datatd" id="tdfinn"><font color="red">*</font><@CommonQueryMacro.SingleField fId="finn"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码</td>
									   <td width="25%" width="25%" class="datatd" id="tdfinc"><font color="red">*</font><@CommonQueryMacro.SingleField fId="finc"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系</td>
									   <td width="25%" width="25%" class="datatd" id="tdrltp"><font color="red">*</font><@CommonQueryMacro.SingleField fId="rltp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码</td>
									   <td width="25%" width="25%" class="datatd" id="tdfirc"><font color="red">*<@CommonQueryMacro.SingleField fId="firc"/></td>	
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点代码类型</td>
									   <td width="25%" width="25%" class="datatd" id="tdfict"><font color="red">*</font><@CommonQueryMacro.SingleField fId="fict"/></td>
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
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>
										<td width="25%" width="25%" class="datatd" id="tdcfin"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfin"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码网点类型</td>
										<td width="25%" width="25%" class="datatd" id="tdcfct"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfct"/></td>    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>
										<td width="25%" width="25%" class="datatd" id="tdcfic"><font color="red">*</font><@CommonQueryMacro.SingleField fId="cfic"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名</td>
										<td width="25%" width="25%" class="datatd" id="tdtcnm"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcnm"/></td>						  
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtcat"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>
										<td width="25%" width="25%" class="datatd" id="tdtcac"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcac"/></td>
										
									</tr>	
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>
										<td width="25%" width="25%" class="datatd" id="tdtcit"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcit"/></td>
										<td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型进一步说明</td>
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="coitp"/></td>
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>
									    <td width="25%" width="25%"class="datatd" id="tdtcid"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tcid"/></td>	
									</tr>
									</table>
						</FIELDSET>
						<FIELDSET style="padding: 6px;" expand="true">
						<LEGEND>交易信息</LEGEND>
									<table frame="void" class="grouptable" width="100%">
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易日期</td>
										<td width="25%" width="25%" class="datatd" id="tdtstm"><@CommonQueryMacro.SingleField fId="tstm"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd" id="tdtstp"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd" id="tdtsct"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tsct"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd" id="tdtsdr"><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd" id="tdcrtp"><@CommonQueryMacro.SingleField fId="crtp"/></td>																		
									</tr>									
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
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
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};  
	var location_id = "${RequestParameters["id"]?default('')}"; 
	<#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
	<#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
	<#assign v_reportCode = statics["com.huateng.report.aml.genupreportfile.utils.AMLReportUtils"].getSysParams().getParamVal()>
	function initCallGetter_post(){
		var citp1 = AmlCBHdsCollAdd2_dataset.getValue("citp");
		if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
     		document.getElementById("citpDesc").style.display="";
     		document.getElementById("citpDescLable").style.display="";
       		AmlCBHdsCollAdd2_dataset.setFieldReadOnly("citpDesc", false);
  		}
  		//详细页面设置只读
		if(op=="detail"){
			document.getElementById('btSave').style.display="none";
			document.getElementById('btReport').style.display="none";   
			AmlCBHdsCollAdd2_dataset.setReadOnly(true);
		}
		//修改页面部分字段不可修改
		if(op=="mod"){
	  		iddescDisplay();   //初始化证件类型进一步说明的填写框
	   		var trcd = AmlCBHdsCollAdd2_dataset.getValue("trcd");
       		if(trcd!="CHN" && trcd!="Z01" && trcd!="Z02" && trcd!="Z03"){
           		AmlCBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true); 
       		}
       		var tdrc = AmlCBHdsCollAdd2_dataset.getValue("tdrc");
	       if(tdrc!="CHN" && tdrc!="Z01" && tdrc!="Z02" && tdrc!="Z03"){
	           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true); 
	       }
		}
		//新增页面
		if(op=="new"){
			iddescDisplay();
		  //隐藏状态栏
		  document.getElementById('xitong').style.display="none";
		  document.getElementById("citpDesc").style.display="none";
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tcitDesc").style.display="none";
	      document.getElementById("citpDescLable").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      document.getElementById("tcitDescLable").style.display="none";
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
	   var citp = AmlCBHdsCollAdd2_dataset.getValue("citp");
	   var tbit = AmlCBHdsCollAdd2_dataset.getValue("tbit");
	   var tcit = AmlCBHdsCollAdd2_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlCBHdsCollAdd2_dataset.setFieldReadOnly("citpDesc", false);
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
		
     //客户身份证件/证明文件类型
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("citpDescLable").style.display="";
		    document.getElementById("citpDesc").style.display="";
		    AmlCBHdsCollAdd2_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlCBHdsCollAdd2_dataset.setValue("citpDesc","");
	  }
	  return true;
	}

	//代办人身份证件类型
	function tbit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	      document.getElementById("tbitDesc").style.display="";
	      document.getElementById("tbitDescLable").style.display="";
	      AmlCBHdsCollAdd2_dataset.getField("tbitDesc").require=true;    
	  }else{
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      AmlCBHdsCollAdd2_dataset.setValue("tbitDesc","");
	  }
	  return true;
	}
	
	//代办人身份证件类型
	function tcit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	    document.getElementById("tcitDesc").style.display="";
	    document.getElementById("tcitDescLable").style.display="";
	    AmlCBHdsCollAdd2_dataset.getField("tcitDesc").require=true;     
	  }else{
	    document.getElementById("tcitDesc").style.display="none";
	    document.getElementById("tcitDescLable").style.display="none";
	    AmlCBHdsCollAdd2_dataset.setValue("tcitDesc","");
	  }
	  return true;
	}
	
	//交易方向
	function tdrc_DropDown_onSelect(dropDown,record,editor){
	  var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	  var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";	  
      if(!b1 &&　!b2){
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffix","000000");
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffixName","000000");
           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);     
      }
      if(b1){
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffix","");
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffixName","");
           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);
      }
      if(b2){
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffix","");
           AmlCBHdsCollAdd2_dataset.setValue("tdrcSuffixName","");
           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("tdrcSuffix", false);
      }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlCBHdsCollAdd2_dataset.setValue("trcdSuffix","000000");
          AmlCBHdsCollAdd2_dataset.setValue("trcdSuffixName","000000");
          AmlCBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlCBHdsCollAdd2_dataset.setValue("trcdSuffix","");
           AmlCBHdsCollAdd2_dataset.setValue("trcdSuffixName","");
           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlCBHdsCollAdd2_dataset.setValue("trcdSuffix","");
           AmlCBHdsCollAdd2_dataset.setValue("trcdSuffixName","");
           AmlCBHdsCollAdd2_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	
	
 	//保存校验
    function btSave_onClickCheck(button) {
   	   var htdt = formatDate(AmlCBHdsCollAdd2_dataset.getValue("htdt")); 
       AmlCBHdsCollAdd2_dataset.setValue("workDate",htdt);
        var tstm = formatDate(AmlCBHdsCollAdd2_dataset.getValue("tstm")); 
       if(htdt!=tstm){
            alert("大额交易发生日期和交易日期不一致！");
            return false;
       }
       
       var citpdesc = AmlCBHdsCollAdd2_dataset.getValue("citpDesc"); 
       AmlCBHdsCollAdd2_dataset.setValue("citpDesc",citpdesc);
       //交易发生地为国内,交易发生地区不能为空
       var trcd = AmlCBHdsCollAdd2_dataset.getValue("trcd"); 
       var trcdSuffix = AmlCBHdsCollAdd2_dataset.getValue("trcdSuffix"); 
       if(trcd=="CHN" || trcd=="Z01" || trcd=="Z02" || trcd=="Z03"){
            if(trcdSuffix==""){
            alert("交易发生地为国内,交易发生地区不能为空");
            return false;
            }     
       }
       
       //交易方向国别为国内,交易方向地区不能为空
       var tdrcSuffix = AmlCBHdsCollAdd2_dataset.getValue("tdrcSuffix"); 
       var tdrc = AmlCBHdsCollAdd2_dataset.getValue("tdrc");
       if(tdrc=="CHN" || tdrc=="Z01" || tdrc=="Z02" || tdrc=="Z03"){
            if(tdrcSuffix==""){
            alert("交易方向国别为国内,交易方向地区不能为空");
            return false;
            }     
       }
       return true;
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
	
	
	function btBack_onClick() {
		closeWin();
	}
  
	//上报
	function btReport_onClickCheck(button) {
	   var htdt = formatDate(AmlCBHdsCollAdd2_dataset.getValue("htdt")); 
	   AmlCBHdsCollAdd2_dataset.setValue("workDate",htdt);
	   
	    var tstm = formatDate(AmlCBHdsCollAdd2_dataset.getValue("tstm")); 
       if(htdt!=tstm){
            alert("大额交易发生日期和交易日期不一致！");
            return false;
       }
       
        var citpdesc = AmlCBHdsCollAdd2_dataset.getValue("citpDesc"); 
       AmlCBHdsCollAdd2_dataset.setValue("citpDesc",citpdesc);
       //交易发生地为国内,交易发生地区不能为空
       var trcd = AmlCBHdsCollAdd2_dataset.getValue("trcd"); 
       var trcdSuffix = AmlCBHdsCollAdd2_dataset.getValue("trcdSuffix"); 
       if(trcd=="CHN" || trcd=="Z01" || trcd=="Z02" || trcd=="Z03"){
            if(trcdSuffix==""){
            alert("交易发生地为国内,交易发生地区不能为空");
            return false;
            }     
       }
       
       //交易方向国别为国内,交易方向地区不能为空
       var tdrcSuffix = AmlCBHdsCollAdd2_dataset.getValue("tdrcSuffix"); 
       var tdrc = AmlCBHdsCollAdd2_dataset.getValue("tdrc");
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
	    	alert("确认成功！");
			closeWin(true);
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
	
	
	/*
	function AmlCBHdsCollAdd2_dataset_afterChange(dataset,field){
		if(field.name=="ticd"){
			var ticd = dataset.getValue("ticd");
			AMLVaildService.hisToAML(ticd,function(id){
			AmlCBHdsCollAdd2_dataset.setParameter("id",id);
			AmlCBHdsCollAdd2_dataset.flushData();
			AmlCBHdsCollAdd2_dataset.setValue("reportType","C");         //初始化报文类型
			});
		}
	}
	 */
	
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
    
</script>
</@CommonQueryMacro.page>