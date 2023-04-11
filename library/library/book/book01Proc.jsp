<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="bMgr" class="library.Mgr"/>
<jsp:useBean id="bBean" class="library.BookBean"/>
<jsp:setProperty name="bBean" property="*"/>

<%
	  boolean result = bMgr.insertBook(bBean);
	  if(result){
%>
<script type="text/javascript">
		alert("내용을 입력 하였습니다.");
		location.href="book01.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("내용 입력에 실패 하였습니다.");
		history.back();
</script>
<%} %>