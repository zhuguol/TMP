<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="下载列表查询">
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlDownload" init="true" submitMode="current">
            <table width="100%">
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="" fieldStr="oper,fileName[500],fileSize,crtTm[200],crtTlr[200]" width="100%" />
                    </td>
                </tr>
                <tr align="center">
					<td>
					<div style="display:none">
						<@CommonQueryMacro.Button id= "btDelete" />
					 </div>
					</td>
				</tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">

    function datatable_oper_onRefresh(cell,value,record) {
        if(record){
            var id = record.getValue("id");
            var innerText = " <a href=\"JavaScript:download('"+id+"')\">下载</a>&nbsp;&nbsp;" + "<a href=\"JavaScript:doDelete('"+id+"')\">删除</a>&nbsp;&nbsp; ";
            cell.innerHTML= "<center>"+innerText+"</center>";
        }
    }
	function doDelete(id){
		if(confirm("将该文件删除，不可恢复，请确认!")){
			AmlDownload_dataset.setParameter("id", id);
			btDelete.click();
        }
    }
    function btDelete_postSubmit(){
    	alert("删除成功！");
		AmlDownload_dataset.flushData(AmlDownload_dataset.pageIndex);
	}
   function download(id){
        window.location.href = "${contextPath}/filedownload/TransFileDownloadAction.do?id="+id;
   }
</script>
</@CommonQueryMacro.page>