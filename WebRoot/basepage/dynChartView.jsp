<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html style="height:100%;">
	<head>
		<base href="<%=basePath%>" />
		<title>${dynChartApp.caption }</title>
		<link rel="stylesheet" type="text/css"	href="basepage/css/BaseCommon.css" />

		<style type="text/css">
		
		</style>
		<script type="text/javascript" src="basepage/javascript/common.js"></script>
		<script type='text/javascript' src='Components/ExtJS/adapter/ext/ext-base.js'></script>
		<script language="JavaScript" src="Components/FusionCharts/JSClass/FusionCharts.js"></script>	
		<script type="text/javascript" src="basepage/javascript/UnicodeAnsi.js"></script>	
		<script type="text/javascript" src="basepage/javascript/base64.js"></script>	
		<script type='text/javascript'>
		//用于读取快速查询的参数
		function getQukParams()
		{
		   //var pars=[];
		   var parStr="";
		   for(var i=0; i<document.all.queryForm.elements.length ;i++)
		   {
		   	 var el=document.all.queryForm.elements(i);	
		   	 if(el.type=='submit' || el.type=='button')
		   	 	continue;
		   	 if(el.type == 'radio' && !el.checked)
		   	 	continue;
		   	 if(el.type == 'checkbox' && !el.checked)
		   	 	continue;
		   	 parStr +=  '[|]';
		   	 parStr +=	(el.name+'-#'+i+'='+el.value);

		   }
		   if(parStr != "")
		   		parStr = parStr.substr(3);	
		   var de=encode64(strUnicode2Ansi(parStr));
		   	
		   return (de);
		   //return encodeURI(parStr);
		}		

		function getAdvParams()
		{
		   if(document.getElementById("advSearch_field") == undefined)
		   {
		   		return '';
		   }  	
		   var advPars=[];
		   if(document.getElementById("advSearch_key").length  == undefined)
		   {
			   	 var field=document.getElementById("advSearch_field").value	;
			   	 var cond=document.getElementById("advSearch_cond").value	;
			   	 var key=document.getElementById("advSearch_key").value	;
				 if(key!="")	   	 	
			   	 	advPars['cond0']=field+"[,]"+cond+"[,]"+key;
		   }
		   else
		   {
			   for(var i=0; i<document.getElementById("advSearch_field").length ;i++)
			   {
			   	 var field=document.getElementById("advSearch_field")[i].value	;
			   	 var cond=document.getElementById("advSearch_cond")[i].value	;
			   	 var key=document.getElementById("advSearch_key")[i].value	;
			
			   	 if(key!="")	
			   	 	advPars['cond'+i]=(field)+"[,]"+cond+"[,]"+key;
			   }   
			}
			var de=encode64(strUnicode2Ansi(Ext.urlEncode(advPars)));
		   return de;
		}

        function getXField()
        {
            var o = document.getElementById("xField");
            var value="";
            for(var i=0;i<o.length;i++){   
                if(o.options[i].selected){
                    value+=o.options[i].value+"[,]";
                }
            }
            if(value !="" )
            	value=value.substr(0,value.length-3);
            return value;
		}
		function getDField()
		{
            var o = document.getElementById("dataField");
            var value="";
            for(var i=0;i<o.length;i++){   
                if(o.options[i].selected){
                    value+=o.options[i].value+"[,]";
                }
            }
            if(value !="" )
            	value=value.substr(0,value.length-3);            
            return value;
		}
		//用于读取所有参数
		function getParams()
		{
		   //var pars=[];
		   var parStr="";
		   parStr="queryParams="+getQukParams();
		   parStr+="&advParams="+getAdvParams();
		   parStr+="&viewId=<s:property value='%{viewId}'/>";
		   parStr+="&tableName=<s:property value='%{tableName}'/>";
		   parStr+="&xField="+getXField();
		   parStr+="&dataField="+getDField();
		   parStr+="&countType="+document.getElementById("countType").value;
		   
		   return encodeURIComponent(parStr);
		   //return encodeURI(parStr);
		}
		
			
		function doChart()//生成Chart图
		{
			if(getXField()==""){
				alert("请选择横纵字段");
				return;
			}
			if(getDField()==""){
				alert("请选择数据字段");
				return;
			}			
			var myChart;
			var url= '<s:property value="%{chartDataAction}"/>.qact';
			var chartType=document.getElementById("chartType").value;
			myChart = new FusionCharts("Components/FusionCharts/Charts/"+chartType, "myFlashChart", "100%", "100%", "0", "1");					
			var params=getParams();			

			myChart.setDataURL(url+"?"+params);
			myChart.addParam("wmode","transparent");
			myChart.render("chartDiv");		
		}
		
				
		//打开高级查询
		 function advSearchShow()
		 {
			document.all.advSearchTab.style.display="block";
			addAdvSearch();
		 }
		 //取消关闭高级查询
		function cancelAdvSearch()
		{
			while(document.all.advSearchTab.rows.length>1)
			{
				document.all.advSearchTab.deleteRow(0);
			}
			document.all.advSearchTab.style.display="none";
		}
		 //增加查询条件
		function addAdvSearch()
		{
			var row=document.all.advSearchTab.insertRow(document.all.advSearchTab.rows.length-1);
			var cell = row.insertCell();
			cell.innerHTML=document.all.advSearchTemplet.rows[0].innerHTML;
		}
		//减少查询条件
		function subAdvSearch()
		{
			if(document.all.advSearchTab.rows.length > 2){
				document.all.advSearchTab.deleteRow(document.all.advSearchTab.rows.length-2);
			}
			else
			{
				cancelAdvSearch();
			}
		}		
