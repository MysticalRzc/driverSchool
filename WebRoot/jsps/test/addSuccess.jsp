<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="cn.driver.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">

<title>My JSP 'addSuccess.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
	String testName = request.getParameter("test");
	byte b[] = testName.getBytes("ISO-8859-1");
	testName = new String(b,"UTF-8");
	String type = request.getParameter("type");
	b = type.getBytes("ISO-8859-1");
	type = new String(b,"UTF-8");
	String data = request.getParameter("data");
	b = data.getBytes("ISO-8859-1");
	data = new String(b,"UTF-8");
	String money = request.getParameter("money");
	b = money.getBytes("ISO-8859-1");
	money = new String(b,"UTF-8");
	String address = null;
	if(testName.compareTo("科目一")==0)
		address = "images/test1.png";
	if(testName.compareTo("科目二")==0)
		address = "images/test2.png";
	if(testName.compareTo("科目三")==0)
		address = "images/test3.png";
	if(testName.compareTo("科目四")==0)
		address = "images/test4.png";
	Visited_SQL sqlVister = new Visited_SQL();
	String sql2 = "select max(cid) from clothes";
	ResultSet rs = sqlVister.Reading(sql2);
	int maxId=10;
	while (rs.next()) {
			maxId = rs.getInt(1);
		} 
	String sql = "insert into clothes values("+maxId+1+",\""+testName+"\",\""+type+"\",\""+106+"\",\""+data+"\",\""+address+"\")";
	sqlVister.writing(sql);

 	 
	%>
	添加考试成功！
	<br>

</body background="../../laundry/images/driverSchool.jpg">
</html>
