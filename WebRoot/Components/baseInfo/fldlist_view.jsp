<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath1%>">

		<title>数据字典维护_FLDLIST</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<script src="${pageContext.request.contextPath}/Components/DateTimePick/calendar.js" type="text/javascript"></script>
		<SCRIPT language=javascript src="${pageContext.request.contextPath}/Components/ExtJS/adapter/jquery/jquery.js"></SCRIPT>		
		<SCRIPT language=javascript src="Components/baseInfo/dictionary.js"></SCRIPT>		
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Components/baseInfo/css/css.css" />		

	<%@ include file="js/vilidate.jsp" %>
	<script type="text/javascript">		
		function returnPage()
		{
			var url = "QLListView_FLDLIST.List.qact";
			this.location = url;
		}
	
	</script>
	</head>
	<body>	
	<form id="form1" name="form1" action="fldlist_save.qact" method="post">
		<div class="toptabler" style="width:750;">
        <TABLE width=100% border="0" cellpadding="0" cellspacing="0" class="toptabler">
            <TBODY>
                <TR>
                    <TD align=right>							
                        <INPUT class="submit"  type="submit" value="保存">          
                        <INPUT  type="button" value="退出" onclick="returnPage();">                  
                    </TD>
                </TR>					
            </TBODY>
      </TABLE>
    </div>
	<s:hidden name="fldlist.id"></s:hidden>
	<div style="position: absolute;TOP: 95px;left=80"><h4><label id="errorDiv" name="errorDiv" style="font-size:14; color:#993300 "></label></h4></div>
		<TABLE width="750" border="0" align="center" cellpadding="0" cellspacing="4" id="tabsContent">   
          <tr>
              <td valign="top">
              <center><h3>数据字典维护_FLDLIST</h3></center>				
              <table width=100% height="100%" border="0" cellpadding="0" cellspacing="0" class="table_title">
               <tr>
               <td align="left" valign="top" >
               <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	              <tr>
	                  <th align="right" >表名(taben)</th>
	                  <td rowspan="3" ><input type="text" name="fldlist.taben" value="${fldlist.taben}" id="fldlist.taben"  style="width:400px;" class="{maxlength:25}"/></td>                 
	              </tr>                   
              </table>
                </td>
             </tr>
                <tr valign="top">
                  <td align="center">
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <th align="center" >字段名(flden)</th>
                  	<td >
                  	    <s:textfield name="fldlist.flden" cssStyle="width:150px;" theme="simple" cssClass="{required:true,maxlength:30}"/>                    	
                    </td>
                    <th align="center" >字段名称(fldnm)</th>
                    <td >
                    	<s:textfield name="fldlist.fldnm" cssStyle="width:150px;" theme="simple" cssClass="{required:true,maxlength:20}"/>                    	
                    </td>
                  </tr>
                  <tr>
                    <th align="center" >是否可为空(nullid)</th>
                  	<td >
                    	<s:select  name="fldlist.nullid" list="#{'1':'是','0':'否'}" cssStyle="width:150px;" theme="simple" headerValue="请选择"></s:select> 
                    </td>
                    <th align="center" >是否主键(pkid)</th>
                    <td >
                    	<s:select  name="fldlist.pkid" list="#{'1':'是','0':'否'}" cssStyle="width:150px;" theme="simple" headerValue="请选择"></s:select> 
                    </td>
                  </tr>
                  <tr>
                    <th align="center" >字段长度(tpln)</th>
                  	<td >
                  		<s:textfield name="fldlist.tpln" cssStyle="width:150px;" theme="simple" cssClass="{maxlength:4}"/>                     	
                    </td>
                    <th align="center" >单位(fldunt)</th>
                    <td >
                    	<s:textfield name="fldlist.fldunt" cssStyle="width:150px;" theme="simple" cssClass="{maxlength:10}"/>
                    </td>
                  </tr>
                   <tr>
                    <th align="center" >外键引用表名(fktaben)</th>
                  	<td >
                    	<s:textfield name="fldlist.fktaben" cssStyle="width:150px;" theme="simple" cssClass="{maxlength:20}"/>
                    </td>
                    <th align="center" >序号(num)</th>
                    <td >
                    	<s:textfield name="fldlist.num" cssStyle="width:150px;" theme="simple" cssClass="digits"/>
                    </td>
                  </tr>
                  <tr>
                    <th align="center" >是否自增长(isauto)</th>
                  	<td >
                  		<s:select  name="fldlist.isauto" list="#{'1':'是','':'否'}" cssStyle="width:150px;" theme="simple" headerValue="请选择"></s:select>                    	
                    </td>
                    <th align="center" >默认值(defval)</th>
                    <td >
                    	<s:textfield name="fldlist.defval" cssStyle="width:150px;" theme="simple" cssClass="{maxlength:100}"/>
                    </td>
                  </tr>
                  <tr>
                    <th align="center" >样式类型(fdstyle)</th>
                  	<td >
                    	<s:select  name="fldlist.fdstyle" list="#{'0':'—般字段','1':'序列关键字','2':'时间关键字','3':'节点关键字','4':'元数据关键字','5':'序号关键字','6':'其他关键字','7':'非空'}" cssStyle="width:150px;" theme="simple" headerValue="请选择"></s:select>
                    </td>
                    <th align="center" >字段类型(fdtype)</th>
                    <td >
                    	<s:select  name="fldlist.fdtype" list="#{'0':'字符','1':'整型','2':'浮点型','3':'日期','4':'BLOB型','5':'Clob','6':'时间戳'}" cssStyle="width:150px;" theme="simple" headerValue="请选择"></s:select>
                    </td>
                  </tr>
                  
                </table></td>
              </tr>	
	              <tr>
						  <td align="left" valign="top" >&nbsp;&nbsp;&nbsp;备注: </td>
					</tr>
              	<tr>
					  <td align="center" valign="top" >			         
					   <textarea name="fldlist.nt" cols="88" rows="10" id="fldlist.nt">${fldlist.nt}</textarea>
					  </td>
				</tr>
              </table>
              </td>
        </tr>		
    </TABLE>	
         </form>
	</body>
</html>
