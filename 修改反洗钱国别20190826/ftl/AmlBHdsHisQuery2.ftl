<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易查询">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsHisQuery2" init="false" submitMode="all" navigate="false" >
			<table align="left"  width="100%">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface" label="请输入查询条件" colNm="8"/>
					</td>
				</tr>

				<tr>
					<td valign="top">
						<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
					</td>
		    	</tr>

		    	<tr>
		    		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="-,btSubmit" fieldStr="select,ticd[200],recStatus,repStatus,isComp,sourceType,crcd[120],reportType,brNo,brNoName[260],workDate,ctnm[200],ctid[200],csnm,ctnt[200]"   width="100%"  height="480"  hasFrame="true"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		function initCallGetter_post() {
			AmlBHdsHisQuery2_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHdsHisQuery2_interface_dataset.setValue("qworkDateEnd",sysTxdate);
			AmlBHdsHisQuery2_interface_dataset.setValue("qrecStatus","06");
		}
		
		//交易标识号链接
		function datatable1_ticd_onRefresh(cell,value,record) {
			if (record) {//当存在记录时
				var id = record.getValue("id");
				var ticd = record.getValue("ticd");
				cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + ticd + "</a>"
			} else {
				cell.innerHTML="&nbsp;";
			}
		}
		
		//链接查看详细信息
		function doDetail(id){
			showWin("大额交易信息管理明细","/fpages/hf/ftl/AmlBHdsHisAdd2.ftl?id=" + id + "&op=detail","window","flushPage()",window);
		}
		
		
		//确认提交
		function btSubmit_onClickCheck(button){
			var record = AmlBHdsHisQuery2_dataset.firstUnit;
			var chk=0;
			while(record){
				var temp = record.getValue("select");
				if(temp){
					chk++;
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请选择要提交的记录！");
				return false;
			}else{
			  	return true;
			}
	    }
	    
	    function btSubmit_postSubmit(button){
	    	var retParam = button.returnParam;
	    	alert("操作成功！"+retParam.msg+"!");
	    	AmlBHdsHisQuery2_dataset.flushData(AmlBHdsHisQuery2_dataset.pageIndex);
	    }
			    
	    //刷新数据
		function flushPage(){
			AmlBHdsHisQuery2_dataset.flushData(AmlBHdsHisQuery2_dataset.pageIndex);
		}
	</script>
</@CommonQueryMacro.page>