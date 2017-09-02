<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- DB 호출 시작 -->
	<%
	
	out.println("기다려주세요. "); 
	
	
	request.setCharacterEncoding("utf-8");
	String t001 = request.getParameter("001");
	String t002 = request.getParameter("002");
	String t003 = request.getParameter("003");
	String t004 = request.getParameter("004");
	String t005 = request.getParameter("005");
	String c006 = request.getParameter("006");
	String t007 = request.getParameter("007");
	String c008 = request.getParameter("008");
	
	
	int t008 = Integer.parseInt(c008);
	int t006 = Integer.parseInt(c006);
	
	//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.

		
		Connection conn = null;                                        // null로 초기화 한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sqlurl = "jdbc:mysql://localhost:3306/lws7402?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
			String sqlid = "lws7402";                                       // 사용자 계정
			String sqlpw = "online123";                                     // 사용자 계정의 패스워드
			
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(sqlurl,sqlid,sqlpw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			String sql ="update board set author=?,title=?,contents=?,date=?,hit=?,priority=?,board_name=? where count=? ";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, t001 );
			pstmt.setString(2, t002 );
			pstmt.setString(3, t003 );
			pstmt.setString(4, t004);
			pstmt.setString(5, t005);
			pstmt.setInt(6, t006);
			pstmt.setString(7, t007);
			pstmt.setInt(8, t008);
			
			pstmt.executeUpdate(); 				//쿼리 업데이트 를 통해서 쿼리를 입력시킴
			
			
			response.sendRedirect("control.jsp?Bname=1");

		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			out.println(" 테이블 호출에 실패했습니다.");
		}finally{                                                           // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
		}
	%>

</body>
</html>