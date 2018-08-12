<%= "<!-- "+request.getRequestURI()+" -->" %>
<%= "<!-------------------------------------------------------->" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>测试页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Components/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Components/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/all.css">
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/Components/jquery/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Components/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Components/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Components/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/Components/echarts/echarts.min.js"></script>


</head>
<body>
<div class="ywt-tab-content JS-tab-content">
	<div id="p1" class="active">
		<div class="search-container">
			<div class="form-block form-block-v">
		        <label class="form-label">登录名</label>
		        <div class="form-box">
		            <input class="form-input form-input-radius" placeholder=""  id="search_userid"/>
		        </div>
		    </div>
			<div class="form-block form-block-v">
		        <label class="form-label">姓名</label>
		        <div class="form-box">
		            <input class="form-input form-input-radius" placeholder="" id="search_username"/>
		        </div>
		    </div>
			<div class="btn-box">
		        <buttton id="search_btn" class="btn btn-info">查 询</buttton>
		        <buttton class="btn btn-warning" data-toggle="modal" data-target="#addInfo">添 加</buttton>
		        <buttton class="btn btn-success" onclick="pInfo('#68BA1E','mid-center','用水计划导出成功。','info')">导 出</buttton>
		        <button class="btn btn-danger" data-toggle="modal" data-target="#staticInfo">统 计</button>
		    </div>
	    </div>
	    <div class="content-box tz">
	        <div class="content-body">
	            <table id="mytab" class="table-list"></table>
	        </div>
	    </div>
	</div>
</div>

<!-- 添加弹出窗口 -->
<div class="modal fade" id="addInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1024px; height: 450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    	用户信息编辑
                </h4>
            </div>
            <div class="modal-body" >
                <div class="ywt-tab-content JS-tab-content">
                    <div class="active tz ptb16" id="info">
                        <table class="table-edit">
                            <tbody>
                                <tr>
                                    <td class="t-edit-title">登录名</td>
                                    <td>
                                        <div class="form-box">
                                            <input class="form-input form-input-ms input-block form-input-radius" placeholder="" />
                                        </div>
                                    </td>
                                    <td class="t-edit-title">姓名</td>
                                    <td>
                                        <div class="form-box">
                                            <input class="form-input form-input-ms input-block form-input-radius" placeholder="" />
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="t-edit-title t-edit-title-t">手机号</td>
                                    <td>
                                        <input class="form-input form-input-ms input-block form-input-radius"/>
                                    </td>
                                    <td class="t-edit-title">邮箱</td>
                                    <td>
                                        <div class="form-box">
                                            <input class="form-input form-input-ms input-block form-input-radius" placeholder="" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="t-edit-title">地址</td>
                                    <td>
                                        <div class="form-box">
                                            <input class="form-input form-input-ms input-block form-input-radius" placeholder="" />
                                        </div>
                                    </td>
                                    <td class="t-edit-title">所属组织机构</td>
                                    <td>
                                        <div class="select-box select-box-block select-box-ms select-box-radius">
                                            <select class="form-input" placeholder="">
                                                <option>水文局1</option>
                                                <option>水文局2</option>
                                                <option>水文局3</option>
                                                <option>水文局4</option>
                                                <option>水文局5</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success btn-ms" data-dismiss="modal">保存</button>
                <button type="button" class="btn btn-warning btn-ms" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 统计弹出窗口 -->
<div class="modal fade" id="staticInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 724px; height: 350px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    	组织机构用户数量统计
                </h4>
            </div>
            <div class="modal-body" >
                <div class="chart-box" id="chart1" style="height: 350px;width: 700px;"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success btn-ms" data-dismiss="modal">保存</button>
                <button type="button" class="btn btn-warning btn-ms" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
