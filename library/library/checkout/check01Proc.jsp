<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cMgr" class="library.Mgr"/>
<jsp:useBean id="cBean" class="library.CheckBean"/>
<jsp:setProperty property="*" name="cBean"/>
<%
	boolean result = cMgr.checkout(cBean);
	if(result) {
%>
<script type="text/javascript">
	alert("대출 성공! 반납일을 확인해주세요");
	location.href="../index/main.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("대출 실패");
	history.back();
</script>
<% } %>