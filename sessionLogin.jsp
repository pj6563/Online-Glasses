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
	
	String loginid = request.getParameter("id");                        // request에서 id 파라미터를 가져온다

	String loginpasswd = request.getParameter("pw");     // request에서 passwd 파라미터를 가져온다.
	
	//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.

		
		Connection conn = null;                                        // null로 초기화 한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sqlurl = "jdbc:mysql://localhost:3306/og?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
			String sqlid = "root";                                                    // 사용자 계정
			String sqlpw = "1234";                                                // 사용자 계정의 패스워드
			
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(sqlurl,sqlid,sqlpw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			String sql ="select * from user where id =? and pw = ?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, loginid );
			pstmt.setString(2, loginpasswd );
			
			
			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			
			if(!rs.next()){                                                        // 로그인 실패
					%>
				<script>

				alert("로그인 실패");

				history.go(-2);                                    // 이전 페이지로 이동

				</script>

				<%
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()){ 
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				
				//--- 로그인 처리 ...   로그인 성공시 check 는 TRUE --
				if(id != null){                                                        // 로그인 성공시



				session.setAttribute("id", id);                 // 세션에 "id" 이름으로 id 등록


				//response.sendRedirect("index.jsp");               // 로그인 성공 메인페이지 이동
				%><script>

				alert("로그인 성공");

				history.go(-2);                                    // 이전 페이지로 이동

				</script> <%


				}
				
			}
		}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			out.println(" 테이블 호출에 실패했습니다.");
		}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
			if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
		}
	%>
	
	











</body>


</html>