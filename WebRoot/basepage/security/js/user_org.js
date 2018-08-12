function showPop(url)
{
	 //url=url+"?"+getParams2();
	  var r=showModalDialog("basepage/ModalDialog.jsp",url,'dialogWidth:650px;dialogHeight:610px;center:yes;help:no;resizable:yes;status:no');
	  if(r!=null)
	  {
		quickSearch();//刷新
	  }	
//	document.location=url+"?"+getParams2();
}