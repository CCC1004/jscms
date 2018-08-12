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
    
    <title>排放标准修改</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
	<script type="text/javascript" src="<%=basePath%>Components/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/My97DatePicker/WdatePicker.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker3.min.css">
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrapValidator/bootstrapValidator.css">
	<script type="text/javascript" src="<%=basePath%>Components/bootstrapValidator/bootstrapValidator.js"></script>
   
    <script type="text/javascript">
    
    	var index = 0;//下标
    	var result = ${result};
  		/** 指标项select（若指标项需要添加或更正，在此处进行修改）*/
    	var titleList = new Array('COD','BOD','总磷','总氮','氨氮');
  		var addList = new Array();

		$(function(){
    		var len;
    		<c:forEach items="${insppronumBlist}">  
    			len = ${fn:length(insppronumBlist) };
    		</c:forEach>
	   		
    		//select赋值--所有
    		if (len == 0) {
        		for ( var i = 0; i < titleList.length; i++) {
        			var opt = '<option id="title" value="' + titleList[i] + '">' + titleList[i] + '</option>';
    				$("#titleSelect").append(opt);
    			}
    		}else{//select赋值--除去已经存在的指标
		   		index = len;//赋值下标为list长度，用于后续添加指标使用
    			
	    		for ( var i = 0; i < titleList.length; i++) {
	    			var flag = true;//表示没有该指标
	    			var tt = titleList[i];
    				<c:forEach items="${insppronumBlist}" var="list" varStatus="i" > 
	    				var tt2 = "${list.title}";
	    				if(tt == tt2){
			    			flag = false;
			    			continue;
		    			}
	    			</c:forEach>
	    			if(flag){//没有，则添加
	    				var opt = '<option id="title" value="' + tt + '">' + tt + '</option>';
						$("#titleSelect").append(opt);
	    			}
				}//外层for循环
    		}//else end
   		
			//修改失败弹框		   		
    		if(result == '0'){
    			alert("修改失败");
    		}
    	});
    	
    	//添加指标项
    	function addZB(){
    		index += 1;
    		var options=$("#titleSelect option:selected"); //获取选中的项
    		var title = options.val();//获取指标名称
    		if(typeof title === 'undefined'){
    			$("#addzb").prop('disabled', true); // 按钮灰掉，且不可点击。
    		}else{
    			//title不等于undefined，才添加
	    		var str = '<div class="form-group"><label for="" class="col-sm-4 control-label">' + title + '</label>';
				   str += '<div class="col-sm-1"><input type="hidden" name="insppronumBlist[' + index + '].title" value="' + title + '">';
				   str += '<input type="number" class="form-control" name="insppronumBlist[' + index + '].startnum" min="0.00" step="0.01" max="9999.99"></div>';
				   str += '<div class="col-sm-1" align="center"><span class="add-on">~</span></div>';
				   str += '<div class="col-sm-1"><input type="number" class="form-control" name="insppronumBlist[' + index + '].endnum" min="0.00" step="0.01" max="9999.99"></div>';
		           str += '<span class="add-on">mg/L</span></div>';
	            //添加指标项
	    		$("#zhibiao").append(str);
	    		//移除select选中指标项
	    		options.remove();
    		}
    		
    	}
	    
    
    </script>

  </head>
  
  <body>
			
	  <form class="form-horizontal" id="form1" method="post" action="pfRosdPdoAction!updatePfRosdPdo.qact">
	    <fieldset>
			<br/>
		    <div class="form-group">
			    <label for="nm" class="col-sm-4 control-label">标准名称</label>
			    <div class="col-sm-4">
			      <input type="hidden" class="form-control" id="guid" name="pfRosdPdo.guid" value="${pfRosdPdo.guid}">
			      <input type="text" class="form-control" id="nm" name="pfRosdPdo.nm" value="${pfRosdPdo.nm}" maxlength="100">
			    </div>
			    <span class="add-on" id="nmSpan" style="color:red"></span>
			</div>
		    <div class="form-group">
			    <label for="vesion" class="col-sm-4 control-label">版本号</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="vesion" name="pfRosdPdo.vesion" value="${pfRosdPdo.vesion}" maxlength="20">
			    </div>
	            <span class="add-on" id="vesionSpan" style="color:red"></span>
			</div>
			<div class="form-group">
			    <label for="pubdate" class="col-sm-4 control-label">发布时间</label>
		        <div class="col-sm-4">
				   <input id="text_datebox" readonly class="form-control" type="text" name="pfRosdPdo.pubdate" 
				   value="${pubdateStr}" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd HH:mm:ss',opposite:false});">
			    </div>
			</div>
			
			<!-- select -->
		    <div class="form-group">
			    <label for="status" class="col-sm-4 control-label">启用状态</label>
			    <div class="col-sm-4">
			      <select class="form-control" id="status" name="pfRosdPdo.status">
			      	<c:choose>
			      		<c:when test="${pfRosdPdo.status eq '1' }">
						    <option value="1" selected="selected">是</option>
						    <option value="2">否</option>
			      		</c:when>
			      		<c:otherwise>
						    <option value="1">是</option>
						    <option value="2" selected="selected">否</option>
			      		</c:otherwise>
			      	</c:choose>
			      </select>
			    </div>
			</div>
			 
			<div class="search-container col-sm-offset-3  col-sm-5">
				<h2>指标管理</h2>
			</div>
			
		</fieldset>
		<fieldset>
			<br/>
			<div class="form-group">
			    <label for="titleSelect" class="col-sm-4 control-label">指标项</label>
			    <div class="col-sm-3">
			      <select class="form-control" id="titleSelect" name="title">
				    
			      </select>
			    </div>
			    <button id="addzb" type="button" class="btn btn-info" onclick="addZB()">增加指标</button>
			</div>
			
			<!-- 各指标项数据 -->
			<div id="zhibiao">
				<c:forEach var="list" items="${insppronumBlist }" varStatus="i">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">${list.title }</label>
						<div class="col-sm-1">
							<input type="hidden" name="insppronumBlist[${i.index}].guid" value="${list.guid}">
							<input type="hidden" name="insppronumBlist[${i.index}].title" value="${list.title}">
							<input type="number" class="form-control" name="insppronumBlist[${i.index}].startnum" 
							value="${list.startnum }" min="0.00" step="0.01" max="9999.99">
						</div>
						<div class="col-sm-1" align="center"><span class="add-on">~</span></div>
						<div class="col-sm-1">
							<input type="number" class="form-control" name="insppronumBlist[${i.index}].endnum" 
							value="${list.endnum }" min="0.00" step="0.01" max="9999.99">
						</div>
						<span class="add-on">mg/L</span>
					</div>
				</c:forEach>
			</div>
			 
			<br/>
			<!-- 提交 -->
			<div class="form-group">
			  <div class="col-sm-offset-5 col-sm-7">
			    <button type="submit" class="btn btn-success">修改</button>&nbsp;&nbsp;
			    <button type="button" class="btn btn-danger" onclick="history.back(-1);">返回</button>
			  </div>
			</div>

	    </fieldset>
	  </form>
		
</body>
</html>
