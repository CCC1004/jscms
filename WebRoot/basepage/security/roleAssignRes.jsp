<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>角色权限分配</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="STYLESHEET" type="text/css" href="basepage/css/BaseCommon.css">
	<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  	
	<link rel="STYLESHEET" type="text/css" href="Components/DhtmlTree/css/dhtmlXTree.css"> 

	<script  src="Components/DhtmlTree/js/dhtmlXCommon.js"></script>
	<script  src="Components/DhtmlTree/js/dhtmlXTree.js"></script>		
	<script  src="Components/DhtmlTree/js/dhtmlXTreeExtend.js"></script>
	
	<script language="java" type="text/javascript">
		var tree;
		function save()
		{
			str=tree.getAllChecked();
			RoleForm.RoleResIdData.value=str;
			RoleForm.submit();
		}
		
		function selall(type){
			tree.setSubChecked('0',type);
		}
	</script>

  </head>
  
  <body topmargin="5">
  <form name="RoleForm" action="modifyResourceTree.qact" method="post">
  	<input name="RoleId" type="hidden" value="${roleId}">
  	<input name="RoleResIdData" type="hidden">
  </form>
   	<table border="0" width="100%" height="90%" cellpadding="0" cellspacing="0" class="normalformTb_s" >
		<tr height="20">
			<td colspan="2">
				<table class="titleTable">
					<tr>
						<td class="title">
							角色权限分配
						</td>
					</tr>
				</table>											
			</td>
		</tr>   	
  		<tr height="35">
  			<td colspan="2"> 角色名称：<input name="RoleName" type="text" ID="RoleName" size="17"  value="${roleName}" style="background-color: #eeeeee;" readonly></td>
  		</tr>
  		<tr height="20">
  			<td colspan="2">该角色所拥有的资源：（已勾选资源既是角色所拥有资源）
  				<input type="button"  class="Btn" name="Submit" value="全选" onClick="selall(1);">
  				<input type="button"  class="Btn" name="Submit" value="全不选" onClick="selall(0);">			
  			</td>
  		</tr>
  		<tr>
  			<td width=5></td>
  			<td>
			    <div id="tree_DIV" style="width:80%; height:100%;background-color:#fbfbfb;border :1px solid Silver;; overflow:auto;"></div>  			
  			</td>
  		</tr> 		
  	</table>
  	<table>
  		<tr height="30">
  			<td colspan="2">
				<input type="button"  class="Btn" name="Submit" value="确 定" onClick="save();">
				&nbsp;&nbsp;
				<input type="button" name="返 回"  class="Btn" value="取 消" ONCLICK="JAVASCRIPT:history.back();">  			
  			</td>
  		</tr>   	
  	</table>
<xml id="treeXML">
${strXML}
</xml>
    <script>

		    
		tree=new dhtmlXTreeObject("tree_DIV","100%","100%",0);
		tree.setImagePath("Components/DhtmlTree/imgs/");
		tree.enableCheckBoxes(1);
		//tree.enableThreeStateCheckboxes(true);
		tree.setOnCheckHandler(onStateChange);
		tree.loadXMLString(document.all.treeXML.innerHTML);
		tree.openAllItems();
		tree.setOnDblClickHandler(dbClick)
		
		function dbClick(id){
			tree.setSubChecked(id,1);
			onStateChange(id);
		}
		
		function onStateChange(id){
			if(tree.isItemChecked(id))
			{
				var p=tree.getParentId(id);
				while(p!=0){
					tree.setCheck(p,1);
					p=tree.getParentId(p);
				}
			}
			else{
				tree.setSubChecked(id,0);
			}
		}			

		
    </script>   	
  </body>
</html>
