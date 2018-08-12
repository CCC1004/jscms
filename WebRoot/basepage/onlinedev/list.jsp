<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>页面配置列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
			font-size: 12px;
			margin: 0px 0px 0px 0px;
		}
		#tableDiv table {
			border-collapse: collapse;
		}
		
		#tableDiv table td {
			border: solid 1px #cfcfcf;
			line-height: 20px;
			padding: 2px;
		}
		
		#tableDiv table th {
			border: solid 1px #A7A6AA;
			line-height: 20px;
			padding: 4px;
			font-size: 12px;
			color: #777779;
			background: #E6E6E6;
		}
	</style>
	<script type="text/javascript">
		function linkEdit(){
			var ckValues = "";
			var cks = document.getElementsByName("ck");
			for(var i=0;i<cks.length;i++){
				var ckd = cks[i].checked;
				if(ckd){
					ckValues+=cks[i].value;
				}
			}
			parent.window.frames["editXml"].location.href="editPageXml.qact?id="+ckValues;
		}
		function quickHandler(){
			var tn = document.getElementById("tableName");
			var tableObject = document.getElementById("listTable");
			var trows = tableObject.rows;
			for(var i=1;i<trows.length;i++){
				var rcell = trows[i].cells;
				//for(var j=0;j<rcell.length;j++){
					var ctext = rcell[1].innerText;
					if(ctext.replace(/(^\s*)|(\s*$)/g, "").toLowerCase().indexOf(tn.value.toLowerCase())!=-1){
						//rcell[0].select();
						rcell[0].children(0).checked =true;
						rcell[0].scrollIntoView();
						break;
						//alert(rcell[0].innerHTML);
					}
				//}
			}
		}
	</script>
  </head>
  
  <body>

	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td align="right"><span style="font-size:13px;font-weight: 800">表名称:</span></td>
			<td><input type="text" id="tableName"/> <input type="button" value="查询" onclick="quickHandler()"/></td>
			<td align="right"><input type="button" value="修改" onclick="linkEdit()"/></td>
		</tr>
	
	</table>

  	<div id="tableDiv" style="width: 100%;overflow: auto;">
    <table id="listTable" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th>选择</th>
			<th>表配置页面名称</th>
			<th>地址</th>
		</tr>
		<s:iterator value="viewList">
		<tr>
			<td><input type="radio" name="ck" value="<s:property value="id"/>" /></td>
			<td><s:property value="name"/> </td>
			<td><s:property value="xmlPath"/> </td>
		</tr>
		</s:iterator>

	</table>
	</div>
  </body>
</html>
