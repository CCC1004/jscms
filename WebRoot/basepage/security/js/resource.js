//刷新后台权限配置
function RefreshAuth()
{
        Ext.Ajax.request({method:'POST',   
            url: "Au_RefreshAuthorities.qact",    
            success: (function(response) {   
                var result = Ext.decode(response.responseText);   
                if (result.success) {   
	                alert('刷新完成');        	 
                } else  
                    alert('刷新失败');   
            }), 
            failure:(function(response) 
            {
            	alert('刷新失败');   
            }),  
            scope: this  
        });  	
}

function upAuthOfRes(url,needSel)
{
	submitTo(url+"&resid="+getSelectId()[0].split('=')[1],needSel);
}