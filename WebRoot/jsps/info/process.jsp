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

		<script type="text/javascript">
	$(function() {
		$("#birthday").datepick( {
			dateFormat : "yy-mm-dd"
		});
	});

	function add() {
		$(".error").text("");
		var bool = true;
		if (!$(":text[name=iname]").val()) {
			$("#inameError").text("姓名不能为空");
			bool = false;
		}
		if (!$("#male").attr("checked") && !$("#female").attr("checked")) {
			$("#sexError").text("性别不能为空");
			bool = false;
		}
        if (!$(":text[name=birthday]").val()) {
			$("#birthdayError").text("生日不能为空");
			bool = false;
		}
		if (!$(":text[name=email]").val()) {
			$("#emailError").text("email不能为空");
			bool = false;
		}
		if (!$(":text[name=phone]").val()) {
			$("#phoneError").text("手机不能为空");
			bool = false;
		}
		if (!$(":text[name=address]").val()) {
			$("#addressError").text("地址不能为空");
			bool = false;
		}
		if (bool) {
			$("form").submit();
		}
	}
</script>
		<style type="text/css">
		h3{
		margin-top:50px;}
.error {
	color: red;
}
</style>
	</head>

	<body background="../../laundry/images/driverSchool.jpg">
		<center>
			<h3>
				请修改个人信息
			</h3>
			<form action="<c:url value='/InfoServlet'/>" method="post">
				<c:choose>
					<c:when test="${not empty requestScope.add }">
						<input type="hidden" name="method" value="add" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="method" value="update" />
					</c:otherwise>
				</c:choose>

				<table border="0" align="center" style="margin-left: 280px;">
					<tr>
						<td width="90px">
							姓名:
						</td>
						<td >
							<input type="text" name="iname" value="${form.iname }" />
						</td>
						<td width="150">
							<label id="inameError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							性别:
						</td>
						<td>
							<input type="radio" name="sex" value="男" id="male"
								<c:if test="${form.sex eq '男' }">checked='checked'</c:if> />
							<label for="male">
								男
							</label>
							<input type="radio" name="sex" value="女" id="female"
								<c:if test="${form.sex eq '女' }">checked='checked'</c:if> />
							<label for="female">
								女
							</label>
						</td>
						<td>
							<label id="sexError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							生日:
						</td>
						<td>
							<input type="text" name="birthday" id="birthday"
								readonly="readonly" value="${form.birthday}" />
						</td>
						<td>
							<label id="birthdayError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							邮箱:
						</td>
						<td>
							<input type="text" name="email" value="${form.email }" />
						</td>
						<td>
							<label id="emailError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							手机号:
						</td>
						<td>
							<input type="text" name="phone" value="${form.phone }" />
						</td>
						<td>
							<label id="phoneError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							通讯地址:
						</td>
						<td>
							<input type="text" name="address" value="${form.address }" />
						</td>
						<td>
							<label id="addressError" class="error">
								&nbsp;
							</label>
						</td>
					</tr>
					<tr>
						<td>
							备注:
						</td>
						<td>
							<textarea rows="5" cols="22" name="note">${form.note }</textarea>
						</td>
					</tr>

				</table>
				<input type="button" value="提交" onclick="add()" />
				&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置">
			</form>
		</center>
	</body>
</html>
