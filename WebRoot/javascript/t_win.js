/*
窗口公用调用
包含方法
function openWin(url,w,h) 打开新居中窗口 
function showDiv(url,titlename,width,height) 打开DIV 关闭DIV
function fnTabClick( nTab ) 翻页 
function openOrgByTpye(type,formnm,name) 树图行政分区
function openWrrcd(formnm,name) 5、树图水资源分区
*/
/*
注意页面要定义 W3C 	标准 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
url 
titlename 头信息
*/
function showDiv(url,titlename,width,height,type){ 
	
	 var msgw, msgh, bordercolor;
	 msgw = width;//提示窗口的宽度
	 msgh = height;//提示窗口的高度
	 titleheight = 25 //提示窗口标题高度
	 bordercolor = "#A480B2";//提示窗口的边框颜色
	 titlecolor = "#B3DCEF";//提示窗口的标题颜色
  
	 //根据自己需求注意宽度和高度的调整
	 var iWidth = document.documentElement.clientWidth; 
	 var iHeight = document.documentElement.clientHeight; 

	 //遮罩层
	 var bgObj = document.createElement("div"); 
	 bgObj.setAttribute("id", "bgObj");//设置ID
	 bgObj.style.cssText = "position:absolute;left:0px;top:0px;width:"+iWidth+"px;height:"+Math.max(document.body.clientHeight, iHeight)+"px;filter:Alpha(Opacity=30);opacity:0.3;background-color:#000000;z-index:101;";
	if(type!=1)
	  document.body.appendChild(bgObj); 

	 //弹出窗口
	 var msgObj=document.createElement("div");
	 msgObj.setAttribute("id", "msgDiv");//可以用bgObj.id="msgDiv"的方法，是为div指定属性值
	 msgObj.setAttribute("align", "center");//为div的align赋值
	 msgObj.style.background = "white";//背景颜色为白色
	 msgObj.style.border = "1px solid " + bordercolor;//边框属性，颜色在上面已经赋值
	 msgObj.style.position = "absolute";//绝对定位	 
	 msgObj.style.left = (iWidth-msgw)/2 +"px" ;//从左侧开始位置
	 msgObj.style.top = (iHeight-msgh)/2+"px";//从上部开始位置
	 msgObj.style.font = "12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";//字体属性
	 msgObj.style.width = msgw + "px";//提示框的宽(上面定义过)
	 msgObj.style.height = msgh + "px";//提示框的高(上面定义过)
	 msgObj.style.textAlign = "center";//文本位置属性，居中。
	 msgObj.style.lineHeight = "25px";//行间距
	 msgObj.style.zIndex = "102";//层的z轴位置
	 document.body.appendChild(msgObj);

	 //弹出窗口标题
	 var title = document.createElement("div");//创建一个标题对象
	 title.setAttribute("id", "msgTitle");//为标题对象填加id
	 title.style.margin = "0";//浮动
	 title.style.padding = "3px";//浮动
	 title.style.background = titlecolor;//背景颜色
	 title.style.filter = "progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
	 title.style.opacity = "0.75";//透明
	 //title.style.border="1px solid " + bordercolor;//边框
	 title.style.height = "25px";//高度
	 title.style.font = "12px Verdana, Geneva, Arial, Helvetica, sans-serif";//字体属性
	 //title.style.color = "red";//文字颜色
	 title.style.cursor = "move";//鼠标样式
	 //title.innerHTML="<table border='0' width='100%'><tr><td align='left'>"+titlename+"</td><td align=\"right\" onclick='closeDiv()'>关闭</td></tr></table>"; 
	 title.innerHTML="<table border='0' width='100%'><tr><td align='left'>"+titlename+"</td><td align=\"right\"><a href='javaScript:closeDiv()'>关闭</a></td></tr></table>";

	 //设置窗口可移动
	
	 var moveX = 0;
	 var moveY = 0;
	 var moveTop = 0;
	 var moveLeft = 0;
	 var moveable = false;
	 var docMouseMoveEvent = document.onmousemove;
	 var docMouseUpEvent = document.onmouseup;
	 title.onmousedown = function() {
	   var evt = getEvent();
	   moveable = true; 
	   moveX = evt.clientX;
	   moveY = evt.clientY;
	   moveTop = parseInt(msgObj.style.top);
	   moveLeft = parseInt(msgObj.style.left);   
	   document.onmousemove = function() {   
	         if (moveable){
	     var evt = getEvent();
	     var x = moveLeft + evt.clientX - moveX;
	     var y = moveTop + evt.clientY - moveY;
	     if ( x > 0 &&( x + msgw < iWidth) && y > 0 && (y + msgh < iHeight) ){
	      msgObj.style.left = x + "px";
	      msgObj.style.top = y + "px";
	     }
	    } 
	   };
	   document.onmouseup = function (){ 
	    if (moveable) { 
	     document.onmousemove = docMouseMoveEvent;
	     document.onmouseup = docMouseUpEvent;
	     moveable = false; 
	     moveX = 0;
	     moveY = 0;
	     moveTop = 0;
	     moveLeft = 0;
	    } 
	   };
 	}
	 //获得事件Event对象，用于兼容IE和FireFox
	 function getEvent() {
	  return window.event || arguments.callee.caller.arguments[0];
	 }
 
	 msgObj.appendChild(title);//在提示框中增加标题
	 var txt = document.createElement("div");
	 txt.style.margin = "0px";//文本浮动
	 txt.setAttribute("id", "msgTxt");//为p属性增加id属性
	 txt.innerHTML = "<iframe id ='subf' src='"+url+"' width='100%' height='"+(height-25)+"' frameBorder='0'></iframe>";//str;//把传进来的值赋给p属性
	 msgObj.appendChild(txt);//把p属性增加到提示框里
} 

