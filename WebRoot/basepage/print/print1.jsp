<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'print1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"></object>
  <script type="text/javascript">
  	function userPrint(i,j)
	{
	    document.WebBrowser.Execwb(i,j);//打印预览
	    return false;
	}
	/*
	WebBrowser.ExecWB(1,1) 打开
	WebBrowser.ExecWB(2,1) 关闭现在所有的IE窗口，并打开一个新窗口
	WebBrowser.ExecWB(4,1) 保存网页
	WebBrowser.ExecWB(6,1) 打印
	WebBrowser.ExecWB(7,1) 打印预览
	WebBrowser.ExecWB(8,1) 打印页面设置
	WebBrowser.ExecWB(10,1) 查看页面属性
	WebBrowser.ExecWB(15,1) 好像是撤销，有待确认
	WebBrowser.ExecWB(17,1) 全选
	WebBrowser.ExecWB(22,1) 刷新
	WebBrowser.ExecWB(45,1) 关闭窗体无提示
	*/
  </script>
  </head>
  
  <body>
    This is my JSP page. <br>
    <form action="">
    	<button onclick="return userPrint(7,1)"></button>
    </form>
  </body>
</html>
