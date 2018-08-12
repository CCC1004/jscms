function doInsert(url)
{
	document.addForm.password.value=MD5(document.addForm.password1.value);
	submitTo(url);
}
function doUpdate(url)
{
	if(document.updateForm.password1 &&　document.updateForm.password1.value != "")
		document.updateForm.password.value=MD5(document.updateForm.password1.value);
	submitTo(url);
}


function saveUserForOrg(){
	var selectionModel = grid.getSelectionModel();   
	var rows = selectionModel.getSelections();
	var store = grid.getStore();   
	if(document.queryForm.orgId.value == ""){
		alert("请先选择组织");
		return;
	}
	if(rows.length == 0)
	{
		alert("请选择要加入到组织的用户");
		return;
	}
	var ids = "";
	for(var i=0;i<rows.length;i++){
		if(i == 0){
			ids = ids + rows[i].get("userId-1");
		}else{
			ids = ids + ","+rows[i].get("userId-1");
		}
	}
	Ext.MessageBox.show({ 
		title: '请稍等', 
		msg: '正在保存...', 
		progressText: '', 
		width:300, 
		progress:true, 
		wait:true,
		closable:false, 
		animEl: 'loding' 
	}); 
	Ext.Ajax.request({
	                 url: 'saveUserByOrg.qact',
	                 params: {
						 userId:ids,
						 orgIds:document.queryForm.orgId.value
	                 },
	                 success: function(response, options) {
	                 		  Ext.MessageBox.hide();	
	                          var responseArray = Ext.util.JSON.decode(response.responseText);                                             
	                          if(responseArray.success=='true'){
								    parent.window.returnValue='1';
								    parent.window.close();	                              
	                             }
	                             else{
	                        	   alert("加入用户失败"); 	                        	  
	                             }
	                           },
	                 failure:(function(response) 
	     		              {
	     		            	Ext.MessageBox.hide();
	     		            	alert("加入用户失败");   	     		            	
	     		              }) 
	        });
}