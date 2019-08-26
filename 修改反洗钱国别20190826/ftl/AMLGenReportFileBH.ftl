<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额上报文件生成">
<script type='text/javascript' src='${contextPath}/dwr/interface/CreateReportFileService.js'> </script>
		<@CommonQueryMacro.CommonQuery id="AMLGenReportFileBH" init="false" >
			<table align="left"  width="100%">
			    <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%" colNm="6"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="false"/>
                    </td>
                </tr> 
                <tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="brno[120],workDate[120],currentfile[120],reportType[120],noCollNum[120],noReportNum[120],noCheckNum[120],isCheckNum[120],noPackageNum[120],isPackageNum[120],oper[120]" width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">

 	function initCallGetter_post() {
		AMLGenReportFileBH_interface_dataset.setValue("qcurrentfile","BH");
	}

	function datatable1_oper_onRefresh(cell,value,record) {
	var noPackageNum=record.getValue("noPackageNum");
		if(noPackageNum == "0"){
			cell.innerHTML= "<center>生成上报文件</center>";
		}else{
		    var workDate = record.getValue("workDate");
			var reportType = record.getValue("reportType");
			var doDetail = "<a href=\"JavaScript:createFile('"+workDate+"','"+reportType+"')\">生成上报文件</a> ";
		    cell.innerHTML= "<center>"+doDetail+"</center>";
		}
	}
	function createFile(workDate,reportType){
		if(window.confirm('确定要将交易日期为：['+workDate+']报文类型为：['+reportType+']进行打包吗？')){
		   	CreateReportFileService.execGenAMLFile(workDate,"BH",reportType,function(msg){
		   	   alert(msg);
		   	});
		}
	}
</script>
</@CommonQueryMacro.page>
