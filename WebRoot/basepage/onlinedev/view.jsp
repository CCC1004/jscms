<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
   
    <title>页面配置源码</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!--  
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shCore.js"></script>
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shBrushJScript.js"></script>
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shBrushXml.js"></script>
	<link type="text/css" rel="stylesheet" href="Components/syntaxhighlighter/styles/shCoreDefault.css"/>
	<script type="text/javascript">SyntaxHighlighter.all();</script>-->

  </head>
  
  <body style="background: white; font-family: Helvetica">
  	<input id="err" value="<s:property value="messageErr"/>"/>
  	<script type="text/javascript">
  		var ev = document.getElementById("err").value;
  		if(ev!='') {
  			alert("保存失败");
  			window.parent.createDiv(ev);
  		}else{
  			alert("保存成功");
  		}
  		
  		
  	</script>
  </body>
</html>
