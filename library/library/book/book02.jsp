<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="library.BookBean" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="bMgr" class="library.Mgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord = 0;
	int listSize = 0;
	Vector<BookBean> vlist = null;
	String check = request.getParameter("check");
	if (check == null) check = "all";
	
	BookBean bBean = bMgr.getBook();
	int num = bBean.getNum();
	String bname = bBean.getBname();

	String keyWord = "", keyField = "";
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
		check = "ssearch";
	}
	
	totalRecord = bMgr.getBookCount1(check, keyWord, keyField);

	int numPerPage = 10;
	int pagePerBlock = 10;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 1;
	int nowBlock = 1;
	int start = 0;
	int end = 10;
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 목록</title>
	<link href="../style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function book02Up(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "book02Up.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function book03De(num) {
			document.readFrm.num.value = num;
			document.readFrm.action = "book03De.jsp";
			document.readFrm.target = "content";
			document.readFrm.submit();
		}
		function check() {
			if (document.searchFrm.keyWord.value == "") {
				alert("검색어를 입력하세요");
				document.searchFrm.keyWord.focus();
				return;
			}
			document.searchFrm.action="book02.jsp"
			document.searchFrm.target="content";
			document.saerchFrm.submit();
		}
		function pageing(page) {
			document.form.nowPage.value = page;
			document.form.nowPage.action="book02.jsp";
			document.form.nowPage.target="content";
			document.form.submit();
		}
		function block(value) {
			document.form.nowPage.value = <%=pagePerBlock%> * (value - 1) + 1;
			document.form.submit();
		}
	</script>
</head>
	<body>
		<div align="center">
			<br>
			<h2>도서목록</h2>
			<br>
			<table align="center" width="800">
				<tr>
					<td>소장 자료수 : <%=totalRecord%></td>
					<td align="right">
						<form name="readFrm" method="get">
						<a href="book01.jsp">[신규 도서 등록]</a>
						<input type="hidden" name="num">
						</form>
					</td>
				</tr>
			</table>
			<table align="center" width="800" cellpadding="3">
				<tr>
					<td align="center" colspan="3">
					<%
						vlist = bMgr.getBookListSearch(check, keyWord, keyField, start, end);
						listSize = vlist.size();
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<table width="100%" cellpadding="2">
						<tr align="center" height="120%" bgcolor="#F0F8FF" border="1">
							<td>번 호</td>
							<td>도 서</td>
							<td>ISBN</td>
							<td>저 자</td>
							<td>출판사</td>
							<td>발행년도</td>
							<td>수 정</td>
							<td>삭 제</td>
						</tr>
					<%
							for (int i = 0; i < numPerPage; i++) {
								if (i == listSize) break;
								BookBean bean = vlist.get(i);
								num = bean.getNum();
								bname = bean.getBname();
								String ISBN = bean.getISBN();
								String author = bean.getAuthor();
								String publi = bean.getPubli();
								int year = bean.getYear();
					%>
						<tr>
						<td align="center"><%=num%></td>
						<td align="center"><%=bname%></td>
						<td align="center"><%=ISBN%></td>
						<td align="center"><%=author%></td>
						<td align="center"><%=publi%></td>
						<td align="center"><%=year%></td>
						<td align="center"><a href="javascript:book02Up('<%=num%>')">수 정</a></td>
						<td align="center"><a href="javascript:book03De('<%=num%>')">삭 제</a></td>
						</tr>
					<% 		} //for end%>	
					</table>
					<% } // if end%>	
					</td>
				</tr>
				<tr>
					<td align="center">
					<!-- 페이징 및 블럭 처리 시작 -->	
					<%	int pageStart = (nowBlock - 1) * pagePerBlock + 1;
						int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
						
						if (totalPage != 0) {
							if (nowBlock > 1) {
					%><a href="javascript:block('<%=nowBlock - 1%>')">prev</a><%			
							} // end if %> &nbsp; <% 
							for ( ; pageStart < pageEnd; pageStart++) { 
					%>			<a href="javascript:pageing('<%=pageStart%>')"><%
								if (pageStart == nowPage) {
					%>				<font color="#F4796F"><% 
								} //end if 
					%>			[<%=pageStart%>]<%
								if (pageStart == nowPage) {
					%>				</font><%
								} //end if
					%>			</a><%
							} //end for %> &nbsp; <%
							if (totalBlock > nowBlock) {
					%>			<a href="javascript:block('<%=nowBlock + 1%>')">next</a><%
							} //end if %> &nbsp; <%
						} //end if(제일 위에 있는 if) %>
					<!-- 페이징 및 블럭처리 끝 -->
					</td>
				</tr>
			</table>
			<br>
			<form name="searchForm" method="get" action="book02.jsp">
				<table width="600" cellpadding="4" cellspacing="0">
					<tr>
					<td align="center" valign="bottom">
						<select name="keyField" size="1">
							<option value="bname">도서</option>
							<option value="author">저자</option>
							<option value="publi">출판사</option>
						</select>
						<input size="16" name="keyWord">
						<input type="button" value="search" onclick="check()">
						<input type="hidden" name="nowPage" value="1">
					</td>
					</tr>
				</table>
			</form>
			<form name="form" method="post">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
			</form>
		</div>
	</body>
</html>