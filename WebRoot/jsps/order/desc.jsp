<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
    
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
	.img{width: 75px;
		height: 75px;}
	li {
		margin: 10px;
	}
	
	#pay {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		background-position: 0 -412px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
	#pay:HOVER {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		background-position: 0 -448px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
</style>
  </head>
  
  <body background="../../laundry/images/driverSchool.jpg">
<h1>当前订单</h1>
<table border="1" width="100%" cellspacing="0" background="black">
	<tr bgcolor="gray" bordercolor="gray">
		<td colspan="6">
			考试编号：${order.oid }　收费日期：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.ordertime }"/>　
			金额：<font color="red"><b>${order.total }元</b></font>
		</td>
	</tr>

<c:forEach items="${order.orderItemList }" var="orderItem">
	<tr bordercolor="gray" align="center">
		<td width="15%">
		<div><img class="img" src="<c:url value='/${orderItem.clothes.image }'/>" height="75"/></div>
		</td>
		<td>考试名称：${orderItem.clothes.cname }</td>
		<td>考试类型类型：${orderItem.clothes.type }</td>
		<td>价位：${orderItem.clothes.price }元</td>
		<td>总费用：${orderItem.subtotal }元</td>
	</tr>
</c:forEach>

</table>
<br/>
<form method="post" action="<c:url value='/OrderServlet'/>" id="form" target="_parent">
	<input type="hidden" name="method" value="zhiFu"/>
	<input type="hidden" name="oid" value="${order.oid }"/>
	家庭地址：<input type="text" name="address" size="50" value="${sessionScope.session_info.address}  ${sessionScope.session_info.iname}"/><br/>
	联系电话：<input type="text" name="address" size="50" value="${sessionScope.session_info.phone}"/><br/>

	选择银行：<br/>
	<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
	<img src="bank_img/icbc.bmp" align="middle"/>
	<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
	<img src="bank_img/bc.bmp" align="middle"/><br/><br/>
	<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
	<img src="bank_img/abc.bmp" align="middle"/>
	<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
	<img src="bank_img/ccb.bmp" align="middle"/><br/><br/>
	<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
	<img src="bank_img/bcc.bmp" align="middle"/><br/>
	
</form>
<a id="pay" href="javascript:document.getElementById('form').submit();"></a>

  </body>
</html>

