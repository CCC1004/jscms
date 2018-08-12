<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>Excel文件导入</title>
		<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" />    
		<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  
		<script type="text/javascript" src="basepage/javascript/common.js"></script>	
		<script type="text/javascript">
			function imp(){
				if(!check(document.addForm))
				{
					return;
				}
				document.addForm.submit();
			}
	
			
			function isEmpty(str){   
				 for(var i=0;i<str.length;i++){   
				  if(str.charAt(i)!==" "){   
				    return false;   
				  }   
				}   
				return true;   
			}   
			function check(form){   
			 var fileName = form.impFile.value;   
			 if(isEmpty(fileName)){   
			    alert("请选择文件名");   
			    form.impFile.focus();   
			    return false;   
			 }   
			 //lastIndexOf如果没有搜索到则返回为-1   
		     if(fileName.lastIndexOf(".")!=-1)   
			 {   
			    var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();   
			    var suppotFile = new Array();   
			    suppotFile[0] = "xls";   
			    for(var i =0;i<suppotFile.length;i++){   
			     if(suppotFile[i]==fileType){   
			     return true;   
			    }else
			    {   
			     continue;   
			    }   
			  }   
			  alert("不支持文件类型"+fileType);   
			  return false;   
			 }else   
			 {   
			  alert("文件只支持Excel"); 
			  return false;  
			 }   
		    }   
		    
		    function isNumber(oNum) 
		    { 
			  if(!oNum) return false; 
			  var strP=/^\d+(\d+)?$/; 
			  if(!strP.test(oNum)) return false; 
			  try{ 
			  if(parseFloat(oNum)!=oNum) return false; 
			  } 
			  catch(ex) 
			  { 
			   return false; 
			  } 
			  return true; 
		   }
		   
		    
		</script>
	</head>
	<body style="margin: 5px;overflow: hidden">
		<s:form method="post" name="addForm" id="addForm" action="${param.url}" enctype="multipart/form-data"  theme="simple">   
			<table width="100%" border="0" cellpadding="0" cellspacing="0" height="150">
				<tr>
					<td height="30">
						<table class="titleTable">
							<tr>
								<td class="title">
									导入Excel文件数据到表格中(只支持.xls格式)
								</td>
							</tr>
						</table>											
					</td>
				</tr>
				<tr>
					<td >					
					<table border="0" cellpadding="0" cellspacing="0" class="normalformTb" align="left" height="100%">				
				    	<tr height="100%">
				    		<td valign="top">
					    		<br>
					    		<b>文件路径：</b><br/>
								<s:file name="impFile" size="40"></s:file>
								<br>
								<font color="red"> ${msg} </font>
							</td>
						</tr>
					</table>
					</td>
				</tr>	
												
			</table>				
		</s:form>
		<table height="25">
			<tr>
				<td>
					<input type="button" value='导入' onclick="imp()" class="addview-bBtn"/>							
				</td>
			</tr>
		</table>
		<s:if test="%{success != null}">
	<script type="text/javascript">
		var success=${success};
		var msg='${msg}';
		if(!success){
		  alert(msg);
		}else{
		  alert("导入成功");
		  window.returnValue = true;
		  window.close();	  
		}
	</script>       		
	</s:if>
	</body>
</html>
