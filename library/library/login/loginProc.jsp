<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String url = "login.jsp";
	String msg = "로그인에 실패하였습니다";
	
	boolean result = mMgr.loginMember(id, pw);
	if (result) {
		session.setAttribute("idKey", id);
		msg = "로그인에 성공하였습니다";
	}
%>
<script>
	alert("<%=msg%>");
	top.document.location.reload();
	location.href="<%=url%>";
</script>