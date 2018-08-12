function delRole()
{
	var selectionModel = grid.getSelectionModel();   
    var rows = selectionModel.getSelections();   
     
    var idList=[];  
    for (var i = 0; i < rows.length; i++) {
        if(rows[i].id == "roleId=ROLE_ANONYMOUS__________________")
        {
        	alert("匿名角色不允许删除");
        	return;
        }
    }    
    del("au_rolesDelete.qact",">=1");
}