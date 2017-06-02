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

		<title>个人信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
h3{margin-top:60px;}
</style>
	</head>

	<body background="../../laundry/images/driverSchool.jpg">
		<center>
		<h3>个人信息</h3>
			<table border="0" width="296" cellspacing="0" background="black"
				height="177">
				<tr>
					<td>
						姓名:
					</td>
					<td>
						${form.iname }
					</td>
				</tr>
				<tr>
					<td>
						性别:
					</td>
					<td>
						${form.sex }
					</td>
				</tr>
				<tr>
					<td>
						生日:
					</td>
					<td>
						${form.birthday }
					</td>
				</tr>
				<tr>
					<td>
						邮箱:
					</td>
					<td>
						${form.email }
					</td>
				</tr>
				<tr>
					<td>
						手机号:
					</td>
					<td>
						${form.phone }
					</td>
				</tr>
				<tr>
					<td>
						通讯地址:
					</td>
					<td>
						${form.address }
					</td>
				</tr>
				<tr>
					<td>
						备注:
					</td>
					<td>
						${form.note }
					</td>
				</tr>

			</table>
			<a href="<c:url value='/InfoServlet?method=check'/>">编辑信息</a>
		</center>
	</body>
</html>
