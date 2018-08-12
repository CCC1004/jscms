<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html style="height:100%;">
	<head>
		<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"></object>
		<base href="<%=basePath%>" />
		<title><s:text name="#listApp.title" /></title>
		<link rel="stylesheet" type="text/css"
			href="basepage/css/BaseCommon.css" />
		<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/plugin/ux.maximgb.treegrid/css/TreeGrid.css" />
		<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/plugin/ux.maximgb.treegrid/css/TreeGridLevels.css" />

		<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/plugin/GroupHeaderPlugin/GroupHeaderPlugin.css" />

		<link rel="stylesheet" type="text/css" href="basepage/css/divCard.css" />
		<link rel="stylesheet" type="text/css"
			href="Components/ExtJS/plugin/gridSummary/summary.css" />
		<link rel="stylesheet" type="text/css"
			href="basepage/css/ext-patch.css" />
		<style type="text/css">
		
    /*显示竖线*/
    .x-grid3-cell-inner{
        border-right: 1px solid #eceff6;
    }
	 /*去除最右侧边框*/
    .x-grid3-row{border-right-width:0px;}
    /*与表头对齐*/
	.x-grid3-row-table{	
		border-left: 1px solid white;
	}
    /*toolbar隐藏时不留白条*/
	.x-panel-tbar x-hide-display{		
		height:0px;
	}
	.x-grid3-row-radioBtn{background-image:url(Components/ExtJS/resources/images/default/grid/row-radio-sprite.gif); /*一个radio图片*/}
	
</style>
		<script type='text/javascript'
			src='Components/ExtJS/adapter/ext/ext-base.js'></script>
		<script type='text/javascript' src='Components/ExtJS/ext-all-debug.js'></script>
		<script type='text/javascript'
			src='Components/ExtJS/ext-lang-zh_CN.js'></script>
		<script type='text/javascript'
			src='Components/ExtJS/plugin/ux.maximgb.treegrid/TreeGrid.js'></script>
		<script type='text/javascript'
			src='Components/ExtJS/plugin/GroupHeaderPlugin/GroupHeaderPlugin.js'></script>
		<script type='text/javascript'
			src='Components/ExtJS/plugin/gridSummary/exJsonReader.js'></script>
		<script type='text/javascript'
			src='Components/ExtJS/plugin/gridSummary/gridSummary.js'></script>
		<script type="text/javascript" src="basepage/javascript/common.js"></script>
		<script type="text/javascript" src="basepage/javascript/listview.js"></script>
		<s:iterator id="js" value="%{listApp.javaScript}">
			<script type="text/javascript" src="${js.src}"></script>
		</s:iterator>

		<script type='text/javascript'>
 Ext.BLANK_IMAGE_URL = 'Components/ExtJS/resources/images/default/s.gif';
 var grid;
 var pageSize=<s:property value="#listApp.pageSize"/>;			
