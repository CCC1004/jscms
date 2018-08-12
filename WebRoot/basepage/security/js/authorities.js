function showPop(url)
{
	url=url+"?"+getParams2();
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:650px;dialogHeight:610px;center:yes;help:no;resizable:yes;status:no');
	  if(r!=null)
	  {
		quickSearch();//刷新
	  }	
//	document.location=url+"?"+getParams2();
}

function showPop2(url)
{
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:650px;dialogHeight:610px;center:yes;help:no;resizable:yes;status:no');
	  if(r!=null)
	  {
		quickSearch();//刷新
	  }	
}

function showResource(url)
{
	var selectionModel = grid.getSelectionModel();   
    var rows = selectionModel.getSelections();   
    if(rows.length==0){
    	alert("请先选择要设置的权限");
    	return;
    }
    var idList=[];  
    for (var i = 0; i < rows.length; i++) {
        //rows[i].id.split("=")[1];
    	idList.push(rows[i].id.split("=")[1]);
    }
    showPop2(url+"?authIds="+idList);
}