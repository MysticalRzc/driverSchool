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

<title>My JSP 'process.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript"
	src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>

<style type="text/css">
h3 {
	margin-top: 50px;
}

.error {
	color: red;
}
</style>
</head>

<body background="../../laundry/images/driverSchool.jpg">
	<center>
		<h3>请填写考试信息</h3>
		<form action="jsps/test/addSuccess.jsp" method="post">
			<table border="0" align="center" style="margin-left: 280px;">
				<tr>
					<td width="90px">科目名:</td>
					<td><select name="test">
							<option value="科目一">科目一</option>
							<option value="科目二">科目二</option>
							<option value="科目三">科目三</option>
							<option value="科目四">科目四</option>
					</select></td>
				</tr>
				<tr>
					<td>考试类型:</td>
					<td>
						<input type="radio" name="type" value = "上机" />上机
					 	<input type="radio" checked="checked" name="type" value = "驾车" />驾车
					 </td>
					<td><label id="sexError" class="error"> &nbsp; </label></td>
				</tr>
				<tr>
					<td>日期:</td>
					<td><input type="text" name="data" /></td>
					<td><label id="dataError" class="error"> &nbsp; </label></td>
				</tr>
				<tr>
					<td>价格:</td>
					<td><input type="text" name="money" /></td>
					<td><label id="emailError" class="error"> &nbsp; </label></td>
				</tr>
			</table>
			<input type="submit" value="提交" />
			&nbsp;&nbsp;&nbsp; <input type="reset" value="重置">
		</form>
	</center>
</body>
</html>
