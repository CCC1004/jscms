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
	this.id = 0 ;			//菜单ID -id
	this.pid = null ;		//父结点ID -pid
	this.name = '' ;		//显示的名称
	this.tLink = '' ;		//主页面链接
	this.image = '' ;		//图片的位置
	this.sequence = '';
	this.lktp = ''; //链接打开方式 1-内嵌窗口打开 2-新窗口中打开 3-当前窗口打开 
	this.subMenus = new Array() ;	//子菜单
}

//定义一个静态方法
MenuClass.newMenu = function(id, pid, name, tLink, image,sequence,lktp) {
	var cls = new MenuClass() ;
	cls.id = id ;
	cls.pid = pid ;
	cls.name = name ;
	cls.tLink = tLink ;
	cls.image = image ;
	cls.sequence = sequence;
	cls.lktp = lktp;
	return cls ;
};


// 页面布局控制类
function LayoutClass(){
	this.hasRegion1 = true;			// 是否有第一级菜单
	this.hasRegion2 = true;			// 是否有第二级菜单
	this.hasRegion3 = true;			// 是否有第三级菜单	
	
	//第四级菜单(树菜单),只有一层叶子结点时,是否以树的形式展示
	this.showTreeOnlyLeaf = false ;	//true表示树，false表示平面	
	this.showTabPage = true ;		//以Tab的形式展示叶子结点	
	this.showTabOnlyOneLeaf = true ;//只有一个叶子结点(兄弟)时,是否以tab的形式展示
}

LayoutClass.init = function(hasReg1, hasReg2, hasReg3, showTreeOnlyLeaf, showTabPage, showTabOnlyOneLeaf) {	
	pageLayout.hasRegion1 = hasReg1 ;
	pageLayout.hasRegion2 = hasReg2 ;
	pageLayout.hasRegion3 = hasReg3 ;
	pageLayout.showTreeOnlyLeaf = showTreeOnlyLeaf ;
	pageLayout.showTabPage = showTabPage ;
	pageLayout.showTabOnlyOneLeaf = showTabOnlyOneLeaf ;
} ;

/************************************************/
//封装成类QLMenu,菜单的主体类
function QLMenu() {
	//初始化打开的页面索引
	this.index_re1 = "-1" ;
	this.index_re2 = "-1" ;
	this.index_re3 = "-1" ;
	
	this.index_re4 = "-1" ;
}

//树型菜单渲染成HTML
//调用了dtree.js,打开第一个结点
//下面有treeFrame元素存在高耦合
QLMenu.prototype.renderTreeHtml = function(menuElms, flag) {

	var result = '' ;
	rootDtree = new dTree('parent.rootDtree','pageframe/') ;
	rootDtree.add(menuElms[0].pid, "-1", '') ;//根,构建dTree
	
	for(var i=0; i<menuElms.length; i++) {
		var menu = menuElms[i] ;
		rootDtree.add(menu.id, menu.pid, menu.name, menu.tLink) ;
		this.getDtreeItems(menu, rootDtree) ;				
	}
	result += rootDtree.toString() ;
	if(flag) {//判断第三级菜单的状态,设置初始页面
		var link = '' ;	//得到初始页面link	
		for(var i=0; i<menuElms.length; i++) {
			var m0 = menuElms[i] ;
			link = this.getInitLink(m0) ;
			if(link != '') break ;
		}
		//执行JS动作,注意 要有一个空格(&nbsp;)
		result += '&nbsp;<script type="text/javascript" defer="defer">' ;
		result += 'parent.rootDtree.changeFrame(' + link + ');</script>' ;
	}
	return result ;
};
QLMenu.prototype.getInitLink = function(menuElm) {

	menuElms = menuElm.subMenus ;
	if(menuElms.length == 0) {
		return '"' + menuElm.tLink + '", ' + menuElm.id ;
	}
	for(var i=0; i<menuElms.length; i++) {
		var menu = menuElms[i] ;
		if(menu.tLink != null && menu.tLink != 'null') {//或其它标示为null的值
			return '"' + menu.tLink + '", ' + menu.id ;			
		} else {
			return this.getInitLink(menu) ;
		}
	}
};

