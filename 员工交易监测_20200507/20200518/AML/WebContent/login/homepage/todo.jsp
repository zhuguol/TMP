<%@page import="resources.bean.report.form.ViHomePageTodo"%>
<%@page import="resources.bean.report.form.ViHomePageTodo02"%>
<%@page import="resources.bean.report.form.ViHomePageTodo03"%>
<%@page import="resources.bean.report.form.ViHomePageTodo04"%>
<%@page import="resources.bean.report.form.ViHomePageTodo05"%>
<%@page import="resources.bean.report.form.ViHomePageTodo06"%>
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
	boolean[] bool = HfAml3Utils.getPowerByUserId();
	//操作员待办	
	List list1 = null;
	//部门待办
	List list2 = null;
	//大额交易自查
	List list3 = null;
	//可疑交易自查
	List list4 = null;
	//客户交易调研
	List list5 = null;
	//客户交易自查
	List list6 = null;
	
	if(bool[0]){
		list1 = ReportCommonService.getInstance().getUndoTask1(session);
		list2 = ReportCommonService.getInstance().getUndoTask2(session);
	}
	if(bool[1]){
		list3 = ReportCommonService.getInstance().getUndoTask3(session);
	}
	if(bool[2]){
		list4 = ReportCommonService.getInstance().getUndoTask4(session);
	}
	//员工交易调研
	if(bool[3]){
		list5 = ReportCommonService.getInstance().getUndoTask5(session);
	}
	//员工交易自查
	if(bool[4]){
		list6 = ReportCommonService.getInstance().getUndoTask6(session);
	}
	
%>

</head>
<body bgcolor="white" style="margin: 0px;">
	<center>
		<div style="padding: 3px;">
		<% if(bool[0]){ %>
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
					<td colspan="4" align="center" class="datatd">没有需要处理的交易</td>
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
					<td colspan="6" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			 <br>  
        	 <br> 
        	<% } %>
        	<% if(bool[1]){ %>
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
			<br>  
        	 <br>  
        	 <% } %>
        	 <% if(bool[2]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>可疑交易自查</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报送日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list4 != null && list4.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list4.size(); i++) {
							ViHomePageTodo04 bean = (ViHomePageTodo04) list4.get(i);
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
			<% } %>
			
			
			<% if(bool[3]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>操作员待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待调查</b></font></td>
				</tr>
				<%
					if (list5 != null && list5.size() > 0) {
						//String bgcolor = "#FFFF6F";
						String bgcolor = "#ffffff";
						for (int i = 0; i < list5.size(); i++) {
							ViHomePageTodo05 bean = (ViHomePageTodo05) list5.get(i);
							
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getDataDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportDOrM()%></td>
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
			<% } %>
			<% if(bool[4]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>管理员待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list6 != null && list6.size() > 0) {
						//String bgcolor = "#FFFF6F";
						String bgcolor = "#ffffff";
						for (int i = 0; i < list6.size(); i++) {
							ViHomePageTodo06 bean = (ViHomePageTodo06) list6.get(i);
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getDataDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportDOrM()%></td>
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
			<% } %>
	</center>
	</div>
<script type="text/javascript">
</script>
</body>
</html>