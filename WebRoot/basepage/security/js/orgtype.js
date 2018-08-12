function delOrgType()
{
	var selectionModel = grid.getSelectionModel();   
    var rows = selectionModel.getSelections();   
     
    var idList=[];  
    for (var i = 0; i < rows.length; i++) {
        if(rows[i].id == "ID=0000")
        {
        	alert("行政区类型不允许删除");
        	return;
        }
    }    
    del("QLDelete_ql.au_org_type.qact",">=1");
}