Controller = function()
{
	function createGrid()
	{
    var record = Ext.data.Record.create([
<s:iterator id="prop" value="%{propList}" status="sta">
	<s:if test="#prop.type == 'checkBox' || #prop.type == 'radioBox'">								
		{name: '_table_pk'},
	</s:if>
	<s:elseif test="#prop.type == 'link' ">
		{name:'${prop.id}-${sta.index}url'},
	</s:elseif>
	<s:else>
  		{name:'${prop.id}-${sta.index}'},
  	</s:else>
  	
  	<s:if test="#prop.link.size > 0 && #prop.type != 'link'">
  		{name:'${prop.id}-${sta.index}url'},
  	</s:if>
</s:iterator>    

<s:if test="%{listApp.tabFrame.size > 0}">
	<s:iterator id="tab" value="%{listApp.tabFrame[0].tab}" status="sta">
	  		{name:'_tab_param-${sta.index}'},
	</s:iterator> 
</s:if>
   		{name: '_is_leaf'},
   		{name: '_parent_pk'}
   		
   	]);
    
	var jsonRd = new Ext.ux.exJsonReader(
				{
					id: '_table_pk',
					root: 'dataList',
					totalProperty: 'total',
					successProperty: 'success'
				}, 
				record
			);
	// create the data store
    var store = new Ext.ux.maximgb.treegrid.AdjacencyListStore({
    	autoLoad : false,
    	is_tree: <s:property value="#listApp.treeList"/>,
    	remoteSort:true,
    	url:'${listDataAction}.action',
		reader: jsonRd
    });
	store.on("loadexception", function() {
	   alert('数据读取出错！');
	});     
    //每次读取数据时读取查询参数
	store.on('beforeload',function(){
      Ext.apply(
      this.baseParams,
      {
           queryParams:'<s:property value="%{queryParams}" escape="false"/>',
           advParams:'<s:property value="%{advParams}" escape="false"/>',
           viewId:'<s:property value="%{viewId}"/>',
           tableName:'<s:property value="%{tableName}"/>'
      });
<%--//把主页面所收到的参数再传递给数据读取的Action
--%>      
<s:iterator value="%{defParams}" >    		
       this.baseParams['<s:property value="key" />']='<s:iterator  value="value" status="sta"><s:property escape="false" escapeJavaScript="true"/><s:if test="!#sta.last">,</s:if></s:iterator>';             
</s:iterator>            
    });
		
  // store.load();
	//alert(store.getCount());
	
   	var sm = new Ext.grid.CheckboxSelectionModel();
   //	sm.handleMouseDown = Ext.emptyFn;//这个方法可以在点击行的时候不会选择checkbox
<s:iterator id="prop" value="%{propList}" status="sta" >
	<s:if test="#prop.type == 'radioBox'">								
		sm.singleSelect=true; //true单选；false多选[默认]
	</s:if>
</s:iterator>    

    var renderSummary = function(o, cm, cfg,row) {
    	//debugger;
    	if(jsonRd.footData == null)
    		return '';
    	if(row==1)
    		return jsonRd.footData.sum[cm.id];
    	else if(row==2)
    		return jsonRd.footData.avg[cm.id];
    	else if(row==3)
    		return jsonRd.footData.max[cm.id];
    	else if(row==4)
    		return jsonRd.footData.min[cm.id];
    	else
    		return '';


    }
   	
   	var colModel = new Ext.grid.ColumnModel({
   	columns:[
   		
<s:iterator id="prop" value="%{propList}" status="sta" >
	<s:if test="#prop.type == 'checkBox' || #prop.type == 'radioBox'">								
		sm
	</s:if>
	<s:elseif test="#prop.type == 'link' ">
		{header:'<s:text name="#prop.msg" />',sortable:false,dataIndex:'${prop.id}-${sta.index}url'
		,renderer:<s:if test="#prop.link[0].type == 'javaScript'" >jsLinkRd</s:if><s:else>linkRd</s:else>
		,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>}
	</s:elseif>
  	<s:elseif test="#prop.link.size > 0 && #prop.type != 'link'">
  		{header:'<s:text name="#prop.msg" />',sortable:true,dataIndex:'${prop.id}-${sta.index}'
  		,renderer:<s:if test="#prop.link[0].type == 'javaScript'" >jsLinkRd2</s:if><s:else>linkRd2</s:else>
  		,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>}
  	</s:elseif>	
	<s:else>
  		{header:'<s:text name="#prop.msg" />',sortable:true,dataIndex:'${prop.id}-${sta.index}'
  		,renderer:dataCellRenderer
  		,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>}
  	</s:else> 	
  	
  	<s:if test="!#sta.last">
  	,
  	</s:if>

</s:iterator>     			
],
		rows: [${fieldGroup}],
		foot:{sum:${sumFoot},avg:${avgFoot},max:${maxFoot},min:${minFoot}}
});	
	<%-- 找到第一个不是Checker的列，因为在Checker列做为树结点会出错--%>
	var master_column_id=0;
	for(var i=0;i<colModel.getColumnCount();i++)
	{
		//alert(colModel.getColumnId(i));
		if(colModel.getColumnId(i) != "checker"){
			master_column_id=i;
			break;
		}
	}
	

	var pageBar=null;
	//判断是否进行分页	
	<s:if test="#listApp.page">	
		<s:if test="#listApp.treeList">							
			pageBar=new  Ext.ux.maximgb.treegrid.PagingToolbar
		</s:if>
		<s:else>
			pageBar=new  Ext.PagingToolbar
		</s:else>	
		({
	      	store: store,
	      	displayInfo: true,
	      	pageSize: pageSize
	    });
	</s:if>
	<s:elseif test="%{listApp.advancedSelect.size > 0}">
		pageBar=new Ext.Toolbar();
	</s:elseif>
	      	    
    var topBar;
       
	<s:if test="%{listApp.advancedSelect.size > 0 && listApp.advancedSelect[0].option.size > 0 }">	
		topBar=new Ext.Toolbar();
	</s:if>	
	<s:else>	
		topBar=null;
	</s:else>	    
    Ext.QuickTips.init();
	var GridDiv=Ext.get("data-grid"); 

    grid = new Ext.ux.maximgb.treegrid.GridPanel({
      el:"data-grid",
      width:GridDiv.getComputedWidth(),
      height:GridDiv.getComputedHeight(),

      store: store,
      master_column_id : master_column_id, //用于指出显示树结点的列
      cm:colModel,
      sm:sm,
      stripeRows: true,
      
      loadMask:true,
      title: '<s:text name="#listApp.title"/>',
      root_title: '',
      
      i18n: {
		breadcrumbs_tip : '双击展开或者关闭当前结点',
		breadcrumbs_root_tip : '点击返回到根结点'      
      },
      viewConfig : {
      	enableRowBody : true
      	,forceFit: false
      },     
      bbar: pageBar, 
      tbar: topBar,

   
      plugins: [new Ext.ux.plugins.GroupHeaderGrid(),new Ext.ux.grid.GridSummary()]
    });
	
	grid.render();
   	if(sm.singleSelect)
   	{
		<%-- 此处判断如果是checkboxSelectionModel并且是singleSelect单选，然后调用下面的代码 --%>
		
		var gridEl=grid.getEl();
		gridEl.select('div.x-grid3-hd-checker').removeClass('x-grid3-hd-checker'); <%-- 删除表头的checkbox --%>
		grid.store.on('load', function() {  <%--数据加载完毕替换为checkbox列增加一个class，然后我们在这个class中修改图片--%>
		  gridEl.select("div[class=x-grid3-row-checker]").each(function(x) {
		    x.addClass('x-grid3-row-radioBtn');
		  });
	     var selectionModel = grid.getSelectionModel();   
	     if(selectionModel.getCount()==0)
	     {
	     	selectionModel.selectFirstRow();
	     }
		});   		
   	}
	store.load({params:{start:0, limit:pageSize}});

    //grid.getSelectionModel().selectFirstRow();
	grid.getView().getBreadcrumbsEl().setDisplayed(<s:property value="#listApp.treeList"/>);
	if(topBar != null)
	{
		topBar.addElement(Ext.get("quickSearch"));	
		//topBar.addClass("listview-quickSearch");
		//topBar.addFill();  		
		
	}
    
	<s:if test="%{listApp.tabFrame.size > 0}">
		//grid.on('rowclick', function(grid, rowIndex, event) {
		grid.getSelectionModel().on('selectionchange',function(){
			refreshTab();
		});	 
		 
		//refreshTab(); 
	</s:if>
	grid.setHeight(1);<%-- 如果不加这句，在IE6里打开高级查询面板时，高度不会自动 --%>	
    grid.syncSize();<%-- 必需要重新计算一下尺寸，否则Grid下面的按钮出不来 --%>
 
  }
  

  window.onresize=setGridSize;
  function setGridSize()
  {
  	grid.setWidth(Ext.get("data-grid").getComputedWidth());
  	grid.setHeight(Ext.get("data-grid").getComputedHeight());
  }
   

  function linkRd(val, cellmeta, record, rowIndex, colIndex, store)
  {
    var cmHead;
    cmHead=grid.getColumnModel().getColumnHeader(colIndex);
    
    val= '<a href="'+val+'">'+cmHead+'</a>';
    return val;
  }	

  function linkRd2(val, cellmeta, record, rowIndex, colIndex, store)
  {
    var cmDi=grid.getColumnModel().getDataIndex(colIndex);
    var h=record.get(cmDi+"url");
    val= '<a href="'+h+'">'+val+'</a>';
    return val;
  }	
  function jsLinkRd(val, cellmeta, record, rowIndex, colIndex, store)
  {
    var cmHead;
    cmHead=grid.getColumnModel().getColumnHeader(colIndex);
    
    val= '<a href="javascript:'+val+'">'+cmHead+'</a>';
    return val;
  }	
  function jsLinkRd2(val, cellmeta, record, rowIndex, colIndex, store)
  {
    var cmDi=grid.getColumnModel().getDataIndex(colIndex);
    var h=record.get(cmDi+"url");
    val= '<a href="javascript:'+h+'">'+val+'</a>';
    return val;
  }    
  function dataCellRenderer(val, cellmeta, record, rowIndex, colIndex, store)
  {
 	//cellmeta.attr = 'ext:qtitle="' + "标题" + '"'; 
 	//cellmeta.attr += 'ext:qtip="' + val + '"'; 
    return val;  
  }
	return {
		init : function()
		{
			createGrid();
		}
	}
}();

