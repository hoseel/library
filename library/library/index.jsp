<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strTitle = "sky LIBRARY";
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=strTitle%></title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<frameset frameborder="0" framespacing="0" border="0" rows="130, *">
	<frame frameborder="0" scrolling="no" resize="no" name="head" src="<%=cPath%>/library/index/head.jsp">
	
	<frameset name="body" frameborder="0" framespacing="0" border="0" rows="*, 20">
		<frameset name="main" frameborder="0" framespacing="0" border="0" cols="240, *">
			<frame name="left" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" resize="no" src="<%=cPath%>/library/index/left.jsp">
			<frame name="content" src="<%=cPath%>/library/index/main.jsp" scrolling="yes" marginwidth="0" marginheight="0" frameborder="0" noresize>
		</frameset>
		
		<frame name="copy" src="<%=cPath%>/library/index/copy.jsp" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" noresize>
	</frameset>
</frameset>
<body>	
</body>
</html>