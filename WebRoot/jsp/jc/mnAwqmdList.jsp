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
		    $("#mytab").bootstrapTable('hideColumn', 'stid');//--隐藏列stid
		    
		    
		});
		
		var TableInit = function () {
    		var oTableInit = new Object();
    		//初始化Table
   			oTableInit.Init = function () {
				//生成用户数据
				$("#mytab").bootstrapTable({
				    method: 'post',
				    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
				    url:"mnAwqmdWqmdAction!mnAwqmdListPage.qact",//--要请求数据的文件路径
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
				        /*
				        {
				            title:'全选',
				            field:'select',
				            checkbox:true,
				            width:10,
				            align:'center',
				            valign:'middle'
				        },
				        */
				        {
				            title:'stid',
				            field:'stid',
				            hidden:true,
				        },
				        {
				            title:'排口名称',
				            field:'pdoNm'
				        },
				        {
				            title:'时间',
				            field:'tm',
				            //sortable 排序
				            sortable:true
				        },
				        {
				            title:'流量(m³/s)',
				            field:'q',
				            sortable:true
				        },
				        {
				            title:'水温(℃)',
				            field:'wt'
				        },
				        {
				            title:'PH',
				            field:'ph',
				            sortable:true
				        },
				        {
				            title:'CODMn(mg/L)',
				            field:'codmn',
				            sortable:true
				        },
				        {
				            title:'COD(mg/L)',
				            field:'codcr',
				            sortable:true
				        },
				        {
				            title:'氨氮(mg/L)',
				            field:'nh3n',
				            sortable:true
				        },
				        {
				            title:'挥发酚(mg/L)',
				            field:'vlph',
				            sortable:true
				        },
				        {
				            title:'总磷(mg/L)',
				            field:'tp',
				            sortable:true
				        },
				        {
				            title:'总氮(mg/L)',
				            field:'tn',
				            sortable:true
				        },
				        {
				            title:'操作',
				            field:'pdoCd',
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
				
			//--三个参数，value代表该列的值
			function operateFormatter(value,row,index){
				var q = row.q;
				//js判断值是否为undefined
				if(typeof q === 'undefined'){
					q = "";
				}
				var argStr = "'"+ row.stid +"','"+ row.pdoCd +"','"+ row.tm +"','"+ row.pdoNm +"','"+ q +"'";
				var str = '<button type="button" class="btn btn-success btn-xs" onclick="toUpdate(' + argStr +')">修改</button>';
				str += '<button type="button" class="btn btn-danger btn-xs" onclick="toDelete('+ argStr +')">删除</button>';
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
			        pdocd:$('#search_pdocd').val(),
			        pdonm:$('#search_pdonm').val(),
			        addvcd:$('#search_addvcd').val(),
			        rvcd:$('#search_rvcd').val(),
			        powtp:$('#search_powtp').val(),
			        tmB:$('#search_tmB').val(),
			        tmE:$('#search_tmE').val()
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
			$("#mytab").bootstrapTable('refresh', {url: 'mnAwqmdWqmdAction!mnAwqmdListPage.qact'});
		}
		
		//--添加
		function add(){
			location.href = "mnAwqmdWqmdAction!toMnAwqmdAdd.qact?type=3";
		}
		
		//--修改
		function toUpdate(stid,pdoCd,tm,pdoNm,q){
			location.href = "mnAwqmdWqmdAction!toMnAwqmdUpdate.qact?type=2&stid="+stid+"&pdoCd="+pdoCd+"&tm="+tm+"&pdoNm="+pdoNm+"&q="+q;
		}
		
		//--删除
		function toDelete(stid,pdoCd,tm,pdoNm,q){
			if(confirm("确定删除吗？")){
				
				//location.href = "mnAwqmdWqmdAction!deleteMnAwqmdWqmd.qact?stid="+stid+"&tm="+tm;
				$.post("mnAwqmdWqmdAction!deleteMnAwqmdWqmd.qact",{"stid":stid,"tm":tm},function(data){
					if(data == '1'){
						//location.href="mnAwqmdList.jsp";//跳转至列表页
						location.reload(true);
					}else{
						alert("删除失败！");
					}
				});
			}
		}
		
	</script>
    
  </head>
  <body>
  	<div class="ywt-tab-content JS-tab-content">
		<div id="p1" class="active">
			<div class="search-container">
				<div class="form-block form-block-v">
			        <label class="form-label">排口编号</label>
			        <div class="form-box">
			            <input class="form-input form-input-radius" placeholder=""  id="search_pdocd"/>
			        </div>
			    </div>
				<div class="form-block form-block-v">
			        <label class="form-label">排口名称</label>
			        <div class="form-box">
			            <input class="form-input form-input-radius" placeholder="" id="search_pdonm"/>
			        </div>
			    </div>
			    <!-- 
				<div class="form-block form-block-v">
			        <label class="form-label">所在政区</label>
			        <div class="form-box">
			            <input class="form-input form-input-radius" placeholder=""  id="search_addvcd"/>
			        </div>
			    </div>
			    -->
				<div class="form-block form-block-v">
			        <label class="form-label">所在政区</label>
			        <div class="form-box">
			            <select id="search_addvcd" class="selectpicker show-tick form-control" data-live-search="false">
			            	<option value=""></option>
			            	<c:forEach var="list" items="${addvList }">
				            	<option value="${list.addvcd }">${list.addvnm }</option>
			            	</c:forEach>
			            </select>
			        </div>
			    </div>
				<div class="form-block form-block-v">
			        <label class="form-label">所在河湖</label>
			        <div class="form-box">
			            <select id="search_rvcd" class="selectpicker show-tick form-control" data-live-search="false">
			            	<option value=""></option>
			            	<c:forEach var="list" items="${rvList }">
				            	<option value="${list.rvcd }">${list.rvnm }</option>
			            	</c:forEach>
			            	<c:forEach var="list" items="${lkList }">
				            	<option value="${list.lkcd }">${list.lknm }</option>
			            	</c:forEach>
			            </select>
		            </div>
			    </div>
				<div class="form-block form-block-v">
			        <label class="form-label">排水分类</label>
			        <div class="form-box">
			            <select id="search_powtp" class="selectpicker show-tick form-control">
			            	<option value=""></option>
			            	<option value="1">工业废水</option>
							<option value="2">生活污水</option>
							<option value="3">混合废污水</option>
							<option value="4">雨水</option>
			            </select>
			        </div>
			    </div>
			    
				<div class="form-block form-block-v">
			        <label class="form-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间</label>
			        <div class="form-box">
			            <input class="form-input form-input-radius" placeholder="" id="search_tmB" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd',opposite:false});"/>
			        </div>
			    </div>
			    <div class="form-block form-block-v">
			        <label class="form-label">&nbsp;</label>
			        <div class="form-box">
			        	~
			        </div>
		        </div>
				<div class="form-block form-block-v">
			        <label class="form-label">&nbsp;</label>
			        <div class="form-box">
			            <input class="form-input form-input-radius" placeholder="" id="search_tmE" onfocus="WdatePicker({skin:'default',dateFmt:'yyyy-MM-dd',opposite:false});"/>
			        </div>
			    </div>
			    
				<div class="btn-box">
			        <buttton id="search_btn" class="btn btn-info" onclick="search()">查 询</buttton>
			        <buttton class="btn btn-warning" onclick="add()">添 加</buttton>
			        <%--
			        <buttton class="btn btn-success" onclick="">批量导入</buttton>
			        --%>
			    </div>
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