//递归树型子菜单
QLMenu.prototype.getDtreeItems = function(menuRoot, xtree) {
	//menuElm是一组兄弟结点	
	var menuElm = menuRoot.subMenus ;
	if(menuElm.length == 0) {
		return ;
	}
	for(var i=0; i<menuElm.length; i++) {
		var menu = menuElm[i] ;			
		xtree.add(menu.id, menu.pid, menu.name, menu.tLink) ;
		this.getDtreeItems(menu, xtree) ;		
	}
};

//设置第一级菜单内容
QLMenu.prototype.setMenuRegion1 = function(index) {
	//重新设置初始值
	if(index == "-1") {//根结点首次选中的索引
		menuReInit(menuRoots[0]) ;	
	} else {
		for(var k=0; k<menuRoots.length; k++) {
			if(menuRoots[k].id == index) {
				menuReInit(menuRoots[k]) ;
				break ;	
			}
		}
	}

	if(pageLayout.hasRegion1) {	//如果有第一级菜单
		
		if(index == "-1") {
			index = this.index_re1 ;
		} else {
			this.index_re1 = index;//保存状态	
		}
		var menuElms = menuRoots ;
		var result = '<TABLE cellSpacing=4 cellPadding=0 border=0 ><TR><td>&nbsp;</td>';
		result += '<td ><UL id=NorTools>';
	
		for(var i=0; i<menuElms.length; i++) {
			if(menuElms[i].id == this.index_re1) {
				if(menuElms[i].subMenus.length != 0) {
					this.index_re2 = menuElms[i].subMenus[0].id ;
				} else {///设置初始页面
					//var html = '&nbsp;<script type="text/javascript" defer="defer">' ;
					//html += 'showTabLink("'+menuElms[i].tLink+'", '+menuElms[i].id+');</script>' ;
					region2_menu.innerHTML = '&nbsp;';
					showTabLink(menuElms[i].tLink,menuElms[i].id);
					region3_menu.innerHTML = '&nbsp;';
					this.index_re2 = "-1" ;
					document.getElementById('leftMenuTD').style.display="none";
					document.getElementById('sideBarTD').style.display="none";						
				}
				result += this.renderToHTML1(menuElms[i], true);
			} else {
				result += this.renderToHTML1(menuElms[i], false);
			}
		}
		result += '</UL></td><td>&nbsp;</td></TR></TABLE>';
				
		region1_menu.innerHTML = result; //将一级菜单内容显示到页面中
		if(this.index_re2 == "-1") return ;
	} //结束:有第一级菜单	
	// 设定二级菜单内容
	this.setMenuRegion2(this.index_re2);
}

//在下面要设置图片  -----------------------------------------------------------------------------------------------2010.4.23修改菜单
QLMenu.prototype.renderToHTML1 = function(menuElm, flag) {
	var temp_image = menuElm.image;
	var btnCls="btnOut";
	if(flag) {//设图片选中的效果
		btnCls="btnDown";
	}
	temp_image=rootPath + temp_image;
	
	var result = '<li class="norli" onclick="parent.qlmenu.setMenuRegion1(\''+ menuElm.id +'\')" ';// 去掉 '+btnCls+'
	if(!flag){
		result += 'onmouseover=\'SetStyle1("norli btnOn")\' onmouseout=\'SetStyle1("norli btnOut")\'';
	}
	result += '>';
    var img=temp_image;
	var img_down;
	img_down = img.substr(0,img.length -4)+"_down"+img.substr(img.length-4 , 4);
	if(flag)
		temp_image=img_down;
	//alert(img_down);
	
	
	result+='<img ';
	result += ' title="'+menuElm.name+'"';
	//result+='_background: url('+temp_image+') no-repeat !important; ';
	result+=' src="'+temp_image+'"';
	//result+='background:none;\' ';
	result+= ' /> ';


	return result;
}

