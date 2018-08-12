<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>用户角色管理޹</title>
<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" /> 
<link rel="stylesheet" type="text/css" href="basepage/css/form.css" />  

</head>

<body style="margin-top: 5px;">

<form name="mainFrm" action="insertUserRoles.qact" method="post">
<input ID="roleIdList" NAME="roleIdList" type="hidden" value="">

	
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="normalformTb_s" >
		<tr>
			<td>
				<table class="titleTable">
					<tr>
						<td class="title">
							用户角色分配
						</td>
					</tr>
				</table>											
			</td>
		</tr>
        <tr height="60">
          <td  nowrap class="table2_td_title">用户名：&nbsp;&nbsp;&nbsp;<input name="userId" type="text" style="background-color: #eeeeee;"    value="${userId}" size="15" readonly>
          </td>
        </tr>  
	   <tr>
              <td  class="table2_td_title">用户姓名：<input name="userName" type="text" style="background-color: #eeeeee;"  value="${userName}" size="15" readonly>
              </td>			  
	   </tr> 		
        <tr>
        
          <td valign="middle" align="left"><br><br>
            <table width="400" border="0" cellpadding="0" cellspacing="1" class="table2_border">
              <tr>
                <td width="20%" nowrap class="table2_td_title">系统角色列表：</td>
               <td> &nbsp;</td>
                <td width="20%" class="table2_td_title">该用户所拥有角色：</td>
               
              </tr>             
              <tr class="bg1">
                <td align="center" valign="middle" bgcolor="#FFFFFF">
	                  <s:select list="%{leftMap}" multiple="true" name="RoleL" theme="simple" cssClass="table2_td" cssStyle="width:200; HEIGHT: 200px">
					   </s:select>	                           
				</td>
                <td width="87" height="185" valign="middle" class="table2_td_title1">
                  <input type="button" class="Btn" name="AddRightBtn" value="增加角色&gt;&gt;" onClick="moveSelectItem(document.mainFrm.RoleL,document.mainFrm.RoleR);">                  
                  <p><input type="button" class="Btn" name="RemoveRightBtn" value="&lt;&lt;取消角色" onclick="moveSelectItem(document.mainFrm.RoleR,document.mainFrm.RoleL);">
                </td>
                <td align="center" valign="middle" bgcolor="#FFFFFF"><font class="textsty">
                <s:select list="%{rightMap}" multiple="true" name="RoleR" theme="simple" cssClass="table2_td" cssStyle="width:200; HEIGHT: 200px" >
				 </s:select>         
                </font></td>
              </tr>

            </table>
          </td>
        </tr>

      </table>
      <br/>
		<table>
              <tr valign="middle">
              <td colspan="3" class="table2_btn">
                <div align="center">
                  <input type="button" name="Submit"  class="Btn" value="确 定" onclick="optSubmit();">
                  &nbsp;&nbsp;
                  <input type="button" name="返 回"  class="Btn" value="取 消" onClick="JAVASCRIPT:history.back();">
                </div></td>
              </tr>
            </table>    
<script language="JavaScript">
<!--
function moveSelectItem(locs,mylocs)
{  
  for(var x=0;x<locs.length;x++){
    var opt ;
    if (locs.options[x].selected){
        opt=new Option();
        opt.value=locs.options[x].value;
        opt.text=locs.options[x].text;
    	mylocs.add(opt);
    	locs.options[x]=null;
    }
  }
}



function optSubmit()
{
	var itemColLen=document.mainFrm.RoleR.length;
	var grpIDS="";
	for(var i=0;i<itemColLen+1;i++)
	{
		if(document.mainFrm.RoleR!=null&&document.mainFrm.RoleR.options[i]!=null)
		{
			grpIDS=grpIDS+document.mainFrm.RoleR.options[i].value+":";
		}
		else
			continue;
	}
	document.mainFrm.roleIdList.value=grpIDS;
	document.mainFrm.submit();
}

function document.mainFrm.RoleL.ondblclick()
{
	moveSelectItem(document.mainFrm.RoleL,document.mainFrm.RoleR);
}

function document.mainFrm.RoleR.ondblclick()
{
	moveSelectItem(document.mainFrm.RoleR,document.mainFrm.RoleL);
}

//end --> 
</script>
</form>
</body>
</html>
