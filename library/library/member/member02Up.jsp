<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<jsp:useBean id="mMgr" class="library.Mgr" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	MemBean mBean = mMgr.getMember1(num);
	String id = mBean.getId();
	session.setAttribute("bean", mBean);
%>

<!DOCTYPE html>
<html>
<head>
	<title>회원 정보 수정[관리자]</title>
	<link href="../style.css" rel="stylesheet" type="text/css" >
	<script type="text/javascript" src="javascript.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>table { border-collapse: collapse; }</style>
</head>
	<body onload="regFrm.id.focus()">
		<div align="center">
		<br><br>
		<form name="regFrm" method="post" action="member02UpProc.jsp">
			<table aling="center" cellpadding="5">
				<tr>
					<td align="center" valign="middle">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#F0F8FF">
								<td colspan="3"><h2>회원정보수정[관리자]</h2></td>
							</tr>
							<tr>
								<td width="25%">순번</td>
								<td width="75%"><input name="num" size="5" value="<%=mBean.getNum()%>" readonly></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><input name="id" size="15" value="<%=mBean.getId()%>" readonly></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pw" size="15" value="<%=mBean.getPw()%>" readonly></td>
							</tr>
							<tr>
								<td>회원구분</td>
								<td><select name="memship">
									<option value="admin">관리자
									<option value="special">특별회원
									<option value="basic">일반회원
									</select><script>document.regFrm.memship.value="<%=mBean.getMemship()%>"</script></td>
							</tr>
							<tr>
								<td>회원상태</td>
								<td><input type="radio" name="status" value="1" <%=Integer.valueOf(mBean.getStatus()).equals(1) ? "checked" : ""%>>정상
								<input type="radio" name="status" value="0" <%=Integer.valueOf(mBean.getStatus()).equals(0) ? "checked" : ""%>>불량</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="name" size="15" value="<%=mBean.getName()%>" placeholder="이름 작성"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input name="tel" size="11" value="<%=mBean.getTel()%>" placeholder="하이픈(-) 없이 작성"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input type="radio" name="gender" value="1" <%=mBean.getGender().equals("1") ? "checked" : ""%>>남
								<input type="radio" name="gender" value="2" <%=mBean.getGender().equals("2") ? "checked" : ""%>>여
								<input type="radio" name="gender" value="3" <%=mBean.getGender().equals("3") ? "checked" : ""%>>지정하지않음</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birth" size="6" placeholder="ex)830815" value="<%=mBean.getBirth()%>"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input name="mail" size="30" value="<%=mBean.getMail()%>"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input id="zip" name="zip" size="5" value="<%=mBean.getZip()%>" readonly>
								<input type="button" value="우편번호찾기" onclick="PostCheck()"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input id="post" name="post" size="50" value="<%=mBean.getPost()%>" readonly>
								<input id="post2" name="post2" size="50" value="<%=mBean.getPost2()%>"></td>
							</tr>
							<tr>
								<td>취향장르</td>
								<td><%
										String lists[] = { "시/수필/소설", "자기계발/에세이", "역사/인문학", "철학/예술/종교", "정치/사회과학", "기타" };
										String taste[] = mBean.getTaste();
										for (int i = 0; i < lists.length; i++) {
											out.println("<input type='checkbox' name='taste'");
											out.println("value=" + lists[i] + " "
											+ (taste[i].equals("1") ? "checked" : "") + ">");
											out.println( lists[i]);
										}
									%>
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
								</select><script>document.regFrm.job.value="<%=mBean.getJob()%>"</script></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
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