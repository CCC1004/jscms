//用于读取快速查询的参数
function getParams()
{
   var pars=[];
   for(var i=0; i<document.getElementById("queryForm").elements.length ;i++)
   {
   	 var el=document.getElementById("queryForm")[i];	
   	 if(el.type=='submit' || el.type=='button')
   	 	continue;
   	 if(el.type == 'radio' && !el.checked)
   	 	continue;
   	 if(el.type == 'checkbox' && !el.checked)
   	 	continue;
   	 	
   	 pars[el.name+'-#'+i]=el.value;
   }

   return Ext.urlEncode(pars);
}
//读取快速查询参数，参数名称不变
function getParams2()
{
   var pars=[];
   for(var i=0; i<document.getElementById("queryForm").elements.length ;i++)
   {
   	 var el=document.getElementById("queryForm")[i];	
   	 if(el.type=='submit' || el.type=='button')
   	 	continue;
   	 if(el.type == 'radio' && !el.checked)
   	 	continue;
   	 if(el.type == 'checkbox' && !el.checked)
   	 	continue;
   	 pars[el.name]=el.value;
   }

   return Ext.urlEncode(pars);
}
function getAdvParams()
{
   if(document.advSearchForm.elements["advSearch_field"] == undefined)
   {
   		return '';
   }  	
   var advPars=[];
   if(document.advSearchForm.elements["advSearch_key"].length  == undefined)
   {
	   	 var field=document.advSearchForm.elements["advSearch_field"].value	;
	   	 var cond=document.advSearchForm.elements["advSearch_cond"].value	;
	   	 var key=document.advSearchForm.elements["advSearch_key"].value	;
		 if(key!="")	   	 	
	   	 	advPars['cond0']=field+"[,]"+cond+"[,]"+key;
   }
   else
   {
	   for(var i=0; i<document.advSearchForm.elements["advSearch_field"].length ;i++)
	   {
	   	 var field=document.advSearchForm.elements["advSearch_field"][i].value	;
	   	 var cond=document.advSearchForm.elements["advSearch_cond"][i].value	;
	   	 var key=document.advSearchForm.elements["advSearch_key"][i].value	;
	
	   	 if(key!="")	
	   	 	advPars['cond'+i]=(field)+"[,]"+cond+"[,]"+key;
	   }   
	}
   return Ext.urlEncode(advPars);
}
//打开高级查询
 function advSearchShow()
 {
	document.all.advSearchTab.style.display="block";
	addAdvSearch();
 }
 //增加查询条件
function addAdvSearch()
{
	var row=document.all.advSearchTab.insertRow(document.all.advSearchTab.rows.length-1);
	var cell = row.insertCell();
	//alert(document.all.advSearchTemplet.rows[0].innerHTML);
	cell.innerHTML=document.all.advSearchTemplet.rows[0].innerHTML;
	
	//Ext.get("advSearchTab").remove();	
	document.all.advSearchTab.width=grid.getSize().width-6;
	//if(isBrowser("IE6"))
	//	grid.setHeight(1);//如果不加这句，在IE6里打开高级查询面板时，高度不会自动
	//grid.syncSize();
	setGridSize();
}
//减少查询条件
function subAdvSearch()
{
	if(document.all.advSearchTab.rows.length > 2)
		document.all.advSearchTab.deleteRow(document.all.advSearchTab.rows.length-2);
}
//取消关闭高级查询
function cancelAdvSearch()
{
	while(document.all.advSearchTab.rows.length>1)
	{
		document.all.advSearchTab.deleteRow(0);
	}
	document.all.advSearchTab.style.height=1;
	document.all.advSearchTab.style.display="none";
	setGridSize();
	grid.getStore().reload();
}
//提交高级查询
function advSearch()
{
    grid.getStore().reload({params:{start:0, limit:pageSize}});
}

function quickSearch()//快速查询
{
	if(grid.getStore().is_tree)
		grid.getSelectionModel().clearSelections();
	grid.getStore().reload({params:{start:0, limit:pageSize}});
}

// 全选
function selectAll() {
	grid.getSelectionModel().selectAll();
}

function selAlert(needSel)
{
	var cond;
	var val;
	cond=needSel.substr(0,2);
	val=needSel.substr(2);
	var prompt;
	if(cond=="==")
		prompt="请选择"+val+"条记录,并且只能选择"+val+"条";
	else if(cond==">=")
		prompt="请选择记录";
	else 
		prompt="请选择记录";				
	alert(prompt);
}
function checkSelect(needSel)
{
	if(needSel!="")
	{
		var str;
		var r=0;
		str="if(!(getSelSize()"+needSel+")){ selAlert('"+needSel+"');r=1;}";
		eval(str);
		if(r==1)
			return false;
	}
	return true;		
}


