<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*" %>
<%@ page  import="qlight.util.bean.MyBeanUtils"%>
<%@ page  import="com.opensymphony.xwork2.ognl.OgnlValueStack"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="fck" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<meta http-equiv="X-UA-Compatible" content="IE=5"/>
		<title>${updateApp.title }</title>
		
		<s:set name="hasTreeSelect" value="0"></s:set>
		<s:set name="hasDateSelect" value="0"></s:set>		
		<s:iterator id="opt" value="%{updateApp.option}">
			<s:if test="#opt.type=='treeSelect' || #opt.type=='treeSelect-ONLY_LEAF' || #opt.type=='treeSelect-EXCEPT_ROOT'">	
				<s:set name="hasTreeSelect" value="1"></s:set>
			</s:if>
			<s:if test="#opt.type=='datetime' || #opt.type=='date' || #opt.type=='date-year'">	
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
		    
		<script type="text/javascript" src="basepage/javascript/common.js"></script>		    

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
		<%--base href必需放在导入My97DatePicker js的后面，否则在IE6下My97DatePicker会出错--%>
		<base href="<%=basePath%>" />
                
		<script type="text/javascript">		
		var valid; 
		
		function submitTo(url) {            
            var result = valid.validate();            
            if(!result) return ;
			document.all.updateForm.action = url ;
           	<s:if test="%{updateApp.isUpload}">	
				document.updateForm.encoding = "multipart/form-data";
			</s:if>			
			
			document.all.updateForm.submit() ;
		}
		function getSuccessURL()
		{
			return updateForm.successURL.value;
		}		
		function myonload(){
			valid = new Validation('updateForm', {onSubmit:false});
			
			var isreadonly='${param.dms_readonly}';
			
			if(isreadonly=='1')
			{
				//alert(document.getElementById('saveBtn'));
				document.getElementById('saveBtn').style.display="none";
				var t=document.getElementById('tabTitle').innerText;
				document.getElementById('tabTitle').innerText=t.split("-")[0];
			}
			
		}
		</script>

	</head>
	<body style="margin-top: 5px;" onload="myonload();${updateApp.onload};">	
		<s:iterator id="js" value="%{updateApp.javaScript}">
			<script type="text/javascript" src="<%=request.getContextPath()%>${js.src}"></script>	
		</s:iterator>
		<script type="text/javascript">
			<s:iterator id="opt" value="%{updateApp.option}">
				<s:if test="#opt.type=='treeSelect' || #opt.type=='treeSelect-ONLY_LEAF' || #opt.type=='treeSelect-EXCEPT_ROOT'">	
					<s:iterator value="#opt.mapRef" id="xml">
					   	var __${opt.id}TreeXML='${xml.value}';					
					</s:iterator>
				</s:if>	
			</s:iterator>		
		</script>
    <s:token></s:token>
		<s:form method="post" name="updateForm" id="updateForm">
        <s:hidden name="successURL" value="%{successURL}"></s:hidden> 
        <s:hidden name="updateAction" value="%{updateAction}"></s:hidden> 
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table class="tabsContent">
							<tr>
								<td class="title">
					<center>
						<h3>
							<span id="tabTitle">${updateApp.title }</span>
						</h3>
					</center>								
									
								</td>
							</tr>
						</table>											
					</td>
				</tr>
				<tr>
					<td>
						<s:hidden name="_table_pk" ></s:hidden>
					</td>
				</tr>
				<tr>
					<td >
					<table border="0" cellpadding="0" cellspacing="0" class="normalformTb">
					


					<s:set var="count" value="0"></s:set>
					<s:iterator id="opt" value="%{updateApp.option}" status="sta" >
							<jsp:useBean id="optBean" class="qlight.frames.base.model.OgnlValueBean" >
								<jsp:setProperty name="optBean" property="ovs" value="${request['struts.valueStack']}"  />
							</jsp:useBean>
							<jsp:setProperty name="optBean" property="value" value="opt.id"  />

						    <s:if test="#opt.type!='hidden'">	
						    	<s:if test="%{#count % updateApp.column ==0}">
							    	<tr height="45">
							    </s:if>						    	
							    		
						    	<th align="right">&nbsp;&nbsp;<b><s:property value="getText(#opt.msg)" escapeHtml="false"  />：</b></th>
						    	<td colspan="${opt.colspan*2-1}">
						    	<s:if test="#opt.colspan>1">
							    	<s:set var="count" value="%{#count + #opt.colspan -1}"></s:set>
							    </s:if>									    				    

						    </s:if>						    
						    
							<s:if test="#opt.type=='input'">		
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"  onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:if>
								
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#optid}"  theme="simple" onchange="%{#opt.onChange}" >
									  </s:textfield>
								</s:else>
							</s:if>
							
							<s:elseif test="#opt.type=='image'">
									<img name="${opt.id}" src='<s:url value="download.qact"><s:param name="inputPath" value="%{#optid}"></s:param></s:url>' style="width:${opt.width}px;" class="${opt.validator}" value="${opt.defaultval}" />	
							</s:elseif>
							
							<s:elseif test="#opt.type=='download'">
									<a  href='<s:url value="download.qact"><s:param  name="inputPath" value="%{#optid}"></s:param></s:url>'><s:property value="#opt.msg" /></a>
							</s:elseif>
							
							<s:elseif test="#opt.type=='file'">					
									<s:file name="j_%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									   cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple" onchange="%{#opt.onChange}"></s:file>
							</s:elseif>
							
							<s:elseif test="#opt.type=='datetime'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}"
									   theme="simple" onfocus="selectDateTime(this);" onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" theme="simple"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#optid}" 
									  onfocus="selectDateTime(this);" onchange="%{#opt.onChange}"/>

								</s:else>
							</s:elseif>
							
							<s:elseif test="#opt.type=='date'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" 
									  theme="simple" onfocus="selectDate(this);" onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#optid}" 
									  theme="simple" onfocus="selectDate(this);" onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:else>
							</s:elseif>						
							
							<s:elseif test="#opt.type=='date-year'">					
								<s:if test="#opt.defaultval != null">
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" 
									  theme="simple" onfocus="selectYear(this);" onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:if>
								<s:else>
									<s:textfield  name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;"
									  readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#optid}" 
									  theme="simple" onfocus="selectYear(this);" onchange="%{#opt.onChange}">										
									  </s:textfield>
								</s:else>
							</s:elseif>										
														
							<s:elseif test="#opt.type=='hidden'">
								<s:if test="#opt.defaultval != null">
									<s:hidden name="%{#opt.id}" value="%{#opt.defaultval}" onchange="%{#opt.onChange}"></s:hidden>
								</s:if>
								<s:else>
									<s:hidden name="%{#opt.id}" onchange="%{#opt.onChange}"></s:hidden>							
								</s:else>															
							</s:elseif>
								
							<s:elseif test="#opt.type=='password'">
								<s:if test="#opt.defaultval != null">
									<s:password name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" 
									showPassword="true" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" 
									 value="%{#opt.defaultval}" theme="simple" onchange="%{#opt.onChange}"/>
								</s:if>
								<s:else>
									<s:password name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;" 
									showPassword="true" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" 
									theme="simple" onchange="%{#opt.onChange}"/>
								</s:else>								
								
							</s:elseif>
							
							<s:elseif test="#opt.type=='textarea'">
								<s:if test="#opt.defaultval != null">
									<s:textarea name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;height:%{#opt.height}px"	onchange="%{#opt.onChange}" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#opt.defaultval}" theme="simple"/>
								</s:if>
								<s:else>
									<s:textarea name="%{#opt.id}" key="%{#opt.msg}" cssStyle="width:%{#opt.width}px;height:%{#opt.height}px"	onchange="%{#opt.onChange}" readonly="%{#opt.readonly}" cssClass="%{#opt.validator}" theme="simple"/>				
								</s:else>																
							</s:elseif>					
							
							<s:elseif test="#opt.type=='checkBox'">
								<s:if test="#opt.defaultval != null">
									<s:checkboxlist list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"></s:checkboxlist>
								</s:if>
								<s:else>
									<s:checkboxlist list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" disabled="$%{opt.readonly}" cssClass="%{#opt.validator}" theme="simple"></s:checkboxlist>
								</s:else>																
							</s:elseif>
							
							<s:elseif test="#opt.type=='radioBox'">
								<s:if test="#opt.defaultval != null">
									<s:radio list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" value="%{#opt.defaultval}" theme="simple"></s:radio>
								</s:if>
								<s:else>
									<s:radio list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" theme="simple"></s:radio>
								</s:else>								
							</s:elseif>
							
							<s:elseif test="#opt.type=='select' || #opt.type=='select-null'">
								<s:if test="#opt.defaultval != null">
									<s:select list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" cssStyle="width:%{#opt.width}px;" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}"  value="%{#opt.defaultval}" theme="simple" ></s:select>
								</s:if>
								<s:else>
									<s:select list="#opt.mapRef" name="%{#opt.id}" key="%{#opt.msg}" onchange="%{#opt.onChange}" cssStyle="width:%{#opt.width}px;" disabled="%{#opt.readonly}" cssClass="%{#opt.validator}" theme="simple"></s:select>						
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
										CreateTreeSelect("${opt.id}","<s:property value='%{#optid}'/>",__${opt.id}TreeXML,250,${opt.width},selectMode,'%{#opt.validator}');
									</script>
								</s:else>																
							</s:elseif>		
											
							<s:elseif test="#opt.type=='richEditor'">				
								<fck:editor instanceName="${opt.id}" width="${opt.width}" height="${opt.height}" value="${optid}" >
									<fck:config CustomConfigurationsPath="${pageContext.request.contextPath}/Components/fckeditor/fckconfig.js" />
								</fck:editor>
							</s:elseif>	
								
						    <s:if test="#opt.type!='hidden'">								    
						    	<s:fielderror  theme="simple" templateDir="/WEB-INF/themes" cssClass="errMsg"> <s:param>${opt.id}</s:param> </s:fielderror>	
						    	</td>
 					    	    <s:set var="count" value="#count+1"></s:set>

						    	<s:if test="%{#count % updateApp.column ==0}">
							    	</tr>	
							    </s:if>	
							   		    	
			
						    </s:if>						
					</s:iterator>		
					</table>
					</td>
				</tr>			
			</table>					
		</s:form>
		<s:actionmessage/>	
		<table width="100%">
			<tr><td align="center">
				<s:iterator id="button" value="%{updateApp.actionButton}" status="sta">
					
   						<s:if test="#button.type=='javaScript' " >	
   							<input <s:if test="#button.msg=='保存' ">id="saveBtn" </s:if>type="button" value='<s:text name="%{#button.msg}"/>' onclick="${button.linkRef}" class="updateview-bBtn"/>

   						</s:if>	    						
						<s:elseif test="#button.type=='save' ">
							
							<input type="button" value='<s:text name="%{#button.msg}"/>' onclick="submitTo('${button.linkRef}')" class="updateview-bBtn"/>
						
						</s:elseif>			
						<s:else>
							<input type="button" value='<s:text name="%{#button.msg}"/>' onclick="openURL('${button.linkRef}')" class="updateview-bBtn"/>							
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
