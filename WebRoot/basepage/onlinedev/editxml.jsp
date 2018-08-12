<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
   
    <title>编辑xml配置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/XRegExp.js"></script>
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shCore_min.js"></script>
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shBrushJScript.js"></script>
	<script type="text/javascript" src="Components/syntaxhighlighter/scripts/shBrushXml.js"></script>
	<link type="text/css" rel="stylesheet" href="Components/syntaxhighlighter/styles/shCoreDefault.css"/>
	<link type="text/css" rel="stylesheet" href="Components/syntaxhighlighter/styles/shThemeDefault.css"/>

	<style type="text/css">
		body {
			
			margin: 0px 0px 0px 0px;
		}
		.table_css {
			border-collapse: collapse;
		}
		
		.table_css td {
			border: solid 1px #cfcfcf;
			line-height: 20px;
			padding: 2px;
		}
		
		.table_css th {
			border: solid 1px #A7A6AA;
			line-height: 20px;
			padding: 4px;
			font-size: 12px;
			color: #777779;
			background: #E6E6E6;
		}
		.errd{
			position: absolute;
			left: 5px;
			top: 0px;
			width: 250px;
			height:150px;
			z-index: 20;
			background-color:#f5f5f5;
			border :1px solid Silver;
			overflow:auto;
			white-space: nowrap;
			font-size: 12px;
			color: red;
		}
	</style>
	<script>
		function submitForm(){

			return true;
		}
		document.onreadystatechange = function (){
			if(document.readyState == "complete"){
				var w = document.documentElement.clientWidth;
				var h = document.documentElement.clientHeight;
				document.getElementById("pre_div_code").style.width=(w-100);
				document.getElementById("pre_div_code").style.height=(h-88);
			}
		}
		function editOpen(){
			var codeDiv = findParentElement(document.getElementById("pre_div_code"),".container");
			codeDiv.contentEditable="true";
			codeDiv.focus();

		}
		function realTimeHighlight(){
			SyntaxHighlighter.highlight();
		}
		function editEnd(){
			var code = [];
			var codeDiv = findParentElement(document.getElementById("pre_div_code"),".container");
			codeDiv.contentEditable="false";
			var lines = codeDiv.childNodes;
			for (var i = 0; i < lines.length; i++)
				code.push(lines[i].innerText || lines[i].textContent);
			//元素之间用回车联接
			code = code.join('\r');
			document.getElementById("xmlText").value=code;
		}
		function findElement(target, search, reverse /* optional */)
		{
			if (target == null)
				return null;
			var nodes			= reverse != true ? target.childNodes : [ target.parentNode ],
				propertyToFind	= { '#' : 'id', '.' : 'className' }[search.substr(0, 1)] || 'nodeName',
				expectedValue,
				found
				;
			expectedValue = propertyToFind != 'nodeName'
				? search.substr(1)
				: search.toUpperCase()
				;
			if ((target[propertyToFind] || '').indexOf(expectedValue) != -1)
				return target;
			
			for (var i = 0; nodes && i < nodes.length && found == null; i++)
				found = findElement(nodes[i], search, reverse);
			
			return found;
		}
		/**
		 * 查找clssName元素
		 * @param {Element} 起始元素
		 * @param {String} class 名称
		 * @param {boolean} 向上查找，还是向下查找
		 * @return {Element} 符合条件的最后一个
		 */
		function findParentElement(target, className,reverse)
		{
			return findElement(target, className, reverse);
		}
		function createDiv(v)
		{
			/*var	replaceObj = "&lt;";
			v = v.replace(replaceObj, '<');
			replaceObj = "&gt;";
			v = v.replace(replaceObj, '>');*/
			document.getElementById("errd").innerHTML=v;
			document.getElementById("errd").style.display="block";
		}
		function checkboxHandler(){
			var cks = document.getElementsByName("syncUpdateCk");
			if(cks[0].checked){
				if(!window.confirm("勾选此选项会把源代码替换,是否继续？")){
					cks[0].checked= false;
					document.getElementById("workspacePath").value="";
					document.getElementById("workPath").innerText="";
				}else{
					var v = window.prompt("请输入工作空间地址",wp);
					if(v!=null){
						document.getElementById("workspacePath").value=v;
						document.getElementById("workPath").innerText=v;
						wp = v;
					}
				}
				
			}else{
				document.getElementById("workspacePath").value="";
				document.getElementById("workPath").innerText="";	
			}
			
		}
		var wp="";
	</script>
  </head>
  
  <body style="background: white; font-family: Helvetica">
  	<div class="errd" id="errd" style="display: none" title="双击关闭" ondblclick="this.style.display='none'"></div>
   <form action="updateSource.qact" method="post" target="ifr" onsubmit="return submitForm()" >
   	<input type="hidden" name="id" value="<s:property value="editView.id"/>"/>
   	<input type="hidden" name="xmlText" id="xmlText" value="<s:property value="editView.text" escapeHtml="true"/>"/>
   	<input type="hidden" name="workspacePath" id="workspacePath"></input>


   	<table cellpadding="0" cellspacing="0" width="100%" class="table_css" >
   		<tr>
   			<td colspan="1" align="center"><div style="font-size: 14px;font-weight: bold">编辑页面xml文件</div> </td>
   		</tr>   	
		<tr >

			<td align="right" colspan="1">
			<div style="font-size:13px;float: left;">同步更新到工作空间中<input type="checkbox"  name="syncUpdateCk" value="1" onclick="checkboxHandler()" /> &nbsp;&nbsp;</div> 			
			<div id="workPath" style="font-size:13px;float: left;"></div>
			<input type="button" onclick="editOpen()" value="开始编辑"/>&nbsp;<input type="button" onclick="editEnd()" value="结束编辑"/>&nbsp;<input type="submit" value="提交"/>
			</td>
		</tr>   	

   		<tr >
   			<th  align="left"><s:property value="editView.name"/></th>
 
   		</tr>

   	</table>
	   			<div style="background: white; font-family: Helvetica;" id="pre_div_code">
				<pre class="brush: xml;toolbar:false;quick-code:false;"><s:property value="editView.text" /></pre>
	   			</div>   	
   </form>

   	<script type="text/javascript">SyntaxHighlighter.all();</script>
   	   	<iframe width="0" height="0" style="display:none" name="ifr"/>
  </body>
</html>
