<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/Components/ExtJS/adapter/jquery/css/screen.css" />
<SCRIPT language=javascript src="${pageContext.request.contextPath}/Components/ExtJS/adapter/jquery/jquery.metadata.js"></SCRIPT>
	<SCRIPT language=javascript src="${pageContext.request.contextPath}/Components/ExtJS/adapter/jquery/jquery.validate.js"></SCRIPT>
	
	<script type="text/javascript">	
					
			$(document).ready(function(){	
			var message = "";
			// 手机号码验证
			   jQuery.validator.addMethod("mobile", function(value, element) {
			    var length = value.length;
			    return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/.test(value));
			   }, "手机号码格式错误!");
			
			   // 电话号码验证
			   jQuery.validator.addMethod("phone", function(value, element) {
			    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
			    return this.optional(element) || (tel.test(value));
			   }, "电话号码格式错误!");
			
			   // 邮政编码验证
			   jQuery.validator.addMethod("zipCode", function(value, element) {
			    var tel = /^[0-9]{6}$/;
			    return this.optional(element) || (tel.test(value));
			   }, "邮政编码格式错误!");
			
				// 验证值double长度精度 例子class="{decimal:[8,2]}"	
			   jQuery.validator.addMethod(	"decimal", function(value, element, param) {
			   var num = /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/;//是不是数字
			   var boo = true;	
			   var valueSp = value.split(".");				   
			   if(!num.test(value))
			   {
			   		boo = false;
			   		message ="不是数字";
			   }
			   else
			   {
				   if(valueSp.length==1)
				   {
				   		if(valueSp[0].length>param[0])
				   		{
				   			boo = false;
				   			message ="长度大于"+param[0];
				   		}
				   }
				   else if(valueSp.length==2)
				   {
				  		if(valueSp[0].length>param[0])
				   		{
				   			boo = false;
				   			message ="长度大于"+param[0];
				   		}
				   		
				   		if(valueSp[1].length>param[1])
				   		{
				   			
				   			boo = false;
				   			message ="精度大于"+param[1];
				   		}
				   }
				   else
				   {
				   		boo = false;
				   		message ="不是全法数字";
				   }
			   }
			    return this.optional(element) || (boo &&  num.test(value));			    
			   }, $.validator.format("输入正确数字,长度小于{0}精度不能超过{1}!"));
			   //更改提示
				//$.validator.messages.decimal = jQuery.format("xxxxx"); 			
				
				$("#form1").validate(					
				{
					//重新定义输出位置
					//errorLabelContainer: "#errorDiv" 
				});
			});
	</script>