Ext.onReady(Controller.init);


var tabFrameSize=0;
var btnAreaSize=0;
<s:if test="%{listApp.tabFrame.size > 0}">
	tabFrameSize=${listApp.tabFrame[0].size}+24;		
</s:if>
<s:if test="%{listApp.actionButton.size > 0}">
	btnAreaSize=50;
</s:if>

function userPrint(i,j)
	{
	    document.WebBrowser.Execwb(i,j);//打印预览
	    return false;
	}
	/*
	WebBrowser.ExecWB(1,1) 打开
	WebBrowser.ExecWB(2,1) 关闭现在所有的IE窗口，并打开一个新窗口
	WebBrowser.ExecWB(4,1) 保存网页
	WebBrowser.ExecWB(6,1) 打印
	WebBrowser.ExecWB(7,1) 打印预览
	WebBrowser.ExecWB(8,1) 打印页面设置
	WebBrowser.ExecWB(10,1) 查看页面属性
	WebBrowser.ExecWB(15,1) 好像是撤销，有待确认
	WebBrowser.ExecWB(17,1) 全选
	WebBrowser.ExecWB(22,1) 刷新
	WebBrowser.ExecWB(45,1) 关闭窗体无提示
	*/
	
</script>
	<style media="print">
.Noprint   {DISPLAY:   none;}
</style>
	</head>
	<body style="height:100%;overflow: hidden;" id="QLightListViewPage">
		<form method="post" name="postForm">
			<input type="hidden" name="_table_pk" />
		</form>
		<div id="quickSearch">
			<%-- 快速查询  --%>
			<form method="post" name="queryForm" id="queryForm" action=""
				onsubmit="return false;">
				
			</form>

			<form method="post" name="advSearchForm" id="advSearchForm" action=""
				onsubmit="return false;">
				
			</form>
		</div>

		<table height="100%" width="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr
				style="height:expression(document.body.clientHeight-btnAreaSize-tabFrameSize);">
				<td>
					<div id="data-grid" class="listview-grid" align="left">
					</div>
				</td>
			</tr>
				<tr height="50" class="Noprint">
					<td>
						<table class="listview-btnArea">
							<tr>
									<td>
										<input type="button" value='预览'
												onclick="userPrint(7,1)"
												class="listview-bBtn" />
									</td>
							</tr>
						</table>
					</td>
				</tr>
			<s:if test="%{listApp.tabFrame.size > 0}">
				<%-- 如果包括有Tab页的配置 --%>
				<script type="text/javascript">
	var activeTab=0;

	function TabOpen(url,index,event)
	{
        var o=document.getElementById('nav1').getElementsByTagName('li');     
        for (var i=0; i<o.length; i++){
            o[i].className = 'default' ;
        }
        //alert(event);
        event.className = 'active'; 
                		
		var selectionModel = grid.getSelectionModel();   
		var store = grid.getStore();   
		var rows = selectionModel.getSelections();   
		var param="";
		if(rows.length>0)
		{
			var record = store.getById(rows[0].id);	  	
			param=record.get("_tab_param-"+index);
		}
		var url1=url+param;
		if(url1!=document.getElementById("tabFrame").title){
		
			document.getElementById("tabFrame").title=url1;
			var tabFrame;
			if(document.all)
				tabFrame=document.frames["tabFrame"];
			else
				tabFrame=document.getElementById("tabFrame");
			if(document.getElementById("tabFrame").src!=""
				&& document.getElementById("tabFrame").src.indexOf(url)==0 
				&& document.getElementById("tabFrame").readyState == "complete"
				&& tabFrame.document.body.id =="QLightListViewPage")
			{
				if(param!="")
					param=param.substr(1,param.length-1);
				tabFrame.doQuery(param);
			}
			else
			{
				document.getElementById("tabFrame").src=url1;
			}
		}
		activeTab=index;
	}
	function refreshTab(){
		var btnId="tabBtn"+activeTab;
        if(document.all)   
            document.getElementById(btnId).click();           
	    else   
	    {   
		    var   evt   =   document.createEvent("MouseEvents");   
		    evt.initEvent("click",   true,   true);   
		    document.getElementById(btnId).dispatchEvent(evt);   
	    } 		
		//document.getElementById(btnId).click();
	}
</script>
				<tr height="${listApp.tabFrame[0].size+24}">
					<td align="center">
						<div class='tab' id="tab">
							<div id="ul">
								<ul id='nav1' class='menu' width="100%">
									<s:iterator id="tab" value="%{listApp.tabFrame[0].tab}"
										status="sta">
										<LI class="default" id="tabBtn${sta.index}"
											onclick="javascript:TabOpen('${tab.url}',${sta.index},this);">
											<s:text name="%{#tab.title}" />
										</LI>
									</s:iterator>
								</ul>
							</div>
							<div class="content"
								style="height:${listApp.tabFrame[0].size-8}px">
								<iframe class="tabFrame" id="tabFrame" name="tabFrame"
									height="100%" width="100%" frameborder="0" />

							</div>
						</div>

					</td>
				</tr>
			</s:if>
		</table>
	</body>
</html>
