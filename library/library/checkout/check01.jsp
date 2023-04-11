<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<%@ page import="library.BookBean" %>
<jsp:useBean id="cMgr" class="library.Mgr"/>
<jsp:useBean id="bMgr" class="library.Mgr" />

<% 
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey"); 
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 대출</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function inputCheck(){
			if(document.chFrm.id.value==""){
				alert("회원 ID를 입력해 주세요");
				document.chFrm.id.focus();
				return;
			}
			if(document.chFrm.bname.value==""){
				alert("대출하시는 책 이름을 입력해 주세요");
				document.chFrm.bname.focus();
				return;
			}
			document.chFrm.action = "check01Proc.jsp";
			document.chFrm.submit();
		}
		function bookSearch() {
			url = "bookSearch.jsp?search=n";
			window.open(url, "booknameSearch", "width=500, height=300, scrollbar=yes");
		}
	</script>
</head>
	<body>
		<div align="center">
		<br><br>
		<form name="chFrm" method="post" action="check01Proc.jsp">
			<table cellpadding="5">
				<tr>
					<td align="center">
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr bgcolor="#F0F8FF">
								<td align="center" colspan="3"><h2>도서 대출</h2></td>
							</tr>
							<tr>
								<td width="25%">회원ID</td>
								<td width="75%"><input name="id" size="20" value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>대출도서</td>
								<td><input name="bname" size="20" readonly>
								<input type="button" value="도서 찾기" onclick="bookSearch()"></td>
							</tr>
							<tr>
								<td>대출도서 ISBN</td>
								<td><input name="ISBN" size="20" readonly></td>
							</tr>
							<tr>
								<td>대출일자</td>
								<td><input type="date" name="cdate" id="cdate" size="20" readonly></td>
							</tr>
							<tr>
								<td>반납예정일자</td>
								<td><input type="date" name="exrdate" id="exrdate" size="20" readonly></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								<input type="button" value="대출신청" onClick="inputCheck()"> &nbsp; &nbsp; 
								<input type="reset"  value="다시쓰기"> &nbsp; &nbsp; 
  								<input type="button" value="뒤로가기" onClick="history.go(-1)">
  								<input type="hidden" name="odate" id="odate">
  								<input type="hidden" name="rdate" id="rdate"></td>
  							</tr>
  						</table>
  						<br><br>
  						<table width="400" border="1" align="center">
							<tr align="center" bgcolor="#F0F8FF"><td colspan="3">대출안내</td></tr>
							<tr align="center" bgcolor="#F0F8FF"><td>회원구분</td><td>대출가능권수</td><td>대출가능기간</td></tr>
							<tr align="center"><td>일반회원</td><td>최대 5권</td><td>14일(연장 1회 가능)</td></tr>
							<tr align="center"><td>특별회원</td><td>최대 3권</td><td>7일(연장 1회 가능)</td></tr>
							<tr align="center"><td colspan="3">특별회원의 경우 대출표에 적힌 반납일이 자동으로 수정 적용됩니다!</td></tr>
						</table>
  						
					</td>
				</tr>
			</table>
		</form>
		<script>
		date = new Date();
		year = date.getFullYear();
		month = ('0' + (date.getMonth() + 1)).slice(-2);
		day = ('0' + date.getDate()).slice(-2);
		today = year + "-" + month + "-" + day;
		document.getElementById('cdate').value = today;
		
		
		function addDays(date, days) {
			var clone = new Date(date);
			clone.setDate(date.getDate() + days);
			return clone;
		}
		
		week = addDays(date, 7);
		wyear = week.getFullYear();
		wmonth = ('0' + (week.getMonth() + 1)).slice(-2);
		wday = ('0' + week.getDate()).slice(-2);
		aweek = wyear + "-" + wmonth + "-" + wday;
		document.getElementById('exrdate').value = aweek;
		
		/* document.getElementById('cdate').value = new Date().toISOString().substring(0, 10);*/
		
		/*
		rdate = aweek;
		exrdate = today;
		odate = document.getElementById('odate').value;
		
		if (rdate == null) {
			odate = "0";
		} else if (rdate > exrdate) {
			odate = date - week;
		}*/
		</script>

		</div>
	</body>
</html>