function getSelSize()
{
	var selCount=0;
	selCount=grid.getSelectionModel().getCount();
	return selCount;		
}
//把选中的ID，以Hiiden Button的方式加入到PostForm里
function addSelectIdToPostForm()
{
    var idList=getSelectId();
    document.all.postForm.innerHTML="";
    for(var i = 0; i < idList.length; i++) {   
      var id = idList[i];   
      var input = document.createElement("input");   
      input.setAttribute("name","_table_pk");   
      input.setAttribute("type","hidden");   
      input.setAttribute("value",id);   
      document.all.postForm.appendChild(input);   
    } 		
}

function submitTo(url,needSel) {
	if(checkSelect(needSel))
	{
		if(needSel!="")//如果有必需选择条件，则把选中的ID加入到PostForm里，做为数组提交
			addSelectIdToPostForm();
		document.all.postForm.action = url ;
		//document.all.postForm._table_pk.value=getSelectId();
		document.all.postForm.submit() ;
	}
}	
	
function getSelectId()//读取当前选中ID
{
     var selectionModel = grid.getSelectionModel();   
     var rows = selectionModel.getSelections();   
     
     var idList=[];  
     for (var i = 0; i < rows.length; i++) { 
     	idList.push(rows[i].id);
     }
     return idList;
}
//刷新分页的工具条
function updatePageUI(pageBar)
{	
   var d = pageBar.getPageData(), ap = d.activePage, ps = d.pages;
   pageBar.afterTextEl.el.innerHTML = String.format(pageBar.afterPageText, d.pages);   
   pageBar.field.dom.value = ap;
   pageBar.first.setDisabled(ap == 1);
   pageBar.prev.setDisabled(ap == 1);
   pageBar.next.setDisabled(ap == ps);
   pageBar.last.setDisabled(ap == ps);
   pageBar.loading.enable();
   pageBar.updateInfo();
}
function del(url,needSel)//删除
{
	if(checkSelect(needSel))
	{
		 var selectionModel = grid.getSelectionModel();   
		 var rows = selectionModel.getSelections();   
		 if(!window.confirm("是要确定要删除选中的"+rows.length+"条记录"))
		 {
		 	return;
		 }
	     
	     var store = grid.getStore();   	     
	     
	     var idList=[];  
	    idList=getSelectId();
        var params = {};   
           
        params['_table_pk'] = idList;   

        Ext.Ajax.request({method:'POST',   
            url: url,    
            params: params,   
            success: (function(response) {   
                var result = Ext.decode(response.responseText);   
                if (result.success) {   
				     for (var i = 0; i < rows.length; i++) {
						var record = store.getById(rows[i].id);	                           
                        store.remove(record);  
                        store.totalLength--;
				     } 		                      
                } else  
                    alert(result.error);  
                store.commitChanges();
                if(grid.bottomToolbar && grid.bottomToolbar.getPageData){
                	updatePageUI(grid.bottomToolbar);            	
                }
            }), 
            failure:(function(response) 
            {
            	alert('删除失败');   
            }),  
            scope: this  
        });    			      
	}
}
//删除所有
function delAll(url){
	var store = grid.getStore();
	var count = store.getTotalCount();
	if(count ==0){
		alert("当前列表为空，无法删除");
		return;
	}
	 if(!window.confirm("是要确定要删除当前列表的所有记录（共"+count+"条)"))
	 {
	 	return;
	 }
     Ext.Ajax.request({method:'POST',   
         url: url,    
         params: store.baseParams,   
         success: (function(response) {   
             var result = Ext.decode(response.responseText);   
             if (result.success) {   
			     store.removeAll();	
			     store.totalLength -= count;                      
             } else  
                 alert(result.error);  
                 
             if(grid.bottomToolbar && grid.bottomToolbar.getPageData)
             	updatePageUI(grid.bottomToolbar);  
         }), 
         failure:(function(response) 
         {
         	alert('删除失败');   
         }),  
         scope: this  
     });    			
}

//设置快速查询的参数值，并重新加载数据
function doQuery(params){
	var param=params.split("&");
	for(var i=0;i<param.length;i++)
	{
		if(param[i] != ""){
			param[i]=UrlDecode(param[i]);
			var p=param[i].split("=");
		    for(var j=0; j<document.all.queryForm.elements.length ;j++)
		    {
		   	  var el=document.all.queryForm.elements(j);	
		   	  if(el.type=='submit' || el.type=='button')
		   	 	 continue;	
		   	  if(el.name.toLowerCase() == p[0].toLowerCase())
		   	  {
				 if(p.length>1)
		   	  	 	el.value=p[1];
		   	  	 else
		   	  	 	el.value="";
		   	  }
		   	}				
		}
	}
	quickSearch();
}

function showPop(url,width,height){
	var w=650,h=610;
	if(width)
		w=width;
	if(height)
		h=height;
	var c='?';
	if(url.indexOf("?") != -1)
	  c="&";
	url=url+c+getParams2();
//	alert(url);
	 var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:'+w+'px;dialogHeight:'+h+'px;center:yes;help:no;resizable:yes;status:no');
	 if(r!=null)
	 {
		quickSearch();//刷新
	 }			
	
}
//不自动传递快速查询的参数
function showPop2(url,width,height)
{
	var w=650,h=610;
	if(width)
		w=width;
	if(height)
		h=height;
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:'+w+'px;dialogHeight:'+h+'px;center:yes;help:no;resizable:yes;status:no');
	  if(r!=null)
	  {
		quickSearch();//刷新
	  }	
}

