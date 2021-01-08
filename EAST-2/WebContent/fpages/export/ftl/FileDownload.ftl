<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="导出CSV下载">
<table width="100%" align="center">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="FileDownload" init="false" submitMode="all">
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
          		<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="oper[180],brno[100],tlrno[100],rsptime[140],rsptablename[240],sqlWhereShow[700],num[90],filesize[100]" width="100%"  readonly="true"/><br />
        	</td>
        </tr>
   </table>
</@CommonQueryMacro.CommonQuery>
</td>
</tr>
</table>

<script>
	//定位一条记录
    function datatable_oper_onRefresh(cell,value,record) {
        if(record){
	   		var comments = record.getValue("comments");
	    	if("成功"==comments){
	        	var path = record.getValue("filePath");
	            cell.innerHTML= "<center><a href=\"JavaScript:download('"+path+"')\">下载CSV</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"JavaScript:downloadExcel('"+path+"')\">下载Excel</a></center>";
	    	}else if("审核通过"==comments){
	    		cell.innerHTML= "<center>系统正在生成文件</center>";
	    	}else if(""==comments){
	    		cell.innerHTML= "<center>等待CHECKER人员审核</center>";
	    	}else{
				cell.innerHTML= "<center>"+comments+"</center>";
			}	
        }
    }
    
    //下载CSV
    function download(path){
    	var flag = "0";
        window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/demoDownloadAction.do?path="+path+"&flag="+flag));
    }
    
    //下载Excel
    function downloadExcel(path){
    	var flag = "1";
   		window.location.href = encodeURI(encodeURI("${contextPath}/filedownload/demoDownloadAction.do?path="+path+"&flag="+flag));
    }
</script>
</@CommonQueryMacro.page>