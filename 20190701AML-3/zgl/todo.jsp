<%@page import="resources.bean.report.form.ViHomePageTodo"%>
<%@page import="resources.bean.report.form.ViHomePageTodo02"%>
<%@page import="resources.bean.report.form.ViHomePageTodo03"%>
<%@page import="java.lang.*"%>
<%@page import="com.huateng.report.common.service.ReportCommonService"%>
<%@page import="com.huateng.report.hfaml3.utils.HfAml3Utils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/easyui/themes/blue/easyui.css">
<title>待办业务</title>
<%
	String v_rolePowerName = HfAml3Utils.getPowerByUserId();
	List list1 = null;
	List list2 = null;
	List list3 = null;
	if(v_rolePowerName.indexOf("BS")!=0){
		list1 = ReportCommonService.getInstance().getUndoTask1(session);
		list2 = ReportCommonService.getInstance().getUndoTask2(session);
		list3 = ReportCommonService.getInstance().getUndoTask3(session);	
	}else{
		list1 = new ArrayList();
		list2 = new ArrayList();
		list3 = new ArrayList();
	}
%>

</head>
<body bgcolor="white" style="margin: 0px;">
	<center>
		<div style="padding: 3px;">
		 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>操作员待办</b></font></span></p>
			<table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
					
					<tr>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报文类型</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待补录</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待上报</b></font></td>
					</tr>
				<%
					if (list1 != null && list1.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list1.size(); i++) {
							ViHomePageTodo bean = (ViHomePageTodo) list1.get(i);
							if ("1".equals(bean.getT5Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportType()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getBlNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getSbNum()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			 <br>  
        	 <br>  
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>部门待办</b></font></span></p>
			<table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报文类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待补录</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待上报</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待打包</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>已打包</b></font></td>
				</tr>
				<%
					if (list2 != null && list2.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list2.size(); i++) {
							ViHomePageTodo02 bean = (ViHomePageTodo02) list2.get(i);
							if ("1".equals(bean.getT5Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportType()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getBlNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getSbNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getNoPackageNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getPackageNum()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			 <br>  
        	 <br>  
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>大额交易自查</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list3 != null && list3.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list3.size(); i++) {
							ViHomePageTodo03 bean = (ViHomePageTodo03) list3.get(i);
							if ("1".equals(bean.getT17Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getcNt()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
	</center>
	</div>
<script type="text/javascript">
</script>
</body>
</html>