//设置第二级菜单内容,有可能没有第一级菜单
QLMenu.prototype.setMenuRegion2 = function(index) {	

	if(pageLayout.hasRegion2) {
		if(index == "-1") {
			index = this.index_re2 ;
		} else {		
			this.index_re2 = index;
		}
	
		var menuElms ;
		if(pageLayout.hasRegion1) {
			menuElms = menuMap.get(menuMap.get(index+'').pid).subMenus ;
		} else {
			menuElms = menuRoots ;
		}		
		
		var result = '<TABLE height="100%" width="100%" alin="center" cellSpacing=0 cellPadding=0>';
		result += '<TR><TD >';//NavOffOff.gif图片路径修改-----------------------------------------------------------------------------##################---------------------2010.4.29
		
		for(i=0; i<menuElms.length; i++) {
			if(menuElms[i].id == this.index_re2) {
				if(menuElms[i].subMenus.length != 0) {//有下一级菜单
					this.index_re3 = menuElms[i].subMenus[0].id ;
					document.getElementById('leftMenuTD').style.display="";
					document.getElementById('sideBarTD').style.display="";
				} else { //没有下一级菜单
					document.getElementById('leftMenuTD').style.display="none";
					document.getElementById('sideBarTD').style.display="none";					
					//var html = '&nbsp;<script type="text/javascript" defer="defer">' ;
					//html += 'showTabLink("'+menuElms[i].tLink+'", '+menuElms[i].id+');</script>' ;
					region3_menu.innerHTML = '';
					showTabLink(menuElms[i].tLink,menuElms[i].id);
					this.index_re3 = "-1" ;
				}
				result += this.renderToHTML2(menuElms[i], true) ;
			} else {
				result += this.renderToHTML2(menuElms[i], false) ;
			}
		}
		result += '</TR></TABLE>';
		
		// 将二级菜单内容显示到页面中
		region2_menu.innerHTML = result;
		if(this.index_re3 == "-1") return;
	}		
	// 设定三级四级菜单内容
	this.setMenuRegion3(this.index_re3);
}

//导航条 CLASS 设置  修改(font标签替换为span) ------------------------------------------------%%%%-------------------- 2010.4.23 
QLMenu.prototype.renderToHTML2 = function(menuElm, flag) {
	var result='';
	if(flag){
		result += '<TD class=NavGlowFontOn noWrap align="center">';
		result += '<div id="div' + menuElm.id + '" class="navtitle" onclick="parent.qlmenu.setMenuRegion2(\'' + menuElm.id + '\')">';
		result += '<img src="'+menuElm.image+'">';
		result += '<span>' + menuElm.name + '</span>';
	}else{
		result += '<TD class=NavGlowFont noWrap align="center">';
		result += '<div id="div' + menuElm.id + '" class="navtitle" onclick="parent.qlmenu.setMenuRegion2(\'' + menuElm.id + '\')">';
		result += '<img src="'+menuElm.image+'">';
		result += menuElm.name;
	}
	result += '</div></TD>';//NavOffOff.gif图片路径修改--------------------------------------------------------------------------------------##################---------------------2010.4.29
	return result;
}

//设置第三级菜单内容
QLMenu.prototype.setMenuRegion3 = function(index) 
{		
	var result = '<TABLE width="100%" height="100%" cellSpacing=0 cellPadding=0 border=0>';	
	if(index == "-1") {
		index = this.index_re3 ;
	} else {
		this.index_re3 = index;
	}	
	
	var menuElms ;
	if(pageLayout.hasRegion1 || pageLayout.hasRegion2) {
		menuElms = menuMap.get(menuMap.get(index+'').pid).subMenus ;
	} else {
		menuElms = menuRoots ;
	}	

	//清空数组
	//dtree.length = 0 ;
	//第四级树结点的样式
	if(pageLayout.hasRegion3) {
		for(var i=0; i<menuElms.length; i++) {
			if(menuElms[i].id == index) {
				result += this.renderToHTML3(menuElms[i], true, menuElms.length) ;//选中
			} else {
				result += this.renderToHTML3(menuElms[i], false, menuElms.length) ;
			}
		}
	} else {//下面的还没有设置
		result +=	'<TR id="subcon' + menuElms[0].id + '" style="display:block">';
		result +=		'<TD id="id">';
		result +=			'<table width="100%" border=0 cellSpacing=0 cellPadding=0>';
		result +=           '<tr height=5><td height=5></td></tr><tr><td>'		
		result += this.renderRegion4(menuElms, true) ;
		result += '</td></tr></table></TD></TR>' ;
	}
	result += '</TABLE>';
	// 设定三级四级菜单到页面中
	region3_menu.innerHTML = result;
}

   function createSCR(obj,contain,name)
    {
        if(!name)
        {
            var date=new Date();
            name=date.getTime();
        }
       
        contain=(contain)?(contain):document.body;
        var doc;
        doc=contain.parentNode;
        //alert(doc);
        while(doc.tagName != 'HTML'){
        	doc=doc.parentNode;
        	}
        doc=doc.ownerDocument;
        var script=doc.createElement("script");
        script.id=name;
        
        if(typeof(obj)=="string")
        {
            var src=obj.match(/^<script[^>]+?scr=([^\s>]+)/i);
            if(src)
            {
                script.src=src;
            }
            else
            {
                script.text=obj;
            }
        }
        if(typeof(obj)=="object")
        {
            if(obj.src)
                script.src=obj.src;
            else
                script.text=obj.innerHTML;
        }
        contain.appendChild(script);
        return name;
    }

