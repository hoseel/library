<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord = 0; //전체레코드수
	int listSize = 0;    //현재 읽어온 게시물의 수
	Vector<MemBean> vlist = null;
	String id = (String) session.getAttribute("idKey");
	MemBean mBean = mMgr.getMember(id);  //회원자료 가져오기
	
	int num = mBean.getNum();
	String name = mBean.getName();
	String memship = mBean.getMemship();
	
	totalRecord = mMgr.getTotalCount(memship, num);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function member02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function member01Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member01Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function member03De(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "member03De.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
	</script>
</head>
	<body>
		<div align="center">
			<br>
			<h2>회원관리</h2>
			<br>
			<table align="center" width="600">
				<tr>
					<td>회원수 : <%=totalRecord%></td>
				</tr>
			</table>
			<table align="center" width="600" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = mMgr.getMemberList(memship, num);
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<table width="100%" cellpadding="2" border="1">
						<tr align="center" height="120%" bgcolor="#F0F8FF">
							<td>번 호</td>
							<td>아이디</td>
							<td>권 한</td>
							<td>상 태</td>
							<td>이 름</td>
							<td>전 화</td>
							<td>메 일</td>
							<td>수 정</td>
							<td>삭 제</td>
						</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								MemBean bean = vlist.get(i);
								num = bean.getNum();
								id = bean.getId();
								memship = bean.getMemship();
								int status = bean.getStatus();
								name = bean.getName();
								String tel = bean.getTel();
								String mail = bean.getMail();
					%>
						<tr>
						<td align="center">
							<%=num%>
						</td>
						<td align="center">
							<%=id%>
						</td>
						<td align="center">
							<%=memship%>
						</td>
						<td align="center">
							<% if (status == 0) { out.print("불량"); } else { out.print("정상"); } %>
						</td>
						<td align="center">
							<%=name%>
						</td>
						<td align="center">
							<%=tel%>
						</td>
						<td align="center">
							<%=mail%>
						</td>
						<td align="center">
							<% if (Integer.valueOf(mBean.getNum()).equals(1)) { %>
							<a href="javascript:member02Up('<%=num%>')">수 정</a>
							<% } else { %> <a href="javascript:member01Up('<%=num%>')">수 정</a><% } %>
						</td>
						<td align="center">
							<a href="javascript:member03De('<%=num%>')">삭 제</a>
						</td>
						</tr>
					<% 		} //for end%>	
						</table>
					<% } // if end%>	
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
			<br>
			<input type="button" value="신규회원" onclick="location.href='member01.jsp'">
			<input type="hidden" name="num">
			</form>
		</div>
	</body>
</html>