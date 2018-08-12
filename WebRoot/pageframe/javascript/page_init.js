var menuMap = new Map() ; 		//当前id菜单对应的子孙菜单
var qlmenu = new QLMenu() ;
var menuRoots = new Array() ; 	//从根菜单开始的菜单树,顶级菜单
var pageLayout = new LayoutClass() ;
var mMap ;//叶子结点处理后的菜单集合Map

var xmlHttp;
var region1_menu ;
var region2_menu ;
var region3_menu ;
var rootDtree ;
var tabLinkIndex = ''; //tab页选中的索引
//var xmlDoc;

// 创建异步调用对象
function createXMLHttpRequest() {
	if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
}

function loadxml(xmlFile)
{
   var xmlDoc;
    if(window.ActiveXObject)
    {
        xmlDoc    = new ActiveXObject('Microsoft.XMLDOM');
        xmlDoc.async    = false;
        xmlDoc.load(xmlFile);
    }
    else if (document.implementation&&document.implementation.createDocument)
    {
        xmlDoc    = document.implementation.createDocument("","",null);
        xmlDoc.load(xmlFile);
    }
    else
    {
        return null;
    }
    
    return xmlDoc;

}



// AJAX异步请求,在请求的时候,要结一段时间用来加载内容
function loadMenuAndInit(url) {
	xmlHttp = createXMLHttpRequest();
	xmlHttp.onreadystatechange = handleStateChange;	
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);

}

// AJAX的回调处理函数
function handleStateChange() {	
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {			
			parseXmlMenu();		//解析XML
			pageInit() ;		// 初始化页面请求			
		}
	}
}

//从XML配置文件或数据库读取数据初始化所有的菜单
// 解析菜单XML文件,数据全部放到内存里
function parseXmlMenu() {	
	
	var xmlDoc = xmlHttp.responseXML;	
	
	var xmlMenus = xmlDoc.getElementsByTagName('Menus')[0] ;
	var rootIds = new Array() ;
	var mcnt = xmlMenus.childNodes.length;

	//把所有的菜单结点加入到map中
	for(var i=0; i<mcnt; i++) {
		var xmlMenu = xmlMenus.childNodes[i];	
		if(xmlMenu.nodeType==8) {
		  	continue;
		}
		var name = xmlMenu.getAttribute('name');
		var id = xmlMenu.getAttribute('id')+'';
		var image = xmlMenu.getAttribute('image');
		var pid = xmlMenu.getAttribute('pid')+'';
		var tLink = xmlMenu.getAttribute('tLink') ;
		var sequence = xmlMenu.getAttribute('sequence') ;
		var lktp= xmlMenu.getAttribute('lktp') ;
		if(sequence=='')
			sequence=0;
		var menu = MenuClass.newMenu(id,pid,name,tLink,image,sequence,lktp);
		menuMap.put(id, menu) ;		
	}

	//对map中的菜单结点进行父子关系约束
	var mapArray = menuMap.arr ;	
	for(var i=0; i<mapArray.length; i++) {
		var menu = mapArray[i].value ;		
		if(menu.pid==null || menu.pid=='null' ) {
			rootIds.push(menu.id) ;	//保存父ID	
		}
		else if(menuMap.get(menu.pid) == null)
		{
			menu.pid=null;
			rootIds.push(menu.id) ;	//保存父ID	
		}	
		else {//加入到父菜单中			
			menuMap.get(menu.pid).subMenus.push(menu) ;
		}
	}
	//得到根结点的集合
	for(var i=0; i<rootIds.length; i++) {
		menuRoots.push(menuMap.get(rootIds[i])) ;
	}
	
	menuRoots.sort(menuSort);//对根菜单进行排序
	//对所有子菜单按指定顺序进行排序
	for(var i=0; i<mapArray.length; i++) {
		var menu = mapArray[i].value ;	
		if(menu.subMenus.length>0)
			menu.subMenus.sort(menuSort);
	}	

}


function menuSort(a,b){
	return a.sequence - b.sequence;
}
//初始化打开页面
function pageInit() {

	//得到3个菜单显示域,与页面有耦合
	region1_menu = window.document.getElementById("region1_menu");
	region2_menu = window.document.getElementById("region2_menu");
	region3_menu = window.document.getElementById("region3_menu");
	
	//设置菜单内容
	qlmenu.setMenuRegion1(qlmenu.index_re1) ;
};

//初始化打开页面
function pageReInit(region) {
	if(region==1)
	{
		if(qlmenu.index_re1 == "-1" )
			return;
		region1_menu = window.document.getElementById("region1_menu");
		qlmenu.setMenuRegion1(qlmenu.index_re1) ;
	}
	else if(region==2)
	{
		if(qlmenu.index_re2 == "-1" )
			return;
		region2_menu = window.document.getElementById("region2_menu");
		qlmenu.setMenuRegion2(qlmenu.index_re2) ;
	}
	else if(region==3)
	{
		if(qlmenu.index_re3 == "-1" )
			return;	
		region3_menu = window.document.getElementById("region3_menu");
		qlmenu.setMenuRegion3(qlmenu.index_re3) ;
	}
	else if(region==4) {
		if(qlmenu.index_re4 == "-1" )
			return;
		qlmenu.refrushMenuRegion4(qlmenu.index_re4) ;
	}
	
};