//添加关闭功能
function closeDiv() {
    var msgTitelObject = document.getElementById("msgDiv");
    document.body.removeChild(msgTitelObject);
    var bgObj = document.getElementById("bgObj");
    document.body.removeChild(bgObj);

}

/*
打开窗口
*/
function openWin(url,w,h)
{
	var top=(screen.availHeight-h)/2;
	var left=(screen.availWidth-w)/2;
	
	var win=window.open(url, "popupwin", "height="+h+", width="+w+
	", top="+top+", left="+left+", toolbar=0, menubar=0, scrollbars=1, resizable=1,location=0, status=1");
	win.focus();
}
/**
 * 打开全屏窗口带滚动
 * @param url
 * @returns
 */
function openFullWindowScroll(url){
	var subwinname;
	var windowheight=screen.height;
	var windowwidth =screen.width;
	subwinname = window.open(url,"_blank","resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,directories=no,width=" + windowwidth +",height=" + windowheight + ",top=0,left=0");
	subwinname.focus();
	return subwinname;
}

/**
 * 获取当前页面的总宽度
 * @param percent 百分比 值范围：0~1
 * @returns
 */
function getBodyWidth (percent) {
	var bodyWidth = $jquery(document).width();
	return parseInt((bodyWidth) * percent, 10);
};

/*
jsp 多页 翻页
nTab 页码
*/
function fnTabClick( nTab )
{
	nTab = parseInt(nTab);
	var oTab;
	var prevTab = nTab-1;
	var nextTab = nTab+1;
	event.cancelBubble = true;
	el = event.srcElement;
	for (var i = 0; i < tabsContent.length; i++)
	{	
		oTab = tabs[i];
		oTab.className = "biaoqian1-2";
		oTab.style.borderLeftStyle = "";
		oTab.style.bordercenterStyle = "";
		tabsContent[i].style.display = "none";
	}
	tabsContent[nTab].style.display = "block";
	tabs[nTab].className = "biaoqian2-2";
	oTab = tabs[nextTab];
	if (oTab) oTab.style.borderLeftStyle = "none";
	oTab = tabs[prevTab];
	if (oTab) oTab.style.bordercenterStyle = "none";
	event.returnValue = false;
}


/*
	打开行政分区树形图
	type: 0000 固定 组织表中表示分区
	formnm: form名称
	name: 字段名称
	调用方式如"
	表来源 au_organization type类型0000表示行政分区
	<input type="text" name="_alongshoreSetBean.wrSmsbsinfB.addvcd_name" value='<ql:code table="ADDV" property="addvcd" value="addvnm" id="${alongshoreSetBean.wrSmsbsinfB.addvcd }"></ql:code>' class="required"/>
	<input type="hidden" readonly="readonly" name="alongshoreSetBean.wrSmsbsinfB.addvcd" value="${alongshoreSetBean.wrSmsbsinfB.addvcd }" /><button onclick="openOrgByTpye('0000','form1','alongshoreSetBean.wrSmsbsinfB.addvcd')">选择</button> 					
*/
function openOrgByTpye(type,formnm,name){
	var handle =window.showModalDialog("selectOrgByType.qact?type="+type,"","dialogWidth:300px;dialogHeight:300px;scroll:yes;status:no") 
	if(handle != null){
		document.forms[formnm].elements[name].value=trimall(handle["id"]);
		document.forms[formnm].elements["_"+name+"_name"].value=handle["text"];		
	}
}
/*
	打开水资源分区树形图
	formnm: form名称
	name: 字段名称
	对应表为WRRVIEW视图
	调用方式如行政分区树形图				
*/
function openWrrcd(formnm,name)
{
	var handle =window.showModalDialog("basepage/security/selectWrr.jsp","","dialogWidth:300px;dialogHeight:300px;scroll:no;status:no") ;
	if(handle != null){
		document.forms[formnm].elements[name].value=trimall(handle["id"]);
		document.forms[formnm].elements["_"+name+"_name"].value=handle["text"];		
	}
}
//去空格
function trimall(str)
{
	return str.replace(/[ ]/g,""); 
}

//地图选址 pkname 名称的字段名
function showGisDiv()
{	
	var lgtd = document.getElementById("updateForm_lgtd").value;
	var lttd = document.getElementById("updateForm_lttd").value;
	var url = "/fjszy/map/arcgisApp/setPoint.jsp?lgtd="+lgtd+"&lttd="+lttd;
	
	showDiv(url,'地图选址',600,400);
}




  