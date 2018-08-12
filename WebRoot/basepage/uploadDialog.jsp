<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css"href="<%=path %>/Components/ExtJS/resources/css/ext-all.css" />
	<script type='text/javascript' src='<%=path %>/Components/ExtJS/adapter/ext/ext-base.js'></script>
	<script type='text/javascript' src='<%=path %>/Components/ExtJS/ext-all-debug.js'></script>
	<script type='text/javascript' src='<%=path %>/Components/ExtJS/ext-lang-zh_CN.js'></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/Components/ExtJS/plugin/UploadDialog/css/Ext.ux.UploadDialog.css">
	<script type="text/javascript" src="<%=path %>/Components/ExtJS/plugin/UploadDialog/Ext.ux.UploadDialog.js"></script>
  </head>
  <script type="text/javascript">
  	Ext.BLANK_IMAGE_URL = 'Components/ExtJS/resources/images/default/s.gif';
  	Ext.onReady(
  		function(){
  			var dialog = new Ext.ux.UploadDialog.Dialog({
	  			url: '<%=path %>/upload.qact?fileGroup='+'${param.group}',
	  			reset_on_hide: true,
	  			allow_close_on_upload: true,
	  			upload_autostart: false,
	  			groupId:'${param.group}'
			});
			//dialog.show('show-button');
			dialog.show();
  		}
  	)
  </script>
  <body>
  </body>
</html>
