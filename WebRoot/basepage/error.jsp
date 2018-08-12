<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="qlight.frames.upload.service.impl.UploadServiceImpl"%>
<%@page import="qlight.frames.upload.service.UploadService;"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>错误信息</title>		
		<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" /> 
		<script type="text/javascript">
			var show=0;
			function switchDe()
			{
				if(show==0)
				{
					showDetail();
				}
				else
				{
					hideDetail();
				}
			}
			function showDetail()
			{
				show=1;
				document.getElementById("errorDIV").style.visibility="visible";
				document.getElementById("errorTopDIV").style.visibility="visible";
				
			}
			function hideDetail()
			{
				show=0;
				document.getElementById("errorDIV").style.visibility="hidden";
				document.getElementById("errorTopDIV").style.visibility="hidden";
			}
			
		</script>
		<%
			UploadService uploadService  = new UploadServiceImpl();
			uploadService.delete((String[])request.getAttribute("upForDelPath"));
		%>
	</head>
	<body>
    <s:fielderror></s:fielderror>
    
    <s:if test="%{actionErrors != null || exception != null}">
	<div style="font-size: 14px;font: bold;COLOR:#FF2000;BACKGROUND: #EEEEEE; BORDER: #aaaaaa 1px solid; PADDING:5px;margin:5px;width:400px;height:100px;">
		<img src="basepage/images/error.png"/> ${actionErrors[0]} ${exception.message}
	</div>
    <input type="button" value=" 返 回 " onclick="javascript:history.go(-1)">	
    
    <input type="button" value="错误详细信息" onclick="switchDe();">
    <BR><BR>
	<div id="errorTopDIV" style="font: bold;COLOR:#FF2000;BORDER: #aaaaaa 1px solid;BACKGROUND: #BBBBBB; PADDING-LEFT:5px;PADDING-TOP:3px;width:100%;height:20px;">错误详细信息</div>
	<div class="errBox" id="errorDIV">
		<s:iterator id="error" value="%{actionErrors}">
			<span class="errorMessage">${error}</span><br/><hr>
		</s:iterator>
		${exceptionStack}	
	</div>
	</s:if>    

    <SCRIPT type="text/javascript">
    	hideDetail();
    </SCRIPT>
	</body>
</html>
