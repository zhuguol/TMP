<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="GB18030"%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>邮件模板</title>
</head>
<style>
body {
font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
color: #4f6b72;
}
#mytable {
width: 100%;
padding: 0;
margin: 0;
}
td{
padding: 0;
margin: 0;
height:40px;
border:1px solid #ccc;
}
tr{
padding: 0;
margin: 0;

}

</style>
<body id="body">
	<%
		String alertId = java.net.URLDecoder.decode(request.getParameter("alertId"), "utf-8");
		String custName = java.net.URLDecoder.decode(request.getParameter("custName"), "utf-8");
		String staffNumber = java.net.URLDecoder.decode(request.getParameter("staffNumber"), "utf-8");
		String staffJobTitle = java.net.URLDecoder.decode(request.getParameter("staffJobTitle"), "utf-8");
		String managerName = java.net.URLDecoder.decode(request.getParameter("managerName"), "utf-8");
		String invesResultByOps = java.net.URLDecoder.decode(request.getParameter("invesResultByOps"), "utf-8");
	%>
		<table id="mytable" cellspacing="0">
			<tr>
				<td style="width:90%;height:170px;font-size:12px;border:1px solid lightgray;">
				<div style="padding-top:0; padding-right:0; padding-bottom:0; padding-left:0;">
					Subject: Potential misconduct <%=alertId %>.<br/>
					Dear colleague, Here is a potential misconduct case for your investigation by referring the listed information,<br/>
					Staff Name: <%=custName %><br/>
					Staff ID: <%=staffNumber %><br/>
					Job title: <%=staffJobTitle %><br/>
					Line manager Name: <%=managerName %><br/>
					Alerted transaction details : Attachment file of transaction details, such as 当日交易，或当月交易<br/>
					Investigation Result by OPS BOSC RAM: <%=invesResultByOps %><br/>
					It’s to remind replying your investigation result to BOS RAM by the 20th each month for extracting MI.
				</div>
				</td>
			</tr>
		</table>
</body>
</html>