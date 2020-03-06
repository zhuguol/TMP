<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="可疑报送抽样调查情况表">
	<@CommonQueryMacro.CommonQuery id="AmlCustInfo" init="false" submitMode="all" navigate="false" >
		<table align="left"  width="100%">
			<tr>
				<td colspan="2">
					<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="4"/>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
				</td>
		    </tr>
		    <tr>
		    	<td colspan="2">
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btnDownLoad,-,btnUpload,-,btFind" fieldStr="custName[200],opr[300],custZjnum[300],custStatus[300]" width="100%" hasFrame="true" readonly="true"/>
		      	</td>
		    </tr>
		</table>
	</@CommonQueryMacro.CommonQuery>

<script language="JavaScript">
	
	//客户编号链接
	function datatable_opr_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
			var ids = record.getValue("custNum");
			if(ids!=""){
				cell.innerHTML = "<a href=\"JavaScript:doDetails('"+ids+"')\">" + ids + "</a>";
			}else{
				cell.innerHTML = "&nbsp;";
			}
		}
	}
	
	//链接查看详细信息
	function doDetails(ids){
		showWin("客户数据明细","/fpages/hf/form/ftl/AmlCustMxInfo.ftl?id="+ids+"&op=detail","window","flushPage()",window);
	}
	
	//刷新数据
	function flushPage(){
		AmlCustInfo_dataset.flushData(AmlCustInfo_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>