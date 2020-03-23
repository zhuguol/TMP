<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="黑名单交易下载">
	<@CommonQueryMacro.CommonQuery id="CBlackTransDownload" init="false" submitMode="all" navigate="false" >
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
					<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="downLoadBN" fieldStr="etlDate[100],sid[150],uid[150],retName[200],dataType[200],batchTime[150],ccpdt[130],cdlno[130],ccpws[150],cpimg[175],cpims[170],cob,cpnm,cpad,cpac,cbnm,cbad,cbac,cnr,cftag,ctxtf,isBibtcpp,isMerge,cmid,gmab[150],recId,dataDate,csnm[150],ctnm[200],citp[200],ctid[200],aoitp[200],ctnt[100],ctvc[200],cctl,cbct,ocbt[200],cbcn[200],htdt,crcd[200],finn[200],firc[200],rltp[200],fict[200],finc[200],rlfc[200],catp[200],ctac[200],oatm[200],tbnm[200],tbit[200],tbid[200],boitp[200],tbnt,tstm,ticd,rpmt,rpmn,tstp,octt,ooct,ocec,bptc,tsct,tsdr,tdrc,trcd,trcdsuffix,crpp,crtp,crat,teaAmountCny,teaAmountUsd[100],cfin[200],cfct[200],cfic[200],cfrc,cfrcsuffix,tcnm[200],tcit[200],tcid[200],coitp[200],tcat[200],tcac[200],citpdesc[200],catm[200],bitpdesc[200],crsp[200],tictdesc[100]"   width="100%"  readonly="true"/>
		      	</td>
		    </tr>		    	
		</table>
	</@CommonQueryMacro.CommonQuery>

<script language="JavaScript">
	var sysTxdate = ${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()?string("yyyyMMdd")};   
	
	//工作日期
	function initCallGetter_post() {
		CBlackTransDownload_interface_dataset.setValue("etlDateStart",sysTxdate);
		CBlackTransDownload_interface_dataset.setValue("etlDateEnd",sysTxdate);
	}
	var qtableName="CBlackTransDownloadRet";
	
	//下载
	function downLoadBN_onClick(){
		var etlDateStart = CBlackTransDownload_interface_dataset.getString("etlDateStart");
		var etlDateEnd = CBlackTransDownload_interface_dataset.getString("etlDateEnd");
		if(etlDateStart==''){
			alert("请选择批处理起始日期");
			return false;
		}
	    if(etlDateEnd==''){
			alert("请选择批处理终止日期");
			return false;
		}
	    document.getElementById("downLoadBN").style.display = "none";
		createTimerIfNull();
		window.location.href = "${contextPath}/filedownload/CBlackListUploadDownloadAction.do?etlDateStart="+etlDateStart+"&etlDateEnd="+etlDateEnd+"&qtableName="+qtableName;
	}

	//旋转
	var timer = null;
	function createTimerIfNull(){
		if(timer==null){
			timer = window.setInterval(function(){
			try{
				getExportStatus();
			}catch(e){}},500);//刷新时间 
		}
	}
	
	function getExportStatus(){
		PrivAction.getExportFlag(qtableName,function(data){
			exportCallBack(data);
		});
	}
		
	function exportCallBack(data){
		if(data!=null){
			document.getElementById("downLoadBN").style.display = "";
			if(timer!=null){
				window.clearInterval(timer);
				timer=null;
			}
		}
	}
</script>
</@CommonQueryMacro.page>