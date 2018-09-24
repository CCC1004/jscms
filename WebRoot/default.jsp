<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix='security' uri='http://www.springframework.org/security/tags' %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>武汉排口管理系统</title>
	<base href="<%=basePath%>" />
	<link href="pageframe/css/home.css" type="text/css" rel="stylesheet" />
	<link href="pageframe/css/dtree.css" rel="stylesheet" type="text/css" /> 
<style type="text/css">
*{ margin:0; padding:0;}
html { height:100%; max-height:100%; border:0; background:#fff; font-size:12px;  font-family:Verdana,宋体; overflow: hidden;}
body{ height:100%; max-height:100%; overflow:hidden; border:0; text-align:left;}
.lightbox{width:300px;background:#FFFFFF;border:1px solid #ccc;line-height:25px; top:20%; left:20%;display: none;}
.lightbox dt{background:#e4e4e4; padding:5px;color: blue;font-size: 11pt;}	
.lightbox dd{background:#f8f8f8; padding:5px;font-size: 11pt; padding-left: 10px;}	
</style>

<script language="JavaScript" src="pageframe/javascript/lightbox.js" type="text/javascript"></script>	
<script language="JavaScript" src="pageframe/javascript/dtree.js" type="text/javascript"></script>
<script language="JavaScript" src="pageframe/javascript/qlmenu.js" type="text/javascript"></script>
<script language="JavaScript" src="pageframe/javascript/page_init.js" type="text/javascript"></script>
	
<script type="text/javascript">
 		if(top.location  !=  self.location)  
	    {  
	       //top.location  =  self.location;  
	    }
		function initPage() {
	<%--  
	LayoutClass.init(true, true, true, false, true, true)中6个开关的定义：
	1) 第一个：为true表示第一级菜单域显示，为false则不显示此级菜单域
	2) 第二个：为true表示第二级菜单域显示，为false则不显示此级菜单域
	3) 第三个：为true表示第三级菜单域显示，为false则不显示此级菜单域
	
	4) 第四个：为true表示第四级菜单域总是以树的形式展示；
			  为false则在第四级菜单均为叶子结点时，以平面的形式展示
	5) 第五个：为true表示如果第四级菜单(树)某级菜单的子结点均为叶子结点时，
			  以选项卡(tab页)形式展示叶子结点；
			  为false则不改变叶子结点的展示方式
	6) 第六个：为true表示(在第五个为true的基础上)
			  如果某菜单结点要以选项卡(tab页)形式展示的叶子(兄弟)结点数只的一个时，
			  仍然以选项卡(tab页)形式展示其单个叶子结点；
			  为false则此单个叶子结点不以选项卡(tab页)形式展示，而是以树的形式展示		
	--%>  
            LayoutClass.init(false, true, true, false, true, true) ;
            <%
              String rtId="";
              if(request.getParameterMap().get("rootId") != null)
                rtId=request.getParameterValues("rootId")[0];
            %>
            var rootId="<%=rtId%>";
			loadMenuAndInit('QLight_GetMenu.qact?rootId='+rootId+"&t="+Date.parse(new Date())) ; 
		}
		var rootPath="<%=request.getContextPath()%>/" ;<%--系统根路径，在打开链接时需要加在前面--%>
		var blankPage="pageframe/blank.htm"; <%--菜单空链接时显示的页面 --%>
	</script>
	
</head>

