<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����쳣</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<div style="font-size: 14px;font: bold;COLOR:#FF2000;BACKGROUND: #EEEEEE; BORDER: #aaaaaa 1px solid; PADDING:5px;margin:5px;width:400px;height:100px;">
		<img src="basepage/images/user_error.png"/> ���ĵ�¼�Ѿ���ʱ�������û�������λ�ñ���¼��
        <br>
         <br>
    <a href="basepage/security/login.jsp">����������µ�¼</a>		
	</div>

  </body>
</html>
