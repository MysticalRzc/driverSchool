<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>考试详情</title>
    
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
	body {
		font-size: 10pt;
	}
	img{
		width:150px;
		height:160px;
	}
	div {
		margin:20px;
		border: solid 2px gray;
		width: 150px;
		height: 160px;
		text-align: center;
	}
	li {
		margin: 10px;
	}
	a {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -70px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
	a:HOVER {
		background: url(<c:url value='/images/all.png'/>) no-repeat;
		display: inline-block;
		
		background-position: 0 -106px;
		margin-left: 30px;
		height: 36px;
		width: 146px;
	}
</style>
  </head>
  
  <body background="../../laundry/images/driverSchool.jpg">
  <div>
    <img src="<c:url value='/${clothes.image }'/>" border="0"/>
  </div>
  <ul> 
    <li>考试名称：${clothes.cname }</li>
    <li>考试时间：${clothes.unit }</li>
    
    <li>报名费用：&nbsp;&nbsp;${clothes.price }元</li>
    <li>服务类型：${clothes.type }</li>
  </ul>
  <form id="form" action="<c:url value='/CartServlet'/>" method="post">
  	<%-- 指定要调用的方法 --%>
  	<input type="hidden" name="method" value="add"/>
  	<input type="hidden" name="cid" value="${clothes.cid }"/>
  	<input type="text" size="3" name="count" value="1"/>
  </form>
  <a href="javascript:document.getElementById('form').submit();"></a>
  </body>
</html>
