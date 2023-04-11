<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.MemBean" %>
<%@ page import="library.BookBean" %>
<%@ page import="library.CheckBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="cMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord = 0;
	int listSize = 0;
	int num = 0;
	Vector<CheckBean> vlist = null;
	String id = (String) session.getAttribute("idKey");
	String check = request.getParameter("check");
	if (check == null) check = "all";
	
	MemBean mBean = cMgr.getMember(id);
	String memship = mBean.getMemship();
	
	totalRecord = cMgr.checkoutCount(id, memship);
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
			<br>
			<h2><a href="lookup01.jsp">도서목록</a>&nbsp;&nbsp;&nbsp;<a href="lookup02.jsp">대출자목록</a></h2>
			<br>
			<table align="center" width="800">
				<tr>
					<td>전체 대출 기록 : <%=totalRecord%></td>
				</tr>
			</table><br>
			<form name="form" method="get">
				<br>
				<input type="button" value="전체자료" onClick="location.href='lookup02.jsp?check=all'">
				<input type="button" value="연체자" onClick="location.href='lookup02.jsp?check=over'"> 
				<input type="button" value="미반납자" onClick="location.href='lookup02.jsp?check=not'">
			</form>
			<table align="center" width="800" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = cMgr.chekoutList1(id, memship, check);
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<table width="100%" cellpadding="2">
						<tr align="center" height="120%" bgcolor="#F0F8FF">
							<td>번 호</td>
							<td>아이디</td>
							<td>이 름</td>
							<td>등 급</td>
							<td>도 서</td>
							<td>ISBN</td>
							<td>대 출 일</td>
							<td>반납예정일</td>
							<td>반 납 일</td>
							<td>연 체 일</td>
						</tr>
					<%
							for (int i = 0; i < listSize; i++) {
								if (i == listSize) break;
								CheckBean bean = vlist.get(i);
								num = bean.getNum();
								id = bean.getId();
								String bname = bean.getBname();
								String ISBN = bean.getISBN();
								String cdate = bean.getCdate();
								String exrdate = bean.getExrdate();
								String rdate = bean.getRdate();
								String odate = bean.getOdate();
								
								if (rdate == null) rdate = "대출중";
								
								MemBean nBean = cMgr.getMember(id);
								String name = nBean.getName();
								String memshipp = nBean.getMemship();
					%>
						<tr>
							<td align="center"><%=num%></td>
							<td align="center"><%=id%></td>
							<td align="center"><%=name%></td>
							<td align="center"><% if(memshipp.equals("special")){out.print("특별회원");}else if(memshipp.equals("basic")){out.print("일반회원");}%></td>
							<td align="center"><%=bname%></td>
							<td align="center"><%=ISBN%></td>
							<td align="center"><%=cdate%></td>
							<td align="center"><%=exrdate%></td>
							<td align="center"><%=rdate%></td>
							<td align="center"><%=odate%></td>
						</tr>
					<%		} //for%>
					</table>
					<%	} //if %>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>