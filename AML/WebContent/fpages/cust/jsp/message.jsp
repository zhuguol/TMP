<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<%@page import="com.huateng.ebank.business.common.MessageResourceUtil"%>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/templets/ui/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/templets/ui/js/uirender-min.js"></script>
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
}
tr{
padding: 0; 
margin: 0; 
}

</style> 

  <body >
  	
	
	<table id="mytable">
		<tr>
			<td align="left" bgcolor="ECF1F4">
				<span>
				<font class="gray">
				<% 
		 			List errorList = (List)request.getAttribute("errors");
	   				if(errorList == null || errorList.isEmpty()) {
	   	 		%>
					Success!
				<%
   					}else{
   				%>
   				信息:</font>
				</span></td>
		</tr>
		<tr>
			<td class="listcenter_right">
			 	<ul>
   				<%
	   				for(int i = 0; i < errorList.size(); i++){
				%>
	   	 		<li>
				<%=errorList.get(i).toString()%>
				<%}
   				}
   				%>
   				</ul>
			</td>
		</tr>
		<tr>
			<td class="listcenter_right">
				<a extra="button" type="button" id="btSave" resultdataset="" plain="false" href="javascript:void(0);"   onClick="javascript:parent.closetab()" submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"> 
				<!-- <a extra="button" type="button" id="btSave" resultdataset="" plain="false" href="javascript:history.go(-1);"  submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true">-->
					<span class="l-btn-left">
						<span class="l-btn-text ">返回</span>
					</span>
				</a>
			</td>
		</tr>
	</table>
  </body>
  
  <script type="text/javascript">
  	window.onbeforeunload = function(){
		window.parent.flushPage();
	}
	function goHistory(p){
		window.setTimeout("historyA",3000,p);
	}
	function historyA(p){
		history.go(p);
	}
	function closeWindow(){
		window.parent.closeSubWin("pageWinId1");	
	}
	</script>
</html>
