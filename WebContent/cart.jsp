<%@page import="com.cugb.javaee.chileme.bean.CartItem"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.chileme.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.chileme.bean.Dish"%>
<%@page import="com.cugb.javaee.chileme.bean.Customer"%>
<%@page import="com.cugb.javaee.chileme.dao.*"%>
<%@page import="com.cugb.javaee.chileme.biz.*"%>
<%@page import="com.cugb.javaee.chileme.utils.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>网上订餐</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section id="cart_items" style="margin-bottom:20px">

		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<%--- <table class="table table-condensed"  align="center" border="0">
					<thead>
						<tr class="cart_menu">
							<td class="image" width="23%" align="center">菜品</td>
							<td class="price" width="20%" align="center">价格</td>
							<td class="quantity" width="18%" align="center">数量</td>
							<td class="total" width="20%" align="center">总价</td>
							<td class="total"  width="19%" align="center"></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<Table border="0"  align="center">
						<% 
						float sum = 0;
						int counts = 0;
						Map cart = (Map) session.getAttribute("shopcart");
						Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
						while(it.hasNext()){
							Map.Entry entry = (Map.Entry) it.next();
							IDishDAO ff = (IDishDAO)DAOFactory.newInstance("IDishDAO");
							out.println("<tr>");
							int dishid = (Integer)entry.getKey();
							int disnumber = (Integer)entry.getValue();
							counts+=disnumber;
							Dish cur = ff.findDish(dishid);
							sum+=disnumber * cur.getPrice();
							out.println("<td>");
							out.println("<table border=\"0\" cellpadding=\"75\" cellspacing=\"0\" height=\"100%\">");
							out.println("<tbody>");
							out.println("<tr>");							
							out.println("<td height=\"100\" align=\"center\" valign=\"top\" width=\"25%\">");	
							out.println("<a href =logout?actiontype=detail&dishid=" + dishid + ">");
							out.println("<strong>");
							out.println(cur.getName());
							out.println("</strong>");
							out.println("</a>");
							out.println("<a href =logout?actiontype=detail&dishid=" + dishid + ">");
							out.println("<img alt=\"点击图片查看内容\" border=\"0\" height=\"100\" src=\""+cur.getImgURL()+"\" width=\"100\"/>");
							out.println("</a>");
							out.println("</td>");
							out.println("<td height=\"21\" align=\"center\" width=\"20%\" >");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.println("￥:"+String.valueOf(cur.getPrice()));
							out.println("</font>");
							out.println("</td>");

							out.println("<td height=\"21\" align=\"center\"  width=\"20%\">");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.println(disnumber);
							out.println("</font>");
							out.println("</td>");
							
							out.println("<td height=\"21\" align=\"center\"  width=\"20%\">");
							out.println("<font size=\"5\" color=\"#ff0000\">");
							out.print("￥:");
							out.println(disnumber * cur.getPrice() * cur.getDiscount());
							out.println("</font>");
							out.println("</td>");
							
							out.println("<td font-size=\"5\" height=\"21\" align=\"center\"  width=\"15%\">");
                            out.println("<a type = \"submit\" href = logout?actiontype=del&dishid=" + dishid + " class=\"btn btn-default cart\" value = \"我不饿\">删除</a>");
							out.println("</td>");
							
							out.println("</tr>");
							out.println("</tbody>");
							out.println("</table>");
							out.println("</td>");
						} 
						
						
						%>
						</Table>
					</tbody>
					
				</table>--%>
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image"></td>
							<td class="description">菜品</td>
							<td class="price">原价</td>
							<td class="total">现价</td>
							<td class="total">数量</td>
							<td class="total">总价</td>
							<td></td>
						</tr>
					</thead>
					<tbody>

						<!-- <tr>
							<td class="cart_product">
								<a href=""><img src="images/cart/one.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><del>$59</del></p>
							</td>
							
							<td class="cart_total">
								<p class="cart_total_price" style="color: red">$59</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">20</p>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$20</p>
							</td>
						</tr> -->
						<%
							Map cart = (Map) session.getAttribute("shopcart");
							Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
							DishDAO ff = (DishDAO) DAOFactory.newInstance("DishDAO");
							float totalPrice = 0.0f;
							int totalNum = 0;
							while (it.hasNext()) {
								Map.Entry entry = (Map.Entry) it.next();

								CartItem nc = new CartItem();
								nc = (CartItem) entry.getKey();
								Customer cuss = (Customer) session.getAttribute("loginuser");
								if (!nc.getUsername().equals(cuss.getUsername())) {
									continue;
								}
								int dishid = nc.getId();
								int disnumber = (Integer) entry.getValue();
								totalNum += disnumber;
								Dish cur = ff.findDish(dishid);
								out.println("<tr>");
								out.println(" <td class=\"cart_product\">");
								out.println("  <a href=\"\">");
								out.println("   <img alt=\"\" src=\"" + cur.picSize("150") + "\"/>");
								out.println("  </a>");
								out.println(" </td>");
								out.println(" <td class=\"cart_description\">");
								out.println("  <h4>");
								out.println("   <a href=\"action?actiontype=detail&dishid=" + String.valueOf(dishid) + "\">");
								out.println(cur.getDishname());
								out.println("   </a>");
								out.println("  </h4>");
								out.println("  <p>");
								out.println("   Web ID: " + String.valueOf(dishid));
								out.println("  </p>");
								out.println(" </td>");
								out.println(" <td class=\"cart_total\">");
								out.println("  <p class=\"cart_total_price\">");
								out.println("   <del>¥");
								out.println(cur.getPrice());
								out.println("   </del>");
								out.println("  </p>");
								out.println(" </td>");
								out.println(" <td class=\"cart_total\">");
								out.println("  <p class=\"cart_total_price\" style=\"color: red\">¥");
								out.println(cur.getDiscount());
								out.println("  </p>");
								out.println(" </td>");
								out.println(" <td class=\"cart_total\">");
								out.println("  <p class=\"cart_total_price\">");
								out.println(disnumber);
								out.println("  </p>");
								out.println(" </td>");
								out.println(" <td class=\"cart_total\">");
								out.println("  <p class=\"cart_total_price\">");
								out.println("   ¥" + String.valueOf(disnumber * cur.getDiscount()));
								out.println("  </p>");
								out.println(" </td>");
								out.println(" <td class=\"cart_delete\">");
								out.println(
										"<a class=\"cart_quantity_delete\" style=\"margin-right:10px\" href=\"action?actiontype=del&dishid="
												+ String.valueOf(dishid) + "\"><i class=\"fa fa-times\"></i></a>");

								out.println(" </td>");
								out.println("</tr>");
								totalPrice += disnumber * cur.getDiscount();

							}
						%>



					</tbody>
				</table>
			</div>
			<div class="container">
				<div class="heading">
					<h3>去买单？</h3>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="total_area">
							<ul>
								<li>总数量 <span>
										<%
											out.println(totalNum);
										%>
								</span></li>
								<li>总&nbsp;&nbsp;&nbsp;&nbsp;价 <span>
										<%
											out.print("￥：");
											out.println(totalPrice);
										%>
								</span></li>
								<span><a class="btn btn-default check_out"
									href="checkout.jsp">去买单</a></span>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#cart_items-->

	
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>