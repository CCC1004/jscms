菜单页面设置时要注意的一些事项:
1、qlmenu.js定义的几个类对象
	1) Map对象
	2) MenuClass对象，为菜单类(id, pid, name, image, tLink, pLink)
	3) LayoutClass对象，为页面布局类
	4) QLMenu对象，为JS的封装体，提供了很多对MenuClass对象的操作
	
	
2、page_init.js定义的几个初始方法


3、qlmenu.js和page_init.js与页面耦合处，
	当更改页面的一些关键DOM元素时，务必更改JS里面的代码
	
4、LayoutClass.init(true, true, true, false, true, true)中6个开关的定义：
	1) 第一个：为true表示第一级菜单域显示，为false则不显示此级菜单域
	2) 第二个：为true表示第二级菜单域显示，为false则不显示此级菜单域
	3) 第三个：为true表示第三级菜单域显示，为false则不显示此级菜单域
	
	4) 第四个：为true表示第四级菜单域总是以树的形式展示；
			  为false则在第四级菜单均为叶子结点时，以平面的形式展示
	5) 第五个：为true表示如果第四级菜单(树)某级菜单的子结点均为叶子结点时，
			  以选项卡(tab页)形式展示叶子结点；
			  为false则不改变叶子结点的展示方式
	6) 第六个：为true表示(在第五个为true的基础上)
			  如果某菜单结点要以选项卡(tab页)形式展示的叶子(兄弟)结点数只的一个时，
			  仍然以选项卡(tab页)形式展示其单个叶子结点；
			  为false则此单个叶子结点不以选项卡(tab页)形式展示，而是以树的形式展示
			  
	ps:默认设置为(true, true, true, false, true, true)
	
	