<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cugb.javaee.chileme.utils.DAOFactory"%>
<%@page import="com.cugb.javaee.chileme.bean.Dish"%>
<%@page import="com.cugb.javaee.chileme.bean.Customer"%>
<%@page import="com.cugb.javaee.chileme.dao.*"%>
<%@page import="com.cugb.javaee.chileme.utils.*"%>
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
          
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
	<script language="javascript">
	function checkUserInfo() {
	 if(document.loginForm.loginName.value==""){
	    alert("用户名不能为空");
	    return false;
	 }
	 if(document.loginForm.loginPass.value==""){
	    alert("密码不能为空");
	    return false;
	 }
	}
	function checkUserInfo2() {
		 if(document.registerForm.registerName.value==""){
		    alert("用户名不能为空");
		    return false;
		 }
		 if(document.registerForm.registerEmail.value==""){
			alert("邮箱不能为空");
			return false;
		 }
		 if(document.registerForm.registerPass.value==""){
		    alert("密码不能为空");
		    return false;
		 }
		}
	
	</script>
</head><!--/head-->

<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<center>
	<section id="form" style="margin-top:0px; margin-bottom:120px"><!--form-->
		<div class="container">
			<img alt="" src="images/home/aboutus.jpg" width="1024px" height="1536px">
		</div>
	</section><!--/form-->
	</center>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

