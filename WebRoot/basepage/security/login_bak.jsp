<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.security.AuthenticationException" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>河北省水利厅纪检办公系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<base href="<%=basePath%>" />
	<link rel="stylesheet" type="text/css" href="basepage/css/index.css" />
	<link rel="stylesheet" href="basepage/css/swiper.min.css">
	
	<script src="basepage/javascript/swiper.min.js"></script>
</head>

<body>
<%
if(request.getParameter("first") == null && session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") != null){
	AuthenticationException ae=(AuthenticationException)session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");					
	out.write(ae.getLocalizedMessage() );
	session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
} 
%>
<form action="<%=request.getContextPath()%>/j_spring_security_check" method="POST">
<div class="head"></div>
		<div class="daohang">
			<ul>
				<li>
					<a href="">首 页</a>
				</li>
				<li>
					<a href="">组织机构</a>
				</li>
				<li>
					<a href="">文件汇编</a>
				</li>
				<li>
					<a href="">业务指导</a>
				</li>
				<li>
					<a href="">工作动态</a>
				</li>
				<li>
					<a href="">信息报备</a>
				</li>
				<li>
					<a href="">监督管理</a>
				</li>
				<li>
					<a href="">统计分析</a>
				</li>
				<li>
					<a href="">预警管理</a>
				</li>
			</ul>
		</div>
		<div class="neirong">
			<div class="top">
				<div class="jiaodian">
					<!-- Swiper -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><a href=""><img src="basepage/images/1.jpg" alt="" /></a></div>
							<div class="swiper-slide"><a href=""><img src="basepage/images/2.jpg" alt="" ></a></div>
							<div class="swiper-slide"><a href=""><img src="basepage/images/3.jpg" alt="" /></a></div>
							<div class="swiper-slide"><a href=""><img src="basepage/images/1.jpg" alt="" /></a></div>
							<div class="swiper-slide"><a href=""><img src="basepage/images/3.jpg" alt="" /></a></div>
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<div class="dongtai">
					<div class="dtbt">
						<div class="gzbt">工作动态</div>
						<a href="">更多>></a>
					</div>
					<div class="dtlb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监测待办事项测试测待试...<span>[2016-09-07]</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="left">
				<div class="denglu">
					<div class="lan">用户登录</div>
					<div class="canshu">用户名：<input type="text" name="j_username" value=""/></div>
					<div class="canshu">密&nbsp;&nbsp;&nbsp;码：<input type="password" name="j_password" value=""/></div>
					<div class="canshu"><input type="checkbox" name="remember_me">记住密码</div>
					<div class="tijiao"><input type="submit" value="登 录" class="button_blue" /></div>
				</div>
				<div class="gonggao">
					<div class="ggbt">
						<div class="zxbt">最新公告</div>
						<a href="">更多>></a>
					</div>
					<div class="gglb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全工程监测试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监工程测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="zuzhi">
					<div class="zzbt">
						<div class="jgbt">组织机构</div>
						<a href="">更多>></a>
					</div>
					<div class="zzlb">
						<ul>
							<li>
								<a href="#">工作一室</a>
							</li>
							<li>
								<a href="#">工作二室</a>
							</li>
							<li>
								<a href="">工作三室</a>
							</li>
							<li>
								<a href="">工作四室</a>
							</li>
							<li>
								<a href="">工作五室</a>
							</li>
							<li>
								<a href="">工作六室</a>
							</li>

						</ul>
					</div>
				</div>

			</div>
			<div class="right">
				<div class="wenjian">
					<div class="wjbt">
						<div class="hbbt">文件汇编</div>
						<a href="">更多>></a>
					</div>
					<div class="wjlb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全工程监测试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监工程测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监待试...</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="yewu">
					<div class="ywbt">
						<div class="zdbt">业务指导</div>
						<a href="">更多>></a>
					</div>
					<div class="ywlb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全工程监测试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监工程测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监待试...</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="banner"><img src="basepage/images/u495.jpg" /></div>

				<div class="wenjian">
					<div class="wjbt">
						<div class="hbbt">待定栏目1</div>
						<a href="">更多>></a>
					</div>
					<div class="wjlb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全工程监测试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监工程测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监待试...</a>
							</li>
						</ul>
					</div>
				</div>

				<div class="yewu">
					<div class="ywbt">
						<div class="zdbt">待定栏目2</div>
						<a href="">更多>></a>
					</div>
					<div class="ywlb">
						<ul>
							<li>
								<a href="">关于申请对2015年工程安全工程监测试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全监工程测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安全工程监测待...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监测待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程安工程全监待试...</a>
							</li>
							<li>
								<a href="">关于申请对2015年工程工程安全监待试...</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
				</form>
		<div class="footer">
			<div class="xinxi">
				<div class="ftlogo"></div>
				<div class="banquan">
					<p>©中共河北省纪律检查委员会 河北省监察厅 版权所有 <br/><br/>
					冀ICP备13012755号 地址：河北省XX市XX街道XX号 </p>
				</div>
			</div>

		</div>

		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper('.swiper-container', {
				pagination: '.swiper-pagination',
				paginationClickable: true,
				spaceBetween: 30,
				centeredSlides: true,
				autoplay: 2500,
				autoplayDisableOnInteraction: false
			});
		</script>
	</body>
	<!--http://www.hebcdi.gov.cn/-->
  </body>
</html>
