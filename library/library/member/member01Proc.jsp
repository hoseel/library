<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mMgr" class="library.Mgr"/>
<jsp:useBean id="mBean" class="library.MemBean"/>
<jsp:setProperty property="*" name="mBean"/>
<%
	boolean result = mMgr.insertMember(mBean);
	if(result) {
%>
<script type="text/javascript">
	alert("회원가입을 하였습니다");
	location.href="../index/main.jsp"
</script>
<% } else { %>
<script type="text/javascript">
	alert("회원가입에 실패하였습니다");
	history.back();
</script>
<% } %>