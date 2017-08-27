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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String BName = request.getParameter("BName");
	
	BName = BName.replace("\"", "");
	BName = BName.replace("\'", "");
	String userid = (String)session.getAttribute("id");
	
	// 운영자의 글쓰기 인지 확인 하는 단계
	int authority = 9;
	if( id == "admin"){
		authority = 1;
	}
	
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
			
			String sql ="insert into bord( author , title , content ,date , hit,priority , bord_name , authority) values(?,?,?,curdate(),?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1, userid );
			pstmt.setString(2, title );
			pstmt.setString(3, content);
			pstmt.setInt(4, 0); 
			pstmt.setInt(5, 1);
			pstmt.setString(6, BName);
			pstmt.setInt(7, authority);

			pstmt.executeUpdate(); 				//쿼리 업데이트 를 통해서 쿼리를 입력시킴
			
			%><script>


			history.go(-2);                                    // 이전 페이지로 이동

			</script> <%
			

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