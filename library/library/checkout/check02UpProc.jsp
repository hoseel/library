<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cMgr" class="library.Mgr"/>
<jsp:useBean id="cBean" class="library.CheckBean"/>
<jsp:setProperty name="cBean" property="*"/>

<%
	  boolean result = cMgr.updateCheck(cBean);
	  if(result){
%>
<script type="text/javascript">
		alert("반납 정보 수정 완료");
		location.href="check02.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("수정 실패");
		history.back();
</script>
<%	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>