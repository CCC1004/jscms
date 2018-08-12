<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>数据表frame</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
<link rel="stylesheet" type="text/css" href="jsp/style/css.css" />
	<style type="text/css">
			body {
			font-size: 12px;
			margin: 0px 0px 0px 0px;
		}
		table td{
			background-color: #f5f5f5;
		}
	</style>
	<script type="text/javascript">
		window.onresize = autoSize;
		window.onload = autoSize;
		function autoSize(){
		

		  	var cheight=document.documentElement.clientHeight;
		  	var cwidth = document.documentElement.clientWidth;
		  	
		  	if(cheight==0)
		  		cheight=document.body.clientHeight;
		  	if(cwidth==0)
		  		cwidth = document.body.clientWidth;  
  					
			document.getElementById("tableList").height=cheight-3;
			document.getElementById("editXml").height=cheight-3;
			window.frames["tableList"].document.getElementById("tableDiv").style.height=cheight-30;
			//window.frames["editXml"].document.getElementById("tableDiv").style.height=h;
		}
	
	</script>
</head>
<body style="height:100%;padding: 0px;">
<table width="100%" height="100%" border="0" bgcolor="#F5F5F5" cellpadding="0" cellspacing="0">
	<tr>
		<td width="500" height="100%">
			<iframe name="tableList" id="tableList" src="tablePageList.qact" width="100%" height="100%" frameborder="0"  scrolling="no" ></iframe>
		</td>
		<td height="100%" align="left">
			<iframe id="editXml" name="editXml" src="" frameborder="0" scrolling="auto" width="100%" height="100%"/>
		</td>
	</tr>
</table>
</body>
</html>