// 去掉 tr td 标签里的行内样式 --font-标签替换为span---------------------------------------------%%%%%%%%%%-------------2010.4.23
QLMenu.prototype.renderToHTML3 = function(menuElm, flag, cnt) {

	var result = '' ;
	result += '<TR>';
	if(flag) { 
	  	result += '<TD class="dtree_on">';
	} else {
	  	result += '<TD class="dtree_off">';
	}
	
	//retult += '<table border="1" height="50"><tr><td></td></tr></table>';
	result += '<TABLE border="0" style="padding-left: 10px;" width="100%" height="100%" cellSpacing=0 cellPadding=0><TR>';
	result += '<TD id="comcon' + menuElm.id + '" class="clsMenuBar" width="82%" onclick="parent.qlmenu.setMenuRegion3(\'' + menuElm.id + '\');">';

	if(flag) {
		result += '<span>&nbsp;' + menuElm.name + '</span>';
	} else {
		result += '&nbsp;' + menuElm.name;
	}
	
	result += '</TD></TR></TABLE></TD></TR>';
	
	//设置第四级菜单
	if(flag) {//下面显示
		result +=	'<TR id="subcon' + menuElm.id + '" class="block">';
		
		result +=		'<TD id="id" valign="top">';
		result +=			'<div id="subdiv' + menuElm.id + '" class="subbody">';
		result +=			'<table style="padding-left: 15px;" width="100%" border=0 cellSpacing=0 cellPadding=0>';
		//result +=           '<tr height=5><td height=5></td></tr>' ;
		// 去掉顶部的留白 -------------------------------------------------^^&^&&&&&&&&&&&&&&&&&&&&&^^^^^^^^^^^^^^^^^^^^^^^^2010.4.2
	
		if(cnt == 0) {	//对于第四级为空的情况,设置链接
			result += '<tr><td>&nbsp;</td></tr>';
		} else {		
			result += '<tr><td> ' ;
			var subMs = menuElm.subMenus ;
			if(subMs.length != 0) {
				result += this.renderRegion4(subMs, flag) ;
			} else if(flag) {	//选中设置链接/?
				var tmp;
				tmp = 'showTabLink("'+menuElm.tLink+'","'+menuElm.id+'");' ;
				//result += '&nbsp;<script type="text/javascript" defer="true">' ;
				//result += 'showTabLink("'+menuElm.tLink+'", '+menuElm.id+');</script>' ;
				createSCR(tmp,region3_menu);
			}
			result += '</td></tr>' ;
		}
		result += '</table></div></TD></tr>';
		
	} 
	return result;
}

//处理树模型树菜单
// @flag 表示第三级菜单是否选中
QLMenu.prototype.renderRegion4 = function(menuElms, flag) {

	var result = '' ;
	var menuArr = new Array() ;//处理后菜单集合数组
	mMap = new Map() ;//叶子结点处理后的菜单集合Map
	if(pageLayout.showTabPage) {//叶子结点用tab页显示
		for(var i=0; i<menuElms.length; i++) {
			this.getLeafFromRoot(menuElms[i], mMap, pageLayout.showTabOnlyOneLeaf) ;
		}
		//建立父子关系,mMap里放的结点是没有建立关系的
		var mapArray = mMap.arr ;
		var idArr = new Array() ;
		for(var i=0; i<mapArray.length; i++) {
			var menu = mapArray[i].value ;
			var m = mMap.get(menu.pid) ;
			if(m != null) {
				m.subMenus.push(menu) ;
				idArr.push(menu.id) ;
			}
		}
		//删除不是父结点的结点
		for(var i=0; i<idArr.length; i++) {
			mMap.remove(idArr[i]) ;
		}
		//得到父结点对应的菜单
		for(var i=0; i<mMap.arr.length; i++) {
			menuArr.push(mMap.arr[i].value) ;
		}
	} else {////叶子结点不用tab页显示
		menuArr = menuElms ;
	}	
	
	if(!pageLayout.showTreeOnlyLeaf) {//所有树根结点都是叶子结点时,不显示树
		var isLeafAll = true ;
		for(var i=0; i<menuArr.length; i++) {
			if(menuArr[i].subMenus.length != 0) {//不是叶子结点
				isLeafAll = false ;
				break ;
			}
		}
		if(isLeafAll) {//输出HTML, 非树
			result += this.renderToHTML4(menuArr, false, flag) ;				
		} else {//输出树来
			result += this.renderToHTML4(menuArr, true, flag) ;
		}
	} else {//输出树来
		result += this.renderToHTML4(menuArr, true, flag) ;
	}
	return result ;
}

