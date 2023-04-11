<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.BookBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="bMgr" class="library.Mgr" />

<%
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	String bname = null;
	Vector<BookBean> vlist = null;
	if (search != null && search.equals("y")) {
		bname = request.getParameter("bname");
		vlist = bMgr.bookRead(bname);
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 검색</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function bookSearch() {
			if (bFrm.bname.value == "") {
				alert("책 제목을 검색하세요");
				bFrm.bname.focus();
				return;
			}
			document.bFrm.action = "bookSearch.jsp";
			document.bFrm.submit();
		}
		function send(bname, ISBN) {
			opener.document.chFrm.bname.value = bname;
			opener.document.chFrm.ISBN.value = ISBN;
			self.close();
		}
	</script>
</head>
	<body>
	<div align="center">
		<form name="bFrm" method="post">
			<table>
				<tr>
				 	<td><br>책 제목 입력 : <input name="bname">
				 	<input type="button" value="검색" onclick="bookSearch();"></td>
				</tr> 
				<!-- 검색결과 시작 -->
				<%
					if (search != null && search.equals("y")) {
						if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br>검색된 결과가 없습니다.</td>
				</tr>
				<%		} else { %>
				<tr>
					<td align="center"><br>※검색 후, 아래 책 이름을 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
							for (int i = 0; i < vlist.size(); i++) {
								BookBean bean = vlist.get(i);
								String rname = bean.getBname();
								String rISBN = bean.getISBN();
				%>
				<tr>
					<td><a href="#" onclick="javascript:send('<%=rname%>', '<%=rISBN%>')">
					<%=rname%>&nbsp;<%=rISBN%></a></td>
				</tr>
				<%
							} //for
						} //if
					} //if
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br>
					<a href="#" onclick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
	</body>
</html>