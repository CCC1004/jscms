<#if (actionErrors?exists && actionErrors?size > 0)>
	<#assign errorTitle=actionErrors[0]><#t/>
	<div style="font-size: 14px;font: bold;COLOR:#FF2000;BACKGROUND: #EEEEEE; BORDER: #aaaaaa 1px solid; PADDING:5px;margin:5px;width:400px;height:100px;">
		<img src="basepage/images/error.png"/> ${errorTitle}
	</div>
    <input type="button" value=" 返 回 " onclick="javascript:history.go(-1)">	
    <input type="button" value="错误详细信息" onclick="switchDe();">
    <BR><BR>
	<div id="errorTopDIV" style="font: bold;COLOR:#FF2000;BORDER: #aaaaaa 1px solid;BACKGROUND: #BBBBBB; PADDING-LEFT:5px;PADDING-TOP:3px;width:100%;height:20px;">错误详细信息</div>
	<div class="errBox" id="errorDIV">		
		<#list actionErrors as error>
			<span class="errorMessage">${error}</span><br/><hr>
		</#list>
	</div>
</#if>
