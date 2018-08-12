$(document).ready(function(){
	$("#addForm_j_upload").parent().append("<div id='selfDiv'>1233</div>");
	var path=$("#savePath").val();
	
	alert('111111111'+path);
	$("#addForm_j_upload").uploadify({
		'swf':'Components/jquery/uploadify/uploadify.swf',
		'uploader':'hsxqcl_uploadFile.qact',
		'fileObjName':'upload',
		'cancel':'Components/jquery/uploadify/uploadify-cancel.png',
		'buttonText':'选择文件hao',
		'auto':true,
		'fileSizeLimit' : '102400KB',  //上传文件大小限制
		'queueSizeLimit' : '20', //同时上传的文件最大数
		'displayData' : 'percentage',    //有speed和percentage两种，一个显示速度，一个显示完成百分比
		'fileTypeDesc' : '支持:jpg/jpeg/png/bmp', //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
		'fileTypeExt' : '*.jpg,*.jpeg,*.png,*.bmp',  //允许的格式
		'queueID' : 'pic',  //显示待上传文件列表的div区域
		'formData' : {'savePath': path},
		'multi': true,	//允许同时上传 
		'onUploadSuccess' : function(file, data, response) {}
	});
});