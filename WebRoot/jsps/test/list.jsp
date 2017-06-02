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
<title>价格</title>

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
		var select = document.getElementById("select");
		location = "__tag_29$14_&pc=" + select.value;
	}
</script>
<style type="text/css">
body {
	font-size: 10pt;
}

img {
	width: 160px;
	height: 155px;
}

.cont {
	padding-left: 60px;
}

.icon {
	margin: 10px;
	border: solid 2px gray;
	width: 160px;
	height: 180px;
	text-align: center;
	float: left;
}

p {
	position: absolute;
	left: 200px;
	bottom: 10px;
}
</style>
</head>
<body background="../../laundry/images/driverSchool.jpg">
	<div class="cont">
		<center>
			<input type="hidden" name="method" value="findCname" /> 查看考试 <input
				type="text" name="cname" /> <input type="submit" value="查询" />
		</center>


		<c:forEach items="${pb.datas }" var="clothes">
			<div class="icon">
				<a
					href="<c:url value='//TestServlet?method=load&cid=${clothes.cid }'/>">
					<img src="<c:url value='/${clothes.image }'/>" border="0" />
				</a> <br /> <a
					href="<c:url value='//TestServlet?method=load&cid=${clothes.cid }'/>">${clothes.cname
								}-${clothes.type }</a>
			</div>
		</c:forEach>
		<c:if test="${sessionScope.session_user.type == 1 }">
			<div class="icon">
				<a href="<c:url value='/jsps/test/addList.jsp'/>"> <img
					src="images/add.png" border="0" /> <span>添加考试项目</span>
			</div>
			<br>
		</c:if>
		<p>
			第${pb.pc }页/共${pb.tp }页 <a
				href="<c:url value='//TestServlet?${pb.url }&pc=1'/>">首页</a>
			<c:if test="${pb.pc > 1 }">
				<a href="<c:url value='//TestServlet?${pb.url }&pc=${pb.pc-1 }'/>">上一页</a>
			</c:if>
			<%------------------------------------ --%>
			<%-- 页码列表的长度自己定，8个长 --%>
			<c:choose>
				<%-- 第一条：如果总页数<=8，那么页码列表为1 ~ tp --%>
				<c:when test="${pb.tp <= 8 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="${pb.tp }" />
				</c:when>
				<c:otherwise>
					<%-- 第二条：按公式计算，让列表的头为当前页-4；列表的尾为当前页+5 --%>
					<c:set var="begin" value="${pb.pc-3 }" />
					<c:set var="end" value="${pb.pc+4 }" />

					<%-- 第三条：第二条只适合在中间，而两端会出问题。这里处理begin出界！ --%>
					<%-- 如果begin<1，那么让begin=1，相应end=10 --%>
					<c:if test="${begin<1 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="8" />
					</c:if>
					<%-- 第四条：处理end出界。如果end>tp，那么让end=tp，相应begin=tp-9 --%>
					<c:if test="${end>pb.tp }">
						<c:set var="begin" value="${pb.tp-7 }" />
						<c:set var="end" value="${pb.tp }" />
					</c:if>
				</c:otherwise>
			</c:choose>

			<%-- 循环显示页码列表 --%>
			<c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${i eq pb.pc }">${i }</c:when>
					<c:otherwise>
						<a href="<c:url value='//TestServlet?${pb.url }&pc=${i}'/>">[${i
										}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%------------------------------------ --%>

			<c:if test="${pb.pc < pb.tp }">
				<a href="<c:url value='//TestServlet?${pb.url }&pc=${pb.pc+1 }'/>">下一页</a>
			</c:if>

			<a href="<c:url value='//TestServlet?${pb.url }&pc=${pb.tp }'/>">尾页</a>

			<select name="pc" onchange="_change()" id="select">
				<c:forEach begin="1" end="${pb.tp }" var="i">
					<option value="${i }"
						<c:if test="${i eq pb.pc }">selected="selected"</c:if>>
						${i }</option>
				</c:forEach>
			</select>
		</p>
</body>
</html>
