<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>

		<title>${listApp.title }</title>
		<s:set name="hasTreeSelect" value="0"></s:set>
		<s:set name="hasDateSelect" value="0"></s:set>		
		<s:iterator id="opt" value="%{listApp.advancedSelect[0].option}">
			<s:if test="#opt.type=='treeSelect'">	
				<s:set name="hasTreeSelect" value="1"></s:set>
			</s:if>
			<s:if test="#opt.type=='datetime' || #opt.type=='date' || #opt.type=='date-year'">	
				<s:set name="hasDateSelect" value="1"></s:set>
			</s:if>
		</s:iterator>		
		<link rel="stylesheet" type="text/css" href="basepage/css/BaseCommon.css" />
		<link rel="stylesheet" type="text/css" href="basepage/css/button.css" />
		<link rel="stylesheet" type="text/css" href="Components/ExtJS/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css" href="Components/ExtJS/plugin/ux.maximgb.treegrid/css/TreeGrid.css" />
		<link rel="stylesheet" type="text/css" href="Components/ExtJS/plugin/ux.maximgb.treegrid/css/TreeGridLevels.css" />
		<link rel="stylesheet" type="text/css" href="Components/ExtJS/plugin/GroupHeaderPlugin/GroupHeaderPlugin.css" />
		<link rel="stylesheet" type="text/css" href="basepage/css/divCard.css" />
		<link rel="stylesheet" type="text/css" href="Components/ExtJS/plugin/gridSummary/summary.css" />
		<link rel="stylesheet" type="text/css" href="basepage/css/ext-patch.css" />
		<style type="text/css">		
html,body{    

}
body{
    padding:0px; 
    margin:0px;  
    background:#fff url('pageframe/images/home/contentbj.gif') repeat-x;
	overflow: hidden;
}
#grid-tr{
	
}


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
			.quickSearchTable{
				
			}
			.quickSearchTable th{
				text-align: right;
				height: 25px;
			}
		</style>
		<script type='text/javascript' src='Components/ExtJS/adapter/ext/ext-base.js'></script>
		<script type='text/javascript' src='Components/ExtJS/ext-all.js'></script>
		<script type='text/javascript' src='Components/ExtJS/ext-lang-zh_CN.js'></script>
		<script type='text/javascript' src='Components/ExtJS/plugin/ux.maximgb.treegrid/TreeGrid.js'></script>
		<script type='text/javascript' src='Components/ExtJS/plugin/GroupHeaderPlugin/GroupHeaderPlugin.js'></script>
		<script type='text/javascript' src='Components/ExtJS/plugin/gridSummary/exJsonReader.js'></script>
		<script type='text/javascript' src='Components/ExtJS/plugin/gridSummary/gridSummary.js'></script>
        <s:if test="#hasDateSelect==1">
        	<script src="Components/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        </s:if>
		<%--base href必需放在导入My97DatePicker js的后面，否则在IE6下My97DatePicker会出错--%>
		<base href="<%=basePath%>" />        
        <s:if test="#hasTreeSelect==1">	
        	<script src="Components/TreeSelect/xtree.js" type="text/javascript"></script>
        	<script src="Components/TreeSelect/treeselect.js" type="text/javascript"></script>
        </s:if>		
		<script type="text/javascript" src="basepage/javascript/common.js"></script>
		<script type="text/javascript" src="basepage/javascript/listview.js"></script>
		<s:iterator id="js" value="%{listApp.javaScript}">
			<script type="text/javascript" src="<%=path %>/${js.src}"></script>
		</s:iterator>

		<script type='text/javascript'>		
 Ext.BLANK_IMAGE_URL = 'Components/ExtJS/resources/images/default/s.gif';
 var grid;
 var pageSize=<s:property value="%{listApp.pageSize}"/>;			
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
    	is_tree: <s:property value="%{listApp.treeList}"/>,
    	remoteSort:true,
