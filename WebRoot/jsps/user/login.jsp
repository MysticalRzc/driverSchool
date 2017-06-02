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

		<title>登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript">
    	function _change() {
    		var img = document.getElementById("vCode");
    		img.src = "<c:url value='/VerifyCodeServlet'/>?xxx=" + new Date().getTime();
    	}
    </script>
    <style type="text/css">
		div{
			text-align:left;
			height:380px;
			width:390px;
			margin-top:100px;
			margin-right:100px;
			background:#FFF;
		}
		div.transbox{
			margin-left:80px;
			
			opacity:0.7;	
		}
		div.container{
			padding:30px;
		}
		ul li{
			line-height:40px;
		}
    </style>
	</head>

	<body background="../../laundry/images/lufei.jpg">
	<div class="transbox">
    <div class="container"> 
			<form id=formname name=formname action="<c:url value='/UserServlet'/>" method="post">
				<ul>
					<li>
						<input type="hidden" name="method" value="login" />
					</li>
					<li>	
						用户名：
						<input type="text" name="name" value="${form.name }" />
						<span style="color: red; font-weight: 900">
							${msg }
						</span>
					</li>
					<li>
						密&nbsp;码：
						<input type="password" name="password" value="${form.password }" />
					</li>
<%-- 					<li>
						用户类型：
						<input type="text" name="type" value="${form.tpye }" />
					</li> --%>
					<li>
						验证码：
						<input type="text" name="verifyCode" value="${form.verifyCode }" size="4" style=" vertical-align:middle"/>
						<img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" border="1" onclick="_change()" style=" vertical-align:middle"/>
						<a href="javascript:_change()">换一张</a><span style="color: red; font-weight: 900">
							${errors.verifyCode }
						</span>
					</li>
					<li>
						&nbsp;&nbsp;&nbsp;
						<input type="submit" value="登录" />
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="取消">
					</li>
				</ul>
			</form>
			</div>
			</div>
	</body>
</html>
