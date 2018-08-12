<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="%{notice.name}"/></title>
<script type="text/javascript">
	//打印
	function printNotice(){		
		var obj = document.getElementById("notice");		
		document.body.innerHTML = obj.innerHTML;
		window.print();
		this.location.reload();
	}
</script>
</head>
<body>
<div>
	<button onclick="printNotice();">打印</button>
	<button onclick="window.close();">推出</button>
</div>
<div style="height: 30px;">

</div>
<div id="notice">
	<s:property value="%{notice.text}"/>
</div>
</body>
</html>