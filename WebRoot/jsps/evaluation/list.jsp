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
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>客户评价</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type=text/css>
#demo {
	overflow: hidden;
	height: 200px;
	width: 600px;
	border: 1px solid #dde5bc;
	margin-left: 140px;
	margin-top: 50px;
}

#demo a {
	width: 100%;
	overflow: hidden;
	font: 12px/ 16px tahoma;
	display: block;
	text-decoration: none;
	margin-top: 10px;
	margin-left: 100px;
	color: #4a551c;
	padding-left: 2px;
	text-align: left;
}

#demo a:hover {
	color: #ff6600;
}
</style>
	</head>
	<body background="../../laundry/images/driverSchool.jpg">
		<div id="demo" onmouseover="iScrollAmount=0" onmouseout="iScrollAmount=1">
			<c:forEach items="${eList }" var="e">
				<a href="#">${e.evaluation}</a>
			</c:forEach>
		</div>
		<br />
		<center>
			<c:choose>
				<c:when test="${not empty sessionScope.session_user and empty exit}">
					<form action="<c:url value='/EvaluationServlet?method=process'/>"
						method="post">
						<label>
							评价服务
						</label>
						<textarea name="evaluation" rows="4" cols="60"
							style="vertical-align: middle"></textarea>
						<br />
						<br />
						<input type="submit" value="提交评价" />
					</form>
				</c:when>
			</c:choose>
		</center>
		<script>
	var oMarquee = document.getElementById("demo"); //滚动对象
	var iLineHeight = 16; //单行高度，像素
	var iLineCount = 12; //实际行数
	var iScrollAmount = 1; //每次滚动高度，像素
	function run() {
		oMarquee.scrollTop += iScrollAmount;
		if (oMarquee.scrollTop == iLineCount * iLineHeight)
			oMarquee.scrollTop = 0;
		if (oMarquee.scrollTop % iLineHeight == 0) {
			window.setTimeout("run()", 100);
		} else {
			window.setTimeout("run()", 100);
		}
	}
	oMarquee.innerHTML += oMarquee.innerHTML;
	window.setTimeout("run()", 1000);
</script>

	</body>
</html>