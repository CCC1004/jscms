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
    
    <title>表描述信息</title>
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
	</style>
    <script type="text/javascript">
	
		$(function () {
		    //1.初始化Table
		    var oTable = new TableInit();
		    oTable.Init();
		    $("#mytab").bootstrapTable('hideColumn', 'guid');//--隐藏列guid
		    
		});//init ---end
		
		var TableInit = function () {
    		var oTableInit = new Object();
    		//初始化Table
   			oTableInit.Init = function () {
				//生成用户数据
				$("#mytab").bootstrapTable({
				    method: 'post',
				    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
				    url:"etdAction!tdListPage.qact",//--要请求数据的文件路径
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
			    	ti:$('#search_ti').val(),
			        tnm:$('#search_tnm').val(),
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
		
		//--查询按钮事件
		function search(){
			$("#mytab").bootstrapTable('refresh', {url: "etdAction!tdListPage.qact"});
		}
		
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
  	<div class="ywt-tab-content JS-tab-content">
		<div id="p1" class="active">
			
			<!-- search start -->
				<div class="search-container">
				<form>
					<div class="row">
		             	<div class="col-lg-1 col-md-1">
					        <label class="form-label">表标识符</label>
		             	</div>
						<div class="col-lg-2 col-md-2">
				            <input  id="search_ti" autocomplete="off" class="form-input form-input-radius" placeholder="请输入表标识符" />
					    </div>
					    <div class="col-lg-1 col-md-1">
					        <label class="form-label">表名</label>
		             	</div>
						<div class="col-lg-2 col-md-2">
				            <input id="search_tnm" autocomplete="off" class="form-input form-input-radius" placeholder="请输入表名" />
				        </div>
					</div>
				
					<div class="row"> 
						<div class="col-lg-4 col-md-4"></div>
						<div class="col-lg-5 col-md-5">
					        <button type="button" id="search_btn" class="frombtn" onclick="search()">查 询</button>
					        <input type="reset" class="frombtn" style="width: 41.56px;" value="重置"/>
					        <button type="button" class="frombtn" onclick="add()">添 加</button>
					        <button type="button" class="frombtn" onclick="exportDoc()">导出DOC</button>
					    </div>
				    </div><!-- row end --> 
				</form>
				</div><!-- search end -->	
		    
		     <!-- table list -->    
		    <div class='table_lin'>
	            <table id="mytab" class="table-list"></table>
		    </div>
		    
		</div>
	</div>
  </body>
</html>

