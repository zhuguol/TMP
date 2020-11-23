<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>300号文文件导入</title>
</head>
<style>
body {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica,
		sans-serif;
	color: #4f6b72;
}

#mytable {
	width: 60%;
	padding: 0;
	margin: 0;
}

td {
	padding: 0;
	margin: 0;
	height: 40px;
	border: 1px solid #ccc;
}

tr {
	padding: 0;
	margin: 0;
}
</style>
<body id="body">
	<form
		action="<%=request.getContextPath()%>/batchXLSImport/uploadFilses300.spring"
		enctype="multipart/form-data" name="inputform1" id="inputform1"
		method="post" accept-charset="UTF-8">
		<table id="mytable" cellspacing="0">
			<tr>
				<div id="fileUplodeDiv"></div>  
			</tr>
			<tr>
				<input type="button" value="添加文件" onClick="return uploadFile2();" name="upload2" id="upload2">
				<input type="button" value="上传"     onClick="return uploadFile1();" name="upload1" id="upload1">
				<br>&nbsp;<font color="red">注意：文件名称格式为【CUSTOMER_RISK_RATING_PB_YYYYMM.XLS(XLSX)或
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CUSTOMER_RISK_RATING_GBM_YYYYMM.XLS(XLSX)或
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CUSTOMER_RISK_RATING_CMB_YYYYMM.XLS(XLSX)或
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CUSTOMER_RISK_RATING_RBWM_YYYYMM.XLS(XLSX)】</font>
				<br>&nbsp;<font id="msg" style="display: none" color="blue">正在导入文件,请等待......</font>
				</td>
			</tr>
		</table>
	</form>
	<script language="javascript">
		function uploadFile1() {
			
			var form = document.forms[0];
			if (form.uploadFile.value == "") {
				alert("请至少选择一个文件上传！");
				return false;
			}
			
			//var regex1 = /\.xlsx$/gi;
			//var regex2 = /\$/gi;
			//var regex3 = /\.xls$/gi;
			//var pathName=document.getElementById("uploadFile").value;
			//if (regex3.test(pathName)) {
				//alert("文件类型不正确，请上传xlsx格式的文件！");
				//return false;
			//}
			//else{
			//	alert("文件类型不正确，请上传xlsx格式的文件！");
			//	return false;
			//}

			if (confirm('确定导入文件吗?')) {
				document.getElementById("inputform1").submit();
				document.getElementById("fileUplodeDiv").disabled = "disabled";
				document.getElementById("upload2").disabled = "disabled";
				document.getElementById("upload1").disabled = "disabled";
				document.getElementById("msg").style.display = "";
				return true;
			} else {
				return false;
			}
		}
		
		var i = 1;
		function uploadFile2() {
			var dvID ="fileUplodeDiv";
			var inputNamePrefix ="uploadFile";
			var dv = document.getElementById(dvID);
			//var font =  document.createElement("font");
			//font.color="red";
			//font.innerText = "文件格式为*.xlsx或*.txt:";
			//dv.appendChild(font);
			var file = document.createElement("input");
			file.type = "file";
			file.id = file.name = inputNamePrefix;
			file.size="100";
			dv.appendChild(file);
			var btn =  document.createElement("input");
			btn.type = "button";
			btn.id = btn.name = "btn"+i;
			btn.value = "删除" ;
			btn.onclick = function() {
				var b = document.getElementById(btn.id);
				dv.removeChild(b.nextSibling); //remove <BR>
				dv.removeChild(b.previousSibling); //file
				dv.removeChild(b); //btn
			}
			dv.appendChild(btn);
			dv.appendChild(document.createElement("BR"));
			i++;
		}
		

	</script>
</body>
</html>