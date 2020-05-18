<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="客户参数设置">
<table align="left" width="80%"><tr><td>
<@CommonQueryMacro.CommonQuery id="AStaffSysParams" init="true" submitMode="current">
<table width="100%">
	<tr>
		<td><@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9" showArrow="true" pageCache="false"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id="datatable1" fieldStr="paramgroupId,paramId,paramName[260],paramVal,memo[260],st,operation"  width="100%" hasFrame="true"/>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="600" resize="true" defaultZoom="normal" minimize="false"
			maximize="false" closure="true" float="true" exclusive="true" position="center" show="false">
				<div align="center">
				<@CommonQueryMacro.Group id="group1" fieldStr="paramgroupId,paramId,paramName,paramVal,memo" label="客户参数设置" colNm="4" />
				<br/>
				<@CommonQueryMacro.Button id="btMod" />&nbsp;&nbsp;	<@CommonQueryMacro.Button id="btCancel" />
				<br/><br/>
				</div>
			</@CommonQueryMacro.FloatWindow>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>

</td></tr>
</table>
<script language="JavaScript">
	//系统刷新单元格是触发
	function datatable1_operation_onRefresh(cell,value,record) {
		//记录集存在
		if(record) {
			var paramgroupId = record.getValue("paramgroupId");
			var paramId = record.getValue("paramId");
			//防止类型自动转换，所以传一个值
			var par = "p"+paramgroupId+"p"+paramId+"p";
			var lock=record.getValue("lock");
			if(isTrue(lock)){
				cell.innerHTML = "<center><a href=\"Javascript:void(0);\" style=\"color:#666666\" title=\"记录已锁定，不能操作\">修改</a> </center>";
			}else{
				cell.innerHTML="<center><a href=\"JavaScript:openModifyWindow('"+par+"')\">修改</a></center>";

			}
		}else{
			cell.innerHTML="";
		}


	}
	//展示对比功能的js
	function datatable1_paramgroupid_onRefresh(cell, value, record){
	if(record!=null){
		var st = record.getValue("st");
		var id1 = record.getValue("paramgroupId");
		var id2 = record.getValue("paramId");
		var id = id2+"/"+id1;


		cell.innerHTML = "<a href=\"Javascript:showDetail('"+id+"','"+st+"')\">"+id1+"</a>";

	} else {
		cell.innerHTML = ""
	}
}


function showDetail(id,st){
	var paramMap = new Map();
	paramMap.put("id",id);
	paramMap.put("st",st);
	paramMap.put("flag","0");
	paramMap.put("action","detail");
	loadPageWindows("partWin", "系统参数","/fpages/system/ftl/SysParamsEntryDetail.ftl", paramMap, "winZone");
}




	function openModifyWindow(par) {

		var parArra = par.split("p");
		var paramgroupId = parArra[1];
		var paramId = parArra[2];
		locate(paramgroupId,paramId);
		AStaffSysParams_dataset.setFieldReadOnly("paramgroupId",true);
		AStaffSysParams_dataset.setFieldReadOnly("paramId",true);
		AStaffSysParams_dataset.setFieldReadOnly("paramName",false);
		AStaffSysParams_dataset.setFieldReadOnly("paramVal",false);
		AStaffSysParams_dataset.setFieldReadOnly("memo",false);
		subwindow_signWindow.show();
	}


	//定位一条记录
	function locate(paramgroupId,paramId) {
		var record = AStaffSysParams_dataset.find(["paramgroupId","paramId"],[paramgroupId,paramId]);
		if(record) {
			AStaffSysParams_dataset.setRecord(record);
		}
	}
	function btCancel_onClickCheck(button) {
		//关闭浮动窗口
		subwindow_signWindow.close();
	}
	//关浮动窗口,释放dataset
	function signWindow_floatWindow_beforeClose(subwindow) {
		AStaffSysParams_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow) {
		return signWindow_floatWindow_beforeClose(subwindow);
	}

	//确认按钮并刷新当前页
	function btMod_postSubmit(button) {
	    button.url="#";
		subwindow_signWindow.close();
		alert("客户参数修改成功！");
		AStaffSysParams_dataset.flushData(AStaffSysParams_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>