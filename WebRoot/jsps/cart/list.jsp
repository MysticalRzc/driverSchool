<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		  	margin: 20px;
		  	border: solid 2px gray;
		  	width: 150px;
		  	height: 150px;
		  	text-align: center;
		  	}
		 img{
		    width: 75px;
		  	height: 75px;}
		 li {
		 	margin: 10px;
		 	}
	   #buy {
	   	   	background: url(<c:url value='/images/all.png'/>) no-repeat;
	   	    display: inline-block;
	   	    background-position: 0 -902px;
	     	margin-left: 700px;
	     	height: 36px;
	    	width: 146px;
	    	}

 #buy:HOVER {
 background: url(<c:url value ='/images/all.png'/>) no-repeat;
	display: inline-block;
	background-position: 0 -938px;
	margin-left: 700px;
	height: 36px;
	width: 146px;
}
</style>
	</head>

	<body background="../../laundry/images/driverSchool.jpg">
		<h1>已预约的考试</h1>
		<c:choose>
			<%-- 如果没有车，或车的内容集合为0长 --%>
			<c:when	test="${empty sessionScope.cart or fn:length(sessionScope.cart.cartItems) eq 0}">
				<img src="<c:url value='/images/cart.png'/>" width="300" />
			</c:when>
			<c:otherwise>
				<table border="1" width="100%" cellspacing="0" background="#86f8f9">
					<tr>
						<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
							<a href="<c:url value='/CartServlet?method=clear'/>">全部取消预约</a>
						</td>
					</tr>
					<tr bgcolor="#f98686" align="center">
					    <th>图片</th>
						<th>考试科目</th>
						<th>预约时间</th>
						<th>应付金额</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${sessionScope.cart.cartItems }" var="cartItem">
						<tr align="center">
						    <td><img src="<c:url value='/${cartItem.clothes.image }'/>"/></td>
							<td>${cartItem.clothes.cname }</td>
							<td>${cartItem.clothes.type }</td>
							<td>${cartItem.clothes.price }元</td>
							<td><a href="<c:url value='/CartServlet?method=delete&cid=${cartItem.clothes.cid }'/>">取消</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
						合计：${sessionScope.cart.total }元&nbsp;&nbsp;
						</td>
					</tr>					
				</table>
				<a id="buy" href="<c:url value='/OrderServlet?method=add'/>"></a>
			</c:otherwise>
			
		</c:choose>
	</body>
</html>
