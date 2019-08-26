<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBHdsBatchInfoAdd2" init="true" insertOnEmpty="true" navigate="false">
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
			<@CommonQueryMacro.Button id="btBack"/>&nbsp; &nbsp;
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
		var citp1 = AmlBHdsBatchInfoAdd2_dataset.getValue("citp");
		if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
     		document.getElementById("citpDesc").style.display="";
     		document.getElementById("citpDescLable").style.display="";
       		AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("citpDesc", false);
  		}
  		//详细页面设置只读
		if(op=="detail"){
			document.getElementById('btSaveTemp').style.display="none";
			AmlBHdsBatchInfoAdd2_dataset.setReadOnly(true);
		}
		//修改页面部分字段不可修改
		if(op=="mod"){
	  		iddescDisplay();   //初始化证件类型进一步说明的填写框
	  		var codeName = '${v_branchcode}'+'-'+'${v_branchName}';
	  		AmlBHdsBatchInfoAdd2_dataset.setValue("brNo",'${v_branchcode}');  //初始化机构号
      		AmlBHdsBatchInfoAdd2_dataset.setValue("ricd",'${v_reportCode}');  //初始化报告机构编码
       		AmlBHdsBatchInfoAdd2_dataset.setValue("rinm",'${v_branchName}');  //初始化报告机构名称
       		AmlBHdsBatchInfoAdd2_dataset.setValue("rinmName",codeName);
       		AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("brNo",true);       //机构号不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("ricd",true);       //报告机构编码不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("rinm",true);       //报告机构名称不可修改
		   
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("ticd",true);       //业务标识号不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("csnm",true);       //客户号不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("reportType",true); //报文类型不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("htdt",true);       //大额交易发生日期不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("crcd",true);       //大额交易特征代码不可修改
		   	
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tstm",true);       //交易时间不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("crtp",true);       //币种不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("crat",true);       //交易金额不可修改
		   	AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tsdr",true);       //资金收付标志不可修改
		   	
	   		var trcd = AmlBHdsBatchInfoAdd2_dataset.getValue("trcd");
       		if(trcd!="CHN" && trcd!="Z01" && trcd!="Z02" && trcd!="Z03"){
           		AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("trcdSuffix", true); 
       		}
       		var tdrc = AmlBHdsBatchInfoAdd2_dataset.getValue("tdrc");
	       if(tdrc!="CHN" && tdrc!="Z01" && tdrc!="Z02" && tdrc!="Z03"){
	           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tdrcSuffix", true); 
	       }
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
	   var citp = AmlBHdsBatchInfoAdd2_dataset.getValue("citp");
	   var tbit = AmlBHdsBatchInfoAdd2_dataset.getValue("tbit");
	   var tcit = AmlBHdsBatchInfoAdd2_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("citpDesc", false);
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
	   
	   var tbnm = AmlBHdsBatchInfoAdd2_dataset.getValue("tbnm");  //交易代办人姓名
	   var tbit = AmlBHdsBatchInfoAdd2_dataset.getValue("tbit");  //交易代办人证件类型
	   var tbid = AmlBHdsBatchInfoAdd2_dataset.getValue("tbid");  //交易代办人证件号码
	   var tbnt = AmlBHdsBatchInfoAdd2_dataset.getValue("tbnt");  //交易代办人国籍
	   var crpp = AmlBHdsBatchInfoAdd2_dataset.getValue("crpp");  //资金用途
	   if(tbnm==""||tbnm==null){
	   		AmlBHdsBatchInfoAdd2_dataset.setValue("tbnm","@N");
	   }
	   if(tbit==""||tbit==null){
	   		AmlBHdsBatchInfoAdd2_dataset.setValue("tbit","@N");
	   }
	   if(tbid==""||tbid==null){
	   		AmlBHdsBatchInfoAdd2_dataset.setValue("tbid","@N");
	   }
	   if(tbnt==""||tbnt==null){
	   		AmlBHdsBatchInfoAdd2_dataset.setValue("tbnt","@N");
	   }
	   if(crpp==""||crpp==null){
	   		AmlBHdsBatchInfoAdd2_dataset.setValue("crpp","@N");
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
		    AmlBHdsBatchInfoAdd2_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlBHdsBatchInfoAdd2_dataset.setValue("citpDesc","");
	  }
	  return true;
	}

	//代办人身份证件类型
	function tbit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	      document.getElementById("tbitDesc").style.display="";
	      document.getElementById("tbitDescLable").style.display="";
	      AmlBHdsBatchInfoAdd2_dataset.getField("tbitDesc").require=true;    
	  }else{
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      AmlBHdsBatchInfoAdd2_dataset.setValue("tbitDesc","");
	  }
	  return true;
	}
	
	//代办人身份证件类型
	function tcit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	    document.getElementById("tcitDesc").style.display="";
	    document.getElementById("tcitDescLable").style.display="";
	    AmlBHdsBatchInfoAdd2_dataset.getField("tcitDesc").require=true;     
	  }else{
	    document.getElementById("tcitDesc").style.display="none";
	    document.getElementById("tcitDescLable").style.display="none";
	    AmlBHdsBatchInfoAdd2_dataset.setValue("tcitDesc","");
	  }
	  return true;
	}
	
	//交易方向
	function tdrc_DropDown_onSelect(dropDown,record,editor){
	  var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	  var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";	  
      if(!b1 &&　!b2){
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffix","000000");
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffixName","000000");
           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);     
      }
      if(b1){
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffix","");
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffixName","");
           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tdrcSuffix", true);
      }
      if(b2){
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffix","");
           AmlBHdsBatchInfoAdd2_dataset.setValue("tdrcSuffixName","");
           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("tdrcSuffix", false);
      }
	  return true;
	}
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffix","000000");
          AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffixName","000000");
          AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffix","");
           AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffixName","");
           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffix","");
           AmlBHdsBatchInfoAdd2_dataset.setValue("trcdSuffixName","");
           AmlBHdsBatchInfoAdd2_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	
	function btSaveTemp_postSubmit(button){
    	var retParam = button.returnParam;
    	alert(retParam.msg);
    	closeWin(true);
    }
	
	
	function btBack_onClick() {
		closeWin();
	}
	
</script>
</@CommonQueryMacro.page>