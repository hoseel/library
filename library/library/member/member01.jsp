<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<style>
	table { border-collapse: collapse; }
	</style>
	<script src="javascript.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function idCheck(id) {
			if (id == "") {
				alert("아이디를 입력해 주세요");
				document.regFrm.id.focus();
				return;
			}
			url = "idCheck.jsp?id=" + id;
			window
			.open(url, "IDCheck", "width=300, height=150");
		}
	</script>
</head>
	<body onLoad="regFrm.id.focus()">
		<div align="center">
			<br><br>
			<form name="regFrm" method="post" action="member01Proc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellsapcing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#F0F8FF">
								<td colspan="3"><h2>회원가입</h2></td>
							</tr>
							<tr>
								<td width="25%">아이디<font color="red"> *</font></td>
								<td width="75%"><input name="id" size="15" >
								<input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value)"></td>
							</tr>
							<tr>
								<td>비밀번호<font color="red"> *</font></td>
								<td><input type="password" name="pw" size="15" placeholder="4자 이상"></td>
							</tr>
							<tr>
								<td>비밀번호 확인<font color="red"> *</font></td>
								<td><input type="password" name="repw" size="15" placeholder="4자 이상"></td>
							</tr>
							<tr>
								<td>이름<font color="red"> *</font></td>
								<td><input name="name" size="15" placeholder="이름 작성"></td>
							</tr>
							<tr>
								<td>전화번호<font color="red"> *</font></td>
								<td><input name="tel" size="15" placeholder="하이픈(-) 없이 작성"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input type="radio" name="gender" value="1" checked>남
								<input type="radio" name="gender" value="2">여
								<input type="radio" name="gender" value="3">지정하지않음</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birth" size="6" placeholder="ex)830815"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input name="mail" size="20" placeholder="aa@bb.cc형태로 작성"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input id="zip" name="zip" size="5" readonly>
								<input type="button" value="우편번호찾기" onclick="PostCheck()"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input id="post" name="post" size="50" readonly>
								<input id="post2" name="post2" size="50" placeholder="상세주소 입력"></td>
							</tr>
							<tr>
								<td>취향장르</td>
								<td><input type="checkbox" name="taste" value="시/수필/소설"> 시/수필/소설
									<input type="checkbox" name="taste" value="자기계발/에세이"> 자기계발/에세이
									<input type="checkbox" name="taste" value="역사/인문학"> 역사/인문학<br>
									<input type="checkbox" name="taste" value="철학/예술/종교"> 철학/예술/종교
									<input type="checkbox" name="taste" value="정치/사회과학"> 정치/사회과학
									<input type="checkbox" name="taste" value="기타"> 기타
								</td>
							</tr>
							<tr>
								<td>직업</td>
								<td><select name="job">
								<option value="0" selected>선택하세요
								<option value="회사원">회사원
								<option value="연구전문직">연구전문직
								<option value="교수학생">교수학생
								<option value="일반자영업">일반자영업
								<option value="공무원">공무원
								<option value="의료인">의료인
								<option value="법조인">법조인
								<option value="종교,언론,에술인">종교/언론/예술인
								<option value="농,축,수산,광업인">농/축/수산/광업인
								<option value="주부">주부
								<option value="무직">무직
								<option value="기타">기타
								</select></td>
							</tr>
						</table>
						<span align="center">
							<br>
							<input type="button" value="회원가입" onClick="inputCheck()"> &nbsp; &nbsp;
							<input type="reset" value="다시쓰기">
						</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</body>
</html>