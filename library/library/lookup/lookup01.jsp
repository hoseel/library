<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.BookBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="bMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord = 0;
	int listSize = 0;
	Vector<BookBean> vlist = null;
	String check = request.getParameter("check");
	if (check == null) check = "all";
	
	BookBean bBean = bMgr.getBook();
	int num = bBean.getNum();
	String bname = bBean.getBname();

	totalRecord = bMgr.getBookCount();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 상태 조회</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<div align="center">
			<br>
			<h2><a href="lookup01.jsp">도서목록</a>&nbsp;&nbsp;&nbsp;<a href="lookup02.jsp">대출자목록</a></h2>
			<br>
			<table align="center" width="850">
				<tr>
					<td>소장 자료수 : <%=totalRecord%></td>
				</tr>
			</table>
			<form name="form" method="get">
				<br>
				<input type="button" value="전체자료" onclick="location.href='lookup01.jsp?check=all'">&nbsp;&nbsp;
				<input type="button" value="대출가능자료" onclick="location.href='lookup01.jsp?check=in'">&nbsp;&nbsp;
				<input type="button" value="대출불가능자료" onclick="location.href='lookup01.jsp?check=out'">
			</form>
			<table align="center" width="850" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = bMgr.getBookList0(check);
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<table width="100%" cellpadding="2">
						<tr align="center" height="120%" bgcolor="#F0F8FF" border="1">
							<td>번 호</td>
							<td>도 서</td>
							<td>ISBN</td>
							<td>저 자</td>
							<td>출판사</td>
							<td>발행년도</td>
							<td>재 고</td>
							<td>상 태</td>
							<td>대출여부</td>
						</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								BookBean bean = vlist.get(i);
								num = bean.getNum();
								bname = bean.getBname();
								String ISBN = bean.getISBN();
								String author = bean.getAuthor();
								String publi = bean.getPubli();
								int year = bean.getYear();
								int poss = bean.getPoss();
								String condi = bean.getCondi();
								String state = bean.getState();
					%>
						<tr>
						<td align="center">
							<%=num%>
						</td>
						<td align="center">
							<%=bname%>
						</td>
						<td align="center">
							<%=ISBN%>
						</td>
						<td align="center">
							<%=author%>
						</td>
						<td align="center">
							<%=publi%>
						</td>
						<td align="center">
							<%=year%>
						</td>
						<td align="center">
							<%=poss%>
						</td>
						<td align="center">
							<%=condi%>
						</td>
						<td align="center">
							<%=state%>
						</td>
						</tr>
					<% 		} //for end%>	
						</table>
					<% } // if end%>	
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>  