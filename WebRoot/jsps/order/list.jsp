<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>考试列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	* {
		font-size: 11pt;
	}
	div {
		border: solid 2px gray;
		width: 75px;
		height: 75px;
		text-align: center;
	}
	img{width: 75px;
		height: 75px;}
</style>
  </head>
  
  <body background="../../laundry/images/driverSchool.jpg">
<h1>我的考试</h1>

<table border="1" width="100%" cellspacing="0" background="black">
<c:forEach items="${orderList }" var="order">
	<tr bgcolor="#f98686" bordercolor="gray">
		<td colspan="6">
			考试编号：${order.oid }　预约时间：${order.ordertime }　费用：<font color="red"><b>${order.total }</b></font>　
			<c:choose>
				<c:when test="${order.state eq 1 }">
					<a href="<c:url value='/OrderServlet?method=load&oid= ${order.oid }'/>">付款</a>
				</c:when>
				<c:when test="${order.state eq 2 }">等待考试</c:when>
				<c:when test="${order.state eq 3 }">已通过</c:when>
				<c:when test="${order.state eq 4 }">未通过</c:when>
			</c:choose>
			<a href="<c:url value='/OrderServlet?method=delete&oid=${order.oid }'/>" style="float:right;padding-right:20px">取消考试/隐藏成绩</a>
		</td>
	</tr>
  <c:forEach items="${order.orderItemList }" var="orderItem">
	<tr bordercolor="gray" align="center">
		<td width="15%">
			<div><img src="<c:url value='/${orderItem.clothes.image }'/>" height="75"/></div>
		</td>

		<td>考试类型：${orderItem.clothes.type }</td>
		<td>价位：${orderItem.clothes.price }元</td>
		<td>考试形式:${orderItem.clothes.unit }</td>
		<td>应付款：${orderItem.subtotal }元</td>
	</tr>
  </c:forEach>
 <p></p>
</c:forEach>

</table>
  </body>
</html>
