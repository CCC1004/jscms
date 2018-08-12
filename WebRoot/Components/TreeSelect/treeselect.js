
document.onclick = hiddenDiv;
var treeDivHeight = new Array();

String.prototype.Trim = function() { return this.replace(/(^\s*)|(\s*$)/g, ""); }  
String.prototype.LTrim = function() { return this.replace(/(^\s*)/g, ""); }  
String.prototype.RTrim = function() { return this.replace(/(\s*$)/g, ""); } 
//定义一个JS的map类
function Map() {
	var struct = function(key, value) {
		this.key = key;
		this.value = value;
	};
	var put = function(key, value){
		for(var i=0; i<this.arr.length; i++) {
			if(this.arr[i].key === key) {
				this.arr[i].value = value;
				return;
			}
		}
		this.arr[this.arr.length] = new struct(key, value);
	}; 
	var get = function(key) {
		for(var i = 0; i < this.arr.length; i++) {
			if(this.arr[i].key === key) {
				return this.arr[i].value;
			}
		}
		return null;
	}; 
	var remove = function(key) {
		var v;
		for(var i = 0; i < this.arr.length; i++) {
			v = this.arr.pop();//弹出最后一个元素
			if(v.key === key) {
				continue;
			}
			this.arr.unshift(v);//在数组头部插入元素
		}
	}; 
	var size = function() {
		return this.arr.length;
	}; 
	var isEmpty = function() {
		return this.arr.length <= 0;
	};
	this.arr = new Array();
	this.get = get;
	this.put = put;
	this.remove = remove;
	this.size = size;
	this.isEmpty = isEmpty;
}

//定义一个菜单类，核心类
function MenuClass() {
	this.id = '' ;			//菜单ID -id
	this.pid = null ;		//父结点ID -pid
	this.name = '' ;		//显示的名称
	this.subMenus = new Array() ;	//子菜单
}

//定义一个静态方法
MenuClass.newMenu = function(id, pid, name) {
	var cls = new MenuClass() ;
	cls.id = id ;
	cls.pid = pid ;
	cls.name = name ;
	return cls ;
};		


function parseXmlTree(xmlString) {	
	
	var xmlDoc;    
	if(document.implementation.createDocument){   // Mozilla, create a new DOMParser   		
		var parser = new DOMParser();   
		xmlDoc = parser.parseFromString(xmlString, "text/xml");  
	}else if(window.ActiveXObject){ 
	  // Internet Explorer, create a new XML document using ActiveX   and use loadXML as a DOM parser.   
	  xmlDoc = new ActiveXObject("Microsoft.XMLDOM") ;  
	  xmlDoc.async="false";   
	  xmlDoc.loadXML(xmlString);   
	}
	
	var menuMap = new Map() ; 		//当前id菜单对应的子孙菜单
	var menuRoots = new Array() ; 	//从根菜单开始的菜单树,顶级菜单	
	
	var xmlMenus = xmlDoc.getElementsByTagName('Tree')[0] ;	
	var rootIdValue=xmlMenus.getAttribute('rootId');
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
		var pid = xmlMenu.getAttribute('pid');
		if(pid != null && pid.RTrim()=='')
		  pid=null;
		var menu = MenuClass.newMenu(id,pid,name);
		menuMap.put(id, menu) ;		
	}
	//对map中的菜单结点进行父子关系约束
	var mapArray = menuMap.arr ;	
	for(var i=0; i<mapArray.length; i++) {
		var menu = mapArray[i].value ;		
		if(menu.pid==null || menu.pid=='' || menu.id==rootIdValue) {
			rootIds.push(menu.id) ;	//保存父ID		
		} else {//加入到父菜单中			
			menuMap.get(menu.pid).subMenus.push(menu) ;
		}
	}
	//得到根结点的集合
	for(var i=0; i<rootIds.length; i++) {
		menuRoots.push(menuMap.get(rootIds[i])) ;
	}
	return {menuMap:menuMap,menuRoots:menuRoots};
}		

