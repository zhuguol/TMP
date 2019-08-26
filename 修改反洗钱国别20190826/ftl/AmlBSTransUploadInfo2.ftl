<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑数据信息">
<#assign op=RequestParameters["op"]?default("")>
<@CommonQueryMacro.CommonQuery id="AmlBSTransUploadInfo2" init="true" submitMode="all" navigate="false">
<table width="100%" cellpadding="2">
	<tr>
		<td valign="top">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td><@CommonQueryMacro.GroupBox id="groupbox1" label="可疑主体交易信息" expand="true">
							<table frame=void class="grouptable" width="100%">
								<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">业务标识号</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="ticd"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户号</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="csnm"/></td>		
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件类型</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="citp"/></td>			
									   <td width="25%" width="25%" id="citpDescLable" colspan="1" align="right" nowrap class="labeltd">客户身份证件类型进一步说明</td>
									   <td width="25%" width="25%" class="datatd" id="citpDesc"><@CommonQueryMacro.SingleField fId="citpDesc"/></td>		
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户身份证件号码</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="ctid"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户名称/姓名</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="ctnm"/></td>		
						   			</tr>
						   			<tr>
						   			   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户类型</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="catp"/></td>
						   			   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账号</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="ctac"/></td>
									  		
						   			</tr>
						   			<tr>
						   			   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户开户时间</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="oatm"/></td>	
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">客户账户销户时间</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="catm"/></td>			
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人姓名</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbnm"/></td>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人国籍</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbnt"/></td>			
									   		
						   			</tr>
						   			<tr>
						   			   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人身份证件/证明文件类型</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbit"/></td>
									   <td width="25%" width="25%" id="bitpDescLable" colspan="1" align="right" nowrap class="labeltd">代办人身份证件类型进一步说明</td>
									   <td width="25%" width="25%" class="datatd" id="bitpDesc"><@CommonQueryMacro.SingleField fId="bitpDesc"/></td>			
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">代办人身份证件/证明文件号码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tbid"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易时间</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tstm"/></td>		
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcd"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易发生地区代码</td>
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trcdSuffix"/></td>		
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易方式</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tstp"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">涉外收支交易分类与代码</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tsct"/></td>		
						   			</tr>
						   			<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金收付标识</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tsdr"/></td>			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">资金来源和用途</td>
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="crsp"/></td>		
						   			</tr>
									<tr>
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">币种</td>                                                                                            
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="crtp"/></td>                                                                                                                                      			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易金额</td>                                                                                                                   
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="crat"/></td>                                                                                        		
									</tr>                                                                  
									<tr>                                 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点名称</td>                                                                                            
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="cfin"/></td>                                                                                                                                      			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点代码</td>                                                                                            
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="cfic"/></td>                                                                                                                                                                                                                                                                                                        		
									</tr>                                                                  
									<tr>                                 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点地区</td>                                                                                                                                                                                                                                                             
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cfrc"/></td> 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构网点地区行政区划代码</td>                                                                                                                                                                                                                                                                                                           
									   <td width="25%" width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="cfrcSuffix"/></td>                                                                                         		
									</tr>                                                                 
									<tr>                                                                                                 	                                
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">对方金融机构代码类型</td>                                                                                                                                                                                                                                                                                    
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="cfct"/></td>                                                                                                                                       			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手姓名/名称</td>                                                                                                                   
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tcnm"/></td>                                                                                        		
									</tr>                                                                 
									<tr>                                 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件类型</td>                                                                                                                                                                                                                                                                                                           
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tcit"/></td>                                                                                                                                      			
									   <td width="25%" width="25%" id="tcitDescLable" colspan="1" align="right" nowrap class="labeltd">交易对手证明类型进一步说明</td>                                                                                                                                                                                                                                                             
									   <td width="25%" width="25%" class="datatd" id="tcitDesc"><@CommonQueryMacro.SingleField fId="tcitDesc"/></td>                                                                                        		
									</tr>                                                          
									<tr>                                 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手证件号码</td>                                                                                                                                                                                        
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tcid"/></td>                                                                                                                                      			
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账户类型</td>                                                                                            
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tcat"/></td>                                                                                        		
									</tr>                                                                 
									<tr>                                 
									   <td width="25%" width="25%" colspan="1" align="right" nowrap class="labeltd">交易对手账号</td>                                                                                                                                                                                                               
									   <td width="25%" width="25%" class="datatd"><font color="red">*<@CommonQueryMacro.SingleField fId="tcac"/></td>                                                                                                                                      			
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
			<@CommonQueryMacro.Button id= "btSaveTmpTrans"/>
			<@CommonQueryMacro.Button id= "btConfirmTrans"/>
		 </#if>
			<@CommonQueryMacro.Button id= "btBackTrans"/>
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
			AmlBSTransUploadInfo2_dataset.setReadOnly(true);
			iddescDisplay();   //初始化证件类型进一步说明的填写框
		}
		if(op=="mod"){
	  		iddescDisplay();   
		}
		if(op=="new"){
		  iddescDisplay();
	      AmlBSTransUploadInfo2_dataset.setValue("reportId",reportId);
	      AmlBSTransUploadInfo2_dataset.setValue("workDate",workDate);
		}
		
		//回执错误定位
		if(op=="mod"||op=="detail"){
			AMLVaildService.locationBSTrans(location_id,function(data){
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
    function btSaveTmpTrans_postSubmit(button){
        alert("暂存成功！");
    	closeWin(true);
    }
    //校验保存
    function btConfirmTrans_postSubmit(button){
        alert("校验保存成功！");
    	closeWin(true);
    }
    //返回
   	function btBackTrans_onClick(){
    	closeWin();
    }
    
     //【客户身份证件/证明文件类型】 【交易对手证件类型】为[19：其他类个人身份有效证件]或者[29：其他类机构代码]时 页面初始化要显示类型进一步说明否则不显示
	function iddescDisplay(){
	   var citp = AmlBSTransUploadInfo2_dataset.getValue("citp");
	   var tbit = AmlBSTransUploadInfo2_dataset.getValue("tbit");
	   var tcit = AmlBSTransUploadInfo2_dataset.getValue("tcit");
	   if(citp=="19" || citp=="29"){
	      document.getElementById("citpDesc").style.display="";
	      document.getElementById("citpDescLable").style.display="";
	   }else{
	      document.getElementById("citpDesc").style.display="none";
	      document.getElementById("citpDescLable").style.display="none";
	   }
	   if(tbit=="19" || tbit=="29"){
	      document.getElementById("bitpDesc").style.display="";
	      document.getElementById("bitpDescLable").style.display="";
	   }else{
	      document.getElementById("bitpDesc").style.display="none";
	      document.getElementById("bitpDescLable").style.display="none";
	   }
	   if(tcit=="19" || tcit=="29"){
	      document.getElementById("tcitDesc").style.display="";
	      document.getElementById("tcitDescLable").style.display="";
	   }else{
	      document.getElementById("tcitDesc").style.display="none";
	      document.getElementById("tcitDescLable").style.display="none";
	   }
	   
	   //交易发生地
	   var trcd = AmlBSTransUploadInfo2_dataset.getValue("trcd");
   		if(trcd!="CHN" && trcd!="Z01" && trcd!="Z02" && trcd!="Z03"){
       		AmlBSTransUploadInfo2_dataset.setFieldReadOnly("trcdSuffix", true); 
   		}
   		//对方金融机构地区
       	var cfrc = AmlBSTransUploadInfo2_dataset.getValue("cfrc");
     	if(cfrc!="CHN" && cfrc!="Z01" && cfrc!="Z02" && cfrc!="Z03"){
           AmlBSTransUploadInfo2_dataset.setFieldReadOnly("cfrcSuffix", true); 
    	}
	   
	    //当回执错误信息不为空的时候显示
	   var errmsg = AmlBSTransUploadInfo2_dataset.getValue("errmsg");
	   if(errmsg!=""){
	      document.getElementById("errmsg").style.display="";
	      document.getElementById("errmsgLable").style.display="";
	   }else{
	      document.getElementById("errmsg").style.display="none";
	      document.getElementById("errmsgLable").style.display="none";
	   }
	   
	    //补录页面交易时间不可修改  新增页面交易时间可修改    add by GL 20180425
	    /*var tstm = AmlBSTransUploadInfo2_dataset.getValue("tstm");
	    if(tstm!=""){
	    	AmlBSTransUploadInfo2_dataset.setFieldReadOnly("tstm",true); 
	    }else{
	    	AmlBSTransUploadInfo2_dataset.setFieldReadOnly("tstm",false); 
	    }*/
	    
	}
	
	
	//客户身份证件/证明文件类型
	function citp_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("citpDescLable").style.display="";
		    document.getElementById("citpDesc").style.display="";
		    AmlBSTransUploadInfo2_dataset.getField("citpDesc").require=true; 
	  }else{
	        document.getElementById("citpDesc").style.display="none";
	        document.getElementById("citpDescLable").style.display="none";
	        AmlBSTransUploadInfo2_dataset.setValue("citpDesc","");
	  }
	  return true;
	}
	
	//代办人身份证件/证明文件类型
	function tbit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("bitpDescLable").style.display="";
		    document.getElementById("bitpDesc").style.display="";
		    AmlBSTransUploadInfo2_dataset.getField("bitpDesc").require=true; 
	  }else{
	        document.getElementById("bitpDescLable").style.display="none";
	        document.getElementById("bitpDesc").style.display="none";
	        AmlBSTransUploadInfo2_dataset.setValue("bitpDesc","");
	  }
	  return true;
	}
	
	//交易对手身份证件/证明文件类型
	function tcit_DropDown_onSelect(dropDown,record,editor){
	   if(record[0]=="19"||record[0]=="29"){
	        document.getElementById("tcitDescLable").style.display="";
		    document.getElementById("tcitDesc").style.display="";
		    AmlBSTransUploadInfo2_dataset.getField("tcitDesc").require=true; 
	  }else{
	        document.getElementById("tcitDescLable").style.display="none";
	        document.getElementById("tcitDesc").style.display="none";
	        AmlBSTransUploadInfo2_dataset.setValue("tcitDesc","");
	  }
	  return true;
	}
	
	
	//交易发生地下拉框联动
	function trcd_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBSTransUploadInfo2_dataset.setValue("trcdSuffix","000000");
          AmlBSTransUploadInfo2_dataset.setValue("trcdSuffixName","000000");
          AmlBSTransUploadInfo2_dataset.setFieldReadOnly("trcdSuffix", true);     
      }
       if(b1){
           AmlBSTransUploadInfo2_dataset.setValue("trcdSuffix","");
           AmlBSTransUploadInfo2_dataset.setValue("trcdSuffixName","");
           AmlBSTransUploadInfo2_dataset.setFieldReadOnly("trcdSuffix", true);	
      }
      if(b2){
           AmlBSTransUploadInfo2_dataset.setValue("trcdSuffix","");
           AmlBSTransUploadInfo2_dataset.setValue("trcdSuffixName","");
           AmlBSTransUploadInfo2_dataset.setFieldReadOnly("trcdSuffix", false);
      }
	  return true;
	}
	
	//对方金融机构地区下拉框联动
	function cfrc_DropDown_onSelect(dropDown,record,editor){
	    var b1 = record[0]=="@N"||record[0]=="@E"||record[0]=="@I";
	    var b2 = record[0]=="CHN"||record[0]=="Z01"||record[0]=="Z02"||record[0]=="Z03";  
      if(!b1&&!b2){
          AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffix","000000");
          AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffixName","000000");
          AmlBSTransUploadInfo2_dataset.setFieldReadOnly("cfrcSuffix", true);     
      }
       if(b1){
           AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffix","");
           AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffixName","");
           AmlBSTransUploadInfo2_dataset.setFieldReadOnly("cfrcSuffix", true);	
      }
      if(b2){
           AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffix","");
           AmlBSTransUploadInfo2_dataset.setValue("cfrcSuffixName","");
           AmlBSTransUploadInfo2_dataset.setFieldReadOnly("cfrcSuffix", false);
      }
	  return true;
	}
	
	
</script>
</@CommonQueryMacro.page>
