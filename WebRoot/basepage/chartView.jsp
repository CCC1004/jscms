<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html style="height:100%;">
	<head>
		<title>
			${chartApp.caption}
		</title>
		<s:set name="hasTreeSelect" value="0"></s:set>
		<s:set name="hasDateSelect" value="0"></s:set>		
		<s:iterator id="opt" value="%{chartApp.advancedSelect[0].option}">
			<s:if test="#opt.type=='treeSelect'">	
				<s:set name="hasTreeSelect" value="1"></s:set>
			</s:if>
			<s:if test="#opt.type=='datetime' || #opt.type=='date' || #opt.type=='date-year'">	
				<s:set name="hasDateSelect" value="1"></s:set>
			</s:if>			
		</s:iterator>			
		<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" />

		<style type="text/css">

		</style>
		<script type="text/javascript" src="basepage/javascript/common.js"></script>	
		<script type="text/javascript" src="basepage/javascript/UnicodeAnsi.js"></script>	
		<script type="text/javascript" src="basepage/javascript/base64.js"></script>	
		<s:iterator id="js" value="%{chartApp.javaScript}">
			<script type="text/javascript" src="<%=request.getContextPath()%>${js.src}"></script>	
		</s:iterator>		
		<script language="JavaScript" src="Components/FusionCharts/JSClass/FusionCharts.js"></script>	
		<script type='text/javascript' src='Components/ExtJS/adapter/ext/ext-base.js'></script>
        <s:if test="#hasDateSelect==1">
        	<script src="Components/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        </s:if>
        <s:if test="#hasTreeSelect==1">	
        	<script src="Components/TreeSelect/xtree.js" type="text/javascript"></script>
        	<script src="Components/TreeSelect/treeselect.js" type="text/javascript"></script>
        </s:if>			
		<%--base href必需放在导入My97DatePicker js的后面，否则在IE6下My97DatePicker会出错--%>
		<base href="<%=basePath%>" />        
		<script type='text/javascript'>


		//用于读取快速查询的参数
		function getParams()
		{
		   //var pars=[];
		   var parStr="";
		   var i;
		   var queryForm=document.getElementById("queryForm");
		   for(i=0; queryForm && i<queryForm.elements.length ;i++)
		   {
		   	 var el=queryForm.elements(i);	
		   	 if(el.type=='submit' || el.type=='button')
		   	 	continue;
		   	 if(el.type == 'radio' && !el.checked)
		   	 	continue;
		   	 if(el.type == 'checkbox' && !el.checked)
		   	 	continue;
		   	 parStr +=  '[|]';
		   	 parStr +=	(el.name+'-#'+i+'='+el.value);
			 //alert(parStr) ;
		   	 //pars[el.name+'-#'+i]=el.value;
		   }
<%--//把主页面所收到的参数再传递给数据读取的Action
这里由于参数名称可能是javaScript的保留关键字，所以在参数名前后加上下划线，在Action里接收时必需进行还原。
--%>
<s:iterator value="%{defParams}" >   
		   	 parStr +=  '[|]';
		   	 parStr +=	('<s:property value="key" />-#'+i+'='+'<s:iterator  value="value" status="sta"><s:property escape="false"  escapeJavaScript="true"/><s:if test="!#sta.last">,</s:if></s:iterator>');
		   	 i++;
</s:iterator>    		   
		   if(parStr != "")
		   		parStr = parStr.substr(3);	
		   var de=encode64(strUnicode2Ansi(parStr));
		   	
		   //return encodeURIComponent(Ext.urlEncode(pars));
		   //alert(de);
		   return (de);
		   //return encodeURI(parStr);
		}
		function submitTo(url) {

				document.all.postForm.action = url ;
				document.all.postForm.submit() ;
		}	
			
		function quickSearch()//快速查询
		{
			var chartObj = getChartFromId("myFlashChart");		
			var url1 =url+ "?t="+Date.parse(new Date());
			url1 += "&queryParams="+getParams();
			url1 = encodeURIComponent(url1);	
			chartObj.setDataURL(url1);		
		}
var btnAreaSize=0;
<s:if test="%{chartApp.actionButton.size > 0}">
	btnAreaSize=50;
</s:if>		

