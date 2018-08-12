<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<meta http-equiv="imagetoolbar" content="no">
<script language="javascript" src="print.js"></script>
<style media="print">
.Noprint   {DISPLAY:   none;}
</style>
<title>打印测试</title>
</head>
<OBJECT id="factory" style="DISPLAY: none" codeBase="smsx.cab#VVersion=6,3,435,20" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" viewastext></OBJECT>

<script defer>
function window.onload() {   
setPrintBase('页眉','页脚');
}
</script>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<center class="Noprint">
<input type=button value="打印" onclick="factory.printing.Print(true)" class="listview-bBtn" /> 
<input type=button value="页面设置" onclick="factory.printing.PageSetup()" class="listview-bBtn" /> 
<input type=button value="打印预览" onclick="factory.printing.Preview()" class="listview-bBtn" />           
<input type="button" value="关闭" onclick="window.close();" class="listview-bBtn" />
</center>
   <center>
      <table width="100%" border="1" cellpadding="0" cellspacing="0">
      	  <%for(int i=0;i<100;i++){ %>
          <tr>
          	<%for(int j=0;j<100;j++){ %>
          	<td align="center"><b>内容内容内容内容内容内容内容内容内容内容内容内容内容内容<%=j %></b></td>
          	<%} %>
          </tr>
          <%} %>
       </table>
    </center>
</body>
</html>
