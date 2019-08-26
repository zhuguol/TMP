<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="全量交易信息">
<#assign reportId=RequestParameters["reportId"]?default("")>
<#assign workDate=RequestParameters["workDate"]?default("")>
<table align="left">
    <tr>
        <td>
            <@CommonQueryMacro.CommonQuery id="AmlTradInfoAll" init="false" submitMode="current">
            <table width="100%">
                <tr>
                    <td colspan="2" valign="top">
                    <@CommonQueryMacro.Interface id="interface" label="请输入查询条件"  width="100%"/>
                    </td>
                </tr>
                <tr>
                    <td>
                    <@CommonQueryMacro.PagePilot id="pagePilot" maxpagelink="9" showArrow="true" pageCache="false"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <@CommonQueryMacro.DataTable id="datatable" paginationbar="btConfirm" fieldStr="select,workDate,ticd[200],ctnm[200],citp[200],citpDesc[250],ctid[120],ctac[120],bknm[120],bitp[200],bitpDesc[200],bkid[200],bknt[200],tstm[200],trcd[200],trcdSuffix[200],tstp[230],tsct[200],tsdr[80],crsp[250],crtp[150],crat[80],cfin[200],cfct[200],cfic[150],cfrc[200],cfrcSuffix[250],tcnm[120],tcit[200],tcitDesc[200],tcid[150],tcat[250],tcac[150]" width="100%" />
                    </td>
                </tr>
            </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
</table>
<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	var reportId = "${reportId}";
	var workDate = "${workDate}";
	
	//工作日期
	function initCallGetter_post() {
		AmlTradInfoAll_interface_dataset.setValue("qworkDateStart",workDate);
		AmlTradInfoAll_interface_dataset.setValue("qworkDateEnd",workDate);
	}
	 //确认勾选
	function btConfirm_onClickCheck(button){
			var record = AmlTradInfoAll_dataset.firstUnit;
			var chk=0;
			var recIds = "";
			var flag = false;
			while(record){
				var temp = record.getValue("select");
				if(temp){
			        recIds+=record.getValue("id");
			        recIds+="|";
					chk++;
				}
				record=record.nextUnit;
			}
			if(chk==0){
				alert("请至少选择一条客户记录！");
				return false;
			}
			doConfirm(recIds,reportId,workDate);
	   }
	   
	   	function doConfirm(ids){
			PrivAction.getBSTrans(ids,reportId,workDate,function(mgs){
				alert(mgs);
				closeWin(true);
			});
		}
	
</script>
</@CommonQueryMacro.page>