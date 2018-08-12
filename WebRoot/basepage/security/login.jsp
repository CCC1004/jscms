<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.security.AuthenticationException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SSM-QLIGHT管理系统——登录</title>
<link href="../css/login.css" type="text/css" rel="stylesheet" media="all" />
<script type="text/javascript">
//写cookies函数 
function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
    var hour=2;
    var exp  = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + hour*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)//取cookies函数        
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;

}

function delCookie(name)//删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null) document.cookie= name + "="+";expires="+exp.toGMTString();
}

function submitLogin(){
	SetCookie("L_username",document.getElementById("j_username").value);
	SetCookie("L_password",document.getElementById("j_password").value);		
}
</script>
</head>

<body>
<div id="wrapperL">
   <div id="login2">
        <div><!--<img src="../images/login/logo.png" />--></div>
        <div class="loginC">
            <div class="contM">
            	<form  action="<%=request.getContextPath()%>/j_spring_security_check" method="post"  name="loginf">
	                <div class="fix">
	                      <span class="fl w80 h24 tr">用户名：</span>
	                      <!-- <div><input type="text" name="j_username" id="j_username" class="textBg"  placeholder="输入用户名"  value="请输入用户名" onfocus="if(value=='请输入用户名') {value=''}" onblur="if (value=='') {value='请输入用户名'}"/></div> -->
	                      <div><input type="text" name="j_username" id="j_username" class="textBg"  placeholder="请输入用户名" value="" /></div>
	                </div>
	                <div class="fix mt15">
	                      <span class="fl w80 h24 tr">密&nbsp;&nbsp;码：</span>
	                      <div><input type="password" name="j_password" id="j_password" class="textBg"  placeholder="请输入密码" value="" /></div>
	                </div>
	                <div class="fix mt25" style="float:right;margin-right:35px;">
	                      <div class="fl w130 tr"><input type="submit" class="btnS" value="" onclick="submitLogin()"/></div>
	                      <div class="fl w130 tr"><input type="reset" class="btnR" value="" /></div>
	                </div>
                </form>
            </div>
        </div>
   </div>
   <div style="margin-top:440px;text-align: center;">
	<font color="red">
		<span id="errorText" >
			<%
				if(request.getParameter("first") == null && session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") != null)
				{
			%>
			<script>		
			delCookie("L_username");
			delCookie("L_password");
			</script>		
					用户名或密码无效，请重新输入！
			
			<%
					session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
				} 
			%>				
		</span>
	</font>	
   </div>     
</div>
<script>

var username=getCookie("L_username");
var pwd=getCookie("L_password");
if(username){
	document.getElementById("j_username").value=username;
	document.getElementById("j_password").value=pwd;
}
</script>
</body>
</html>
