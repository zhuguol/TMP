<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zqq.bean.ShowBean" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
</head>
<% List<ShowBean> beans = (List<ShowBean>)request.getAttribute("list"); %>
<body>
<div class="container-fluid" style="padding: 20px 20px 20px 20px;">
	<div class="row-fluid" style="padding: 0px 0px 0px 0px;">
		<div class="span12">
			<form id="form" class="form-search" method="post" action="<%=request.getContextPath()%>/analysis/ReceiptAnalysis.spring" enctype="multipart/form-data"
				name="inputform" id="inputform" accept-charset="UTF-8">
					<div class="input-group">
	            <span class="input-group-addon">发送报文</span>
	            <input name="sendFile" type="file" class="form-control" placeholder="选择文件">
	        </div>
	        <br/>
	        <div class="input-group">
	            <span class="input-group-addon">回执文件</span>
	            <input name="recvFile" type="file" class="form-control" placeholder="选择文件">
	        </div>
	        <br/>
	        	<!-- <button class="btn" type="submit" >提交</button> -->
	        <button class="btn" type="button" onclick="return uploadFile1();">提交</button>
			</form> 
		</div>
	</div>
	<br/>
	<div class="row-fluid">
		<div class="span12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							客户号
						</th>
						<th>
							业务标志号
						</th>
						<th>
							错误字段
						</th>
						<th>
							错误描述
						</th>
					</tr>
				</thead>
				<tbody>
				<%if(beans!=null) {%>
				<% for(int i=0;i<beans.size();i++) {%>
					<% ShowBean bean = beans.get(i);%>
					<tr class="info">
						<td>
							<%=bean.getCsnm()%>
						</td>
						<td>
							<%=bean.getTicd()%>
						</td>
						<td>
							<%=bean.getErrfield()%>
						</td>
						<td>
							<%=bean.getErrmsg()%>
						</td>
					</tr>
				<%} }%>
					<!-- 
					<tr class="success"></tr>
					<tr class="error"></tr>
					<tr class="warning"></tr>
					<tr class="info"></tr>
					 -->
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
<script language="javascript">
function uploadFile1() {
	var form = document.forms[0];
	if (form.sendFile.value == "") {
		alert("请选择上传sendFile文件路径！");
		return false;
	}
	
	if (form.recvFile.value == "") {
		alert("请选择上传recvFile文件路径！");
		return false;
	}
	
	document.getElementById("form").submit();
	return true;
}
</script>
</html>