//初始化index
function menuReInit(menuRoot) {
	if(pageLayout.hasRegion1) {
		qlmenu.index_re1 = menuRoot.id ;
		if(pageLayout.hasRegion2) {			
			if(menuRoot.subMenus.length != 0) {
				qlmenu.index_re2 = menuRoot.subMenus[0].id ;
				if(pageLayout.hasRegion3) {//true,true,true
					if(menuRoot.subMenus[0].subMenus.length != 0) {
						qlmenu.index_re3 = menuRoot.subMenus[0].subMenus[0].id ;
					}
				}
			}
		} else {//true,false,true(false)
			if(menuRoots[0].subMenus.length != 0) {
				qlmenu.index_re3 = menuRoot.subMenus[0].id ;
			}
		}
	} else {
		if(pageLayout.hasRegion2) {
			qlmenu.index_re2 = menuRoot.id ;
			if(pageLayout.hasRegion3) {//false,true,true
				if(menuRoot.subMenus.length != 0) {
					qlmenu.index_re3 = menuRoot.subMenus[0].id ;
				}
			}
		} else {
			if(pageLayout.hasRegion3) {//false,false,true
				qlmenu.index_re3 = menuRoot.id ;
			}
		}
	}
};

function openLink(lktp,link){
    var url;
    if(link == null || link == 'null' || link=='') {
        link = blankPage ;
    }
        
    if(link.substr(0,7)=="http://" || link.substr(0,8)=="https://")
    	url=link;
    else 
        url = rootPath + link;

	if(lktp=='2'){
		window.open(url);
		
	}
	else if(lktp=='3'){
		document.location=url;
	}
	else{
		document.getElementById('fraMain').src=url;
	}
}

function showTabLink(links, id) {
	
	qlmenu.index_re4 = id ;
    var subMu = menuMap.get(id+'') ; 
    var title = getTitle(subMu) ;    
    if(document.getElementById("curLc") == null)
    {
       document.getElementById('fraMain').src = blankPage;
    	return;
    }
    document.getElementById("curLc").innerHTML = title;

    if(links.indexOf(',') == -1) {//简单的链接
    
        document.getElementById('ul').style.display = 'none' ;
        resetSize();
        openLink(subMu.lktp , links);
        //document.getElementById('fraMain').src=url ; 
        //window.mainFrame.document.frames['fraMain'].location = rootPath+links ;                    
        return ;
    }
    var str = '';
    var clickIndex = 0 ;
    var array=links.split(';');
    for(var i=0; i<array.length; i++) {
        var arr=array[i].split(',');
        if(arr.length == 2) {//是tab页
        	if(tabLinkIndex == arr[1]) {
        		clickIndex = i ;
        	}
            str += "<li id='link" + i + "' class='default' url='" + arr[0];
            str += "' onclick='javascript:openIn(this);'>" + "<span>" + arr[1] + "</span>" + "</li>" ;
        }//加了个span 标签----------------------------------------^^^^^^^^^^^^^^^^^^^^^^^^--------------------2010.4.23
    }   
    if(str.length>0){
        document.getElementById('nav1').innerHTML=str;
        //记住下面的数组序号
        document.getElementById('nav1').getElementsByTagName('li')[clickIndex].click();
    }
}

//是上面showTabLink方法的一个递归实现"当前位置"             
function getTitle(subMu) {            
    if(subMu.pid==null || subMu.pid=='null' || subMu.pid=="-1") {//没有父结点了
        return subMu.name ;
    } else {
        var pmenu = menuMap.get(menuMap.get(subMu.pid+'').id+'') ;
        var ts = getTitle(pmenu) ;
        return ts + '>>' + subMu.name ;
    }
}

function openIn(obj){
    document.getElementById('ul').style.display = '' ;
    var o=document.getElementById('nav1').getElementsByTagName('li');     
    for(var i=0; i<o.length; i++){
        o[i].className = 'default' ;
    }
    obj.className = 'active';                
    var link  = obj.url ;
    tabLinkIndex = obj.innerHTML ;
    if(link==null || link=='null' || link=='') {
        link = blankPage ;
    }
    var url;
    if(link.substr(0,7)=="http://" || link.substr(0,8)=="https://")
    	url = link;
    else 
        url = rootPath + link;
    document.getElementById('fraMain').src=url ;     

    resetSize();
   // document.frames['fraMain'].location = rootPath+link; 
}
 
//树结点点击事件
dTree.prototype.changeFrame=function(link, id ){
 	showTabLink(link, id) ;
};
