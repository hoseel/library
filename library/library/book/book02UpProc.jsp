<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" class="library.Mgr" />
<jsp:useBean id="bBean" class="library.BookBean" />
<jsp:setProperty name="bBean" property="*" />
<%
	boolean result = bMgr.update_book(bBean);
	if (result) {
%>
<script>
	alert("자료 수정 완료");
	location.href="book02.jsp";
</script>
<% } else { %>
<script>
	alert("자료 수정 실패");
	history.back();
</script>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>