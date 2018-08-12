<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		
		<title>上传附件</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css" />
		<link href="<%=basePath%>/css/table.css" rel="stylesheet" type="text/css"/>
		<link href="<%=basePath%>/css/tab_other.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/button.css" />
		<script language="JavaScript" src="<%=basePath%>/javascript/button.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>/Components/validation/css/style_min.css" />
		<link rel="stylesheet" type="text/css" href="$<%=basePath%>/basepage/css/BaseCommon.css" />    
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/basepage/css/form.css"/>
        
        <script src="<%=basePath%>/Components/validation/prototype_for_validation.js" type="text/javascript"></script>
        <script src="<%=basePath%>/Components/validation/effects.js" type="text/javascript"></script>
        <script src="<%=basePath%>/Components/validation/validation_cn.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=basePath%>/basepage/javascript/common.js"></script>	
        <script src="<%=basePath%>Components/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=basePath%>Components/ExtJS/adapter/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>Components/ExtJS/adapter/jquery/jquery.form.js"></script>
        <base href="${pageContext.request.contextPath}/<%=basePath%>" />
        <script type="text/javascript">	
			function selectDateTime(obj){
	
				if(!obj.readOnly)
				{
				   //setdayDT(obj);
				   WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
				}
			}
			
			
			var valid;
			function submitForm(){	
				if(valid.validate()==false)
					return;
				var url="<%=basePath%>saveFileInfo.qact";
				//alert(url);
				$('#form1').ajaxSubmit({
				    type: "POST",
					url: url,
					cache: false,
					dataType :'json',
					iframe: true,
					//data: extraData,
					timedOut: 90000000,					
					success: function(data) {
						try {
							data=eval("("+data+")");
						}
						catch (ex) {				
							return;
						}										
						if(data.success){
							//alert('aaaa');
					 		if(data.fileExist!=null&&data.fileExist!=""){
					 			str="文件已存在是“覆盖”还是“跳过”\r\n点击“确定”文件进行覆盖";
					 			if(confirm(str)){
					 				document.getElementById("fileCd").value=data.fileCd;
					 				coverSaveData();
					 			}
					 		}else{		
					 			alert("文件上传成功！");
					 			window.close();	
							}
			            }else{
			            	alert("文件上传失败！"+data.error);
			            }
					},
					error: function(data) {
						alert("文件上传失败1！"+data);
					}
				});		
				return false;
			}
			
			function coverSaveData(){		
				if(valid.validate()==false)
					return;			   	
				var url="<%=basePath%>coverFileInfo.qact";
				$('#form1').ajaxSubmit({
				    type: "POST",
					url: url,
					cache: false,
					dataType :'json',
					timedOut: 90000000,
					//data: extraData,					
					iframe: true,
					success: function(data) {
						try {
							data=eval("("+data+")");
						}
						catch (ex) {				
							return;
						}
						if(data.success){		
					 		var str="文件覆盖成功!\r\n";
					 		alert(str);	
					 		window.close();	
			            }else{
			            	//alert("保存信息失败！"+data.error);
			            	alert("<font color='red'>文件覆盖失败!原因：</font>\r\n"+data.error);
			            }	
					},
					error: function(data) {				
						alert("<font color='red'>文件覆盖失败!原因：</font>\r\n"+data.error);
					}
				});	
				return false;
			}
			
		</script>
</head>

<body onload=" valid= new Validation('form1', {onSubmit:false}); ">
	<s:token></s:token>
    <s:form method="post" name="form1" id="form1" enctype="multipart/form-data">  	
    	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table class="tabsContent" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="title" style="background-color: #FFFFFF">
								<center>
									<h3>
										<span id="tabTitle">附件信息</span>
									</h3>
								</center>								
								
							</td>
						</tr>
					</table>											
				</td>
			</tr>
			</table>
    	
    	<div class="list1">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tableContent">
	          	<tr height="30">
	             <td width="10%" class="titleStyle">&nbsp;&nbsp;文件标题：</th>
	            <!--  <td class="td_padding_left">
		             <s:textfield name="fileTitl" cssClass="required"  theme="simple"/>
			    	<s:hidden name="successURL" value="%{successURL}"></s:hidden> 
			    	<s:hidden name="fileCd" id="fileCd" value="%{fileCd}"></s:hidden>
			    	<s:hidden name="estNode" id="estNode" value="FJ"></s:hidden>
			    	<s:hidden name="secG" id="secG" value="1"></s:hidden>
			    	<s:hidden name="table" id="table"></s:hidden>
	             </td> -->
	             <td class="td_padding_left">
		             <s:textfield name="fileTitl" cssClass="required"  theme="simple"/>
		             <s:iterator value="%{defParams}" >
			     		<input type="hidden" name="<s:property value='key' />" value="<s:iterator value='value' status='sta'><s:property escape='false' escapeJavaScript='true'/><s:if test='!#sta.last'>,</s:if></s:iterator>" >             
					</s:iterator>      	
			    	<s:hidden name="successURL" value="%{successURL}"></s:hidden> 
			    	<s:hidden name="fileCd" id="fileCd" value="%{fileCd}"></s:hidden>
			    	<s:hidden name="estNode" id="estNode" value="FJ"></s:hidden>
			    	<s:hidden name="secG" id="secG" value="1"></s:hidden>
	             </td>
	            </tr>
	            <td class="td_padding_right list1_td_style">&nbsp;&nbsp;上传文件：</th>
	            <td class="td_padding_left" colspan="3"><s:file name="file"  id="file"  cssClass="required" theme="simple"></s:file>   </td>     
	          </table>
	          <div class="oper" >
	    		<table  width="100%" border="0" cellpadding="0" cellspacing="0" style="border: 0px solid;color: red;">
					<tr>
						<td align="center" style="border-right: 0px solid #D7D7D7;">
							<input type="button" value='保存' class="button_save" onclick="submitForm()"/>
						</td>
					</tr>
				</table>
			</div>
		</div>		       
    </s:form>    	
</body>
</html>
