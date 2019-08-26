<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额报文统计报表_日报">
		<@CommonQueryMacro.CommonQuery id="AmlLarMessgeCountDayThree" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="orgNo,tradDate[140],department[300],reportTypeA[100],reportTypeC[100],reportTypeD[100]"  height="500"  width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">
		var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
		//工作日期
		function initCallGetter_post() {
			AmlLarMessgeCountDayThree_interface_dataset.setValue("qtradDate",sysTxdate);
		}

	</script>
</@CommonQueryMacro.page>