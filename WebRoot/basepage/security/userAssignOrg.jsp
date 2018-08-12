<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户组织分配</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/resources/css/ext-all.css" />
	<link rel="STYLESHEET" type="text/css" href="basepage/css/BaseCommon.css">
	<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  	
	<link rel="STYLESHEET" type="text/css" href="Components/DhtmlTree/css/dhtmlXTree.css"> 

	<script  src="Components/DhtmlTree/js/dhtmlXCommon.js"></script>
	<script  src="Components/DhtmlTree/js/dhtmlXTree.js"></script>		
	<script  src="Components/DhtmlTree/js/dhtmlXTreeExtend.js"></script>
	<script type='text/javascript'
			src='Components/ExtJS/adapter/ext/ext-base.js'></script>
	<script type='text/javascript' src='Components/ExtJS/ext-all.js'></script>
	<script type='text/javascript'
			src='Components/ExtJS/ext-lang-zh_CN.js'></script>  
	<script language="java" type="text/javascript">
		var tree_from;
		var tree_to;
		function save()
		{
			UserForm.orgIds.value=tree_from.getAllChecked();
			UserForm.submit();
		}

		function init(){
			tree_from=new dhtmlXTreeObject("tree_from","100%","100%","-1root_");
			tree_from.setImagePath("Components/DhtmlTree/imgs/");
			tree_from.enableCheckBoxes(1);

			tree_from.loadXML("orgXml.qact?userId="+'${userId}');
			tree_from.setXMLAutoLoading("orgXml.qact"); 
			
			tree_to=new dhtmlXTreeObject("tree_to","100%","100%","-1root_");
			tree_to.setImagePath("Components/DhtmlTree/imgs/");
			tree_to.enableCheckBoxes(1);
			tree_to.loadXML("allUserOrgList.qact?userId="+'${userId}');
		}

		function add(){
			if(tree_from.getAllChecked() == "")
			{
				alert("请选择要增加的组织");
				return;
			}

			Ext.Ajax.request({
			                 url: 'saveOrgByUser.qact',
			                 params: {
								 userId:"${userId}",
								 orgIds:tree_from.getAllChecked()
			                 },
			                 success: function(response, options) {
			                          var responseArray = Ext.util.JSON.decode(response.responseText);                                             
			                          if(responseArray.success=='true'){
			                              ids = tree_from.getAllChecked().split(",");
			                          	  var flag=false;
			                              if(tree_to.getSubItems('-1root_') == ''){
			                               	 flag=true;
			                              }   			                              
			                              for(var i=0;i<ids.length ; i++)
			                              {
			                                if(!tree_to._globalIdStorageFind(ids[i]))
			                                	tree_to.insertNewChild("-1root_",ids[i],tree_from.getItemText(ids[i]));
			                                if(i==0 && flag){
				                             	 var id =tree_to.getChildItemIdByIndex("-1root_",0);
					                              text = tree_to.getItemText(ids[i])+" (默认)";
					                              tree_to.setItemText(ids[i],text);    
					                              tree_to.setUserData(ids[i],'defOrg','1'); 			                                	
			                                }
			                              }
			                              //tree_to.deleteChildItems("0");
				                  		 // tree_to.loadXML("allUserOrgList.qact?userId="+'${userId}');    
			                             }
			                             else{
			                        	  alert("新增组织失败"); 

			                             }
			                           },
			                 failure:(function(response) 
			     		              {
			     		            	alert("新增组织失败");   

			     		              }) 
			        });
		}

		function remove(){
			if(tree_to.getAllChecked() == "")
			{
				alert("请选择要取消的组织");
				return;
			}
			Ext.Ajax.request({
                url: 'delOrgByUser.qact',
                params: {
                	 userId:"${userId}",
					 ids:tree_to.getAllChecked()
                },
                success: function(response, options) {
                         var responseArray = Ext.util.JSON.decode(response.responseText);                                             
                         if(responseArray.success=='true'){
                              var ids = tree_to.getAllChecked().split(",");
                              var flag=false;
                              for(var i=0;i<ids.length ; i++)
                              {
                              	if(tree_to.getUserData(ids[i],'defOrg')=='1'){
                              		flag=true;
                              	}                                
                                tree_to.deleteItem(ids[i],false);
                              }
                              if(flag && tree_to.getSubItems('-1root_') != ''){
                              	 var id =tree_to.getChildItemIdByIndex("-1root_",0);
	                              text = tree_to.getItemText(id)+" (默认)";
	                              tree_to.setItemText(id,text);    
	                              tree_to.setUserData(id,'defOrg','1');                               	 
                              }                         
                            // tree_to.deleteChildItems("0");
	                  		 //tree_to.loadXML("allUserOrgList.qact?userId="+'${userId}');    

                            }
                            else{
                       	 	 alert("取消组织失败"); 
 
                            }
                          },
                failure:(function(response) 
    		              {
    		            	alert("取消组织失败");   

    		              }) 
       });
		}
	  function setDefOrg(){
	  		var selId=tree_to.getAllChecked();
			if(selId == "")
			{
				alert("请在已拥有的组织列表里选择一个组织");
				return;
			}
			if(selId.split(",").length > 1){
				alert("只能设置一个组织为默认组织，请只选择一个组织");
				return;
			}
			Ext.Ajax.request({
                url: 'setUserDefOrg.qact',
                params: {
                	 userId:"${userId}",
					 orgIds:selId
                },
                success: function(response, options) {
                         var responseArray = Ext.util.JSON.decode(response.responseText);                                             
                         if(responseArray.success=='true'){
                              var ids = tree_to.getSubItems('-1root_').split(",");
                              for(var i=0;i<ids.length;i++){
                              	if(tree_to.getUserData(ids[i],'defOrg')=='1'){
                              		var text =tree_to.getItemText(ids[i]);
                              		text = text.substr(0,text.indexOf(" (默认)"));
                              		tree_to.setItemText(ids[i],text);
                              		tree_to.setUserData(ids[i],'defOrg',null);
                              	}
                              	 //if(getItemText(ids[i]).indexOf("(默认)")
                              }
                              text = tree_to.getItemText(selId)+" (默认)";
                              tree_to.setItemText(selId,text);    
                              tree_to.setUserData(selId,'defOrg','1'); 

                            }
                            else{
                       	  		alert("设置默认组织失败"); 
 
                            }
                          },
                failure:(function(response) 
    		              {
    		            	alert("设置默认组织失败");   
    		              }) 
       });			
			
	  }
	</script>

  </head>
  
  <body  style="padding: 5px;"  onload="init();">
	<form name="UserForm" action="saveOrgByUser.qact" method="post">
		<input name="userId" type="hidden" value="${userId}">
		<input name="orgIds" type="hidden">
	</form>
   	<table border="0" width="100%" height="80%" cellpadding="0" cellspacing="0" class="normalformTb_s" style="padding: 5px;">
		<tr height="20">
			<td colspan="4">
				<table class="titleTable">
					<tr>
						<td class="title">
							用户组织分配
						</td>
					</tr>
				</table>											
			</td>
		</tr>   	
  		<tr height="35">
  			<td> &nbsp;用户名称：<input name="UserName" type="text" ID="UserName" size="17"  value="${userName}" style="background-color: #eeeeee;" readonly></td>
  			<td></td>
  			<td></td>
  			<td></td>
  		</tr>
  		<tr height="20">
  			<td>&nbsp;可分配的组织：</td>
  			<td></td>
  			<td>已拥有的组织：</td>
  			<td></td>
  		</tr>
  		<tr class="bg1">
			<td width="300px">
				<div id="tree_from" style="width:300px; height:100%;background-color:#fbfbfb;border :1px solid Silver;; overflow:auto;"></div>
			</td>
			<td width="15px" height="185" class="table2_td_title1">
				<input type="button" class="Btn" name="AddRightBtn" value="加入组织&gt;&gt;" onClick="add();">
				<br>
				<br>
				<input type="button" class="Btn" name="RemoveRightBtn" value="&lt;&lt;取消组织" onclick="remove();">
			</td>
			<td width="300px">
				<div id="tree_to" style="width:300px; height:100%;background-color:#fbfbfb;border :1px solid Silver;; overflow:auto;"></div>
			</td>
			<td valign="top">
				<input type="button" class="Btn" name="SetDefBtn" value="设置默认组织" onClick="setDefOrg();">
			</td>
		</tr>
  	</table>
  	<table>
  		<tr height="40">
  			<td>
				<input type="button" name="返 回"  class="Btn" value="返 回" ONCLICK="JAVASCRIPT:history.back();">  			
  			</td>
  			<td>&nbsp;</td>
  			<td>&nbsp;</td>
  		</tr>   	
  	</table>
  </body>
</html>
