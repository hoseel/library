<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sky LIBRARY - left</title>
	<link href="../style.css?ver=1" rel="stylesheet" type="text/css">
</head>
	<body leftmargin="0" topmargin="0" bgcolor="#D9E5FF">
		<jsp:include page="../login/login.jsp" />
		<br><br>
		<hr><br><br>
		<div align="center"><a href="../member/member02.jsp" target="content">회원관리</a>
		<br><br>
		<a href="../book/book01.jsp" target="content">도서등록</a>
		<br><br>
		<a href="../checkout/check02.jsp" target="content">대출기록</a></div>
	</body>
</html>