function printGrid(action)
{
	
	
	postForm.queryParams.value=getParams2();
	postForm.advParams.value=getAdvParams();
	var winName=(Math.round(Math.random()*1000)).toString(); //生成新开窗口的名字，可不防止总是在同名窗口中提交
	window.open("",winName,"height=800px, width=650px, toolbar=no, menubar=no, scrollbars=no, location=no, status=no,top=0, left=0");
	document.postForm.target=winName;
	document.postForm.action=action;
	document.postForm.submit();
}

function expExcel(action)
{
	postForm.queryParams.value=getParams();
	postForm.advParams.value=getAdvParams();
	submitTo(action,"");
}

function impExcel(url)
{
	var url = "openExcelDiolog.qact?url="+url;
	var result=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:450px;dialogHeight:210px;center:yes;help:no;resizable:no;status:no');
	if(result==true){
		//alert(result);
		grid.getStore().reload();
		grid.bottomToolbar.updateInfo();   
	}
}


     
        
function impExcel1(url){
	var fileSelector = new Ext.form.FormPanel({
		name:'importExcelFile',
		fileUpload:	true,//指定表单将要进行文件上传
		frame:true,
		border:false,
		height:80,
		width : 200,
		items:[
			    {
			    	xtype: 'fileuploadfield',
		            id: 'fileopen',
		            width:200,
		            emptyText: '请选择一个Excel文件!',
		            fieldLabel: '上传文件',
		            name: 'fileopen',
		            buttonText: '',
		            buttonCfg: {
		                iconCls: 'upload-icon'
		            }
	        	},
	        	{
			    	xtype: 'xstatictextfield',
		            width:200,
		            fieldLabel: '说明',
		            value:"请点击文本框右边的图片，然后选择个一个Excel文件后，点击下面的导入按钮。"
	        	}
		    ],
		buttons : [{
			text : '开始导入',
			handler : function(){
				if(fileSelector.form.isValid() == false){
					//表单验证失败
				}else{
					var v = fileSelector.getForm().findField("fileopen").value;
					
					if(new RegExp('\\.'+"xls"+'$','i').test(v))
					{
						fileSelector.form.doAction('submit',{
							clientValidation:true,
							url:url,
							method:'POST',
							success:function(form,action){
								var serverData=action.response.responseText;
								var data;
								try {
									data=eval("("+serverData+")");
								}
								catch (ex) {
									alert("文件导入失败!原因：\r\n"+serverData);
									return;
								}
								alert("文件导入成功。");
								refresh();
								window.close();
							},
							failure:function(form,action){
								alert("文件导入失败，请查看EXCEL文件数据！");
								this.location.reload();
								window.hide();
							}
						});
					}else{
						alert("只允许选择Excel文件！");
					}
					
				}
			}
		},
		{
			text : '关闭',
			handler : function(){
				window.close();
			}
		}]
	});
	
	var window = new Ext.Window({
        title: '数据导入窗口',
        width: 400,
        height:200,
        minWidth: 300,
        minHeight: 200,
        layout: 'fit',
        plain:true,
        bodyStyle:'padding:5px;',
        buttonAlign:'center',
        items: fileSelector
    });

    window.show();
    
}
//处理 日期格式显示  把yyyy-mm-dd 00:00:00格式。截取为yyyy-mm-dd格式
//时间为空,不隐藏数据
function dateRenderer(val, cellmeta, record, rowIndex, colIndex, store,isSumRender)
{
//alert(val);
  if(!val)
  	return '';
  val= val.substring(0,10);
  return val;
}

function removeFile(url,needSel)//删除
{
	if(checkSelect(needSel))
	{
		 var selectionModel = grid.getSelectionModel();   
		 var rows = selectionModel.getSelections();   
		 if(!window.confirm("确定要移除选中的"+rows.length+"条记录"))
		 {
		 	return;
		 }
	     
	     var store = grid.getStore();   	     
	     
	     var idList=[];  
	    idList=getSelectId();	
        var params = {};   
           
        params['_table_pk'] = idList;   

        Ext.Ajax.request({method:'POST',   
            url: url,    
            params: params,   
            success: (function(response) {   
                var result = Ext.decode(response.responseText);  
                var resultJson = eval('(' + result + ')');
                if (resultJson.rs) {   
				     for (var i = 0; i < rows.length; i++) {
						var record = store.getById(rows[i].id);	                           
                        store.remove(record);  
                        store.totalLength--;
				     } 		                      
                	
                }else{
                	alert('删除失败');  
                	
                } 
                store.commitChanges();
                if(grid.bottomToolbar && grid.bottomToolbar.getPageData){
                	updatePageUI(grid.bottomToolbar);            	
                }
            }), 
            failure:(function(response) 
            {
            	alert('移除失败！');   
            }),  
            scope: this  
        });    			      
	}
	//window.close();
}

function downfile(url){
	this.location=url;
}