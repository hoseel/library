<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.CheckBean"%>
<%@ page import="library.MemBean" %>
<%@ page import="library.BookBean" %>
<jsp:useBean id="cMgr" class="library.Mgr" />
<%
	String id = (String) session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("num"));
	CheckBean cBean = cMgr.getCheckout0(num);
	session.setAttribute("bean", cBean);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>대출 정보 수정</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
</head>
	<body>
	<div align="center">
	<br><br>
	<form name="chFrm" method="post" action="check02UpProc.jsp">
		<table aling="center" cellpadding="5">
			<tr>
				<td align="center" valign="middle">
					<table border="1" cellpadding="2" align="center" width="600">
						<tr align="center" bgcolor="#F0F8FF">
							<td colspan="3"><h2>대출 정보 수정[관리자]</h2></td>
						</tr>
						<tr>
							<td width="25%">레코드번호</td>
							<td width="75%"><input name="num" size="3" value="<%=num%>" readonly></td>
						</tr>
						<tr>
							<td width="25%">회원ID</td>
							<td width="75%"><input name="id" size="15" value="<%=cBean.getId()%>" readonly></td>
						</tr>
						<tr>
							<td>대출도서</td>
							<td><input name="bname" size="20" value="<%=cBean.getBname()%>" readonly></td>
						</tr>
						<tr>
							<td>대출도서 ISBN</td>
							<td><input name="ISBN" size="20" value="<%=cBean.getISBN()%>" readonly></td>
						</tr>
						<tr>
							<td>대출일자</td>
							<td><input type="date" name="cdate" id="cdate" size="20" value="<%=cBean.getCdate()%>" readonly></td>
						</tr>
						<tr>
							<td>반납예정일자</td>
							<td><input type="date" name="exrdate" id="exrdate" size="20" value="<%=cBean.getExrdate()%>" readonly></td>
						</tr>
						<tr>
							<td>반납일자</td>
							<td><input type="date" name="rdate" size="20" value="<%=cBean.getRdate()%>"></td>
						</tr>
						<tr>
							<td>연체일</td>
							<td><input name="odate" size="8" value="<%=cBean.getOdate()%>">일</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="submit" value="수정완료"> &nbsp; &nbsp;
							<input type="reset" value="다시쓰기"> &nbsp; &nbsp;
							<input type="button" value="취소하기" onclick="history.go(-1)"></td>						
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	</div>
	</body>
</html>