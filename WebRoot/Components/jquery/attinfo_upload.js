/*$(document).ready(function (){
	var url = location.search; //获取url中"?"符后的字串
	var s=url.split("=");
	var id=s[2];
	var type=s[1];
	var type_id=type.substring(0,1);
	//alert(type_id);
	$("#addForm_mid").val(id);
	var boarddiv = "<div id='type_id' style='display:none;background:white;width:10px;height:100px;z-index:999;position:absolute;top:0;margin-top:100px;'>加载中...</div>";
	$(window.opener.document.body).append(boarddiv);
	window.opener.document.getElementById("type_id").value=type_id;
});*/

/*$("#addForm_upldt").live("click",
		function (){
	WdatePicker();
}
);*/

function showADDUpload(tablename){
	
	if(fujanupdat()){
		if($('#addForm_attid').val()!='')
		{
			 var url = "uploadDiolog.qact?group="+$('#addForm_attid').val()+"&type=0";
			 var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
			 return;						
		}
		$.ajax({
			url: "getAttInfoId.qact",
			cache: false,
			data: {tableName:tablename},
			dataType :'json',
			async:false,  
			success: function(data) {
				 fileGroup=data.pk;
				 $('#addForm_attid').val(fileGroup);
			},
			error: function(data) {
				alert("数据传输失败！"+data.success);
			}
			
		});
			var url = "uploadDiolog.qact?group="+fileGroup+"&type=0";
			var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
		 return;
	}
}
function toshowADDUpload(tablename){
	
	if(fujanupdat()){
		if($('#addForm_attid').val()!='')
		{
			 var url = "uploadDiolog.qact?group="+$('#addForm_attid').val()+"&type=0";
			 var isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;
			 if (isChrome) {
				 var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
			}else{
				var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
			}
			 return;						
		}
		$.ajax({
			url: "getAttInfoId.qact",
			cache: false,
			data: {tableName:tablename},
			dataType :'json',
			async:false,  
			success: function(data) {
				 fileGroup=data.pk;
				 $('#addForm_attid').val(fileGroup);
			},
			error: function(data) {
				alert("数据传输失败！"+data.success);
			}
			
		});
			var url = "uploadDiolog.qact?group="+fileGroup+"&type=0";
			var isChrome = navigator.userAgent.toLowerCase().match(/chrome/) != null;
			 if (isChrome) {
				 var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
			}else{
				var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:600px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
			}
		 return;
	}
}
//获取附件编号
function submitToGenSave(tablename) {
	  if($('#addForm_attid').val()!='')
		{
		  return;				
		}
	  var fileGroup='';
	       $.ajax({
							url: "getAttInfoId.qact",
							cache: false,
							data: {tableName:tablename},
							dataType :'json',
							async:false,  
							success: function(data) {	
								fileGroup=data.pk;										
							},
							error: function(data) {
								alert("数据传输失败！"+data.success);
							}
							
						});	
						
			$('#addForm_attid').val(fileGroup);
	     
	 }
/**
 * 重写EasyUI的equals方法
 */