<s:if test="%{listApp.treeId.size > 0 && listApp.treeId[0].treeRootIdVal!= null && listApp.treeId[0].treeRootIdVal!= ''}">
		rootVal:'<s:property value="%{listApp.treeId[0].treeNodeId}"/>=<s:property value="%{listApp.treeId[0].treeRootIdVal}"/>',

</s:if>    	
    	
    	url:'${listDataAction}.qact',
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
           queryParams:getParams(),
           advParams:getAdvParams(),
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
    	var v
    	if(jsonRd.footData == null)
    		v= '';
    	else if(row==1)
    		v= jsonRd.footData.sum[cm.id];
    	else if(row==2)
    		v= jsonRd.footData.avg[cm.id];
    	else if(row==3)
    		v= jsonRd.footData.max[cm.id];
    	else if(row==4)
    		v= jsonRd.footData.min[cm.id];
    	else
    		v= '';
    	//linkRd(val, cellmeta, record, rowIndex, colIndex, store)
    	v =cm.renderer(v,null,null,row,null,null,true);
		return v;

    }
   	
   	var colModel = new Ext.grid.ColumnModel({
   	columns:[
   		
<s:iterator id="prop" value="%{propList}" status="sta" >
	<s:if test="#prop.type == 'checkBox' || #prop.type == 'radioBox'">								
		sm
	</s:if>
	<s:else>
		{
		<s:if test="#prop.type == 'link' ">
			header:'<s:text name="%{#prop.msg}" />',sortable:false,dataIndex:'${prop.id}-${sta.index}url'
			,renderer:<s:if test="#prop.link[0].type == 'javaScript'" >jsLinkRd</s:if><s:else>linkRd</s:else>
			,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>
		</s:if>
	  	<s:elseif test="#prop.link.size > 0 && #prop.type != 'link'">
	  		header:'<s:text name="%{#prop.msg}" />',sortable:${prop.sort},dataIndex:'${prop.id}-${sta.index}'
	  		,renderer:<s:if test="#prop.link[0].type == 'javaScript'" >jsLinkRd2</s:if><s:else>linkRd2</s:else>
	  		,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>
	  	</s:elseif>	
		<s:else>
			header:'<s:text name="${prop.msg}" />',sortable:${prop.sort},dataIndex:'${prop.id}-${sta.index}'
			<s:if test="#prop.renderer == '' || #prop.renderer == null">
				,renderer:dataCellRenderer
			</s:if>
			<s:else>
				,renderer:	${prop.renderer}
			</s:else>
			,width:${prop.width}<s:if test="#prop.showFoot">,summaryRenderer:renderSummary</s:if>
		</s:else> 	
		<s:if test="#prop.align != null">								
			,align:'${prop.align}'
		</s:if>					
		}  	
	</s:else>
  	<s:if test="!#sta.last">,</s:if>
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
	<%--判断是否进行分页--%>	
	<s:if test="%{listApp.page}">	
		<s:if test="%{listApp.treeList}">							
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
	<s:elseif test="%{listApp.advancedSelect.size > 0 && !listApp.advancedSelect[0].advBtnHidden}">
		pageBar=new Ext.Toolbar();
	</s:elseif>
	      	    
    var topBar;
       
	<s:if test="%{quickQueryCount > 0 || (listApp.advancedSelect.size > 0 && listApp.advancedSelect[0].option.size > 0 && !listApp.advancedSelect[0].advBtnHidden)}">	
		topBar=new Ext.Toolbar();
	</s:if>	
	<s:else>	
		topBar=null;
	</s:else>	    
	
    Ext.QuickTips.init();
    <s:if test="%{listApp.saveState == true}" >
	Ext.state.Manager.setProvider(   
      new Ext.state.CookieProvider({   
        expires: new Date(new Date().getTime()+(1000*60*60*24*365))   
      })   
    ); 
    </s:if>
    grid = new Ext.ux.maximgb.treegrid.GridPanel({
      el:"data-grid",
      <s:if test="%{listApp.field[0].autoExpandColumn == true}" >
      autoExpandColumn :1,//自动展开列宽
      </s:if>	
      width:Ext.get("grid-tr").getComputedWidth()-4,
      height:document.documentElement.clientHeight -tabFrameHeight - btnAreaSize -3,
      store: store,
      master_column_id : master_column_id, //用于指出显示树结点的列
      cm:colModel,
      sm:sm,
      stripeRows: true,
      
      loadMask:false,
      title: '${listApp.title}',
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
	  <s:if test="%{listApp.saveState == true}" >	
   	  stateful:true,   
	  stateId:'cookiegrid_${tableName}_${viewId}',
   	  stateEvents : [ "columnmove", "columnresize", "hiddenchange" ], 
   	  </s:if>	
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
	grid.getView().getBreadcrumbsEl().setDisplayed(<s:property value="%{listApp.treeList}"/>);
	if(topBar != null)
	{
		topBar.addElement(Ext.get("quickSearch"));
		//Ext.get("quickSearch").repaint();
		if(Ext.get("quickSearchTable"))
			Ext.get("quickSearchTable").repaint();
		//topBar.addClass("listview-quickSearch");
		//topBar.addFill();  		
		
	}
	<s:if test="%{listApp.advancedSelect.size > 0 && !listApp.advancedSelect[0].advBtnHidden}">
		if(pageBar != null)
		{
			pageBar.addSeparator() ;
			//取消高级查询按钮
			/*pageBar.addButton(  
				new Ext.Toolbar.Button({
				     text:'&nbsp;高级查询&nbsp;',
				     pressed:true,
				     handler:advSearchShow
		     	})
		    );*/
	    }	
    </s:if>
    
	<s:if test="%{listApp.tabFrame.size > 0}">
		//grid.on('rowclick', function(grid, rowIndex, event) {
		grid.getSelectionModel().on('selectionchange',function(){
			refreshTab();
		});	 
		 
		//refreshTab(); 
	</s:if>
	//grid.setHeight(1);<%-- 如果不加这句，在IE6里打开高级查询面板时，高度不会自动 --%>	
    grid.syncSize();<%-- 必需要重新计算一下尺寸，否则Grid下面的按钮出不来 --%>
 	//if(isBrowser("IE8")){
 	//	grid.addListener('viewready', setGridSize, this); 		
 	//} 	
 	setGridSize();	
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
    var val = '<a style="cursor: pointer;text-decoration:underline;" onclick="'+val+'">'+cmHead+'</a>';
    return val;
  }	
  function jsLinkRd2(val, cellmeta, record, rowIndex, colIndex, store)
  {
    var cmDi=grid.getColumnModel().getDataIndex(colIndex);
    var h=record.get(cmDi+"url");
    var val = '<a style="cursor: pointer;text-decoration:underline;" onclick="'+h+'">'+val+'</a>';
    return val;
  }    
  function dataCellRenderer(val, cellmeta, record, rowIndex, colIndex, store)
  {
 	//cellmeta.attr = 'ext:qtitle="' + "标题" + '"'; 
 	//cellmeta.attr += 'ext:qtip="' + val + '"'; 
 	//cellmeta.attr = "style='color:red;'";
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
	//if(!isBrowser("IE6"))
  		window.onresize=setGridSize;
  function setGridSize()
  {
  	//alert(document.documentElement.clientHeight+","+document.body.clientHeight);
  	//document.title=document.documentElement.clientHeight;
  	var bottomM=0;
  	var searchPanelH=Ext.get("quickSearch").getComputedHeight();
  	
  	var cheight=document.documentElement.clientHeight;
  	var cwidth = document.documentElement.clientWidth;
  	
  	if(cheight==0)
  		cheight=document.body.clientHeight;
  	if(cwidth==0)
  		cwidth = document.body.clientWidth;  	

  	if(tabFrameHeight!=0 ){
  		if(cheight-tabFrameHeight < 100)
  			tabFrameHeight =tabFrameHeight+(cheight-tabFrameHeight)-100;
  		//bottomM=10;
  		document.getElementById('mainTable').style.height=(cheight-tabFrameHeight-bottomM)+"px";  		
  		document.getElementById('tabTable').style.height=tabFrameHeight+"px";
  		document.getElementById('tabContent').style.height=tabFrameHeight-(26+8)+"px";
  		
  	}
  	if(tabFrameWidth!=0){
  		if(cwidth-tabFrameWidth < 100)
  			tabFrameWidth =tabFrameHeight+(cwidth-tabFrameWidth)-100;  	
  		document.getElementById('mainTable').style.width=(cwidth-tabFrameWidth)+"px";
  		document.getElementById('tabTable').style.width=tabFrameWidth+"px";
  		
  		document.getElementById('tabTable').style.height=(cheight - btnAreaSize) +"px";
  		document.getElementById('tabContent').style.height=(cheight - btnAreaSize)-(26+8)+"px";
  	}

  	var gridHeight = cheight -tabFrameHeight - btnAreaSize-bottomM;
  //alert(document.getElementById('grid-tr').style);
  	document.getElementById('grid-tr').style.height= gridHeight+"px";
  	if(grid == undefined)
  		return ;
  	var w;
  	//w=document.body.clientWidth-3;
  	w=cwidth-tabFrameWidth-3;
  	//w=Ext.get("grid-tr").getComputedWidth()-3;
  	grid.setWidth(w);
  	
  	grid.setHeight(gridHeight-4);
  	grid.syncSize();
  	
  	
  	<s:if test="%{listApp.tabFrame.size > 0}">
//  	document.getElementById('tabContent').style.height=Ext.get("trContent").getComputedHeight()-44+"px";
  	</s:if>
  }

var tabFrameHeight=0;
var btnAreaSize=0;
var tabFrameWidth=0;
<s:if test="%{listApp.tabFrame.size > 0}">
	<s:if test="%{listApp.tabFrame[0].align == 'right'}">
	tabFrameWidth=${listApp.tabFrame[0].size}+8;
	</s:if>
	<s:else>
	tabFrameHeight=${listApp.tabFrame[0].size}+26+8;
	</s:else>
	
</s:if>
<s:if test="%{listApp.actionButton.size > 0}">
	btnAreaSize=50;
</s:if>
</script>
	</head>
	<body id="QLightListViewPage" scroll="no">
		<form method="post" name="postForm" style="border: 0px;padding: 0px;margin: 0px;">
			<input type="hidden" name="_table_pk" />
			<input type="hidden" name="queryParams"/>
			<input type="hidden" name="advParams"/>
		</form>
		<div id="quickSearch" >
			<%-- 快速查询  --%>
			<form method="post" name="queryForm" id="queryForm" action="" onsubmit="return false;" 
				style="<s:if test="%{quickQueryCount==0}"> display: none;</s:if>border: 0px;padding: 0px;margin: 0px;">
		 	
			<table border="0" cellpadding="0" cellspacing="0" 
				<s:if test="listApp.advancedSelect[0].hidden == true">style="display: none;"</s:if>>
				<tr>
					<td style="word-break: break-all;word-wrap: break-word;">
						<s:if test="%{quickQueryCount > 0}">
							<s:if test="listApp.advancedSelect[0].include != null ">
								<s:include value="%{listApp.advancedSelect[0].include}"></s:include>
							</s:if>
							<s:else>
							<%int index = 1; %>
							<table class="quickSearchTable" id="quickSearchTable">
							<s:iterator id="opt" value="%{listApp.advancedSelect[0].option}" status="sta">
								<s:if test="#opt.quickQuery">
									<%if((index%5) == 0){ %>
										<tr>
									<%} %>
									<s:if test="#opt.type!='hidden'">
										<%index++; %>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="%{#opt.msg}"></s:text>：</td>
									</s:if>
									<s:if test="#opt.type=='input' ">
										<td ><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}"
											onkeypress="enterToChange();" cssClass="listview-input"
											theme="simple"></s:textfield></td>
									</s:if>
									<s:elseif test="(#opt.type=='select'||#opt.type=='select-null') ">
										<td><s:select list="#opt.mapRef" key="%{#opt.msg}"
											name="%{#opt.id}" value="%{#opt.defaultval}" cssClass="listview-input"
											theme="simple"></s:select></td>
									</s:elseif>
									<s:elseif test="#opt.type=='radioBox' ">
										<td><s:radio list="#opt.mapRef" key="%{#opt.msg}" name="%{#opt.id}"
											value="%{#opt.defaultval}" cssClass="listview-input" theme="simple"></s:radio></td>
									</s:elseif>
									<s:elseif test="#opt.type=='checkBox'">
										<td><s:checkboxlist list="#opt.mapRef" key="%{#opt.msg}"
											name="%{#opt.id}" value="%{#opt.defaultval}" cssClass="listview-input"
											theme="simple"></s:checkboxlist></td>
									</s:elseif>
									<s:elseif test="#opt.type=='textarea'">
										<td><s:textarea name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}" theme="simple" /></td>
									</s:elseif>
									<s:elseif test="#opt.type=='password'">
										<td><s:password name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}"  
											onkeypress="enterToChange();" showPassword="true"
											cssClass="listview-input" theme="simple" /></td>
									</s:elseif>
									<s:elseif test="#opt.type=='date'">
										<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}" 
											onkeypress="enterToChange();" cssClass="listview-input"
											theme="simple" onfocus="selectDate(this);"></s:textfield></td>
									</s:elseif>			
									<s:elseif test="#opt.type=='datetime'">
										<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}" 
											onkeypress="enterToChange();" cssClass="listview-input"
											theme="simple" onfocus="selectDateTime(this);"></s:textfield></td>
									</s:elseif>			
									<s:elseif test="#opt.type=='date-year'">
										<td><s:textfield name="%{#opt.id}" key="%{#opt.msg}"
											value="%{#opt.defaultval}" 
											onkeypress="enterToChange();" cssClass="listview-input"
											theme="simple" onfocus="selectYear(this);"></s:textfield></td>
									</s:elseif>																			
									<s:elseif test="#opt.type=='hidden'">
										<s:hidden name="%{#opt.id}" value="%{#opt.defaultval}"></s:hidden>
									</s:elseif>
									<%if((index%4) == 0){ %>
										</tr>
										<%index = 1; %>
									<%}%>
								</s:if>

							</s:iterator>
							</table>
							</s:else>
							
						</s:if>
					</td>
					<td width="20">&nbsp;&nbsp;</td>
					<td>
						<input type="submit" value='搜索' onclick="quickSearch();" class="but_new"/>
					</td>
				</tr>

			</table>
			</form>

			<form method="post" name="advSearchForm" id="advSearchForm" action=""
				onsubmit="return false;" style="border: 0px;padding: 0px;margin: 0px;">
				<table id="advSearchTab" class="listview-advSearch"　>
					<%-- 高级查询 --%>
					<tr>
						<td>
							<input type="button" value='增加条件' onclick="addAdvSearch()" class="listview-bBtn" />
							<input type="button" value='减少条件' onclick="subAdvSearch()" class="listview-bBtn" />
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value='开始查询' onclick="advSearch();" class="listview-bBtn" />
							<input type="button" value='取消查询' onclick="cancelAdvSearch();" class="listview-bBtn" />
						</td>
					</tr>
				</table>
			</form>
		</div>

		<table id="advSearchTemplet" style="display: none;height:0px;width:0px;">
			<%-- 高级查询的模板 --%>
			<s:if test="%{listApp.advancedSelect.size > 0}">
				<tr>
					<td>						
						字段：
						<s:select list="%{listApp.advancedSelect[0].option}" listKey="id"
							listValue="%{getText(msg)}" key="list.advSearch.field"
							name="advSearch_field" cssClass="listview-input" theme="simple"
							id="advSearch_field">
						</s:select>
					</td>
					<td>
						&nbsp;&nbsp;
						条件：
						<select name="advSearch.cond" class="listview-input" id="advSearch_cond">
							<option value="=">
								等于
							</option>
							<option value="like">
								包含有
							</option>
							<option value="&gt;">
								大于
							</option>
							<option value="&lt;">
								小于
							</option>
							<option value="&lt;=">
								小于等于
							</option>
							<option value="&gt;=">
								大于等于
							</option>
							<option value="!=">
								不等于
							</option>
						</select>
					</td>
					<td>
						&nbsp;
						关键字：
						<input type="text" name="advSearch.key" class="listview-input" id="advSearch_key" onkeypress=""/>
					</td>
				</tr>
			</s:if>
		</table>

		<table style="height:100%;width:100%;" 
		<s:if test="%{listApp.tabFrame.size > 0 && listApp.tabFrame[0].align == 'right'}">
			align="left"
		</s:if>		
			 border="0" cellpadding="0" cellspacing="0" id="mainTable">
			<tr id="grid-tr" >
				<td>
					<div id="data-grid" class="listview-grid" align="left">
					</div>
				</td>
			</tr>
			<s:if test="%{listApp.actionButton.size > 0}">
				<tr style="height:50px" >
					<td style="vertical-align:middle;border: 1px solid #A2CEF2;" align="center">
						<table class="listview-btnArea">
							<tr>
								<s:iterator id="button" value="%{listApp.actionButton}">
									<td>
										<s:if test="#button.type=='javaScript'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="${button.linkRef}" class="listview-bBtn" />
										</s:if>

										<s:elseif test="#button.type=='action' || #button.type=='add' || #button.type=='update'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="submitTo('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='export'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="expExcel('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='import'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="impExcel('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='upload'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="upload('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='download'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="download('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='delete'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="del('${button.linkRef}','${button.needSelect}')"
												class="listview-bBtn" />
										</s:elseif>
										<s:elseif test="#button.type=='delAll'">
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="delAll('${button.linkRef}')"
												class="listview-bBtn" />
										</s:elseif>										
										<s:else>
											<input type="button" value='<s:text name="%{#button.msg}"/>'
												onclick="openURL('${button.linkRef}')" class="listview-bBtn" />
										</s:else>
										
									</td>
								</s:iterator>
							</tr>
						</table>
					</td>
				</tr>
			</s:if>
			</table>
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
			param = param+"&fromtag=2";
		}else{
			param = "?fromtag=2";
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
	Ext.onReady(function(){
		
		//document.getElementById('tab').style.height=Ext.get("trContent").getComputedHeight()+"px";
		})
		
	</script>
	<table  style="height:100%;width:100%;" border="0" cellpadding="0" cellspacing="0" id="tabTable">
		<tr height="100%" id="trContent">
			<td align="center">
				<div class='tab' id="tab">
					<div id="ul">
						<ul id='nav1' class='menu' width="100%">
							<s:iterator id="tab" value="%{listApp.tabFrame[0].tab}" status="sta">
								<li class="default" id="tabBtn${sta.index}"
									onclick="javascript:TabOpen('${tab.url}',${sta.index},this);">
									<span><s:text name="%{#tab.title}" /></span>
								</li>
							</s:iterator>
						</ul>
					</div>
					<div class="content" id="tabContent" style="height:100%">
						<iframe class="tabFrame" id="tabFrame" name="tabFrame" height="100%" width="100%" frameborder="0" />
					</div>
				</div>
			</td>
		</tr>
	</table>
	</s:if>
		
		<script>
			//alert(document.body.clientHeight);
		</script>
	</body>
</html>
