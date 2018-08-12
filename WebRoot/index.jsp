<%@page language="java" pageEncoding="UTF-8" import="com.hbjj.websocket.WebSocketMessageServlet,qlight.frames.security.model.AuUserinfo"%>

<%
	AuUserinfo userInfo = (AuUserinfo)session.getAttribute("user");
	String user = null;
	if(userInfo != null){
		 user = userInfo.getUsername();
	}
	if(user == null){
		WebSocketMessageServlet.ONLINE_USER_COUNT ++;
		//为用户生成昵称
		user = "游客" + WebSocketMessageServlet.ONLINE_USER_COUNT;
	}
	//'ws://192.168.1.214:9080/WebSocket/message?user=' + user
	String webSocketPath = "ws://"+request.getServerName()+":"+request.getServerPort() + request.getContextPath()+"/message?user=" + user ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>WebSocket 聊天室</title>
	<!-- 引入CSS文件 -->
	<link rel="stylesheet" type="text/css" href="ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="ext4/shared/example.css" />
	<link rel="stylesheet" type="text/css" href="css/websocket.css" />
	
	<script type="text/javascript">
		var user = '<%=user%>';
		var webSocketPath = '<%=webSocketPath%>';
	</script>
	
	<!-- 映入Ext的JS开发包，及自己实现的webscoket. -->
	<script type="text/javascript" src="ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="websocket.js"></script>
</head>

<body>
	<div id="websocket_button"></div>
</body>
</html>