QLMenu.prototype.renderToHTML4 = function(menuElms, isTree, flag) {

	var result = '' ;
	if(!isTree) {//非树,平面菜单
		result +='<table width="100%" id="treeTable" cellPadding="0" cellSpacing="0" border="0">' ;
		for(var i=0; i<menuElms.length; i++) {//连接成tab页
			result +="<tr onclick=\"setStyle("+i+");showTabLink('"+menuElms[i].tLink+"', '"+menuElms[i].id+"');\"";
			if(flag && i==0)
				result += " class='itemSelected' ";
			result +=">";		
			result += '<td align="right" class="imgTD">&nbsp;</td>';
		    result += '<td id="tdSub' + menuElms[i].id + '">';	
			result += ''+ menuElms[i].name + '</td></tr>';
		}
		result +='</table>' ;		
		if(flag) {
			var tmp;
			tmp = 'showTabLink("'+menuElms[0].tLink+'", "'+menuElms[0].id+'");' ;
			createSCR(tmp,region3_menu);			
		}		
	} else {//树菜单
		result += this.renderTreeHtml(menuElms, flag) ;
	}
	return result ;	
}

//广度优搜索递归, 从一个菜单得到一个去掉叶子结点的菜单
//得到每个结点,再进行父子关系化
QLMenu.prototype.getLeafFromRoot = function(melm, mMap, isTabOnlyOneLf) {	

	var m = MenuClass.newMenu(melm.id, melm.pid, melm.name, melm.tLink, melm.pLink, melm.sequence,melm.lktp) ;
	var elms = melm.subMenus ;
	if(elms.length == 0) {//叶子结点
		mMap.put(melm.id, m) ;
		return ;
	}
	var isLeafs = true ;
	var links = '' ;	
	var cnt = 0 ;
	for(var i=0; i<elms.length; i++) {		
		if(elms[i].subMenus.length == 0) {//叶子结点,没有子结点
			links += elms[i].tLink + ',' + elms[i].name + ';' ;
			cnt++ ;
		} else {//不是叶子结点
			isLeafs = false ;
			break ;
		}
	}
	
	if(isLeafs) {
		if(!isTabOnlyOneLf && (cnt==1)) {//一个叶子结点,并且'只一个叶子结点时不显示TAB页'			
			mMap.put(melm.id, m) ;			
			this.getLeafFromRoot(elms[0], mMap, isTabOnlyOneLf) ;
		} else {//叶子结点就显示TAB页
			var lnk = links.substring(0, links.length-1) ;
			m.tLink = lnk ;
			mMap.put(melm.id, m) ;	
		}
	} else {//不全是叶子结点
		mMap.put(melm.id, m) ;
		for(var i=0; i<elms.length; i++) {			
			this.getLeafFromRoot(elms[i], mMap, isTabOnlyOneLf) ;
		}		
	}
}

//main页面的刷新
QLMenu.prototype.refrushMenuRegion4 = function(index) {
	var m ;	
	var rootsM = mMap.arr ;
	for(var i=0; i<rootsM.length; i++) {
		if(rootsM[i].value.id != index) {
			m = findElement(rootsM[i].value, index) ;
			if(m != null) {
				break ;
			}
		} else {
			m = rootsM[i].value ;
			break ;
		}
	}	
	//内嵌方法
	function findElement(rootM, index) {
		var subMs = rootM.subMenus ;
		for(var k=0; k<subMs.length; k++) {
			if(subMs[k].id != index) {
				findElement(subMs[k], index) ;
			} else {
				return subMs[k] ;
			}
		}
		return null ;
	}
	
	window.treeFrame.showTabLink(m.tLink, m.id);
}
