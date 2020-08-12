<%@ page language="java" contentType="text/html;charset=utf-8" isELIgnored="true" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>凭证信息</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/templets/ui/js/jquery-1.8.2.js"></script>
</head>
<style type="text/css">
    imgs{
       width:150px;
       height:150px;
       margin:0 auto;
       vertical-align:middle;
       border:2px solid green;
       }
    </style>
<body id="body">
	<%
		String proofId = java.net.URLDecoder.decode(request.getParameter("proofId"), "utf-8");
	%>
		<input type="hidden" name="proofId" id="proofId" value="<%=proofId%>">
		<input type="hidden" name="contextPath" id="contextPath" value="<%=request.getContextPath()%>">
		<div id="proofIds">
		</div>
		
		<script type="text/javascript">
			window.onload = function(){
				var html = "<img width='770px' height='705px' align='center' src='"+document.getElementById("contextPath").value+"/proofImport/downloadproof.spring?downloadinfo=proof&proofId="+document.getElementById("proofId").value+"' alt='图片展示失败'/>";
				$("#proofIds").append(html);
			}
			
			function close(){
				alert(11);
				window.opener=null;
			    window.open('','_self');
			    window.close();
			}
		</script>
</body>
</html>