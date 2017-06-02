<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<style type="text/css">
	body {
	}
	a {
		text-transform:none;
		text-decoration:none;
	}
	a:hover {
		text-decoration:underline;
	}
	.menu{
		width:800px;
		margin:auto;
	}
	ul{
		line-height:inherit;
		text-align:center;
		text-decoration:none;
	}
	ul li{
		float:left;
		position:relative;
		width:140px;
	}
	.check:hover{
		background: url(<c:url value='/images/button2.jpg'/>);
	}
	.check {
		background: url(<c:url value='/images/button1.jpg'/>) no-repeat;
		margin: 15px;
		padding: 10px;
	}
</style>
</head>

<body background="../../laundry/images/topGround.jpg">
	<div style="font-size: 10pt;text-align: right;">
	  <c:choose>
	    <c:when test="${empty sessionScope.session_user }"> 
	        <a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">登录</a> |&nbsp; 
	        <a href="<c:url value='/jsps/user/register.jsp'/>" target="_parent">注册</a> 
	    </c:when>
	    <c:otherwise> 您好：${sessionScope.session_user.name } :${sessionScope.session_user.type} &nbsp;|&nbsp;
	        <a href="<c:url value='/jsps/cart/list.jsp'/>" target="body">我的预约</a>&nbsp;|&nbsp;
	        <a href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">我的成绩</a>&nbsp;|&nbsp; 
	       <a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a> </c:otherwise>
	  </c:choose>
	</div>
	<h1 style="text-align: center;margin-top:0px">欢迎来到OnePice驾校</h1>
	<div class = "menu">
		<ul>
			<li>
				<div class="check">
					<%-- <a href="<c:url value='/ClothesServlet?method=findAll'/>" target="body">驾校信息</a> --%>
					<a href="<c:url value='/jsps/member/pay.jsp'/>" target="body">驾校信息</a>
				</div>
			</li>
			<c:choose>
				<c:when test="${not empty sessionScope.session_user }">
					<li>
						<div class="check">
							<a href="<c:url value='/InfoServlet?method=enter'/>" target="body">个人信息</a>
						</div>
					</li>
					<li>
						<div class="check">
							<a href="<c:url value='/TestServlet?method=findAll'/>" target="body">考试预约</a>
						</div>
					</li>
			</c:when>
			</c:choose>
			<li>
				<div class="check">
					<a href="<c:url value='/EvaluationServlet?method=findAll'/>" target="body">反馈信息</a>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
