<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신규 도서 등록</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function inputCheck(){
			if(document.bookFrm.ISBN.value==""){
				alert("ISBN을 입력해 주세요");
				document.bookFrm.ISBN.focus();
				return;
			}
			if(document.bookFrm.bname.value==""){
				alert("책 이름을 입력해 주세요");
				document.bookFrm.bname.focus();
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
			document.bookFrm.action = "book01Proc.jsp";
			document.bookFrm.submit();
		}
	</script>
</head>
	<body onload="bookFrm.bname.focus()">
		<div align="center">
		<br><br>
		<form name="bookFrm" method="post" action="book01Proc.jsp">
			<table cellpadding="5">
				<tr>
					<td align="center">※도서 등록 전 검색 필수<br>
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr>
								<td align="center" colspan="3" bgcolor="#F0F8FF"><h2>신규 도서 등록</h2></td>
							</tr>
							<tr>
								<td width="25%">도서</td>
								<td width="75%"><input name="bname" size="20"></td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td><input name="ISBN" size="20"></td>
							</tr>
							<tr>
								<td>저자</td>
								<td><input name="author" size="20"></td>
							</tr>
							<tr>
								<td>출판사</td>
								<td><input name="publi" size="20"></td>
							</tr>
							<tr>
								<td>발행년도</td>
								<td><input name="year" size="10"></td>
							</tr>
							<tr>
								<td>재고</td>
								<td><input name="poss" size="10"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input name="price" size="10"></td>
							</tr>
							<tr>
								<td>상태</td>
								<td><select name="condi">
										<option value="최상" selected>최상
										<option value="상">상
										<option value="중">중
										<option value="하">하
										<option value="폐기필요">폐기필요
								</select></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								<input type="button" value="자료입력" onClick="inputCheck()"> &nbsp; &nbsp; 
								<input type="reset"  value="다시쓰기"> &nbsp; &nbsp; 
  								<input type="button" value="뒤로가기" onClick="history.go(-1)"></td>
  							</tr>
  						</table>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</body>
</html>