<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="模板下载">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="MouldDownLoad" init="true" submitMode="all">
	<table align="left"  width="100%">
		<tr>
   			<td align="center"  colspan="2">
   				<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" colNm=4 showButton="true" />
        	</td>
        </tr>
		<tr>
			<td valign="top">
			<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
  		<tr>
      		<td colspan="2">
          		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAddMould,-,btModMould,-,btRemMould" fieldStr="select,id[70],oper[70],fileEName[250],fileCName[250],status[120],upDepartment[120],fileType[120],upTime[120]" width="100%"  readonly="true"/><br/>
        	</td>
        </tr>
   </table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr>
</table>

<script language="JavaScript">
	//下载定位一条记录
    function datatable_oper_onRefresh(cell,value,record) {
        if(record){
	   		var fileEName = record.getValue("fileEName");
	   		if(fileEName!=""){
	   			cell.innerHTML= "<a href=\"JavaScript:mouldDownLoad('"+fileEName+"')\">下载</a>";
	  	  }
	    }
    }
    //下载
    function mouldDownLoad(fileEName){
        window.location.href = encodeURI("${contextPath}/mouldDownLoad?fileEName="+fileEName);
    }
    //新增
    function btAddMould_onClick(){
    	window.location.href = "${contextPath}/fpages/export/jsp/importMouldDownLoad.jsp?type=new";
    }
    //修改
    function btModMould_onClick(button){
    	var record = MouldDownLoad_dataset.firstUnit;
    	var chk=0;
    	var id;
    	var fileEName;
    	var fileCName;
    	var status;
    	var fileType;
    	var upDepartment;
    	while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
				fileEName = record.getValue("fileEName");
				fileCName = record.getValue("fileCName");
				status = record.getValue("status");
				fileType =record.getValue("fileType");
				upDepartment =record.getValue("upDepartment");
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要修改的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}else{
			window.location.href = "${contextPath}/fpages/export/jsp/importMouldDownLoad.jsp?type=mod&id="+id+"&fileEName="+fileEName+"&fileCName="+encodeURI(encodeURI(fileCName))+"&status="+status+"&fileType="+fileType+"&upDepartment="+upDepartment;
		}
	}
	
	function btRemMould_onClick(button){
    	var record = MouldDownLoad_dataset.firstUnit;
    	var chk=0;
    	var id;
    	var fileEName;
    	var fileCName;
    	var status;
    	var fileType;
    	var upDepartment;
    	while(record){
			var temp = record.getValue("select");
			if(temp){
			    id = record.getValue("id");
				fileEName = record.getValue("fileEName");
				fileCName = record.getValue("fileCName");
				status = record.getValue("status");
				fileType = record.getValue("fileType");
				upDepartment = record.getValue("upDepartment");
				chk++;
			}
			record=record.nextUnit;
		}
		if(chk==0){
			alert("请选择要修改的记录！");
			return false;
		}else if(chk>1){
			alert("请选择一条记录！");
			return false;
		}else{
			window.location.href = "${contextPath}/fpages/export/jsp/importMouldDownLoad.jsp?type=del&id="+id+"&fileEName="+fileEName+"&fileCName="+encodeURI(encodeURI(fileCName))+"&status="+status+"&fileType="+fileType+"&upDepartment="+upDepartment;
		}
	}
	
</script>
</@CommonQueryMacro.page>