<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="ql" uri="/qlight-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>监测录入</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker3.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
	<script type="text/javascript" src="<%=basePath%>Components/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/My97DatePicker/WdatePicker.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrapValidator/bootstrapValidator.css">
	<script type="text/javascript" src="<%=basePath%>Components/bootstrapValidator/bootstrapValidator.js"></script>
   
    <script type="text/javascript">

    	//修改
		function updateTo(){
			var pdoCd = $("#pdoCd").val();//排口代码
			$.post("mnAwqmdWqmdAction!updateMnAwqmdWqmd.qact?pdoCd="+pdoCd,$("#form1").serialize(),function(data){
				if(data == '1'){
					alert("修改成功！");
					//location.href="mnAwqmdList.jsp";//跳转至列表页
					location.href = "mnAwqmdWqmdAction!toMnAwqmdList.qact";
				}else{
					alert("修改失败！");
				}
			});
		}
		
		//添加 -  数据录入
		function insertTo(){
			//var pdoCd = $("#pdoCd").val();//排口代码
			var pdoCd = $("#pdoCd option:selected").val();
				
			if(validateTo()){
				$.post("mnAwqmdWqmdAction!insertMnAwqmdWqmd.qact?pdoCd="+pdoCd,$("#form1").serialize(),function(data){
					if(data == '1'){
						alert("添加成功！");
						location.reload(); 
					}else{
						alert("添加失败！");
					}
				});
			}
			
		}
		
		//添加 - 列表页添加
		function insertTo2(){
			//var pdoCd = $("#pdoCd").val();//排口代码
			var pdoCd = $("#pdoCd option:selected").val();
			if(validateTo()){
				$.post("mnAwqmdWqmdAction!insertMnAwqmdWqmd.qact?pdoCd="+pdoCd,$("#form1").serialize(),function(data){
					if(data == '1'){
						alert("添加成功！");
						//location.href="mnAwqmdList.jsp";//跳转至列表页
						location.href = "mnAwqmdWqmdAction!toMnAwqmdList.qact";
					}else{
						alert("添加失败！");
					}
				});
			}
		}
		
		//非空验证
		function validateTo(){
			//清空验证
			$("#pdoCdSpan").empty();
			$("#tmSpan").empty();
			var cd = $("#pdoCd").val();
			var tm = $("#tm").val();
			if($.trim(cd) == ""){
				$("#pdoCdSpan").html("*必填项");
			  	return false;
			}
			if($.trim(tm) == ""){
				$("#tmSpan").html("*必填项");
			  	return false;
			}
			return true;
		}
		
		//验证是否为数字
		function validateToNum(){
			$("#qSpan").empty();
			var q = $("#q").val();
			return checkNumber(q);
			
		} 
		
		//验证字符串是否是数字
		function checkNumber(theObj) {
		  var reg = /^[0-9]{0,8}+(.[0-9]{1})?/;
		  if (reg.test(theObj)) {
		    return true;
		  }
		  return false;
		}

		
    </script>

  </head>
  
  <body>
			
	  <form class="form-horizontal" id="form1">
	    <fieldset>
			<br/>
		    <div class="form-group">
			    <label for="" class="col-sm-4 control-label">选择排口</label>
			    <div class="col-sm-4">
			      <c:choose>
			      	<c:when test="${type eq '2' }">
			      		<select class="form-control" id="pdoCd">
						  <option name="pdoCd" value="${pdoCd }">${pdoNm }</option>
					    </select>
			      	</c:when>
			      	<c:otherwise>
				      <select class="selectpicker show-tick form-control" data-live-search="false" id="pdoCd">
				      	<option value="">--请选择--</option>
				      	<c:forEach var="list" items="${pfRosdPdoBlist }">
						  <option name="pdoCd" value="${list.pdoCd }">${list.pdoNm }</option>
				      	</c:forEach>
					  </select>
			      	</c:otherwise>
			      </c:choose>
			    </div>
			    <span class="add-on" id="pdoCdSpan" style="color:red"></span>
			</div>
			<div class="form-group">
			    <label for="tm" class="col-sm-4 control-label">时间</label>
			      <div class="col-sm-4">
			        <c:choose>
			      	<c:when test="${type eq '2' }">
					   <input id="stid" class="form-control" type="hidden" name="mnAwqmdWqmd.stid" value="${mnAwqmdWqmd.stid}">
					   <input id="tm" readonly class="form-control" type="text" name="mnAwqmdWqmd.tm" value="${tmStr}">
			      	</c:when>
			      	<c:otherwise>
					   <input id="tm" readonly class="form-control" type="text" name="mnAwqmdWqmd.tm" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss',opposite:false});">
			      	</c:otherwise>
			      </c:choose>
				  </div>
				  <span class="add-on" id="tmSpan" style="color:red"></span>
			</div>
		    <div class="form-group">
			    <label for="q" class="col-sm-4 control-label">流量</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="q" name="q" value="${q}">
			    </div>
	            <span class="add-on">m³/s</span>
	            <span class="add-on" id="qSpan" style="color:red"></span>
			  </div>
			  <div class="form-group">
			    <label for="wt" class="col-sm-4 control-label">水温</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.wt" value="${mnAwqmdWqmd.wt}">
			    </div>
			    <span class="add-on">℃</span>
			  </div>
		      <div class="form-group">
			    <label for="ph" class="col-sm-4 control-label">PH</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.ph" value="${mnAwqmdWqmd.ph}">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="codmn" class="col-sm-4 control-label">COD（Mn）</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.codmn" value="${mnAwqmdWqmd.codmn}">
			    </div>
		        <span class="add-on">mg/L</span>
			  </div>
			  <div class="form-group">
			    <label for="codcr" class="col-sm-4 control-label">COD</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.codcr" value="${mnAwqmdWqmd.codcr}">
			    </div>
		        <span class="add-on">mg/L</span>
			  </div>
			  <div class="form-group">
			    <label for="nh3n" class="col-sm-4 control-label">氨氮</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.nh3n" value="${mnAwqmdWqmd.nh3n}">
			    </div>
		      <span class="add-on">mg/L</span>
			  </div>
			  <div class="form-group">
			    <label for="vlph" class="col-sm-4 control-label">挥发酚</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.vlph" value="${mnAwqmdWqmd.vlph}">
			    </div>
		      <span class="add-on">mg/L</span>
			  </div>
			  <div class="form-group">
			    <label for="tp" class="col-sm-4 control-label">总磷</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.tp" value="${mnAwqmdWqmd.tp}">
			    </div>
		      <span class="add-on">mg/L</span>
			  </div>
			  <div class="form-group">
			    <label for="tn" class="col-sm-4 control-label">总氮</label>
			    <div class="input-append col-sm-4">
			      <input type="text" class="form-control" name="mnAwqmdWqmd.tn" value="${mnAwqmdWqmd.tn}">
			    </div>
		      <span class="add-on">mg/L</span>
			  </div>
			  <!-- 提交 -->
			  <div class="form-group">
			    <div class="col-sm-offset-5 col-sm-7">
			    	<c:choose>
			    		<c:when test="${type eq '2' }">
					      <button type="button" class="btn btn-success" onclick="updateTo()">修改</button>&nbsp;&nbsp;
					      <button type="button" class="btn btn-danger" onclick="history.back(-1);">返回</button>
			    		</c:when>
			    		<c:when test="${type eq '3' }">
					      <button type="button" class="btn btn-success" onclick="insertTo2()">提交</button>&nbsp;&nbsp;
					      <button type="button" class="btn btn-danger" onclick="history.back(-1);">返回</button>
			    		</c:when>
			    		<c:otherwise>
					      <button type="button" class="btn btn-success" onclick="insertTo()">提交</button>&nbsp;&nbsp;
			    		</c:otherwise>
			    	</c:choose>
			    </div>
			  </div>

	    </fieldset>
	  </form>
		
</body>
</html>