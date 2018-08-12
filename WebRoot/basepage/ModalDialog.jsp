<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html style="height:100%;">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>对话框</title>

</head>

 

<body style="height:100%;margin: 0px;overflow: auto;padding: 0px">

<iframe frameborder="0"  width="100%" height="98%" name="mainFrame" id="mainFrame" onload="init()" style="margin: 0px;padding: 0px"></iframe>
<script language="JavaScript" type="text/javascript">
function init()
{
	//alert(document.body.clientHeight);
	//document.all.mainFrame.height=document.body.clientHeight;
	document.title=document.frames["mainFrame"].document.title;
}
var a=window.dialogArguments;
window.mainFrame.location="<%=basePath%>"+a;

//document.all.mainFrame.style.display="";

</script>
</body>

</html>