<body onload="load()">
    <script type="text/javascript">
        var box;
    	function load() { 
    	    resetSize();   
    	    initPage();	
    		//pageReInit(1);
    		//pageReInit(2);
    		//pageReInit(3);
    		//pageReInit(4);
    		//document.getElementById('time').innerHTML="今天是"+new Date().toLocaleDateString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());    		
    		<s:if test="#session.UseOrgId == null && orgList.size >1">
			showOrgSelect();    		
			</s:if>
    	}
    	//显示组织选择窗口
    	function showOrgSelect(){
			box = new LightBox("idBox");   
			box.Show();      		
    	}
		function SetStyle1(cls) {
		  var t=event.srcElement;
		  if(t.tagName=="LI")
		  	t.className=cls;
		  else
		    t.parentElement.className=cls;
		}
		
            function setStyle(index) {	
            	if(document.getElementById("treeTable") == null)
            		return;
	    		var treeTrs = document.getElementById("treeTable").firstChild.children ;
	    		for(var i=0; i<treeTrs.length; i++) {
	    			if(i == index) {
	    				treeTrs[i].className = 'itemSelected' ;
	    			} else {
	    				treeTrs[i].className = '' ;
	    			}
	    		}
	    	} 			    		    	
             
            function hideTreePage(){
           
                if(document.getElementById('leftMenuTD').style.display != "none"){
                    document.getElementById('leftMenuTD').style.display="none";
                } else {
                    document.getElementById('leftMenuTD').style.display="";
                }
                  
            }
            	    
			function GetRadioValue(RadioName){
			    var obj;    
			    obj=document.getElementsByName(RadioName);
			    if(obj!=null){
			        var i;
			        for(i=0;i<obj.length;i++){
			            if(obj[i].checked){
			                return obj[i].value;            
			            }
			        }
			    }
			    return '';
			}
			
			function sendOrgSelect(appUrl,orgId){
           		var url=appUrl+"/userSelectOrg.qact?orgId="+orgId;
           		url += "&timestamp=" + new Date().getTime();
           		
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4 && (xmlHttp.status==200 || xmlHttp.status==0)) {
						result = eval('('+xmlHttp.responseText+')');
					  if(result.success){
					  	var orgName = document.getElementById("orglab"+orgId).innerText;
					    document.getElementById("curOrg").innerText = orgName;
					  	box.Close();
					  }
					  else{
					    alert('选择组织出错('+xmlHttp.status+')');
					  }					
					}
				};	
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);			
			
			}
            	    
           	function orgSelect(){
           		var orgId = GetRadioValue('orgItem');
           		var url="<%=basePath%>";
           		sendOrgSelect(url,orgId);
           		<s:iterator id="appUrl" value="%{outAppUrlList}" status="st">
           			sendOrgSelect('${appUrl}',orgId);
           		</s:iterator>
           		
           	}	
			function resetSize()
			{				
				var cHeight=document.body.clientHeight;
				document.getElementById('mainTable').style.height=cHeight+"px";
				document.getElementById('mainTR').style.height=(cHeight-54-59)+"px";
				var tabh=0;
				if(document.getElementById('ul').style.display != "none"  )
					tabh=30;
				document.getElementById('content').style.height=(cHeight-54-59-tabh)+"px";
				document.getElementById('fraMain').style.height=(cHeight-54-59-tabh-2)+"px";
			}
			window.onresize=resetSize;	    	
			
    	//initPage();
    </script>
<table class="nav_bj" border="0" cellspacing="0" cellpadding="0"  style="width:100%;margin: 0px;" id="mainTable">

  <tr style="width:100%;">
    <td>
    	<table style="height:80px;width:100%" border="0" cellpadding="0" cellspacing="0">
    		<tr>
	    		<td style="padding-left: 20px;">
			    	<img src="pageframe/images/home/logo.png"/>
			    </td>
			    <td>
		    		<table style="height:80px;width:100%;" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td ><span id="menuId" style="display:none"></span></td>
							<td id="region2_menu" >&nbsp;</td>
							
						</tr>           
					</table>
			    </td>
			    <td align="right" style="padding-right: 20px;">
			    	<font size="3" color="white">
			    		${userName}<a href="j_spring_security_logout" target="_top" style="color:blue;">[注销]</a>
			    	</font>
			    </td>
    		</tr>
    	</table>
    </td>
  </tr>
  <tr id="mainTR">
    <td style="width:100%;" align="center" valign="top" background="pageframe/images/home/u23.png">
  		<table cellspacing=0 cellpadding=0 bgcolor="#ffffff" border=0  width="100%" >
			<tr>
				<td valign=top width="180" id="leftMenuTD">
					<table height="100%" cellspacing=0 cellpadding=0 width="100%" border=0>
						<tr>
							<td class="dtree_body" id="region3_menu" valign=top width="100%"></td>							
						</tr>
					</table>
				</td>
				<td align="center" width="1" valign="middle" id="sideBarTD" style="BORDER-RIGHT: #8c8c8c 1px solid">
				</td>	

		    	<td  align="left" valign="top" >
					<table cellspacing=0 cellpadding=0 border=0 style="WIDTH: 100%; HEIGHT: 100%">
					<tr>
					    <td height="30" bgcolor="#ffffff">
					        <div align="left" class="curlc_title">
					        	&nbsp;<img src="pageframe/images/home/curLc.gif"/> 您当前的位置：<span id="curLc"></span>
					        </div> 
					
						</td>					
					</tr>
					<tr>
					<td>
				        <div class='tab' id="tab">			
				            <div id="ul" style="display:none">
				            	<ul id='nav1' class='menu' width="100%"></ul> 
				            </div>
				             <div  id="content">
				                <iframe id="fraMain" class="content" src="" frameborder="0" width="100%" height="100%" scrolling="auto"></iframe>
				            </div>
			       		</div>    			
					</td>
					</tr>
					</table>
		    	</td>											
			</tr>
		</table>  	
	</td>
  </tr>
</table>
</body>
</html>