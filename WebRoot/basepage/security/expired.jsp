<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>访问异常</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<div style="font-size: 14px;font: bold;COLOR:#FF2000;BACKGROUND: #EEEEEE; BORDER: #aaaaaa 1px solid; PADDING:5px;margin:5px;width:400px;height:100px;">
		<img src="basepage/images/user_error.png"/> 您的登录已经超时或您的用户在其它位置被登录！
        <br>
         <br>
    <a href="basepage/security/login.jsp">点击这里重新登录</a>		
	</div>

  </body>
</html>