$.extend($.fn.validatebox.defaults.rules, {
	equals: {
        validator: function(value, param){
            return value != param[0];
        },       
        message: ''
    }
});
//信息发布页面的验证
function xindfb(){
	//发布时间
	$("#dt").validatebox({
 		required:true,
 		missingMessage:'请填写信息发布时间'
 	});
	//信息来源
	$("#infosrc").validatebox({
 		required:true,
 		validType:"equals['0']",
 		invalidMessage:'请填写信息来源'
 	});
	//面向单位
	$("#mjcmp").validatebox({
 		required:true,
 		missingMessage:'请填写面向单位'
 	});
	//信息名称
	$("#infonm").validatebox({
 		required:true,
 		missingMessage:'请填写信息名称'
 	});
	//信息等级
	$("#infosl").validatebox({
 		required:true,
 		missingMessage:'请填写信息等级'
 	});
	//信息内容
	$("#infocnt").validatebox({
 		required:true,
 		missingMessage:'请填写信息信息内容'
 	});
	return $("#form4").form('validate');
}
//结果与归档验证
function jgygd(){
	//档案编号
	$("#fnum").validatebox({
 		required:true,
 		missingMessage:'请填写档案编号'
 	});
	//归档人
	$("#username").validatebox({
 		required:true,
 		missingMessage:'请填写归档人'
 	});
	//归档日期
	$("#dt").validatebox({
 		required:true,
 		missingMessage:'请填写归档日期'
 	});
	//档案名称
	$("#fname").validatebox({
 		required:true,
 		missingMessage:'请填写档案名称'
 	});
	//档案描述
	$("#fdsc").validatebox({
 		required:true,
 		missingMessage:'请填写档案描述'
 	});
	return $("#form5").form('validate');
}
//附件上传字段验证
function fujanupdat(){
	//附件名称
	$("#attnm").validatebox({
 		required:true,
 		missingMessage:'请填写附件名称'
 	});
	//附件密级
	$("#attlv").validatebox({
 		required:true,
 		validType:"equals['0']",
 		invalidMessage:'请填写附件密级'
 	});
	//上传单位
	$("#mjcmp").validatebox({
 		required:true,
 		missingMessage:'请填写上传单位'
 	});
	//上传时间
	$("#upldt").validatebox({
 		required:true,
 		missingMessage:'请填写上传时间'
 	});
	return $("#form1").form('validate');
}
function toGenSave(type){
	//getUrl();
	if(1==type){
		if(xindfb()){
			var form2=$("#form4");
			var url="fbxinx_save.qact";
			form2.attr('action',url);
			form2.submit();
		}
	}else if(2==type){
		if(jgygd()){
			var from5=$("#form5");
			var url="hyjggd_save.qact";
			from5.attr('action',url);
			from5.submit();
		}
	}else{
		var form=$("#form1");
		var url="hsgl_fujiansave.qact";
		form.attr('action',url);
		form.submit();
	}
	
}
//获得上传附件的路径
function getUrl(){
	 var attid1=$('#addForm_attid').val();
	  if(attid1!=""){
		  $.ajax({
			  url: "geturl.qact",
				cache: false,
				data: {attid1:attid1},
				dataType :'json',
				async:false,  
				success: function(data) {
					var url=data.pk;
					var ur=url.replace(/%/g,"\\");
					$("#addForm_attloc").val(ur);
				},
				error: function(data) {
					alert(data.pk);
					alert("数据传输失败！"+data);
				}
		  });
	  }
}
//向中间表插入数据
function savemetid(){
	var attid=$('#addForm_attid').val();
	  var mid= $("#addForm_mid").val();
	  $.ajax({
		  url:"saveattinfo.qact",
		  cache:true,
		  data:{attid:attid,mid:mid}
	  });
}
function GenSave(url,tableName){
	var valid = new Validation('addForm', {onSubmit:false});
	submitToGenSave(tableName);
	savemetid();
    if(valid.validate())
    {
    	getUrl();
    	document.addForm.action = url ;
    	
		document.addForm.submit() ;
		fuzhi();
		guanbi();
		if (window.addForm.submit()){
			window.close();
		}
    }
	
}
function guanbi(){
	window.close();
}
//获得和这条会议相关的附件
function fuzhi(){
	var mid=$("#addForm_mid").val();
	var type_id=window.opener.document.getElementById("type_id").value;
	$.ajax({
		url:'getfujianjson.qact',
		type:"post",
		cache:true,
		data:{mid:mid},
		async:false,
		success:function(data){
			var json=eval("("+data+")");
			if(type_id==1){
				$(window.opener.document.getElementsByTagName("tr")).remove(".delete");
				for(var i=0;i<json.length;i++) 
				{
					var trStr ="<tr class='delete'>>"
	                        +"<td>"+json[i].UPLDT+"</td>" 
	                        +"<td>"+json[i].ATTNM+"</td>"
	                        +"<td>"+json[i].UPLCMP+"</td>"
	                        +"<td>"+json[i].ATTDSC+"</td>"
	                        +"</tr>";
					$(window.opener.document.getElementById("fujian")).parent().append(trStr);
				}
			}else{
				$(window.opener.document.getElementsByTagName("tr")).remove(".delete");
				for(var i=0;i<json.length;i++) 
				{
					var trStr ="<tr class='delete'>>"
	                        +"<td class='alignCenter'><input type='text' value='"+json[i].ATTNM+"'/></td>" 
	                        +"<td class='alignCenter'><input type='text' value='"+json[i].UPLDT+"'/></td>"
	                        +"<td><input type='text' value='"+json[i].UPLCMP+"'/></td>"
	                        +"</tr>";
					$(window.opener.document.getElementById("fujian")).parent().append(trStr);
				} 
			}
			
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	});
	if(type_id==1){
		window.opener.document.getElementById("attnm").innerHTML=$("#addForm_attnm").val();
		window.opener.document.getElementById("upldt").innerHTML=$("#addForm_upldt").val();
		window.opener.document.getElementById("uplcmp").innerHTML=$("#addForm_uplcmp").val(); 
		window.opener.document.getElementById("ATTDSC").innerHTML=$("#addForm_attdsc").val();
	}else{
		window.opener.document.getElementById("attnm").value=$("#addForm_attnm").val();
		window.opener.document.getElementById("upldt").value=$("#addForm_upldt").val();
		window.opener.document.getElementById("uplcmp").value=$("#addForm_uplcmp").val();
	}
	
}

