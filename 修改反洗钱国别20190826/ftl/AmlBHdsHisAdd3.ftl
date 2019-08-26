<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="大额交易">
<@CommonQueryMacro.CommonQuery id="AmlBHdsHisAdd" init="true" insertOnEmpty="true" navigate="false">
<table width="90%" cellpadding="2">
	<tr>
		<td width="25%" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="报告基本信息"
						expand="true">
						<table frame="void" class="grouptable" width="100%">
						   <tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务流水号</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ticd"/></td>	
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">大额报文类型</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="reportType"/></td>		
						   </tr>
							<tr>					
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构名称</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="rinm"/></td>
								<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">报告机构编码</td>
								<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ricd"/></td>				
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
				   <td width="25%"><@CommonQueryMacro.GroupBox id="groupbox1" label="交易主体信息"
						expand="true">
						<table frame="void" class="grouptable" width="100%">
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
							<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="csnm"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnm"/></td>
						   </tr>
						 <tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户类型</td>
						    <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cttp"/></td>
						   
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctnt"/></td>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账号</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="ctac"/></td>	
						   </tr>
						<tr>
						    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户证件号码</td>
						    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="ctid"/></td>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">账户类型</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="catp"/></td>
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
						   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="citp"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="citpDesc"/></td>
						   
						</tr>
						<tr>
						   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户联系电话</td>
						   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cctl"/></td>
						   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户住址</td>
						   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="ctar"/></td>
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
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="finc"/></td>
									  	
									  					  				    
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点与大额交易的关系</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="rltp"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">金融机构网点所在地区行政区划代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="firc"/></td>	
									   
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
										<td width="25%" width="25%" class="datatd" id="tbitDesc"><@CommonQueryMacro.SingleField fId="tbitDesc"/></td>		
									  
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
										<td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="tcitDesc"/></td>
									   
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
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易日期</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tstm"/></td>
														    
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tstp"/></td>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									    <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tsct"/></td>  
									</tr>
									<tr>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tsdr"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="crtp"/></td>																		
									</tr>									
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="crat"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金用途</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="crpp"/></td>
									</tr>
									<tr>
									    <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
										<td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="trcd"/></td>
										<td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区域</td>
										<td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcdSuffix"/></td>
									</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方向国别</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*</font><@CommonQueryMacro.SingleField fId="tdrc"/></td>
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
																<td width="25%" align="right" nowrap class="labeltd">确认不上报审核说明</td>
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
			<@CommonQueryMacro.Button id="btFill"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btSaveTemp"/>&nbsp; &nbsp;
			<@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
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
	<#assign v_branchcode = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()>
	<#assign v_branchName = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrName()>
		function initCallGetter_post(){
			var citp1 = AmlBHdsHisAdd_dataset.getValue("citp");
			if(citp1=="19" || citp1=="29"){//证件类型为11、29则显示进一步说明
	     		document.getElementById("citpDesc").style.display="";
	     		document.getElementById("citpDescLable").style.display="";
	       		AmlBHdsHisAdd_dataset.setFieldReadOnly("citpDesc", false);
	  		}
	  		//详细页面设置只读
			if(op=="detail"){
				document.getElementById('btSave').style.display="none";
				document.getElementById('btSaveTemp').style.display="none";
				AmlBHdsHisAdd_dataset.setReadOnly(true);
			}
			//修改页面部分字段不可修改
			if(op=="mod"){
		  		iddescDisplay();
		  		var codeName = '${v_branchcode}'+'-'+'${v_branchName}';
	      		AmlBHdsHisAdd_dataset.setValue("ricd",'${v_branchcode}');
	       		AmlBHdsHisAdd_dataset.setValue("rinm",'${v_branchName}');
	       		AmlBHdsHisAdd_dataset.setValue("rinmName",codeName);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("ticd",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("reportType",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("rinm",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("ricd",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("htdt",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("crcd",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("csnm",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("ctac",true);
			   	
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("recStatus",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("repStatus",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("crtTm",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("lstUpdTlr",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("lstUpdTm",true);
			   	AmlBHdsHisAdd_dataset.setFieldReadOnly("errmsg",true);
		   		//设置金融机构显示方式	
		   	 	getBctl();
		   		var trcd = AmlBHdsHisAdd_dataset.getValue("trcd");
	       		if(trcd!="CHN" && trcd!="Z01" && trcd!="Z02" && trcd!="Z03"){
	           		AmlBHdsHisAdd_dataset.setFieldReadOnly("trcdSuffix", true); 
	       		}
	       		var tdrc = AmlBHdsHisAdd_dataset.getValue("tdrc");
		       if(tdrc!="CHN" && tdrc!="Z01" && tdrc!="Z02" && tdrc!="Z03"){
		           AmlBHdsHisAdd_dataset.setFieldReadOnly("tdrcSuffix", true); 
		       }
			}
			//新增页面
			if(op=="new"||op=="bubao"){
			  document.getElementById('xitong').style.display="none";
			  document.getElementById("citpDesc").style.display="none";
		      document.getElementById("tbitDesc").style.display="none";
		      document.getElementById("tcitDesc").style.display="none";
		      document.getElementById("citpDescLable").style.display="none";
		      document.getElementById("tbitDescLable").style.display="none";
		      document.getElementById("tcitDescLable").style.display="none";
	       
		      var codeName = '${v_branchcode}'+'-'+'${v_branchName}';
		      AmlBHdsHisAdd_dataset.setValue("ricd",'${v_branchcode}');
		      AmlBHdsHisAdd_dataset.setValue("rinm",'${v_branchName}');
		      AmlBHdsHisAdd_dataset.setValue("rinmName",codeName);
		      AmlBHdsHisAdd_dataset.setValue("htdt",sysTxdate);//大额交易发生日期
		      AmlBHdsHisAdd_dataset.setValue("fict","00");//金融机构网点代码类型  目前暂定填写“00”
		      AmlBHdsHisAdd_dataset.setFieldReadOnly("reportType",true);
		      AmlBHdsHisAdd_dataset.setFieldReadOnly("fict",true);
		      AmlBHdsHisAdd_dataset.setFieldReadOnly("ricd",true);
		      AmlBHdsHisAdd_dataset.setFieldReadOnly("rinm",true);
		      if(op=="new"){
			  	AmlBHdsHisAdd_dataset.setValue("reportType","00");
			  }
			  if(op=="bubao" ){
			  	AmlBHdsHisAdd_dataset.setValue("reportType","03");
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
	   var citp = AmlBHdsHisAdd_dataset.getValue("citp");
	   var tbit = AmlBHdsHisAdd_dataset.getValue("tbit");
	   var tcit = AmlBHdsHisAdd_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	       AmlBHdsHisAdd_dataset.setFieldReadOnly("citpDesc", false);
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
		
    //客户身份证件/证明文件类型
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("citpDescLable").style.display="";
		    document.getElementById("citpDesc").style.display="";
		    AmlBHdsHisAdd_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlBHdsHisAdd_dataset.setValue("citpDesc","");
	  }
	  return true;
	}

	//代办人身份证件类型
	function tbit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	      document.getElementById("tbitDesc").style.display="";
	      document.getElementById("tbitDescLable").style.display="";
	      AmlBHdsHisAdd_dataset.getField("tbitDesc").require=true;    
	  }else{
	      document.getElementById("tbitDesc").style.display="none";
	      document.getElementById("tbitDescLable").style.display="none";
	      AmlBHdsHisAdd_dataset.setValue("tbitDesc","");
	  }
	  return true;
	}
	
	//代办人身份证件类型
	function tcit_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="19"||record[0]=="29"){
	    document.getElementById("tcitDesc").style.display="";
	    document.getElementById("tcitDescLable").style.display="";
	    AmlBHdsHisAdd_dataset.getField("tcitDesc").require=true;     
	  }else{
	    document.getElementById("tcitDesc").style.display="none";
	    document.getElementById("tcitDescLable").style.display="none";
	    AmlBHdsHisAdd_dataset.setValue("tcitDesc","");
	  }
	  return true;
	}
	//交易方向
	function tdrc_DropDown_onSelect(dropDown,record,editor){
	  var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	  var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";	  
      if(!b1 &&　!b2){
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffix","000000");
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffixName","000000");
           AmlBHdsHisAdd_dataset.setFieldReadOnly("tdrcSuffix", true);     
      }
      if(b1){
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffix","");
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffixName","");
           AmlBHdsHisAdd_dataset.setFieldReadOnly("tdrcSuffix", true);
      }
      if(b2){
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffix","");
           AmlBHdsHisAdd_dataset.setValue("tdrcSuffixName","");
           AmlBHdsHisAdd_dataset.setFieldReadOnly("tdrcSuffix", false);
      }
	  return true;
	}
	
	//交易发生地
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBHdsHisAdd_dataset.setValue("trcdSuffix","000000");
          AmlBHdsHisAdd_dataset.setValue("trcdSuffixName","000000");
          AmlBHdsHisAdd_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBHdsHisAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsHisAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsHisAdd_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBHdsHisAdd_dataset.setValue("trcdSuffix","");
           AmlBHdsHisAdd_dataset.setValue("trcdSuffixName","");
           AmlBHdsHisAdd_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}


	//涉外收支交易分类与代码属性下拉框
 	 function tsct_DropDown_beforeOpen(dropDown){
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("headDataTypeNo","02");
        MtsInOutCodeTreeSelect_DropDownDataset.setParameter("codeType","AML");
	 }
	
 	//保存校验--交易发生地为国内,交易发生地区不能为空
    function btSave_onClickCheck(button) {
        //修改页面的值 以便能后删除
       var citpdesc = AmlBHdsHisAdd_dataset.getValue("citpDesc"); 
       AmlBHdsHisAdd_dataset.setValue("citpDesc",citpdesc);
       var trcdSuffix = AmlBHdsHisAdd_dataset.getValue("trcdSuffix"); 
       var trcd = AmlBHdsHisAdd_dataset.getValue("trcd"); 
       var tdrcSuffix = AmlBHdsHisAdd_dataset.getValue("tdrcSuffix"); 
       var tdrc = AmlBHdsHisAdd_dataset.getValue("tdrc");
       if(trcd=="CHN" || trcd=="Z01" || trcd=="Z02" || trcd=="Z03"){
            if(trcdSuffix==""){
            alert("交易发生地为国内,交易发生地区不能为空");
            return false;
            }     
       }
       if(tdrc=="CHN" || tdrc=="Z01" || tdrc=="Z02" || tdrc=="Z03"){
            if(tdrcSuffix==""){
            alert("交易方向国别为国内,交易方向地区不能为空");
            return false;
            }     
       }
       return true;
   
	}
	
    function btSave_postSubmit(button){
		var successMsg;
		successMsg = "确认成功！";
		alert(successMsg);
		closeWin();
	}
	
	function btSaveTemp_postSubmit(button){
		var successMsg;
		successMsg = "保存成功！";
		alert(successMsg);
		closeWin();
	}
	
	function btBack_onClick() {
		closeWin();
	}
  

	function btFill_onClick(){
		//alert(AmlBHdsHisAdd_dataset.getValue("tcat"));
		//报告基础信息
		AmlBHdsHisAdd_dataset.setValue("crcd","0901");	//大额交易特征代码
		AmlBHdsHisAdd_dataset.setValue("rpdt",sysTxdate);	//报告生成日期
		AmlBHdsHisAdd_dataset.setValue("htdt",sysTxdate);//大额交易发生日期
		//交易主体信息
		AmlBHdsHisAdd_dataset.setValue("ctnm","客户名称001");//客户名称
		AmlBHdsHisAdd_dataset.setValue("ctnt","CHN");//客户国籍
		AmlBHdsHisAdd_dataset.setValue("ctid","test01");//客户证件号码
		AmlBHdsHisAdd_dataset.setValue("citp","12");//客户身份证件/证明文件类型
		AmlBHdsHisAdd_dataset.setValue("csnm","001");//客户号
		//金融机构网点信息
		AmlBHdsHisAdd_dataset.setValue("finn","XX银行上海分行");//金融机构网点名称
		AmlBHdsHisAdd_dataset.setValue("finc","310000133001");//金融机构网点代码
		AmlBHdsHisAdd_dataset.setValue("rltp","01");//金融机构网点与大额交易的关系
		AmlBHdsHisAdd_dataset.setValue("firc","110100");//金融机构网点所在地区行政区划代码
		//代办人信息
		AmlBHdsHisAdd_dataset.setValue("tbnm","李明");//交易代办人姓名
		AmlBHdsHisAdd_dataset.setValue("tbnt","CHN");//代办人国籍
		AmlBHdsHisAdd_dataset.setValue("tbid","test05");//交易代办人身份证件号码
		AmlBHdsHisAdd_dataset.setValue("tbit","12");//代办人身份证件类型
		//交易对手信息
		AmlBHdsHisAdd_dataset.setValue("cfin","工商银行");//对方机构名称
		AmlBHdsHisAdd_dataset.setValue("cfct","11");//对方金融机构代码类型
		AmlBHdsHisAdd_dataset.setValue("cfic","09333");//对方金融机构网点代码
		AmlBHdsHisAdd_dataset.setValue("tcnm","行长");//交易对手姓名
		AmlBHdsHisAdd_dataset.setValue("tcat","0011");//交易对手账户类型		
		AmlBHdsHisAdd_dataset.setValue("tcac","230324423344332433");//交易对手账号
		AmlBHdsHisAdd_dataset.setValue("tcit","12");//交易对手证件类型
		AmlBHdsHisAdd_dataset.setValue("tcid","test22");//交易对手证件号码
		//交易信息
		AmlBHdsHisAdd_dataset.setValue("tstm",sysTxdate);//交易时间
		AmlBHdsHisAdd_dataset.setValue("ticd",new Date().getTime());//业务流水号
		AmlBHdsHisAdd_dataset.setValue("tstp","000030");//交易方式
		AmlBHdsHisAdd_dataset.setValue("tsct","801032");//涉外收支交易分类与代码
		AmlBHdsHisAdd_dataset.setValue("tsdr","01");//资金收付标识
		AmlBHdsHisAdd_dataset.setValue("crtp","CNY");//币种
		AmlBHdsHisAdd_dataset.setValue("crpp","付款");//资金用途
		AmlBHdsHisAdd_dataset.setValue("crat","1000000");//交易金额
		AmlBHdsHisAdd_dataset.setValue("trcd","CHN");//交易发生地
		AmlBHdsHisAdd_dataset.setValue("trcdSuffix","310115");//交易发生地
		AmlBHdsHisAdd_dataset.setValue("tdrc","CHN");//交易方向国别
		AmlBHdsHisAdd_dataset.setValue("tdrcSuffix","310115");//交易方向区域
		AmlBHdsHisAdd_dataset.setValue("catp","0011");//账户类型
		AmlBHdsHisAdd_dataset.setValue("ctac","361685");//账号		
	}
	
	//获取金融机构信息
	 function getBctl(){
	 	var brNo = AmlBHdsHisAdd_dataset.getValue("finn");
		PrivAction.getBctlByNo(brNo, function(bctl){
		if(bctl.brno!=null){
		AmlBHdsHisAdd_dataset.setValue("finn",bctl.brname); 
		if(bctl.brno!=null&&bctl.brname!=null){
			AmlBHdsHisAdd_dataset.setValue("finnName",bctl.brno+'-'+bctl.brname);
		}
		AmlBHdsHisAdd_dataset.setValue("finc",bctl.brno);
		AmlBHdsHisAdd_dataset.setValue("firc",bctl.brAreacode);
		var areaCode = bctl.brAreacode;
		PrivAction.getAreaByCode(areaCode, function(biAreaCode){
				var codeAndName = biAreaCode.areaName;
				if(biAreaCode.areaCode!=null&&biAreaCode.areaName!=null){
					AmlBHdsHisAdd_dataset.setValue("fircName",codeAndName);
				}		              
			});
		  }
		 });		    	 
	 }
	 
	//补录客户信息的时候触发，补录当天该客户所有交易的客户信息
	/*
	function AmlBHdsHisAdd_dataset_afterChange(dataset,field){
		if(field.name=="ctnm"||field.name=="cttp"||field.name=="ctnt"||field.name=="ctid"
		   ||field.name=="citp"||field.name=="citpDesc"||field.name=="cctl"||field.name=="ctar"){
		   alert("123");
			btUpdateCustomer.click();
		}
	}
	*/
</script>
</@CommonQueryMacro.page>