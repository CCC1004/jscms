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
    
    <title>流程部署列表</title>
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
	<!-- SweetAlert一款原生JS结合Css3制作的动感弹窗提示框插件 -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>Components/sweetalert/sweetalert2.css">
	<script type="text/javascript" src="<%=basePath%>Components/sweetalert/sweetalert2.js"></script>
	<script type="text/javascript" src="<%=basePath%>Components/sweetalert/es6-promise.auto.js"></script>
	
	<style type="text/css">
		.titleDiv{
			background-color: #3a3a48;
			color: #fff;
			font-size: 15px;
			padding-left: 4px;
			width: 85%;
		}
		
	</style>
    <script type="text/javascript">
	
		$(function () {
		    //1.初始化Table1
		    var oTable = new TableInit();
		   // oTable.Init();
		    //2.初始化Table2
		    var oTable2 = new TableInit2();
		    oTable2.Init();
		    
		});//init ---end
		
		var TableInit = function () {
    		var oTableInit = new Object();
    		//初始化Table
   			oTableInit.Init = function () {
				//生成用户数据
				$("#mytab1").bootstrapTable({
				    method: 'post',
				    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
				    url:"workFlowAction!deploymentPage.qact",//--要请求数据的文件路径
				    height:tableHeight(),//高度调整
				    toolbar: '#toolbar',//指定工具栏
				    striped: true, //是否显示行间隔色
				    pageNumber:1, //初始化加载第一页，默认第一页
				    pagination:true,//是否分页
				    queryParams:queryParams,//请求服务器时所传的参数
				    sidePagination:'server',//指定服务器端分页
				    pageSize:5,//单页记录数
				    pageList:[5,10,20,30],//分页步进值
				    showColumns:false,
				    clickToSelect: true,//是否启用点击选中行
				    toolbarAlign:'right',//工具栏对齐方式
				    buttonsAlign:'right',//按钮对齐方式
				    //--列
				    columns:[
				        {
				            title:'ID',
				            field:'id',
				            sortable:true
				        },
				        {
				            title:'流程名称',
				            field:'name',
				            sortable:true
				        },
				        {
				            title:'创建时间',
				            field:'deploymentTime',
				            sortable:true
				        },
				        {
				            title:'操作',
				            field:'delFormatter'
				        }
					],
				    locale:'zh-CN',//中文支持,
				    responseHandler:function(res){
				        //在ajax获取到数据，渲染表格之前，修改数据源
				        return res;
				    }
				})
	 		};
	 		
	 		//序号
	 		function delFormatter(value,row,index){
	 			var str = '<button type="button" class="tablebtn" onclick="toDelete('+ argStr +')">删除</button>';
	 			return str;
	 		}
	 		
			//请求服务数据时所传参数
			function queryParams(params){
			    return{
			    	pageSize: params.limit,//每页多少条数据
			    	pageNumber:(params.offset/params.limit)+1,//请求第几页
			    	sort:params.sort,//排序列名
			    	order:params.order,//排序方式[desc、asc]
			    	
			    	//--本页面查询条件
			    }
			}
			
			return oTableInit;
		};
		
		var TableInit2 = function () {
    		var oTableInit = new Object();
    		//初始化Table
   			oTableInit.Init = function () {
				//生成用户数据
				$("#mytab2").bootstrapTable({
				    method: 'post',
				    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
				    url:"workFlowAction!processDefinitionPage.qact",//--要请求数据的文件路径
				    height:tableHeight(),//高度调整
				    toolbar: '#toolbar',//指定工具栏
				    striped: true, //是否显示行间隔色
				    pageNumber:1, //初始化加载第一页，默认第一页
				    pagination:true,//是否分页
				    queryParams:queryParams,//请求服务器时所传的参数
				    sidePagination:'server',//指定服务器端分页
				    pageSize:5,//单页记录数
				    pageList:[5,10,20,30],//分页步进值
				    showColumns:false,
				    clickToSelect: true,//是否启用点击选中行
				    toolbarAlign:'right',//工具栏对齐方式
				    buttonsAlign:'right',//按钮对齐方式
				    //--列
				    columns:[
				        {
				            title:'行号',
				            formatter:idFormatter
				        },
				        {
				            title:'guid',
				            field:'guid',
				            hidden:true,
				        },
				        {
				            title:'表标识符',
				            field:'tableIdent',
				            sortable:true
				        },
				        {
				            title:'表名',
				            field:'tableName',
				            sortable:true
				        },
				        {
				            title:'序号',
				            field:'indexnum',
				        },
				        {
				            title:'字段名',
				            field:'fieldname',
				            sortable:true
				        },
				        {
				            title:'字段标识',
				            field:'fieldident',
				        },
				        {
				            title:'类型及长度',
				            field:'charlength',
				        },
				        {
				            title:'可否为空',
				            field:'isnull',
				        },
				        {
				            title:'计量单位',
				            field:'unit',
				        },
				        {
				            title:'主键',
				            field:'pk',
				        },
				        {
				            title:'索引号',
				            field:'refnum',
				        }
					],
				    locale:'zh-CN',//中文支持,
				    responseHandler:function(res){
				        //在ajax获取到数据，渲染表格之前，修改数据源
				        return res;
				    }
				})
	 		};
	 		
	 		//序号
	 		function idFormatter(value,row,index){
	 			return index+1;
	 		}
	 		
			//请求服务数据时所传参数
			function queryParams(params){
			    return{
			    	pageSize: params.limit,//每页多少条数据
			    	pageNumber:(params.offset/params.limit)+1,//请求第几页
			    	sort:params.sort,//排序列名
			    	order:params.order,//排序方式[desc、asc]
			    	
			    	//--本页面查询条件
			    }
			}
			
			return oTableInit;
		};
		
		//tableHeight函数
		function tableHeight(){
		    //可以根据自己页面情况进行调整
		    return $(window).height() -150;
		}

		//根据窗口调整表格高度
		$(window).resize(function() {
		    $("#mytab2").bootstrapTable('resetView', {
		        height: tableHeight()
		    })
		})
		
		//--添加
		function add(){
			location.href = "etdAction!toInsertIdent.qact?result=-1";
		}
		
		//--exportDoc
		function exportDoc(){
			location.href = "etdAction!toExportDoc.qact?result=-1";
		}
		
		
	</script>
    
  </head>
  <body>
  	<div class="ywt-tab-content JS-tab-content active">
		<div id="p1" class="active">
			
			<div class="titleDiv">部署流程定义</div>
			<div class="search-container">
				<form action="workFlowAction!deploy.qact" enctype="multipart/form-data" method="POST">
					<div class="row">
		             	<div class="col-lg-1 col-md-1">
		             		<span style="color:red;">*</span>
					        <label class="form-label">流程名称</label>
		             	</div>
						<div class="col-lg-2 col-md-2">
				            <input type="text" name="processName" autocomplete="off" class="form-input form-input-radius" />
					    </div>
		             	<div class="col-lg-2 col-md-2">
		             		<span style="color:red;">*</span>
					        <label class="form-label">流程文件(ZIP文件)</label>
		             	</div>
						<div class="col-lg-5 col-md-5">
				            <input type="file" name="file" placeholder="请上传ZIP文件"/>
					    </div>
					</div>
				
					<div class="row"> 
						<div class="col-lg-4 col-md-4"></div>
						<div class="col-lg-5 col-md-5">
					        <input type="submit" class="frombtn" value="上传流程"/>
					    </div>
				    </div><!-- row end --> 
				</form>
			</div>
			
		     <!-- table list1 --> 
		     <div class="titleDiv">部署对象列表</div>   
		    <div class='table_lin'>
	            <table id="mytab1" class="table-list"></table>
		    </div>
			
		     <!-- table list2 --> 
		     <div class="titleDiv">流程定义列表</div>   
		    <div class='table_lin'>
	            <table id="mytab2" class="table-list"></table>
		    </div>
		    
		</div>
	</div>
  </body>
</html>

