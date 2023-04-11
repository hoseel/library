<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.BookBean"%>
<jsp:useBean id="bMgr" class="library.Mgr" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 내역 삭제</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
	    String cPath = request.getContextPath();
	
	    BookBean bBean = bMgr.getBook();
		bMgr.deleteBook(num);
	%>
	<script type="text/javascript">
		alert("자료를 삭제하였습니다");
		location.href="book02.jsp";
	</script>
</head>
	<body>
		<div align="center">
		<br><br>
		<table width="400" cellpadding="3">
			<tr>
				<td height="20" align="center">
					자료를 삭제합니다.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="book03De.jsp">
			<table width="400" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td>번호</td>
								<td><%=bBean.getNum()%></td>
							</tr>
							<tr>
								<td>책 이름</td>
								<td><%=bBean.getBname()%></td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td><%=bBean.getISBN()%></td>
							</tr>
							<tr>
								<td>저자</td>
								<td><%=bBean.getAuthor()%></td>
							</tr>
							<tr>
								<td>출판사</td>
								<td><%=bBean.getPubli()%></td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							<tr>
								<td align="center">
								<input type="button" value="삭제" onClick="check()"> 
								<input type="reset" value="리셋">
								<input type="button" value="뒤로" onClick="history.go(-1)"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num%>">
	</body>
</html>