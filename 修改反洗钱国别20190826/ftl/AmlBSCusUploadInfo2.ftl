<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑数据信息">
<#assign op=RequestParameters["op"]?default("")>
<@CommonQueryMacro.CommonQuery id="AmlBSCusUploadInfo2" init="true" submitMode="all" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td><@CommonQueryMacro.GroupBox id="groupbox1" label="可疑主体客户信息" expand="true">
							<table frame=void class="grouptable" width="100%">
								<tr>
								   <td width="25%" colspan="1" align="right" nowrap class="labeltd">业务条线</td>
								   <td width="25%" colspan="1" class="datatd"><@CommonQueryMacro.SingleField fId="ywtx"/></td>	
					   			</tr>
								<tr>
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称/姓名</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="senm"/></td>	
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="csnm"/></td>		
					   			</tr>
					   			<tr>
					   			   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="setp"/></td>	
								   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件类型进一步说明</td>
								   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="citpDesc"/></td>			
								  	
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件/证明文件号码</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="seid"/></td>			
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户类型</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="cttp"/></td>		
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户联系电话</td>
								   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="sctl"/></td>			
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户住址</td>
								   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="sear"/></td>		
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户其他联系方式</td>
								   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="seei"/></td>	
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户国籍</td>
								   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="stnt"/></td>			
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对私客户的职业或对公客户的行业类别</td>
								   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="sevc"/></td>
					   			</tr>
					   			
					   			<tr>
					   			   <td width="25%" width="25%" id="srnmLable" colspan="1" align="right" nowrap class="labeltd">对公客户法定代表人姓名</td>
								   <td width="25%" width="25%" class="datatd" id="srnm"><@CommonQueryMacro.SingleField fId="srnm"/></td>
								   <td width="25%" width="25%" id="rgcpLable" colspan="1" align="right" nowrap class="labeltd">注册资金</td>
								   <td width="25%" width="25%" class="datatd" id="rgcp"><@CommonQueryMacro.SingleField fId="rgcp"/></td>
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" id="sritLable" colspan="1" align="right" nowrap class="labeltd">对公客户法定代表人身份证件类型</td>
								   <td width="25%" width="25%" class="datatd" id="srit"><@CommonQueryMacro.SingleField fId="srit"/></td>	
								   <td width="25%" width="25%" id="critDescLable" colspan="1" align="right" nowrap class="labeltd">对公客户法定代表人身份证件类型进一步说明</td>
								   <td width="25%" width="25%" class="datatd" id="critDesc"><@CommonQueryMacro.SingleField fId="critDesc"/></td>	
					   			</tr>
					   			<tr>
								   <td width="25%" width="25%" id="sridLable" colspan="1" align="right" nowrap class="labeltd">对公客户法定代表人身份证件号码</td>
								   <td width="25%" width="25%" class="datatd" id="srid"><@CommonQueryMacro.SingleField fId="srid"/></td>	
								  			
					   			</tr>
					   			
					   			<tr>
									<td width="25%" id="errmsgLable" colspan="1" align="right" nowrap class="labeltd">回执错误信息</td>
									<td width="85%" colspan="3" class="datatd" id="errmsg"><@CommonQueryMacro.SingleField fId="errmsg"/></td>
								</tr>
							</table>
						</@CommonQueryMacro.GroupBox>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding-left:10px;padding-top:6px;" colspan="3">
		<#if (op=="new") || (op=="mod")>
			<@CommonQueryMacro.Button id= "btSaveTmpCust"/>
			<@CommonQueryMacro.Button id= "btConfirmCust"/>
		</#if>
			<@CommonQueryMacro.Button id= "btBackCust"/>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var op = "${RequestParameters["op"]?default('')}";
	var reportId = "${RequestParameters["reportId"]?default('')}";
	var workDate = "${RequestParameters["workDate"]?default('')}";
	var location_id = "${RequestParameters["id"]?default('')}"; 
	function initCallGetter_post(){
		if(op=="detail"){
			AmlBSCusUploadInfo2_dataset.setReadOnly(true);
			iddescDisplay();   //初始化证件类型进一步说明的填写框
		}
		if(op=="mod"){
	  		iddescDisplay();   //初始化证件类型进一步说明的填写框
		}
		if(op=="new"){
		  iddescDisplay();
	      AmlBSCusUploadInfo2_dataset.setValue("reportId",reportId);
	      AmlBSCusUploadInfo2_dataset.setValue("workDate",workDate);
		}
		
		//回执错误定位
		if(op=="mod"||op=="detail"){
			AMLVaildService.locationBSCust(location_id,function(data){
				if(data!=null){
					for(var i=0;i<data.length;i++){
						var node = document.getElementById("editor_"+data[i]);
						node.style.background = "red"; 
					}
				}
		   });
		}
	}
	
	//暂存
    function btSaveTmpCust_postSubmit(button){
        alert("暂存成功！");
    	closeWin(true);
    }
    //校验保存
    function btConfirmCust_postSubmit(button){
        alert("校验保存成功！");
    	closeWin(true);
    }
    //返回
   	function btBackCust_onClick(){
    	closeWin(true);
    }
    
    //【客户身份证件/证明文件类型】 【交易对手证件类型】为[19：其他类个人身份有效证件]或者[29：其他类机构代码]时 页面初始化要显示类型进一步说明否则不显示
	function iddescDisplay(){
	   var setp = AmlBSCusUploadInfo2_dataset.getValue("setp");
	   var srit = AmlBSCusUploadInfo2_dataset.getValue("srit");
	   if(setp=="19" || setp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	   }else{
	      document.getElementById("citpDesc").style.display="none";
	      document.getElementById("citpDescLable").style.display="none";
	   }
	   if(srit=="19" || srit=="29"){
	      document.getElementById("critDesc").style.display="";
	      document.getElementById("critDescLable").style.display="";
	   }else{
	      document.getElementById("critDesc").style.display="none";
	      document.getElementById("critDescLable").style.display="none";
	   }
	   
	   //当客户类型为02-自然人时隐藏对公客户信息
	   var cttp = AmlBSCusUploadInfo2_dataset.getValue("cttp");
	   if(cttp=="01"||cttp=="03"||cttp=="04"){
	     	document.getElementById("srnm").style.display="";
	        document.getElementById("srnmLable").style.display="";
	        document.getElementById("srit").style.display="";
	        document.getElementById("sritLable").style.display="";
	        document.getElementById("critDesc").style.display="";
	        document.getElementById("critDescLable").style.display="";
	        document.getElementById("srid").style.display="";
	        document.getElementById("sridLable").style.display="";
	        document.getElementById("rgcp").style.display="";
	        document.getElementById("rgcpLable").style.display="";
	   }else{
	      document.getElementById("srnm").style.display="none";
	        document.getElementById("srnmLable").style.display="none";
	        document.getElementById("srit").style.display="none";
	        document.getElementById("sritLable").style.display="none";
	        document.getElementById("critDesc").style.display="none";
	        document.getElementById("critDescLable").style.display="none";
	        document.getElementById("srid").style.display="none";
	        document.getElementById("sridLable").style.display="none";
	        document.getElementById("rgcp").style.display="none";
	        document.getElementById("rgcpLable").style.display="none";
	   }
	   
	   //当回执错误信息不为空的时候显示
	   var errmsg = AmlBSCusUploadInfo2_dataset.getValue("errmsg");
	   if(errmsg!=""){
	      document.getElementById("errmsg").style.display="";
	      document.getElementById("errmsgLable").style.display="";
	   }else{
	      document.getElementById("errmsg").style.display="none";
	      document.getElementById("errmsgLable").style.display="none";
	   }
	}
	
	//客户身份证件/证明文件类型
	function setp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("citpDescLable").style.display="";
		    document.getElementById("citpDesc").style.display="";
		    AmlBSCusUploadInfo2_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlBSCusUploadInfo2_dataset.setValue("citpDesc","");
	  }
	  return true;
	}
	
	//交易对手证件类型
	function srit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("critDescLable").style.display="";
		    document.getElementById("critDesc").style.display="";
		    AmlBSCusUploadInfo2_dataset.getField("critDesc").require=true; 
	  }else{
	        document.getElementById("critDescLable").style.display="none";
	        document.getElementById("critDesc").style.display="none";
	        AmlBSCusUploadInfo2_dataset.setValue("critDesc","");
	  }
	  return true;
	}
	
	//客户类型
	function cttp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]!="02"){
	        document.getElementById("srnm").style.display="";
	        document.getElementById("srnmLable").style.display="";
	        document.getElementById("srit").style.display="";
	        document.getElementById("sritLable").style.display="";
	        document.getElementById("critDesc").style.display="";
	        document.getElementById("critDescLable").style.display="";
	        document.getElementById("srid").style.display="";
	        document.getElementById("sridLable").style.display="";
	        document.getElementById("rgcp").style.display="";
	        document.getElementById("rgcpLable").style.display="";
	  }else{
	        document.getElementById("srnm").style.display="none";
	        document.getElementById("srnmLable").style.display="none";
	        document.getElementById("srit").style.display="none";
	        document.getElementById("sritLable").style.display="none";
	        document.getElementById("critDesc").style.display="none";
	        document.getElementById("critDescLable").style.display="none";
	        document.getElementById("srid").style.display="none";
	        document.getElementById("sridLable").style.display="none";
	        document.getElementById("rgcp").style.display="none";
	        document.getElementById("rgcpLable").style.display="none";
	        
	        AmlBSCusUploadInfo2_dataset.setValue("srnm","@N");
	        AmlBSCusUploadInfo2_dataset.setValue("srit","@N");
	        AmlBSCusUploadInfo2_dataset.setValue("critDesc","");
	        AmlBSCusUploadInfo2_dataset.setValue("srid","@N");
	        AmlBSCusUploadInfo2_dataset.setValue("rgcp","@N");
	  }
	  return true;
	}
	//根据已输入的客户号 自动显示客户信息
	function AmlBSCusUploadInfo2_dataset_afterChange(dataset,field){
	   if(field.name=="csnm"){
			var csnm = dataset.getValue("csnm");
			PrivAction.getAMLBSCust(csnm,function(List_cust){
				if (List_cust && List_cust.length > 0) {
				
					AmlBSCusUploadInfo2_dataset.setValue("senm",List_cust[0].CUST_NAME == null?"":Trim(List_cust[0].CUST_NAME));
					AmlBSCusUploadInfo2_dataset.setValue("setp",List_cust[0].CUST_ID_TYPE == null?"":Trim(List_cust[0].CUST_ID_TYPE));
					//AmlBSCusUploadInfo2_dataset.setValue("oitp",List_cust[0].OITP == null?"":Trim(List_cust[0].OITP));
					AmlBSCusUploadInfo2_dataset.setValue("seid",List_cust[0].CUST_ID_CERT_NO == null?"":Trim(List_cust[0].CUST_ID_CERT_NO));
					//AmlBSCusUploadInfo2_dataset.setValue("csnm",List_cust[0].CSNM == null?"":Trim(List_cust[0].CSNM));
					AmlBSCusUploadInfo2_dataset.setValue("sctl",List_cust[0].CUST_CONTACT_PATN == null?"":Trim(List_cust[0].CUST_CONTACT_PATN));
					AmlBSCusUploadInfo2_dataset.setValue("sear",List_cust[0].CUST_DETAIL_ADDR == null?"":Trim(List_cust[0].CUST_DETAIL_ADDR));
					AmlBSCusUploadInfo2_dataset.setValue("seei",List_cust[0].CUST_OTHRS_CONTACT_PATN == null?"":Trim(List_cust[0].CUST_OTHRS_CONTACT_PATN));
					AmlBSCusUploadInfo2_dataset.setValue("stnt",List_cust[0].CUST_NAT_CODE == null?"":Trim(List_cust[0].CUST_NAT_CODE));
					//AmlBSCusUploadInfo2_dataset.setValue("stntName",List_cust[0].SENM == null?"":Trim(List_cust[0].SENM));
					AmlBSCusUploadInfo2_dataset.setValue("sevc",List_cust[0].CUST_METIER_INDT == null?"":Trim(List_cust[0].CUST_METIER_INDT));
					//AmlBSCusUploadInfo2_dataset.setValue("srnm",List_cust[0].SRNM == null?"":List_cust[0].SRNM);
					//AmlBSCusUploadInfo2_dataset.setValue("srit",List_cust[0].SRIT == null?"":List_cust[0].SRIT);
					//AmlBSCusUploadInfo2_dataset.setValue("orit",List_cust[0].ORIT == null?"":List_cust[0].ORIT);
					//AmlBSCusUploadInfo2_dataset.setValue("srid",List_cust[0].SRID == null?"":List_cust[0].SRID);
					//AmlBSCusUploadInfo2_dataset.setValue("scnm",List_cust[0].SCNM == null?"":List_cust[0].SCNM);
					//AmlBSCusUploadInfo2_dataset.setValue("scit",List_cust[0].SCIT == null?"":List_cust[0].SCIT);
					//AmlBSCusUploadInfo2_dataset.setValue("ocit",List_cust[0].OCIT == null?"":List_cust[0].OCIT);
					//AmlBSCusUploadInfo2_dataset.setValue("scid",List_cust[0].SCID == null?"":List_cust[0].SCID);
				} else {
					AmlBSCusUploadInfo2_dataset.setValue("senm","");
					AmlBSCusUploadInfo2_dataset.setValue("setp","");
					AmlBSCusUploadInfo2_dataset.setValue("oitp","");
					AmlBSCusUploadInfo2_dataset.setValue("seid","");
					//AmlBSCusUploadInfo2_dataset.setValue("csnm","");
					AmlBSCusUploadInfo2_dataset.setValue("sctl","");
					AmlBSCusUploadInfo2_dataset.setValue("sear","");
					AmlBSCusUploadInfo2_dataset.setValue("seei","");
					AmlBSCusUploadInfo2_dataset.setValue("stnt","");
					//AmlBSCusUploadInfo2_dataset.setValue("stntName","");
					AmlBSCusUploadInfo2_dataset.setValue("sevc","");
					AmlBSCusUploadInfo2_dataset.setValue("srnm","");
					AmlBSCusUploadInfo2_dataset.setValue("srit","");
					AmlBSCusUploadInfo2_dataset.setValue("orit","");
					AmlBSCusUploadInfo2_dataset.setValue("srid","");
					AmlBSCusUploadInfo2_dataset.setValue("scnm","");
					AmlBSCusUploadInfo2_dataset.setValue("scit","");
					AmlBSCusUploadInfo2_dataset.setValue("ocit","");
					AmlBSCusUploadInfo2_dataset.setValue("scid","");
				}
			});
		}
	}
	//字符串前后去空格
    function Trim(str){ 

             return str.replace(/(^\s*)|(\s*$)/g, ""); 
     }
</script>
</@CommonQueryMacro.page>