</script>


	</head>
	<body style="height:100%;margin: 0px">
		<form method="post" name="postForm">
		</form>
		<%-- 统计选项面板 --%>
		<div id="optionPanel" style="overflow:auto;WIDTH:160px;height:100%;background:#d7d7d7;float:left;" align="left">
			<!-- 快速查询 -->
			
			<table>
				<tr>
					<td>
						<s:select list="%{dynChartApp.xaxis[0].xfield}" listKey="id"
							multiple="true" listValue="msg" headerValue=""
							label="横坐标" name="xField" id="xField"
							cssClass="listview-input" 
							cssStyle="width:140px;" labelposition="top" ></s:select>

					</td>
				</tr>
				<tr>
					<td>

						<s:select
							list="#{'':'','总和值':'sum','最小值':'min','平均值':'avg','最大值':'max'}"
							listKey="value" listValue="key" label="汇总方法" name="countType" id="countType"
							cssClass="listview-input" labelposition="top"
							cssStyle="width:140px;"></s:select>

					</td>
				</tr>
				<tr>
					<td>
						<div id="quickSearch">
							<!-- 快速查询 -->
							<form method="post" name="queryForm" id="queryForm" action="" onsubmit="return false;">
								<table border="0" cellpadding="0" cellspacing="0">

									<tr>
										<td style="word-break: break-all;word-wrap: break-word;">
											<s:if test="%{dynChartApp.advancedSelect.size > 0}">
												<s:iterator id="opt"
													value="%{dynChartApp.advancedSelect[0].option}" status="sta">
													<s:if test="#opt.quickQuery">
														<s:if test="#opt.type!='hidden'">
															<s:text name="%{#opt.msg}"></s:text>：<br />
														</s:if>
														<s:if test="#opt.type=='input' ">
															<s:textfield name="%{#opt.id}" key="%{#opt.msg}"
																value="%{#opt.defaultval}" 
																cssClass="listview-input"
																theme="simple"></s:textfield>
														</s:if>
														<s:elseif
															test="(#opt.type=='select'||#opt.type=='select-null') ">
															<s:select list="#opt.mapRef" key="%{#opt.msg}"
																name="%{#opt.id}" value="%{#opt.defaultval}"
																 cssClass="listview-input"
																theme="simple"></s:select>
														</s:elseif>
														<s:elseif test="#opt.type=='radioBox' ">
															<s:radio list="#opt.mapRef" key="%{#opt.msg}"
																name="%{#opt.id}" value="%{#opt.defaultval}"
																cssClass="listview-input"
																theme="simple"></s:radio>
														</s:elseif>
														<s:elseif test="#opt.type=='checkBox'">
															<s:checkboxlist list="#opt.mapRef" key="%{#opt.msg}"
																name="%{#opt.id}" value="%{#opt.defaultval}"
																cssClass="listview-input"
																theme="simple"></s:checkboxlist>
														</s:elseif>
														<s:elseif test="#opt.type=='textarea'">
															<s:textarea name="%{#opt.id}" key="%{#opt.msg}"
																value="%{#opt.defaultval}" 
																theme="simple" />
														</s:elseif>
														<s:elseif test="#opt.type=='password'">
															<s:password name="%{#opt.id}" key="%{#opt.msg}"
																value="%{#opt.defaultval}" 
																showPassword="true"
																cssClass="listview-input" theme="simple" />
														</s:elseif>
														<s:elseif test="#opt.type=='hidden'">
															<s:hidden name="%{#opt.id}" value="%{#opt.defaultval}"></s:hidden>
														</s:elseif>
														<s:if test="(%{#sta.index+1} % 3) == 0">
															<br />
														</s:if>
													</s:if>

												</s:iterator>
											</s:if>
										</td>
									</tr>

								</table>
							</form>
							<input type="button" value='高级查询' onclick="advSearchShow()"
								class="listview-bBtn" />
							<form method="post" name="advSearchForm" id="advSearchForm"
								action="" onsubmit="return false;" >
								<table id="advSearchTab" class="listview-advSearch">
									<!-- 高级查询 -->
									<tr>
										<td>
											<input type="button" value='增加条件' onclick="addAdvSearch()"
												class="listview-bBtn" style="width:60px; margin:2px;"/>
											<input type="button" value='减少条件' onclick="subAdvSearch()"
												class="listview-bBtn" style="width:60px;margin:2px;"/>
										</td>
									</tr>
								</table>
							</form>
						</div>

						<table id="advSearchTemplet" style="display: none;height:0px;width:0px;">
							<!-- 高级查询的模板 -->
							<s:if test="%{dynChartApp.advancedSelect.size > 0}">
								<tr>
									<td>
										<table  cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<s:text name="list.advSearch.field"></s:text>:<br/>
													<s:select list="%{dynChartApp.advancedSelect[0].option}"
														listKey="id" listValue="%{getText(msg)}"
														key="list.advSearch.field" name="advSearch_field"
														cssClass="listview-input" theme="simple"
														id="advSearch_field">
													</s:select>
												</td>
												<td>
													<s:text name="list.advSearch.cond"></s:text>:<br/>
													<select 　name="advSearch.cond" class="listview-input"
														id="advSearch_cond">
														<option value="=">
															等于
														</option>
														<option value="like">
															包含有
														</option>
														<option value="&gt;">
															大于
														</option>
														<option value="&lt;">
															小于
														</option>
														<option value="&lt;=">
															小于等于
														</option>
														<option value="&gt;=">
															大于等于
														</option>
														<option value="!=">
															不等于
														</option>

													</select>
												</td>

											</tr>
											<tr>
												<td colspan="2">
													<s:text name="list.advSearch.key"></s:text>:
													<input type="text" name="advSearch.key"	class="listview-input" id="advSearch_key" onkeypress="" style="width:100px;"></input>
												</td>												
											</tr>
										</table>
									</td>
								</tr>
							</s:if>
						</table>
					</td>
				</tr>

				<tr>
					<td>

						<s:select list="%{dynChartApp.dataSet[0].dataField}" listKey="id"
							listValue="msg" label="数据列" name="dataField" size="8" id="dataField"
							multiple="true" cssClass="listview-input"
							cssStyle="width:140px;" labelposition="top"></s:select>

					</td>
				</tr>
				<tr>
					<td>
						<s:select
							list="#{'柱图':'ScrollColumn2D.swf','线图':'ScrollLine2D.swf','面积图':'ScrollArea2D.swf'}"
							listKey="value" listValue="key" label="图表类型" name="chartType"
							cssClass="listview-input" cssStyle="width:140px;"
							labelposition="top"></s:select>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" value="生成统计图" onclick="doChart()" />
					</td>
				</tr>
			</table>

		</div>
		<div  style="float:left;height:100%;background-color: #eeeeee;" align="left">
			<%-- Chart图显示DIV --%>
			<div id="chartDiv"	style="height:expression(document.body.clientHeight-50);margin:auto;font-size: 14px;">
				<br/>
				<br/>
				<br/>
				
				请在左侧选择统计选项
				
			</div>
			<%-- 按钮显示区域 --%>
			<table style="height:50px;	margin-left: auto;	margin-right: auto;vertical-align: top" >
				<tr>
					<s:iterator id="button" value="%{dynChartApp.actionButton}">
						<td>
							<s:if test="#button.type=='javaScript'">
								<input type="button" value='<s:text name="%{#button.msg}"/>'
									onclick="${button.linkRef}" class="chartview-bBtn" />
							</s:if>
							<s:else>
								<input type="button" value='<s:text name="%{#button.msg}"/>'
									onclick="openURL('${button.linkRef}')" class="chartview-bBtn" />
							</s:else>
						</td>
					</s:iterator>
				</tr>
			</table>
		</div>
	</body>
</html>