<script type="text/javascript">
//根据窗口调整表格高度
$(window).resize(function() {
    $('#mytab').bootstrapTable('resetView', {
        height: tableHeight()
    })
})
//生成用户数据
$('#mytab').bootstrapTable({
    method: 'post',
    contentType: "application/x-www-form-urlencoded",//必须要有！！！！
    url:"testAction!list.qact",//要请求数据的文件路径
    height:tableHeight(),//高度调整
    toolbar: '#toolbar',//指定工具栏
    striped: true, //是否显示行间隔色
    //dataField: "res",//bootstrap table 可以前端分页也可以后端分页，这里
    //我们使用的是后端分页，后端分页时需返回含有total：总记录数,这个键值好像是固定的  
    //rows： 记录集合 键值可以修改  dataField 自己定义成自己想要的就好
    pageNumber:1, //初始化加载第一页，默认第一页
    pagination:true,//是否分页
    //queryParamsType:'limit',//查询参数组织方式
    queryParams:queryParams,//请求服务器时所传的参数
    sidePagination:'server',//指定服务器端分页
    pageSize:10,//单页记录数
    pageList:[5,10,20,30],//分页步进值
    //showRefresh:true,//刷新按钮
    showColumns:false,
    clickToSelect: true,//是否启用点击选中行
    toolbarAlign:'right',//工具栏对齐方式
    buttonsAlign:'right',//按钮对齐方式
    columns:[
        {
            title:'全选',
            field:'select',
            checkbox:true,
            width:25,
            align:'center',
            valign:'middle'
        },
        {
            title:'登录名',
            field:'userid',
            sortable:true
        },
        {
            title:'姓名',
            field:'username',
            sortable:true
        },
        {
            title:'手机号',
            field:'phone',
        },
        {
            title:'邮箱',
            field:'mail'
        },
        {
            title:'地址',
            field:'address',
            sortable:true
        },
        {
            title:'状态',
            field:'enabled',
            align:'center',
            //列数据格式化
            formatter:operateFormatter
        }
    ],
    locale:'zh-CN',//中文支持,
    responseHandler:function(res){
        //在ajax获取到数据，渲染表格之前，修改数据源
        return res;
    },
    onLoadSuccess: function () {
    	//showTips("数据加载成功！");
    },
    onLoadError: function () {
        //showTips("数据加载失败！");
    },
    onDblClickRow: function (row, $element) {
        //var id = row.ID;
        //EditViewById(id, 'view');
    }
})
//三个参数，value代表该列的值
function operateFormatter(value,row,index){
    if(value==2){
        return '<i class="fa fa-lock" style="color:red"></i>'
    }else if(value==1){
        return '<i class="fa fa-unlock" style="color:green"></i>'
    }else{
        return '数据错误'
    }
}

//请求服务数据时所传参数
function queryParams(params){
    return{
    	pageSize: params.limit,//每页多少条数据
    	pageNumber:(params.offset/params.limit)+1,//请求第几页
    	sort:params.sort,//排序列名
    	order:params.order,//排序方式[desc、asc]
    	
    	//本页面查询条件
        userid:$('#search_userid').val(),
        username:$('#search_username').val()
    }
}

//查询按钮事件
$('#search_btn').click(function(){
    $('#mytab').bootstrapTable('refresh', {url: 'testAction!list.qact'});
})

//tableHeight函数
function tableHeight(){
    //可以根据自己页面情况进行调整
    return $(window).height() -150;
}
</script>
<script>
	var myChart = echarts.init(document.getElementById('chart1'));
	var option1 = {
        title: {
            text: '用户数量(个)',
            x: 'center',
            y: 20,
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        xAxis: {
            type: 'category',
            data: ['江岸区', '江汉区', '硚口区', '武昌区']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            itemStyle: {
                    normal: {
                        color: function(params) {
                            // build a color map as your need.
                            var colorList = [
                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                            ];
                            return colorList[params.dataIndex]
                        },
                        label: {
                            show: true,
                            position: 'top',
                            formatter: '{b}\n{c}'
                        }
                    }
                },
            data: [48, 34, 30, 37],
            type: 'bar'
        }]
    };
	myChart.setOption(option1);
    //var c1 = window.YWT_COMMON.echart($("#chart1"), option1);
</script>