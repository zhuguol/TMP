<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/blue/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/icon.css">
	
<title>模板信息</title>
<%!String id = "";
String fileEName = "";
String fileCName = "";
String status = "";
String fileType = "";
String type = "";
String upDepartment = "";%>


<%	
			type = request.getParameter("type");
			if(type!=null){
	
				if("mod".equals(type)||"del".equals(type)){
					id = request.getParameter("id");
					fileEName = request.getParameter("fileEName");
					fileCName = java.net.URLDecoder.decode(request.getParameter("fileCName"), "utf-8");
					status = request.getParameter("status");
					fileType = request.getParameter("fileType");
					upDepartment = request.getParameter("upDepartment");
				}
			}else{
	%>
<%
			if((String)request.getAttribute("info")!=null){
				if ((String)request.getAttribute("info") == "success") { 
					id = "";
					fileEName = "";
					fileCName = "";
					status = "1";
					fileType = "";
					type = "";
					upDepartment = "";
				%>
				    <script>
				    	alert("${msg}");
				    	window.location="<%=request.getContextPath()%>/fpages/export/ftl/MouldDownLoad.ftl";
				    </script>
				<%}else{
					fileEName = (String)request.getAttribute("fileEName");
					fileCName = (String)request.getAttribute("fileCName");
					status = (String)request.getAttribute("status");
					fileType = (String)request.getAttribute("fileType");
					type = (String)request.getAttribute("type");
					upDepartment = (String)request.getAttribute("upDepartment");
					if(!"new".equals(type)){
						id = (String)request.getAttribute("id");
					}
				%>
				 	<script>
				 	alert("${msg}");
				    </script>
	<%      	}
			}
	}%>
</head>
<style>
body {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica,
		sans-serif;
	color: #4f6b72;
}

#mytable {
	width: 100%;
	padding: 0;
	margin: 0;
	border-collapse:collapse;
	border:0px solid blue;
}

td {
	padding: 10px;
	margin: 0;
/* 	height: 20px; */
	border: 0px solid #ccc;
 	table-layout:fixed;
}

tr {
	padding: 0;
	margin: 0;
}

.mytxt {
    color:#333;
    line-height:normal;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
   /*  padding-top:4px;
    padding-right:4px;
    padding-bottom:4px;
    padding-left:4px; */
    font-size:12px;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border-top-left-radius:3px;
    border-top-right-radius:3px;
    border-bottom-left-radius:3px;
    border-bottom-right-radius:3px;
    text-shadow:0px 1px 2px #fff;
    background-attachment:scroll;
    background-repeat:no-repeat;
    background-position-x:right;
    background-position-y:top;
    background-size:auto;
    background-origin:padding-box;
    background-clip:border-box;
    background-color:rgb(255,255,255);
    margin-right:0px;
    border-top-color:#ccc;
    border-right-color:#ccc;
    border-bottom-color:#ccc;
    border-left-color:#ccc;
    border-top-width:1px;
    border-right-width:1px;
    border-bottom-width:1px;
    border-left-width:1px;
    border-top-style:solid;
    border-right-style:solid;
    border-bottom-style:solid;
    border-left-style:solid;
}

.mytxt:focus {
     border: 1px solid #fafafa;
    -webkit-box-shadow: 0px 0px 6px #007eff;
     -moz-box-shadow: 0px 0px 5px #007eff;
     box-shadow: 0px 0px 5px #007eff;   
    
}

#mybutton{ 
    border:1px solid #ccc; 
    background:#18b3cf; 
    color:#000; 
    padding:1px 14px;
    height:25px;
    position:relative;
}


