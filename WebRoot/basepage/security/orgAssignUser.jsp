<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html style="height:100%;">
<head >
	<base href="<%=basePath%>"/>
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
		function init(){
			tree_from=new dhtmlXTreeObject("tree_from","100%","100%","-1root_");
			tree_from.setImagePath("Components/DhtmlTree/imgs/");
			tree_from.loadXML("orgXml.qact",
					function(){
						var tmp = tree_from.getAllSubItems("-1root_");
						if(tmp != ""){						
							var defalut = tmp.split(",");
							if(defalut.length > 1){
								form1.horgid.value=defalut[0];
								tree_from.selectItem(defalut[0]);
								document.getElementById('userList').src="au_user_orgListView-2.qact?orgId="+defalut[0];
							}else{
								tree_from.selectItem(tmp);
								form1.horgid.value=tmp;
								document.getElementById('userList').src="au_user_orgListView-2.qact?orgId="+tmp;
								//document.all.userList.src="au_user_orgListView-2.qact?orgId="+tmp;
							}
							
						}
						
					}
					);
			tree_from.setXMLAutoLoading("orgXml.qact"); 
			tree_from.setOnClickHandler(function(id){
				form1.horgid.value=id;
				document.getElementById('userList').src="au_user_orgListView-2.qact?orgId="+id;
				});
		}
	</script>
</head>
<body style="height:100%;width:100%;overflow: hidden;margin: 0px;" onload="init();">
<table width="100%" height="100%" border="0">
	<tr height="20">
		<td width="30%" >
			<b>&nbsp;组织机构列表</b>
		</td>
		<td width="70%"  >
			<b>&nbsp;用户列表</b>
		</td>
	</tr>
	<tr>
		<td width="30%" >
			<form name="form1">
				<input name="horgid" type="hidden" value="" />
			</form>
			
			<div id="tree_from" style="height:99%;background-color:#fbfbfb;border :1px solid Silver;; overflow:auto;"></div>
		</td>
		<td width="70%" >
			<iframe name="userList" id="userList" src="" width="100%" height="100%"  frameborder="0" >
			</iframe>
		</td>
	</tr>
</table>
</body>
</html>