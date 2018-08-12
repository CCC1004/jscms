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
	
    <script type="text/javascript">
	
		$(function () {
		    //1.初始化Table
		    var oTable = new TableInit();
		    oTable.Init();
		    
		});
		
		var TableInit = function () {
    		var oTableInit = new Object();
    		//初始化Table
   			oTableInit.Init = function () {
				//生成用户数据
				$("#mytab").bootstrapTable({
				    method: 'post',
				    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
				    url:"pfRosdPdoAction!pfRosdPdoListPage.qact",//--要请求数据的文件路径
				    height:tableHeight(),//高度调整
				    toolbar: '#toolbar',//指定工具栏
				    striped: true, //是否显示行间隔色
				    pageNumber:1, //初始化加载第一页，默认第一页
				    pagination:true,//是否分页
				    queryParams:queryParams,//请求服务器时所传的参数
				    sidePagination:'server',//指定服务器端分页
				    pageSize:10,//单页记录数
				    pageList:[5,10,20,30],//分页步进值
				    showColumns:false,
				    clickToSelect: true,//是否启用点击选中行
				    toolbarAlign:'right',//工具栏对齐方式
				    buttonsAlign:'right',//按钮对齐方式
				    columns:[
				        {
				            title:'序号',
				            formatter:idFormatter
				        },
				        {
				            title:'排放标准名称',
				            field:'nm'
				        },
				        {
				            title:'标准版本号',
				            field:'vesion',
				            sortable:true
				        },
				        {
				            title:'发布时间',
				            field:'pubdate',
				            //sortable 排序
				            sortable:true
				        },
				        {
				            title:'状态',
				            field:'status',
				            //列数据格式化
				            formatter:statusFormatter
				        },
				        {
				            title:'操作',
				            field:'guid',
				            align:'center',
				            //列数据格式化
				            formatter:operateFormatter
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
	 		
	 		//启用状态
	 		function statusFormatter(value,row,index){
	 			if(value==1){
	 				return '启用';
	 			}else{
	 				return '未启用';  
	 			}
	 		}
				
			//--三个参数，其中value代表该列的值；row表示当前行的数据；index表示当前行的下标
			function operateFormatter(value,row,index){
				var guid = "'"+value+"'";
				var str = '<button type="button" class="btn btn-success btn-xs" onclick="toUpdate(' + guid + ')">修改</button>';
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
		
		//tableHeight函数
		function tableHeight(){
		    //可以根据自己页面情况进行调整
		    return $(window).height() -150;
		}

		//根据窗口调整表格高度
		$(window).resize(function() {
		    $("#mytab").bootstrapTable('resetView', {
		        height: tableHeight()
		    })
		})
		
		//--添加
		function add(){
			location.href = "pfRosdPdoAction!toPfRosdPdoAdd.qact?result=-1";
		}
		
		//--修改
		function toUpdate(guid){
			location.href = "pfRosdPdoAction!toPfRosdPdoUpdate.qact?result=-1&guid="+guid;
		}
		
	</script>
    
  </head>
  <body>
  	<div class="ywt-tab-content JS-tab-content">
		<div id="p1" class="active">
			<div class="btn-box" style="float: right;margin-right: 24px">
		        <button class="btn btn-warning" onclick="add()">添 加</button>
		    </div>
			<div class="search-container">
			</div>
		    <div class="content-box tz">
		        <div class="content-body">
		            <table id="mytab" class="table-list"></table>
		        </div>
		    </div>
		</div>
	</div>
    
  </body>
</html>

