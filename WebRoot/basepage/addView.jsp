<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
	<meta http-equiv="X-UA-Compatible" content="IE=5"/>
		<title>${insertApp.title}</title>
		
		<s:set name="hasTreeSelect" value="0"></s:set>
		<s:set name="hasDateSelect" value="0"></s:set>		
		<s:iterator id="opt" value="%{insertApp.option}">
			<s:if test="#opt.type=='treeSelect' || #opt.type=='treeSelect-ONLY_LEAF' || #opt.type=='treeSelect-EXCEPT_ROOT'">	
				<s:set name="hasTreeSelect" value="1"></s:set>
			</s:if>
			<s:if test="#opt.type=='datetime' || #opt.type=='date'  || #opt.type=='date-year'">	
				<s:set name="hasDateSelect" value="1"></s:set>
			</s:if>			
		</s:iterator>
				   
        <link rel="stylesheet" type="text/css" href="Components/validation/css/style_min.css" />
		<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" />    
		<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  
		<s:if test="#hasTreeSelect==1">	
			<link rel="stylesheet" type="text/css" href="Components/TreeSelect/treeselect.css" />
			<link rel="stylesheet" type="text/css" href="Components/TreeSelect/xtree.css" />	
		</s:if>			
		    
		<script src="Components/validation/prototype_for_validation.js" type="text/javascript"></script>
        <script src="Components/validation/effects.js" type="text/javascript"></script>
        <script src="Components/validation/validation_cn.js" type="text/javascript"></script>
        <s:if test="#hasDateSelect==1">
        	<script src="Components/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        </s:if>
        <s:if test="#hasTreeSelect==1">	
        	<script src="Components/TreeSelect/xtree.js" type="text/javascript"></script>
        	<script src="Components/TreeSelect/treeselect.js" type="text/javascript"></script>
        </s:if>
		<script type="text/javascript">		
		function submitTo(url) {
            var valid = new Validation('addForm', {onSubmit:false}); 
            if(valid.validate())
            {
            	document.all.addForm.action = url ;
            	<s:if test="%{insertApp.isUpload}">	
					document.addForm.encoding = "multipart/form-data";
				</s:if>
				document.all.addForm.submit() ;
            }
			
		}		
		function getSuccessURL()
		{
			return addForm.successURL.value;
		}		
		function selectDate(obj){
			if(!obj.readOnly)
			{
			   setdayD(obj);
			}
		}
		function selectDateTime(obj){
			if(!obj.readOnly)
			{
			   setdayDT(obj);
			}
		}		
		</script>
		<script type="text/javascript" src="basepage/javascript/common.js"></script>	
		<s:iterator id="js" value="%{insertApp.javaScript}">
			<script type="text/javascript" src="<%=request.getContextPath()%>${js.src}"></script>	
		</s:iterator>		
		<%--base href必需放在导入My97DatePicker js的后面，否则在IE6下My97DatePicker会出错--%>
		<base href="<%=basePath%>" />
	</head>
	<body onload="${insertApp.onload}">
		<%--树形下拉选择框的树结点XML--%>
		<script type="text/javascript">
			<s:iterator id="opt" value="%{insertApp.option}">
				<s:if test="#opt.type=='treeSelect' || #opt.type=='treeSelect-ONLY_LEAF' || #opt.type=='treeSelect-EXCEPT_ROOT'">	
					<s:iterator value="#opt.mapRef" id="xml">
					   	var __${opt.id}TreeXML='${xml.value}';					
					</s:iterator>
				</s:if>	
			</s:iterator>		
		</script>		
	     <%-- 防止刷新时重复提交 --%>
        <s:token></s:token>
       <%-- <s:debug></s:debug> --%>
		<s:form method="post" name="addForm" id="addForm">
          <s:hidden name="successURL" value="%{successURL}"></s:hidden> 
          <s:hidden name="insertAction" value="%{insertAction}"></s:hidden>                
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table class="tabsContent">
							<tr>
								<td class="title">
					<center>
						<h3>
							<span id="tabTitle">${insertApp.title }</span>
						</h3>
					</center>								
									
								</td>
							</tr>
						</table>								
					</td>
				</tr>
				<tr>
					<td >
					<%int count=0; %>
					<table border="0" cellpadding="0" cellspacing="0" class="normalformTb">				
					<s:iterator id="opt" value="%{insertApp.option}">
							<jsp:useBean id="optBean" class="qlight.frames.base.model.OgnlValueBean" >
								<jsp:setProperty name="optBean" property="ovs" value="${request['struts.valueStack']}"  />
							</jsp:useBean>
							<jsp:setProperty name="optBean" property="value" value="opt.id"  />					

						    <s:if test="#opt.type!='hidden'">	
						    	<%if(count%2==0){ %>
							    	<tr height="25">
							    <% }%>						    	
							    		
						    	<th align="right" >&nbsp;&nbsp;<b><s:property value="getText(#opt.msg)" escapeHtml="false" />：</b></th>
						    	<s:if test="#opt.type=='richEditor'">
						    		<td colspan="3">
						    		<%count++; %>
						    	</s:if>	
						    	<s:else>
									<td>
								</s:else>
						    				    

						    </s:if>		
						    
							<s:if test="#opt.type=='input'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" onchange="%{#opt.onChange}" 
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" onchange="%{#opt.onChange}" 
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#optid}" theme="simple"/>
								</s:else>
							</s:if>
							
							<s:elseif test="#opt.type=='file'">					
									<s:file name="j_%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" onchange="%{#opt.onChange}" 
									   cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"></s:file>
							</s:elseif>
							
							<s:elseif test="#opt.type=='image' && #opt.defaultval != null">
									<img name="%{#opt.id}" src="${opt.defaultval}" style="width:%{#opt.width}px;" class="${opt.validator}" value="%{#opt.defaultval}" />	
							</s:elseif>
							
							<s:elseif test="#opt.type=='hidden'">
								<s:if test="#opt.defaultval != null">
									<s:hidden name="%{#opt.id}" value="%{#opt.defaultval}" onchange="%{#opt.onChange}" ></s:hidden>
								</s:if>
								<s:else>
									<s:hidden name="%{#opt.id}" onchange="%{#opt.onChange}" value="%{#optid}"></s:hidden>							
								</s:else>															
							</s:elseif>
								
							<s:elseif test="#opt.type=='password'">
								<s:if test="#opt.defaultval != null">
									<s:password name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;" showPassword="true" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#opt.defaultval}" theme="simple"/>
								</s:if>
								<s:else>
									<s:password name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;" showPassword="true" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#optid}" theme="simple"/>
								</s:else>								
								
							</s:elseif>
							
							<s:elseif test="#opt.type=='textarea'">
								<s:if test="#opt.defaultval != null">
									<s:textarea name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;height:%{#opt.height}px"	 readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#opt.defaultval}" theme="simple"/>
								</s:if>
								<s:else>
									<s:textarea name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;height:%{#opt.height}px"	 readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#optid}" theme="simple"/>				
								</s:else>																
							</s:elseif>					
							
							<s:elseif test="#opt.type=='checkBox'">
								<s:if test="#opt.defaultval != null">
									<s:checkboxlist list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}"  disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"></s:checkboxlist>
								</s:if>
								<s:else>
									<s:checkboxlist list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}"  disabled="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#optid}" theme="simple"></s:checkboxlist>
								</s:else>																
							</s:elseif>
							
							<s:elseif test="#opt.type=='radioBox'">
								<s:if test="#opt.defaultval != null">
									<s:radio list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}"  disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"></s:radio>
								</s:if>
								<s:else>
									<s:radio list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}"  disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" theme="simple"></s:radio>
								</s:else>								
							</s:elseif>
							
							<s:elseif test="#opt.type=='select' || #opt.type=='select-null'">
								<s:if test="#opt.defaultval != null">
									<s:select list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#opt.defaultval}" theme="simple"></s:select>
								</s:if>
								<s:else>
									<s:select list="#opt.mapRef" name="%{#opt.id}" onchange="%{#opt.onChange}"  key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" theme="simple"></s:select>						
								</s:else>																
							</s:elseif>
							
							<s:elseif test="#opt.type=='datetime'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple" onfocus="selectDateTime(this);">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;" theme="simple"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" onfocus="selectDateTime(this);"  value="%{#optid}"/>

								</s:else>
							</s:elseif>
							
							<s:elseif  test="#opt.type=='date'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple" onfocus="selectDate(this);">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;" theme="simple"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  onfocus="selectDate(this);"  value="%{#optid}"/>
								</s:else>
							</s:elseif>
							
							<s:elseif  test="#opt.type=='date-year'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple" onfocus="selectYear(this);">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}"  cssStyle="width:%{#opt.width}px;" theme="simple"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  onfocus="selectYear(this);"  value="%{#optid}"/>
								</s:else>
							</s:elseif>							
													
							<s:elseif test="#opt.type=='treeSelect' || #opt.type=='treeSelect-ONLY_LEAF' || #opt.type=='treeSelect-EXCEPT_ROOT'">
								<script type="text/javascript">	
									var selectMode="ALL_ELEMENT";
									<s:if test="#opt.type=='treeSelect-ONLY_LEAF'">
										selectMode="ONLY_LEAF_ELEMENT";
									</s:if>
									<s:elseif test="#opt.type=='treeSelect-EXCEPT_ROOT'">
									    selectMode="EXCEPT_ROOT_ELEMENT";
									</s:elseif>
								</script>
								<s:if test="#opt.defaultval != null">
									<script type="text/javascript">	
										CreateTreeSelect("${opt.id}",'${opt.defaultval}',__${opt.id}TreeXML,250,${opt.width},selectMode,'%{#opt.validator}');
									</script>
								</s:if>
								<s:else>
									<script type="text/javascript">
										CreateTreeSelect("${opt.id}","<s:property value='%{#opt.id}'/>",__${opt.id}TreeXML,250,${opt.width},selectMode,'${opt.validator}');
									</script>
								</s:else>																
							</s:elseif>			
									
							<s:elseif test="#opt.type=='richEditor'">				
								<fck:editor instanceName="${opt.id}" width="100%" height="200">
									<fck:config CustomConfigurationsPath="${pageContext.request.contextPath}/Components/fckeditor/fckconfig.js" />
								</fck:editor>
							</s:elseif>			
								
						   <!--  <s:if test="#opt.type!='hidden'">	
						    	<s:fielderror  theme="simple" templateDir="/WEB-INF/themes" cssClass="errMsg"> <s:param>${opt.id}</s:param> </s:fielderror>	
						    	</td></tr>
						    </s:if>	 -->
						    <s:if test="#opt.type!='hidden'">								    
						    	<br/>
						    	<s:fielderror  theme="simple" templateDir="/WEB-INF/themes" cssClass="errMsg"> <s:param>${opt.id}</s:param> </s:fielderror>	
						    	</td>
 					    	    <%if(count%2==1){ %>

							    	</tr>	
							    <% }%>				    
							   <%count++; %>
						    </s:if>		
					</s:iterator>
					<%if(count%2==1){ %>
				    	<th>&nbsp;</th>
				    	<td>&nbsp;</td>
				    	</tr>	
				    <% }%>	
					</table>
					</td>
				</tr>									
			</table>				
		</s:form>
		<table width="100%">
			<tr>
				<td align="center">
				<s:iterator id="button" value="%{insertApp.actionButton}" status="sta">
					
						<s:if test="#button.type=='javaScript'">								
							<input type="button" value='<s:text name="%{#button.msg}"/>' onclick="${button.linkRef}" class="addview-bBtn"/>
						</s:if>	
						
						<s:elseif test="#button.type=='save'">
							<input type="button" value='<s:text name="%{#button.msg}"/>'  onclick="submitTo('${button.linkRef}')" class="addview-bBtn"/>
						</s:elseif>			
						<s:else>
							<input type="button" value='<s:text name="%{#button.msg}"/>' onclick="openURL('${button.linkRef}')" class="addview-bBtn"/>							
						</s:else>
							    <s:if test="!#sta.last">
							    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    </s:if>								
					
				</s:iterator>
				</td>
			</tr>
		</table>			
       		
	</body>
</html>
     