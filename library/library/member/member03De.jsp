<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<jsp:useBean id="mMgr" class="library.Mgr" />
<% String login = "login.jsp"; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원삭제</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script>
		function reload();
			top.document.location.reload();
			location.href="<%=login%>";
	</script>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String cPath = request.getContextPath();
		
		MemBean mBean = mMgr.getMember1(num);
		
		if (request.getParameter("pass") != null) {
			String inPass = request.getParameter("pass");
			MemBean bean = (MemBean) session.getAttribute("bean");
			String dbPass = bean.getPw();
			if (inPass.equals(dbPass)) {
				mMgr.deleteMember(num);
				String url = "../index/main.jsp";
				response.sendRedirect(url);
			} else {
	%>
	<script type="text/javascript">
		alert("입력하신 비밀번호가 아닙니다.");
		history.back();
	</script>
	<%		}
		} else { %>
	<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
	</script>
</head>
	<body aling="center">
		<div align="center">
		<br><br>
		<table width="500" cellpadding="3">
			<tr>
				<td height="20" align="center">
				사용자의 비밀번호를 입력해주세요.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="member03De.jsp">
			<table width="300" cellpadding="1" align="center">
				<tr>
					<td>번호</td>
					<td><%=mBean.getNum()%></td>
				</tr>
				<tr>	
					<td>사용자 아이디</td>
					<td><%=mBean.getId()%></td>
				</tr>
				<tr>
					<td>구분</td>
					<td><%=mBean.getMemship()%></td>
				</tr>
				<tr>
					<td>상태</td>
					<td><%=mBean.getStatus()%></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=mBean.getName()%></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=mBean.getTel()%></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=mBean.getMail()%></td>
				</tr>
				<tr>
					<td colspan="2"><hr size="1" color="#eeeeee"/></td>
				</tr>
			</table>
			<table width="200" align="center">
				<tr>
					<td>
					<input type="password" name="pass" size="17" maxlength="15"></td>
				</tr>
				<tr>
					<td><br>
					<input type="button" value="삭제완료" onClick="check()"> 
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onClick="history.go(-1)"></td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num%>">
		</form>
		<% } %>
		</div>
	</body>
</html>