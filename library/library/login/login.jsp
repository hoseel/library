<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<jsp:useBean id="mMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String cPath = request.getContextPath();
	String id = (String)session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
		function loginCheck() {
			if (document.loginFrm.id.value == "") {
				alert("아이디를 입력해주세요");
				document.loginFrm.id.focus();
				return;
			}
			if (document.loginFrm.pw.value == "") {
				alert("비밀번호를 입력해주세요");
				document.loginFrm.pw.focus();
				return;
			}
			document.loginFrm.action = "<%=cPath%>/library/login/loginProc.jsp";
			document.loginFrm.submit();
		}
		function memberForm() {
			document.loginFrm.target = "content";
			document.loginFrm.action = "<%=cPath%>/library/member/member01.jsp";
			document.loginFrm.submit();
		}
	</script>
	
</head>
	<body>
		<div align="center"><br><br>
		<%
			if (id != null) { 
		%>
		<b><%=mBean.getName()%></b>[<%=id%>]님 환영합니다.
		<p>sky LIBRARY에 오신것을<br>진심으로 환영합니다.</p>
		<p>저희 도서관은 일반회원 기준<br>대출은 1주일에 최대 3권,<br>연장은 1회(1주일) 가능합니다.</p>
		<a href="../login/logout.jsp">로그아웃</a>		
		<%
			} else {
		%>
		<form name="loginFrm" method="post" action="../login/loginProc.jsp">
		<table>
			<tr>
				<td align="center" colspan="2"><h2>로그인</h2></td>
			</tr>
			<tr>
				<td>아 이 디</td>
				<td><input name="id" size="15"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" size="15"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="right">
					<input type="button" value="로그인" onClick="loginCheck()">&nbsp;
					<input type="button" value="회원가입" onClick="memberForm()">
					</div>
				</td>
			</tr>
		</table>
		</form>
		<%
			}
		%>
		</div>
	</body>
</html>