</script>			
		 		
	</head>
	<body style="height:100%;margin: 0px;padding: 0px;">
		<table style="height:100%;" width="100%" border="0" cellpadding="0" cellspacing="0">
			<s:if test="%{quickQueryCount > 0}">				
				<tr>
				<td id="qQueryTD" height="1">
					<form  method="post" name="queryForm" id="queryForm" action="" onsubmit="return false;" style="margin: 0px;padding: 0px;border: 0px;">	
								<s:if test="chartApp.advancedSelect[0].include != null ">
									<s:include value="%{chartApp.advancedSelect[0].include}"></s:include>
								</s:if>
								<s:else>
								<%int index = 1; %>
								<table class="quickSearchTable">
								<s:iterator id="opt" value="%{chartApp.advancedSelect[0].option}" status="sta">
									<s:if test="#opt.quickQuery">
										<%if((index%5) == 0){ %>
											<tr>
										<%} %>
										<s:if test="#opt.type!='hidden'">
											<%index++; %>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="%{#opt.msg}"></s:text>：</td>
										</s:if>
										<s:if test="#opt.type=='input' ">
											<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												onkeypress="enterToChange();" cssClass="listview-input"
												theme="simple"></s:textfield></td>
										</s:if>
										<s:elseif test="(#opt.type=='select'||#opt.type=='select-null') ">
											<td><s:select list="#opt.mapRef" key="%{#opt.msg}"
												name="%{#opt.id}" value="%{#opt.defaultval}"
												onchange="quickSearch();" cssClass="listview-input"
												theme="simple"></s:select></td>
										</s:elseif>
										<s:elseif test="#opt.type=='radioBox' ">
											<td><s:radio list="#opt.mapRef" key="%{#opt.msg}" name="%{#opt.id}"
												value="%{#opt.defaultval}" onclick="quickSearch();"
												cssClass="listview-input" theme="simple"></s:radio></td>
										</s:elseif>
										<s:elseif test="#opt.type=='checkBox'">
											<td><s:checkboxlist list="#opt.mapRef" key="%{#opt.msg}"
												name="%{#opt.id}" value="%{#opt.defaultval}"
												onclick="quickSearch();" cssClass="listview-input"
												theme="simple"></s:checkboxlist></td>
										</s:elseif>
										<s:elseif test="#opt.type=='textarea'">
											<td><s:textarea name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												theme="simple" /></td>
										</s:elseif>
										<s:elseif test="#opt.type=='password'">
											<td><s:password name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												onkeypress="enterToChange();" showPassword="true"
												cssClass="listview-input" theme="simple" /></td>
										</s:elseif>
										<s:elseif test="#opt.type=='date'">
											<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												onkeypress="enterToChange();" cssClass="listview-input"
												theme="simple" onfocus="selectDate(this);"></s:textfield></td>
										</s:elseif>			
										<s:elseif test="#opt.type=='datetime'">
											<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												onkeypress="enterToChange();" cssClass="listview-input"
												theme="simple" onfocus="selectDateTime(this);"></s:textfield></td>
										</s:elseif>			
										<s:elseif test="#opt.type=='date-year'">
											<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
												value="%{#opt.defaultval}" onchange="quickSearch();"
												onkeypress="enterToChange();" cssClass="listview-input"
												theme="simple" onfocus="selectYear(this);"></s:textfield></td>
										</s:elseif>																			
										<s:elseif test="#opt.type=='hidden'">
											<s:hidden name="%{#opt.id}" value="%{#opt.defaultval}"></s:hidden>
										</s:elseif>
										<%if((index%4) == 0){ %>
											</tr>
											<%index = 1; %>
										<%}%>
									</s:if>
	
								</s:iterator>
								</table>
								</s:else>
					</form>										
				</td>
				</tr>
				
			</s:if>		
			<tr id="grid-tr" >
				<td>
					<div id="chartDiv" style="vertical-align: top;" align="center">	
					</div>
				</td>
			</tr>
			<s:if test="%{chartApp.actionButton.size > 0}">
				<tr style="height:50px" >
					<td style="vertical-align:middle">
						<table class="listview-btnArea">
							<tr>
								<s:iterator id="button" value="%{chartApp.actionButton}">
									<td >
										<s:if test="#button.type=='javaScript'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="${button.linkRef}" class="chartview-bBtn" />
										</s:if>

										<s:elseif test="#button.type=='action' ">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="submitTo('${button.linkRef}','${button.needSelect}')"
												class="chartview-bBtn" />
										</s:elseif>									
										<s:else>
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="openURL('${button.linkRef}')" class="chartview-bBtn" />
										</s:else>
										
									</td>
								</s:iterator>
							</tr>
						</table>
					</td>
				</tr>
			</s:if>	
	</table>
	<form  method="post" name="postForm" style="margin: 0px;padding: 0px;border: 0px;height:0px;">	
	</form>


   <script type="text/javascript">
	var myChart;
	var url= '<s:property value="%{chartDataAction}"/>.qact';
	myChart = new FusionCharts("Components/FusionCharts/Charts/<s:property value='%{swfFileName}'/>?ChartNoDataText=没有数据", "myFlashChart", "${chartApp.width}", "${chartApp.height}", "0", "1");
	var url1 =url+ "?t="+Date.parse(new Date());
	url1 += "&queryParams="+getParams();
	url1 = encodeURIComponent(url1);
	myChart.setDataURL(url1);
	myChart.addParam("wmode","transparent");
	window.onload=function(){
		var qtdh=0;
		if(document.getElementById("qQueryTD"))
			qtdh=document.getElementById("qQueryTD").scrollHeight;
		var h=document.documentElement.clientHeight - qtdh - btnAreaSize;
		document.getElementById("chartDiv").style.height=h+"px";
		myChart.render("chartDiv");		
	}
	
 	
   </script>
				
	</body>
</html>
