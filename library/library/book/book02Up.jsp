<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.BookBean" %>
<jsp:useBean id="bMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	BookBean bBean = bMgr.getBook1(num);
	session.setAttribute("bBean", bBean);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 내역 수정</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function inputCheck(){
		if(document.bookFrm.bname.value==""){
			alert("책 이름을 입력해 주세요");
			document.bookFrm.bname.focus();
			return;
		}
		if(document.bookFrm.ISBN.value==""){
			alert("ISBN을 입력해 주세요");
			document.bookFrm.ISBN.focus();
			return;
		}
		if(document.bookFrm.author.value==""){
			alert("저자를 입력해 주세요");
			document.bookFrm.author.focus();
			return;
		}
		if(document.bookFrm.publi.value==""){
			alert("출판사를 입력해 주세요");
			document.bookFrm.publi.focus();
			return;
		}
		document.bookFrm.action = "book02UpProc.jsp";
		document.bookFrm.submit();
	}
	</script>
</head>
	<body onload="bookFrm.bname.focus()">
		<div align="center">
		<br><br>
			<form name="bookFrm" method="post" action="book02UpProc.jsp">
				<table border="1" cellspacing="0" cellpadding="2" width="600">
					<tr>
						<td align="center" colspan="3" bgcolor="#F0F8FF"><h2>도서 내역 수정</h2></td>
					</tr>
					<tr>
						<td width="25%">순번</td>
						<td width="75%"><input name="num" size="10" value="<%=num%>" readonly></td>
					</tr>
					<tr>
						<td>도서</td>
						<td><input name="bname" size="20" value="<%=bBean.getBname()%>"></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><input name="ISBN" size="20" value="<%=bBean.getISBN()%>"></td>
					</tr>
					<tr>
						<td>저자</td>
						<td><input name="author" size="20" value="<%=bBean.getAuthor()%>"></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td><input name="publi" size="20" value="<%=bBean.getPubli()%>"></td>
					</tr>
					<tr>
						<td>발행년도</td>
						<td><input name="year" size="10" value="<%=bBean.getYear()%>"></td>
					</tr>
					<tr>
						<td>재고</td>
						<td><input name="poss" size="10" value="<%=bBean.getPoss()%>"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input name="price" size="10" value="<%=bBean.getPrice()%>"></td>
					</tr>
					<tr>
						<td>상태</td>
						<td><select name="condi">
								<option value="최상" selected>최상
								<option value="상">상
								<option value="중">중
								<option value="하">하
								<option value="폐기필요">폐기필요
						</select><script>document.bookFrm.condi.value="<%=bBean.getCondi()%>"</script></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="수정">&nbsp;&nbsp;
						<input type="reset" value="리셋">&nbsp;&nbsp;
						<input type="button" value="취소" onclick="history.go(-1)"></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>