<%@page import="com.cugb.javaee.chileme.utils.ConfigFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.cugb.javaee.chileme.bean.Customer"%>

<header id="header"><!--header-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<!-- <li><a href="me.jsp">我的</a></li>
								<li><a href="checkout.jsp">去下单</a></li>
								<li><a href="cart.jsp">我的购物车</a></li> -->
								<%
									Customer cus = (Customer) session.getAttribute("loginuser");
									String adminUsername = ConfigFactory.readProperty("username");
									
									if(cus.getUsername().equals(adminUsername) ){
										out.println("<li><a href=\"\"></i>欢迎管理员："+cus.getUsername()+"</a></li>");
									}
									else{
										response.sendRedirect("login.jsp");
									}
								%>	
								<li><a href="action?actiontype=logOut" >注销</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp">首页</a></li>
								<li class="dropdown"><a href="dishManage.jsp">菜品管理</a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="shop.jsp"></a></li>
										<li><a href="dishManage.jsp"  class="active">菜品详情</a></li> 
										<li><a href="dishAdd.jsp">新增菜品</a></li> 
                                    </ul>
                                </li> 
								<li><a href="customerManage.jsp">用户管理</a></li>
								<li class="dropdown"><a href="#">关于我们</i></a></li> 
								
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="搜索美味"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
