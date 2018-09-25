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
    
    <title>导出doc</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>pageframe/css/whpk.css">
	<script type="text/javascript" src="<%=basePath%>Components/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/My97DatePicker/WdatePicker.js"></script>
    <!-- SweetAlert一款原生JS结合Css3制作的动感弹窗提示框插件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/sweetalert/sweetalert2.css">
	<script type="text/javascript" src="<%=basePath%>Components/sweetalert/sweetalert2.js"></script>
	<!-- SweetAlert一款原生JS结合Css3制作的动感弹窗提示框插件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/sweetalert/sweetalert2.css">
	<script type="text/javascript" src="<%=basePath%>Components/sweetalert/sweetalert2.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/sweetalert/es6-promise.auto.js"></script>
	        
	<style type="text/css">
	input::-webkit-input-placeholder {
	    /* placeholder颜色  */
	    color: #999;
	    /* placeholder字体大小  */
	    font-size: 12px;
	    /* placeholder位置  */
	   /* text-align: right;  */
	}
	</style>
    <script type="text/javascript">
    
    	var result = "${result}";
    	$(function(){
    		if(result != '-1'){
    			if(result == '1'){
    				swal({
       				  type: 'success',
       				  title: 'exportDoc成功！',
       				})
    			}
    			else{
        			swal({
         				  type: 'error',
         				  title: '保存失败！',
         				})
        		}
    		}
    	});/* init---end */
    	
    	
   		var index = 0;//下标
    	//添加指标项
    	function addZB(){
   			index += 1;
    		var str = '<div class="newrow1"><div align="center"><div class="col-lg-5 col-md-5">' + index + '</div>';
			   str += '<input type="text" required id="tableIdent' + index + '" name="tbList[' + index + ']" value="" class="new-input-2" placeholder="请输入表标识" autocomplete="off">';
			   str += '</div></div>';
            //添加指标项
    		$("#td").append(str);
    		
    	}
   		
    	//返回
    	function backTo(){
    		location.href = "etdAction!toTableIdentList.qact";
    	}
    	
    
    </script>

  </head>
  
  <body>
			
	  <form class="" id="form1" method="post" action="etdAction!expWordFile.qact">
	  	<br/>
		<div class="main">
	         <div class="newrow1">
	            <div class="col-lg-2 col-md-2 col-lg-offset-3 col-md-offset-3"><span style="color:red">*</span>Excel路径：</div>
	            <div class="col-lg-5 col-md-5">
			      	<input type="text" id="excelPath" name="excelPath" required value="E:\tableIdent.xls" class="new-input" placeholder="请输入Excel路径" autocomplete="off">
	            </div>
	         </div> 
	        <div class="title">
			    <button id="addzb" type="button" class="frombtn" onclick="addZB()">添加表标识符</button>
	        </div>	
	         <!-- 表标识符数据 -->
			 <div id="td">
			 </div>
			 
			 <br/>
	         <!-- 提交 -->
	         <div align="center">
			    <button type="submit" class="frombtn" >提交</button>&nbsp;&nbsp;
			    <button type="button" class="frombtn" onclick="backTo();">返回</button>&nbsp;&nbsp;
			 </div>
			 <br/>
	     </div>    
			
	  </form>
</body>
</html>
