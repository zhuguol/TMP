<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易查询">
		<@CommonQueryMacro.CommonQuery id="AmlBHdsHisQuery" init="false" submitMode="all" navigate="false" >
		<script type='text/javascript' src='${contextPath}/dwr/interface/AmlBHdsBakService.js'> </script>
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
						<@CommonQueryMacro.DataTable id ="datatable1"  paginationbar="-,btSubmit,-,ctProportion" fieldStr="select,workDate,roleName,csnm[120],ctnm[240],ticd[240],filler1"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		function initCallGetter_post() {
			AmlBHdsHisQuery_interface_dataset.setValue("qworkDate",sysTxdate);
		}
		
		function btSubmit_postSubmit(button){
		
			var record = AmlBHdsHisQuery_dataset.firstUnit;
			var chk=0;
			var flushDataFlag = true;//是否具有重复提交数据表示
			while(record){
				var temp = record.getValue("select");
				var filler1 = record.getValue("filler1");
				var csnm = record.getValue("csnm");
				var ctnm = record.getValue("ctnm");
				if(filler1 && temp){
					alert("不要重复提交客户号"+csnm+"用户"+ctnm+"下的交易数据 ！");
					flushDataFlag = false;
					break;
				}
				if(temp){
					chk++;
				}				
				record=record.nextUnit;
			}
			if (flushDataFlag){
			
				if(chk==0){
				alert("请选择需提交审核数据！");
				return false;
				}else{
					alert("确认提交成功！");
    				AmlBHdsHisQuery_dataset.flushData(AmlBHdsHisQuery_dataset.pageIndex);
				}
			}else{
				AmlBHdsHisQuery_dataset.flushData(AmlBHdsHisQuery_dataset.pageIndex);
			}
				
    	}
		//计算审核占比
		function ctProportion_onClickCheck(button) {
			var record = AmlBHdsHisQuery_dataset.firstUnit;
			var chk=0;
			var roleNameANDrecIds = "";
			var workdate = "";
			while(record){
				var temp = record.getValue("select");
				if(temp){
				    var csnm = record.getValue("csnm");
				    var roleName = record.getValue("roleName");
				    workdate = record[4];
		            //var v_recStatus = record.getValue("recStatus");
					roleNameANDrecIds+=roleName+"-"+csnm;
			        roleNameANDrecIds+="|";
					chk++;
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请选择需提交审核数据！");
				return false;
			}else{
				updateReport(roleNameANDrecIds,workdate);
			}
		}
		
		function updateReport(roleNameANDrecIds,workdate){
		
			AmlBHdsBakService.calculateRatio(roleNameANDrecIds,workdate,function(mgs){
				alert(mgs);
			});
		}
	</script>
</@CommonQueryMacro.page>