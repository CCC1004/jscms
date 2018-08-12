<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日志详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css">
	<link rel="stylesheet" type="text/css" href="basepage/css/form.css">
	
  </head>
  
  <body style="margin-top: 5px;">
  	<table style="width:100%;height:95%;" border="0" align="center" cellpadding="0" cellspacing="0"  class="normalformTb" >
    
		<tr height=25>
			<td colspan="4">
				<table class="titleTable">
					<tr>
						<td class="title">
							日志详细信息
						</td>
					</tr>
				</table>											
			</td>
		</tr>    
    	<tr height=25>
    		<td width=70>记录时间:</td><td colspan="3"><s:text name="global.datetime"><s:param value="model.theDatetime"></s:param></s:text>
    		
    		</td>
    	</tr>
    	<tr height=25>
    		<td>日志级别:</td><td>${model.prio}&nbsp;</td>
    		<td >用户:</td><td>${model.userid}&nbsp;</td>
    	</tr>    	
    	<tr height=25>
    		<td >类名:</td><td >${model.cat}&nbsp;</td>
    		<td >线程:</td><td >${model.thread}&nbsp;</td>
    	</tr>
    	<tr height=50>
    		<td >日志信息:</td><td colspan="3">${model.msg}&nbsp;</td>
    	</tr>  
    	<tr>
    		<td >详细内容:</td><td colspan="3"> 
    		<textarea name="model.throwable" style="width:100%;height:100%;" readonly="readonly">${model.throwable }</textarea>
    		</td>
    	</tr>     	  	
    </table>
    <input type="button" class="listview-bBtn" value=" 返 回 "  onclick="javascript:history.back(-1);"/>
  </body>
</html>
