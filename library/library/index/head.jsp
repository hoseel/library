<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	String cPath = request.getContextPath();
	String url = "../member/member01.jsp";
	String label = "회원가입";
	
	if (id != null) {
		url = "../member/member01Up.jsp";
		label = "회원정보수정";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sky LIBRARY - head</title>
	<link href="../style.css?ver=1" rel="stylesheet" type="text/css">
</head>
	<body>
		<table width="100%" border="0">
			<tr>
				<td colspan="5">
					<a href="<%=cPath%>/library/index.jsp" target="_parent" onfocus="this.blur()";>
					<image height="80" src="../images/book.jpg"></a>
				</td>
			</tr>
			<tr>
				<td width="20%">&nbsp;</td>
				<td width="20%"><font size="3"><a href="<%=url%>" target="content"><b><%=label%></b></a></font></td>
				<td width="20%"><font size="3"><a href="../book/book02.jsp" target="content"><b>도서목록</b></a></font></td>
				<td width="20%"><font size="3"><a href="../checkout/check01.jsp" target="content"><b>도서대출</b></a></font></td>
				<td width="20%"><font size="3"><a href="../lookup/lookup01.jsp" target="content"><b>각종조회</b></a></font></td>
			</tr>
		</table>
	</body>
</html>