//递归树型子菜单
function getDtreeItems(menuRoot, tree) {
	//menuElm是一组兄弟结点	
	var menuElm = menuRoot ;
	if(menuElm.length == 0) {
		return ;
	}
	for(var i=0; i<menuElm.length; i++) {
		var menu = menuElm[i];
		if(menu.pid=='' || menu.pid==null){
			menu.pid="-1";
		}
		//xtree.add(menu.id, menu.pid, menu.name, '') ;
		var b=new WebFXTreeItem(menu.name,menu.id,null,tree);
		//b.setId(menu.id);
		//tree.add(b);
		if(menu.subMenus.length!=0)
			getDtreeItems(menu.subMenus, b);
	}
}

function getL(e) {
	var l = e.offsetLeft;
	while (e = e.offsetParent) {
		l += e.offsetLeft;
	}
	return l;
}
function getT(e) {
	var t = e.offsetTop;
	while (e = e.offsetParent) {
		t += e.offsetTop;
	}
	return t;
}
var currDivNum = 0;
function toBig(num) {
	var tDiv = document.getElementById("TreeDiv_" + num);
	if (tDiv.style.display == "none") {
		hiddenAllDiv();
		return;
	}
	tDiv.style.pixelWidth = tDiv.style.pixelWidth + 250;
}
function dropDown(num) {

	var tDiv = document.getElementById("TreeDiv_" + num);
	hiddenAllDiv(num);
	if (tDiv.style.display == "none") {
		tDiv.style.display = "";
		getPosition(num);
		currDivNum = num;
	} else {
		tDiv.style.display = "none";
	}
	
}
function getPosition(idStr) {
	var tDiv = document.getElementById("TreeDiv_" + idStr);//document.all["TreeDiv_" + idStr];
	var vField = document.getElementById("TextField_" + idStr);
	var fieldSpan = document.getElementById("ValueFieldSpan_" + idStr);
	if(vField.offsetWidth < tDiv.scrollWidth)
		tDiv.style.pixelWidth = tDiv.scrollWidth+20;//这个数是数值的DIV的宽度数。。。
	else
		tDiv.style.pixelWidth = vField.offsetWidth;
// da.style.pixelWidth=sv.offsetWidth;
	tDiv.style.pixelLeft = getL(vField);//这个数是数值的DIV的TOP位置数中X轴的数。。。
	tDiv.style.pixelTop = getT(vField) + vField.offsetHeight;//这个数是这个数是数值的DIV的TOP位置数中Y轴的数。。。
	tDiv.style.pixelHeight = treeDivHeight[idStr];
	tDiv.style.overflowY = "auto";
	tDiv.style.overflowX = "auto";
}
var TreeSelectCount = 0;
function add(v, ID) {
	TreeSelectCount++;
}
function hiddenAllDiv(num) {
	for (j = 0; j < getDivCount(); j++) {
		if (j != num) {
			var currDiv = document.getElementById("TreeDiv_" + j);
			if (currDiv.style.display != "none") {
				currDiv.style.display = "none";
			}
		}
	}
}
function hiddenDiv() {
	var o = window.event.srcElement.id;
	if (o.indexOf("TextField_") == 0 || o.indexOf("TreeDiv_") == 0 || o.indexOf("BigButton") == 0 || o.indexOf("webfx-tree-object") == 0 || o.indexOf("SelectButton") == 0) {
		return;
	} else {
		for (j = 0; j < getDivCount(); j++) {
			var currDiv = document.getElementById("TreeDiv_" + j);
			if (currDiv.style.display != "none") {
				currDiv.style.display = "none";
			}
		}
	}
}//隐藏模拟层
function getDivCount() {
	for (var i = 0; ; i++) {
		var currDiv = document.getElementById("TreeDiv_" + i);
		if (currDiv == null || currDiv == "undefine") {
			return i;
		}
	}
}
//增加inpnubox的接口,在页面中产生一个inputbox控件,下拉列表为空
function clearTreeSelect(idStr) {
	var textNode = document.getElementById("TextField_" + idStr);
	var textNode = document.getElementById("ValueField_" + idStr);
}
function hiddenTreeSelect(idStr) {
	var textNode = document.getElementById("ValueFieldSpan_" + idStr);
	textNode.style.display = "none";
}
function displayTreeSelect(idStr) {
	var textNode = document.getElementById("ValueFieldSpan_" + idStr);
	textNode.style.display = "";
}
function disableTreeSelect(idStr, isEnable) {
	var spanNode = document.getElementById("ValueFieldSpan_" + idStr);
	var selectButtonNode = document.getElementById("SelectButton_" + idStr);
	var bigButtonNode = document.getElementById("BigButton_" + idStr);
	var textNode =document.getElementById("TextField_" + idStr);
	spanNode.disabled = isEnable;
	selectButtonNode.disabled = isEnable;
	bigButtonNode.disabled = isEnable;
	textNode.disabled = isEnable;
}
function setTreeSelectValue(idStr, value, name) {
	var textNode = document.getElementById("TextField_" + idStr);
	var valueNode = document.getElementById("ValueField_" + idStr);
	textNode.value = name;
	valueNode.value = value;
}
function openNode(tree,id){
	webFXTreeHandler.selected[tree.TreeID]=tree.getNodeById(id);
	tree.getNodeById(id).blur();
	var p=tree.getNodeById(id).parentNode;
	while(p!=null)
	{
		p.expand();
		p=p.parentNode
	}
	//tree.getNodeById(DefValue).toggle();

}
function CreateTreeSelect(name,  DefValue, xmlDoc,tdHeight,width,selectMode,validCls) {
	var DefText;
	var menu=parseXmlTree(xmlDoc);
	if(DefValue!=''){
	  var node=menu.menuMap.get(DefValue);
	  if(node == null || node == "undefine")
	  {
	  	DefValue='';
	  	DefText="(无)";
	  }
	  else
	  	DefText=node.name;
	}
	else
	  DefText="(无)";
										 
										  
	//alert(menuRoots);
	var i = getDivCount();
	if(!selectMode)
		selectMode='ALL_ELEMENT';
	 tree = new WebFXTree(i,'(无)','',selectMode);
	// tree2 = new dTree('selectTree',"pageframe/") ;
	 getDtreeItems(menu.menuRoots,tree);


	if (tdHeight != null) {
		treeDivHeight[i] = tdHeight;
	} else {
		treeDivHeight[i] = 180;
	}
	var textName = name + "_Text";
	var floorName = name + "_Floor";
	width=width-16;//减去下拉按钮的宽度
	document.write("<input id='FloorField_" + i + "' type='hidden' name='" + floorName + "' value='-1'>");	
	document.write("<input type=\"text\" style='width:"+width+"px'  readonly onclick=\"this.hideFocus=true;dropDown(" + i + ");\" value=\"" + DefText + "\" name=\"" + textName + "\" id=\"TextField_" + i + "\" class=\"ValueFieldClass "+validCls+"\" ><input type=button class='SelectButtonClass' id=\"SelectButton_" + i + "\" value=\"\u25bc\" onclick=\"this.hideFocus=true;dropDown(" + i + ");\">");
	document.write("<input id='ValueField_" + i + "' type='hidden' name='" + name + "' value='" + DefValue + "' class='"+validCls+"'>");
	document.write("</span>");
	document.write("<div id='TreeDiv_" + i + "' class='seldiv'  style='display:none;background-color:#D0DFF7;'>");
	document.write(tree);
	document.write("</div>"); 
	if(DefValue!='')
		openNode(tree,DefValue);
	else
		openNode(tree,'');	 
}
