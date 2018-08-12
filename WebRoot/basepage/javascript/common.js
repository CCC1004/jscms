
//关闭或者返回
function closeWindow()
{
	//判断是否模式窗口
	if(window.dialogHeight)
		parent.window.close();
	if(getSuccessURL()!="")
		document.location=getSuccessURL();
	else
		window.history.back();
	return;
}

//在当前窗口打开URL
function openURL(url) {
	document.location=url;
}


//判断是否回车，是的话触发Change事件
function enterToChange()
{
	if(window.event.keyCode == 13)
		window.event.srcElement.fireEvent("onchange");
}

function UrlDecode(str){ 
  var ret=""; 
  for(var i=0;i<str.length;i++){ 
   var chr = str.charAt(i); 
    if(chr == "+"){ 
      ret+=" "; 
    }else if(chr=="%"){ 
     var asc = str.substring(i+1,i+3); 
     if(parseInt("0x"+asc)>0x7f){ 
      ret+=asc2str(parseInt("0x"+asc+str.substring(i+4,i+6))); 
      i+=5; 
     }else{ 
      ret+=asc2str(parseInt("0x"+asc)); 
      i+=2; 
     } 
    }else{ 
      ret+= chr; 
    } 
  } 
  return ret; 
} 

//打开模式窗口
function openDialog(url)
{
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:650px;dialogHeight:610px;center:yes;help:no;resizable:yes;status:no');
	  return r;
}

//打开上传窗口，参数为文件组ID
function upload(group)
{
	  var url = "uploadDiolog.action?group="+group;
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:465px;dialogHeight:340px;center:yes;help:no;resizable:no;status:no');
	  return r;
}

//打开下载窗口，参数为文件组ID
function download(group)
{
	  window.open("Sys_upload/sys_uploadListView-1.action?fileGroup="+group,"开下载窗口","height=450px, width=600px, toolbar=no, menubar=no, scrollbars=no, location=no, status=no,top=0, left=0");
	  //var url = "Sys_upload/sys_uploadListView-1.action?fileGroup="+group;
	  //var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:650px;dialogHeight:610px;center:yes;help:no;resizable:no;status:no');
	  //return r;
}
//JS判断IE6,ie7,ie8,ff
function isBrowser(vision) {
    if (typeof vision == 'undefiend')
        return false;
    vision = vision.toUpperCase();
    var isIE = !!window.ActiveXObject;
    var isIE6 = isIE && !window.XMLHttpRequest;
    var isIE8 = isIE && !!document.documentMode;
    var isIE7 = isIE && !isIE6 && !isIE8;
    if (isIE) {
        if (isIE6) {
            return vision === 'IE6';
        } else if (isIE8) {
            return vision === 'IE8';
        } else if (isIE7) {
            return vision === 'IE7';
        }
    }
    else {
        return vision === 'FF';
    }
}
        
function selectDate(obj){
	if(!obj.readOnly)
	{
	   //setdayD(obj);
	   WdatePicker({dateFmt:'yyyy-MM-dd'});
	}
}
function selectDateTime(obj){
	if(!obj.readOnly)
	{
	   //setdayDT(obj);
	   WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});
	}
}
function selectYear(obj){
	if(!obj.readOnly)
	{
	   WdatePicker({dateFmt:'yyyy'});
	}
}