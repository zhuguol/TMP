<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易任务状态管理">
		<@CommonQueryMacro.CommonQuery id="AmlBHDsStatus" init="false" submitMode="all" navigate="false" >
			<table align="left"  width="80%">
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="ricd[120],workDate[120],allNum[120],isPackageNum[120],noCollNum[120],noReportNum[120],noPackageNum[120],otherNum[120]"   width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		function initCallGetter_post() {
			AmlBHDsStatus_interface_dataset.setValue("qworkDateStart",sysTxdate);
			AmlBHDsStatus_interface_dataset.setValue("qworkDateEnd",sysTxdate);
		}

	</script>
</@CommonQueryMacro.page>