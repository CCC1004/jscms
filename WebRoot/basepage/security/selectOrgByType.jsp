<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html style="height:100%;">
<head >
	<title>组织用户分配</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>

	<link rel="STYLESHEET" type="text/css" href="basepage/css/BaseCommon.css"/>
	<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  	
	<link rel="STYLESHEET" type="text/css" href="Components/DhtmlTree/css/dhtmlXTree.css"/> 

	<script  src="Components/DhtmlTree/js/dhtmlXCommon.js"></script>
	<script  src="Components/DhtmlTree/js/dhtmlXTree.js"></script>		
	<script  src="Components/DhtmlTree/js/dhtmlXTreeExtend.js"></script> 
	<script type="text/javascript">
		var tree_from;
		var revalue = {};
		function init(){
			tree_from=new dhtmlXTreeObject("tree_from","100%","100%","-1root_");
			tree_from.setImagePath("Components/DhtmlTree/imgs/");
			tree_from.loadXML("orgXmlByType.qact?type=${param.type}",
					function(){
						
					}
					);
			tree_from.setXMLAutoLoading("orgXmlByType.qact?type=${param.type}"); 
			tree_from.setOnClickHandler(function(id){
				revalue["id"]=id;
				revalue["text"]=tree_from.getItemText(id);
				
			}); 
		}
		function btnOK(){
			if(revalue["id"] == null){
				alert("请选择一个组织！");
				return;
			}
			window.returnValue = revalue;
			window.close();
		}
	</script>
</head>
<body style="height:100%;width:100%;overflow: hidden;margin: 0px;" onload="init();">
<table width="100%" height="100%" border="0">
	<tr height="20">
		<td width="30%" colspan="2">
			<b>&nbsp;组织机构列表</b>
		</td>
	</tr>
	<tr height="100%;">
		<td width="30%"  colspan="2">
			<form name="form1">
				<input name="horgid" type="hidden" value="" />
			</form>
			
			<div id="tree_from" style="height:99%;background-color:#fbfbfb;border :1px solid Silver;; overflow:auto;"></div>
		</td>
	</tr>
	<tr>
		<td align="center"><button onclick="btnOK();" style="width: 50px;">选择</button>　　<button style="width: 50px;" onclick="window.close();">取消</button></td>
	</tr>
</table>
</body>
</html>