</style>
<script language="javascript">
	function btnSave(){
		var fileCNameStr = document.getElementById("fileCNames").value;
		var statusStr = document.getElementById("statuss").value;
		var typeStr = document.getElementById("types").value;
		var upDepartmentStr = document.getElementById("upDepartments").value;
		if(typeStr==null || typeStr==""){
			alert("操作类型为空！");
			return false;
		}
		if(fileCNameStr==null || fileCNameStr==""){
			alert("请输入文件中文名！");
			return false;
		}else{
			if(fileCNameStr.replace(/[^\x00-\xff]/g, "***").length>64){  //中文和中文符号转为3个字符
			   	alert("文件中文名过长，请修改！");
			   	return false;
		   	}
		}
		if(statusStr==null || statusStr==""){
			alert("请选择文件是否有效！");
			return false;
		}
		var form = document.forms[0];
		if (typeStr!="del" && form.uploadFile.value == "") {
			alert("请至少选择一个文件上传！");
			return false;
		}
		if(typeStr!="del"){
			if (confirm('确定导入文件吗?')) {
				document.getElementById("inputform1").submit();
				return true;
			}
		}else{
			if (confirm('确定删除文件吗?')) {
				document.getElementById("inputform1").submit();
				return true;
			}
		}
	}
		
	function btnClose(){
		window.location="<%=request.getContextPath()%>/fpages/export/ftl/MouldDownLoad.ftl";
	}

</script>

<body id="body">
	<form
		action="<%=request.getContextPath()%>/mouldDownLoads/uploadMould.spring"
		enctype="multipart/form-data" name="inputform1" id="inputform1"
		method="post" accept-charset="UTF-8">
		<table id="mytable" class="grouptable" width="100%" cellspacing="0">
			<tr>
				<input type="hidden" id="ids" name="ids" value="<%=id%>" />
				<input type="hidden" id="types" name="types" value="<%=type%>" />
			</tr>
			<tr>
				<td class="labeltd" align="right">文件英文名:</td>
				<td align="left" class="datatd">
					<input type="text" placeholder="请输入文件英文名" id="fileENames" name="fileENames" maxlength="64" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" class="mytxt" value="<%=fileEName%>" />
				</td>
				<td align="right" class="labeltd">文件中文名:<span style="color:red;float:right">*</span></td>
				<td align="left" class="datatd">
					<input type="text" placeholder="请输入文件中文名" id="fileCNames" name="fileCNames" maxlength="64" style="width: 64%;border: 1px solid #E5E5E5; height: 17px" class="mytxt" value="<%=fileCName%>" />
				</td>
			</tr>
			<tr>
				<td align="right" class="labeltd">是否有效:<span style="color:red;float:right">*</span></td>
				<td align="left" class="datatd">
					<select name="statuss" id="statuss" class="mytxt Wdate" type="select" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" value="<%=status%>" />
						<option value="1">1-有效</option>
						<option value="2">2-无效</option>
    				</select>
				</td>
				<td align="right" class="labeltd">文件类型:</td>
				<td align="left" class="datatd">
					<input name="fileTypes" placeholder="请输入文件类型" id="fileTypes" type="text" class="mytxt" style="width: 64%; height: 17px" value="<%=fileType%>" />
				</td>
			</tr>
			
			<tr>
				<td align="right" class="labeltd">文件类型:</td>
				<td align="left" class="datatd">
					<input name="upDepartments" placeholder="请输入上传部门" id="upDepartments" type="text" class="mytxt" style="width: 100%; height: 17px" value="<%=upDepartment%>" />
				</td>
			<% if(!"del".equals(type)){ %>
				<td id="uploadFile.title" align="right" class="labeltd">上传文件:<span style="color:red;float:right">*</span></td>
				<td colspan='4' id="fileUpLoad">
					<input type="file" name="uploadFile" id="uploadFile" style="width: 75%;"/>
				</td>
			<%} %>
			</tr>
			
			<tr>
				<td colspan="4" align="center" class="labeltd">
					<a extra="button" type="button" id="btSave" resultdataset="" plain="false" onclick="return btnSave();"submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text ">确认</span></span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a extra="button" type="button" id="btClose" resultdataset="" plain="false" onclick="btnClose();"submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text ">取消</span></span></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>