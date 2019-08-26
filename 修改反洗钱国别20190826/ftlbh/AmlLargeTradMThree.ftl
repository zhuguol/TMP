<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="大额交易月统计报表">
		<@CommonQueryMacro.CommonQuery id="AmlLargeTradMThree" init="false" submitMode="all" navigate="false" >
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
						<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="" fieldStr="brNo,lstDate[100],branchNo[300],webCode[280],webName[220],ltradReportType[150],tradCnt[100],custCnt[100],crtp[150],tradAmount[120]"  height="500"  width="100%"  readonly="true"/>
		      		</td>
		    	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>

	<script language="JavaScript">

	</script>
</@CommonQueryMacro.page>