//组织新增或者修改时校验组织类型设置是否有效
function checkOrgType(isadd,url){
	var form ;
	if(isadd == 1){
		form = document.addForm;
	}else {
		form = document.updateForm;
	}
	//判断上级组织是否为空
	if(!form.parentid.value){
		if(form.type.value!='0000'){
			alert('上级组织为空的顶级组织只能是行政区类型，请修改上级组织或者组织类型');
			return;
		}else{
			submitTo(url);
		}
	}
	else{
		var param = {'parentid':form.parentid.value,'type' : form.type.value};
		new Ajax.Request(
			'checkOrgType.qact',
			{
				method: 'get',
				parameters: param,
				asynchronous: true ,
				onComplete: function(req){
					var responseArray = eval('('+req.responseText+')');
					if(responseArray.success=='true'){
	                 	submitTo(url);
	                 }
	                 else{
	                 	alert(responseArray.error);
	                 }
				}
			}
			);
	}
}
//打开扩展属性的编辑窗口
function showAddtEdit(url){
	if(!url){
		alert('该组织结点没有扩展属性');
		return;
	}
	window.open(url,'','');
}