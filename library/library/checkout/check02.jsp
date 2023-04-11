<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="library.CheckBean" %>
<%@ page import="library.MemBean" %>
<%@ page import="library.BookBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="cMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");

	int totalRecord = 0;
	int listSize = 0;
	Vector<CheckBean> vlist = null;
	String id = (String) session.getAttribute("idKey");
	
	MemBean mBean = cMgr.getMember(id);
	String memship = mBean.getMemship();

	int num = 0;
	
	totalRecord = cMgr.checkoutCount(id, memship);
%>
<%
	int oneday = 24 * 60 * 60 * 1000;
	long over = 0;
	
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	String anydate = "2022-01-01";
	Date cdate_d = null;
	Date rdate_d = null;
	Date exrdate_d = null;
	
	vlist = cMgr.checkoutList(id, memship, num);
	listSize = vlist.size();
	for (int i = 0 ; i < listSize; i++) {
		if (i == listSize) break;
		CheckBean cBean = vlist.get(i);
		num = cBean.getNum();
		id = cBean.getId();
		String bname = cBean.getBname();
		String ISBN = cBean.getISBN();
		
		MemBean nBean = cMgr.getMember(id);
		String name = nBean.getName();
		String mmemship = nBean.getMemship();
		
		String cdate = cBean.getCdate();
		cdate_d = dateformat.parse(cdate);
		
		if (mmemship.equals("special")) {
			cdate_d.setDate(cdate_d.getDate() + 14);
		} else if (mmemship.equals("basic")) {
			cdate_d.setDate(cdate_d.getDate() + 7);
		}
		
		String exrdate = dateformat.format(cdate_d).substring(0, 10);
		cMgr.updateRdate(num, exrdate);
		
		String rdate = cBean.getRdate();
		if (rdate != null) {
			rdate_d = dateformat.parse(rdate);
		} else {
			rdate_d = dateformat.parse(anydate);
		}
		
		cMgr.updateNotReturn(bname, rdate);
		
		exrdate_d = dateformat.parse(exrdate);
		over = ((rdate_d.getTime() - exrdate_d.getTime()) / oneday);
		
		cMgr.updateOdate(num, over);
		
		String odate = cBean.getOdate();
		cMgr.updateNRid(id, odate);
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>대출 정보 수정</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function check02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "check02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
	</script>
</head>
	<body>
		<div align="center">
			<br>
			<h2>대출 정보 수정</h2>
			<br>
			<table>
				<tr width="800">
					<td>전체 대출 기록 : <%=totalRecord%></td>
				</tr>
			</table><br>
			<table align="center" width="800" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = cMgr.checkoutList(id, memship, num);
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
							<td>수 정</td>
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
							<td align="center">
								<a href="javascript:check02Up('<%=num%>')">수 정</a>
							</td>
						</tr>
					<%		} //for%>
					</table>
					<%	} //if %>
					</td>
				</tr>
			</table>
			<form name="readFrm" method="get">
			<br>
			<input type="hidden" name="num">
			</form>
		</div>
	</body>
</html>