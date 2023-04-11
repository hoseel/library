package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Mgr {
	
	private DBConnectionMgr pool;
	
	public Mgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//1.Member 매니저
	
	//ID 중복 확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
		
	//회원가입
	public boolean insertMember(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert member(id, pw, name, tel, gender, birth, mail, zip, post, post2, taste, job) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getBirth());
			pstmt.setString(7, bean.getMail());
			pstmt.setString(8, bean.getZip());
			pstmt.setString(9, bean.getPost());
			pstmt.setString(10, bean.getPost2());
			String taste[] = bean.getTaste();
			char tst[] = { '0', '0', '0', '0', '0', '0' };
			String lists[] = { "시/수필/소설", "자기계발/에세이", "역사/인문학", "철학/예술/종교", "정치/사회과학", "기타" };
			for (int i = 0; i < taste.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (taste[i].equals(lists[j]))
						tst[j] = '1';
				}
			}
			pstmt.setString(11, new String(tst));
			pstmt.setString(12, bean.getJob());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
		
	//로그인
	public boolean loginMember(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ? and pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//회원정보 가져오기
	public MemBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setStatus(rs.getInt("status"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String tst[] = new String[6];
				String taste = rs.getString("taste");
				for (int i = 0; i < tst.length; i++) {
					tst[i] = taste.substring(i, i + 1);
				}
				bean.setTaste(tst);
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//회원정보 가져오기(num)
	public MemBean getMember1(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setStatus(rs.getInt("status"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String tst[] = new String[6];
				String taste = rs.getString("taste");
				for (int i = 0; i < tst.length; i++) {
					tst[i] = taste.substring(i, i + 1);
				}
				bean.setTaste(tst);
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//회원정보 가져오기(전체)
	public MemBean getMember0() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setStatus(rs.getInt("status"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setMail(rs.getString("mail"));
				bean.setZip(rs.getString("zip"));
				bean.setPost(rs.getString("post"));
				bean.setPost2(rs.getString("post2"));
				String tst[] = new String[6];
				String taste = rs.getString("taste");
				for (int i = 0; i < tst.length; i++) {
					tst[i] = taste.substring(i, i + 1);
				}
				bean.setTaste(tst);
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
		
	// 회원정보수정
	public boolean updateMember(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update member set pw=?, name=?, tel=?, gender=?, birth=?, mail=?, zip=?, post=?, post2=?, taste=?, job=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getTel());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6, bean.getMail());
			pstmt.setString(7, bean.getZip());
			pstmt.setString(8, bean.getPost());
			pstmt.setString(9, bean.getPost2());
			
			char tst[] = { '0', '0', '0', '0', '0', '0' };
			if (bean.getTaste() != null) {
				String taste[] = bean.getTaste();
				String lists[] = { "시/수필/소설", "자기계발/에세이", "역사/인문학", "철학/예술/종교", "정치/사회과학", "기타" };
				for (int i = 0; i < taste.length; i++) {
					for (int j = 0; j < lists.length; j++)
						if (taste[i].equals(lists[j]))
							tst[j] = '1';
				}
			}
			pstmt.setString(10, new String(tst));
			pstmt.setString(11, bean.getJob());
			pstmt.setString(12, bean.getId());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회원정보수정(관리자)
		public boolean updateMember1(MemBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update member set pw=?, name=?, memship=?, status=?, tel=?, gender=?, birth=?, mail=?, zip=?, post=?, post2=?, taste=?, job=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getMemship());
			pstmt.setInt(4, bean.getStatus());
			pstmt.setString(5, bean.getTel());
			pstmt.setString(6, bean.getGender());
			pstmt.setString(7, bean.getBirth());
			pstmt.setString(8, bean.getMail());
			pstmt.setString(9, bean.getZip());
			pstmt.setString(10, bean.getPost());
			pstmt.setString(11, bean.getPost2());
			
			char tst[] = { '0', '0', '0', '0', '0', '0' };
			if (bean.getTaste() != null) {
				String taste[] = bean.getTaste();
				String lists[] = { "시/수필/소설", "자기계발/에세이", "역사/인문학", "철학/예술/종교", "정치/사회과학", "기타" };
				for (int i = 0; i < taste.length; i++) {
					for (int j = 0; j < lists.length; j++)
						if (taste[i].equals(lists[j]))
							tst[j] = '1';
				}
			}
			pstmt.setString(12, new String(tst));
			pstmt.setString(13, bean.getJob());
			pstmt.setString(14, bean.getId());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 회원 총 수
	public int getTotalCount(String memship, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (memship.equals("admin")) {
		       sql = "select count(num) from member";
			   pstmt = con.prepareStatement(sql);
			} else {
			   sql = "select count(num) from member where num=?";
			   pstmt = con.prepareStatement(sql);
			   pstmt.setInt(1, num);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 해당 조건의 회원 조회
	public Vector<MemBean> getMemberList(String memship, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemBean> vlist = new Vector<MemBean>();
		try {
			con = pool.getConnection();
			if (memship.equals("admin")) {
				sql = "select * from member";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select * from member where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemBean bean = new MemBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setPw(rs.getString("pw"));
				bean.setMemship(rs.getString("memship"));
				bean.setStatus(rs.getInt("status"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setMail(rs.getString("mail"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 회원 정보 삭제
	public void deleteMember(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from member where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	//-----------------------------------------------------------------------------
	// 2. Book 매니저
	// 신규 도서 추가
	public boolean insertBook(BookBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert book (bname, ISBN, author, publi, year, poss, price, condi) values (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getBname());
			pstmt.setString(2, bean.getISBN());
			pstmt.setString(3, bean.getAuthor());
			pstmt.setString(4, bean.getPubli());
			pstmt.setInt(5, bean.getYear());
			pstmt.setInt(6, bean.getPoss());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getCondi());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 자료 가져오기
	public BookBean getBook() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from book order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new BookBean();
				bean.setNum(rs.getInt("num"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setAuthor(rs.getString("author"));
				bean.setPubli(rs.getString("publi"));
				bean.setYear(rs.getInt("year"));
				bean.setPoss(rs.getInt("poss"));
				bean.setPrice(rs.getInt("price"));
				bean.setCondi(rs.getString("condi"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	// 자료가져오기 (num)
		public BookBean getBook1 (int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BookBean bean = null;
			try {
				con = pool.getConnection();
				String sql = "select * from book where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bean = new BookBean();
					bean.setNum(rs.getInt("num"));
					bean.setBname(rs.getString("bname"));
					bean.setISBN(rs.getString("ISBN"));
					bean.setAuthor(rs.getString("author"));
					bean.setPubli(rs.getString("publi"));
					bean.setYear(rs.getInt("year"));
					bean.setPoss(rs.getInt("poss"));
					bean.setPrice(rs.getInt("price"));
					bean.setCondi(rs.getString("condi"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return bean;
		}

	// 자료 수
	public int getBookCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
		    sql = "select count(ISBN) from book";
		    pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 도서수 조건별로 카운트
	public int getBookCount1(String check, String keyWord, String keyField) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select count(ISBN) from book";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("ssearch")) {
				sql = "select count(ISBN) from book where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 내역 조회
	public Vector<BookBean> getBookList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			sql = "select * from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BookBean bean = new BookBean();
				bean.setNum(rs.getInt("num"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setAuthor(rs.getString("author"));
				bean.setPubli(rs.getString("publi"));
				bean.setYear(rs.getInt("year"));
				bean.setPoss(rs.getInt("poss"));
				bean.setPrice(rs.getInt("price"));
				bean.setCondi(rs.getString("condi"));
				bean.setState(rs.getString("state"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 내역 조회(대출중)
	public Vector<BookBean> getBookList0(String check) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select * from book";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("out")) {
				sql = "select * from book where state='대출중'";
				pstmt = con.prepareStatement(sql);
			} else if (check.equals("in")) {
				sql = "select * from book where state='대출가능'";
				pstmt = con.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBean bean = new BookBean();
				bean.setNum(rs.getInt("num"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setAuthor(rs.getString("author"));
				bean.setPubli(rs.getString("publi"));
				bean.setYear(rs.getInt("year"));
				bean.setPoss(rs.getInt("poss"));
				bean.setPrice(rs.getInt("price"));
				bean.setCondi(rs.getString("condi"));
				bean.setState(rs.getString("state"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 내역 조회(검색)
	public Vector<BookBean> getBookListSearch(String check, String keyWord, String keyField, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			if (check.equals("all")) {
				sql = "select * from book limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else if (check.equals("ssearch")) {
				sql = "select * from book where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBean bean = new BookBean();
				bean.setNum(rs.getInt("num"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setAuthor(rs.getString("author"));
				bean.setPubli(rs.getString("publi"));
				bean.setYear(rs.getInt("year"));
				bean.setPoss(rs.getInt("poss"));
				bean.setPrice(rs.getInt("price"));
				bean.setCondi(rs.getString("condi"));
				bean.setState(rs.getString("state"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// 내역 조회(2) 페이징 및 검색
	public Vector<BookBean> getBookList1(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist1 = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from book order by num limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from book where " + keyField + "like ? ";
				sql += "order by num limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
		    
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBean bean = new BookBean();
				bean.setNum(rs.getInt("num"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setAuthor(rs.getString("author"));
				bean.setPubli(rs.getString("publi"));
				bean.setYear(rs.getInt("year"));
				bean.setPoss(rs.getInt("poss"));
				bean.setPrice(rs.getInt("price"));
				bean.setCondi(rs.getString("condi"));
				vlist1.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist1;
	}
	
	// 정보수정
	public boolean update_book (BookBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update book set bname=?, ISBN=?, author=?, publi=?, year=?, poss=?, price=?, condi=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getBname());
			pstmt.setString(2, bean.getISBN());
			pstmt.setString(3, bean.getAuthor());
			pstmt.setString(4, bean.getPubli());
			pstmt.setInt(5, bean.getYear());
			pstmt.setInt(6, bean.getPoss());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getCondi());
			pstmt.setInt(9, bean.getNum());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 회원 정보 삭제
	public void deleteBook(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from book where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	//-----------------------------------------------------------------------------
	// 3. Check 매니저
	
	// 책 검색
	public Vector<BookBean> bookRead(String bname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BookBean> vlist = new Vector<BookBean>();
		try {
			con = pool.getConnection();
			sql = "select bname, ISBN from book where bname like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + bname + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookBean bean = new BookBean();
				bean.setBname(rs.getString(1));
				bean.setISBN(rs.getString(2));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//도서 대출
	public boolean checkout(CheckBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert checkout(id, bname, ISBN, cdate, exrdate, rdate, odate) values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getBname());
			pstmt.setString(3, bean.getISBN());
			pstmt.setString(4, bean.getCdate());
			pstmt.setString(5, bean.getExrdate());
			pstmt.setString(6, bean.getRdate());
			pstmt.setString(7, bean.getOdate());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//대출 및 반납 정보 가져오기
	public CheckBean getCheckout (String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CheckBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from checkout where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new CheckBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setCdate(rs.getString("cdate"));
				bean.setExrdate(rs.getString("exrdate"));
				bean.setRdate(rs.getString("rdate"));
				bean.setOdate(rs.getString("odate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//대출 및 반납 정보 가져오기
	public CheckBean getCheckout1 () {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CheckBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from checkout";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean = new CheckBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setCdate(rs.getString("cdate"));
				bean.setExrdate(rs.getString("exrdate"));
				bean.setRdate(rs.getString("rdate"));
				bean.setOdate(rs.getString("odate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}
	
	//대출 및 반납 정보 가져오기
		public CheckBean getCheckout0 (int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			CheckBean bean = null;
			try {
				con = pool.getConnection();
				String sql = "select * from checkout where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					bean = new CheckBean();
					bean.setNum(rs.getInt("num"));
					bean.setId(rs.getString("id"));
					bean.setBname(rs.getString("bname"));
					bean.setISBN(rs.getString("ISBN"));
					bean.setCdate(rs.getString("cdate"));
					bean.setExrdate(rs.getString("exrdate"));
					bean.setRdate(rs.getString("rdate"));
					bean.setOdate(rs.getString("odate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return bean;
		}
	
	// 반납정보수정
	public boolean updateCheck(CheckBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update checkout set id=?, bname=?, ISBN=?, cdate=?, exrdate=?, rdate=?, odate=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getBname());
			pstmt.setString(3, bean.getISBN());
			pstmt.setString(4, bean.getCdate());
			pstmt.setString(5, bean.getExrdate());
			pstmt.setString(6, bean.getRdate());
			pstmt.setString(7, bean.getOdate());
			pstmt.setInt(8, bean.getNum());
			
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 총 수
	public int checkoutCount (String id, String memship) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (memship.equals("admin")) {
				sql = "select count(num) from checkout";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from checkout where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 도서 대출 내역 조회
	public Vector<CheckBean> checkoutList (String id, String memship, int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CheckBean> vlist = new Vector<CheckBean>();
		try {
			con = pool.getConnection();
			if (memship.equals("admin")) {
				sql = "select * from checkout";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select * from checkout where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CheckBean bean = new CheckBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setBname(rs.getString("bname"));
				bean.setISBN(rs.getString("ISBN"));
				bean.setCdate(rs.getString("cdate"));
				bean.setExrdate(rs.getString("exrdate"));
				bean.setRdate(rs.getString("rdate"));
				bean.setOdate(rs.getString("odate"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	// 도서 대출 내역 조회(조건)
		public Vector<CheckBean> chekoutList1 (String id, String memship, String check) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<CheckBean> vlist = new Vector<CheckBean>();
			try {
				con = pool.getConnection();
				if (memship.equals("admin") && check.equals("all")) {
					sql = "select * from checkout";
					pstmt = con.prepareStatement(sql);
				} else if (memship.equals("admin") && check.equals("over")) {
					sql = "select * from checkout where odate > 0";
					pstmt = con.prepareStatement(sql);
				} else if (memship.equals("admin") && check.equals("not")) {
					sql = "select * from checkout where rdate is null";
					pstmt = con.prepareStatement(sql);
				} else {
					sql = "select * from checkout where id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
				}
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					CheckBean bean = new CheckBean();
					bean.setNum(rs.getInt("num"));
					bean.setId(rs.getString("id"));
					bean.setBname(rs.getString("bname"));
					bean.setISBN(rs.getString("ISBN"));
					bean.setCdate(rs.getString("cdate"));
					bean.setExrdate(rs.getString("exrdate"));
					bean.setRdate(rs.getString("rdate"));
					bean.setOdate(rs.getString("odate"));
					vlist.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
	
	// 회원 정보 삭제
	public void checkDelete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from checkout where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 반납 예정일자 계산
	public boolean updateRdate(int num, String exrdate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update checkout set exrdate = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, exrdate);
			pstmt.setInt(2, num);
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 연체 일수 계산
	public boolean updateOdate(int num, long over) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			if (over > 0) {
				String sql = "update checkout set odate=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, over);
				pstmt.setInt(2, num);
			} else {
				String sql = "update checkout set odate=0 where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
			}
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 미반납 도서에 대출중으로 표시 
	public boolean updateNotReturn(String bname, String rdate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			if (rdate == null) {
				String sql = "update book set state='대출중' where bname=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bname);
			} else {
				String sql = "update book set state='대출가능' where bname=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bname);
			}
			
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// 연체자 표시 
	public boolean updateNRid (String id, String odate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			if (Integer.valueOf(odate) > 0) {
				   String sql = "update member set status='0' where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "연체 " + odate);
					pstmt.setString(2, id);
			} else {
				   String sql = "update member set status='1' where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
			}
			
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}


}
