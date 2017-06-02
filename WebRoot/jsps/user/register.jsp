<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<style type="text/css">
div {
	text-align: left;
	height: 380px;
	width: 390px;
	margin-top: 100px;
	margin-right: 100px;
	background: #FFF;
}

div.transbox {
	margin-left: 80px;
	opacity: 0.7;
}

div.container {
	padding: 30px;
}

ul li {
	line-height: 40px;
}
</style>
</head>

<body background="../../laundry/images/lufei.jpg">
	<div class="transbox">
		<div class="container">
			<form action="<c:url value='/UserServlet'/>" method="post">
				<ul>
					<input type="hidden" name="method" value="regist" />
					<li>用户名： <input type="text" name="name" value="${form.name }" />
						<span style="color: red; font-weight: 900">${msg }</span> <span
						style="color: red; font-weight: 900">${errors.username }</span>
					</li>
					<li>密 码： <input type="password" name="password"
						value="${form.password }" /> <span
						style="color: red; font-weight: 900">${errors.password }</span>
					</li>
					<li>用户类型： <%--<input type="radio" name="sex" value="${form.tpye }"/>1 <input
						type="radio" checked="checked" name="sex" value="${form.tpye }"/>2  --%>
						<input type="text" name="name" value="${form.type }" /> <span
						style="color: red; font-weight: 900">${errors.password }</span>
					</li>
					<li><input type="submit" value="注册" /> &nbsp;&nbsp;&nbsp; <input
						type="reset" value="取消"></li>
				</ul>
			</form>
			</center>
</body>
</html>
