<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/EncryptAction.js'> </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/blue/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/icon.css">
<title>ARK加密</title>
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
    var btnSave = function (){
		var plainData = document.getElementById("plainDataBefore").value;
		if(plainData==null || plainData==""){
			alert("加密前信息为空！");
			return false;
		}
		dwr.engine.setAsync(false);
		EncryptAction.getEncryptString(plainData,function(data){
			document.getElementById("plainDataAfter").value = data;
		});
		dwr.engine.setAsync(true);
	}
	
</script>

<body id="body">
	<form
		action="#" enctype="multipart/form-data" name="inputform1" id="inputform1"
		method="post" accept-charset="UTF-8">
		<table id="mytable" class="grouptable" width="100%" cellspacing="0">
			<tr>
				<td class="labeltd" align="right">加密前:</td>
				<td align="left" class="datatd">
					<input type="textarea" placeholder="请输入加密信息" id="plainDataBefore" name="plainDataBefore" maxlength="" style="width: 70%;border: 1px solid #E5E5E5; height: 35px" class="mytxt" />
				</td>
			</tr>
			<tr>
				<td align="right" class="labeltd">加密后:<span style="color:red;float:right">*</span></td>
				<td align="left" class="datatd">
					<input type="textarea" placeholder="" id="plainDataAfter" name="plainDataAfter" maxlength="" style="width:70%;border: 1px solid #E5E5E5; height: 35px" class="mytxt" />
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" class="labeltd">
					<a extra="button" type="button" id="btSave" resultdataset="" plain="false" onclick="btnSave();"submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text">生成加密</span></span></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>