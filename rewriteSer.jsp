<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.InputMismatchException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import = "java.sql.*" %> 
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String BName = request.getParameter("BName");
	String c007 = request.getParameter("number");
	
	int number = Integer.parseInt(c007);
	int n;
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
			
			String sql ="update board set title=?,contents=? where count=? ";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, title );
			pstmt.setString(2, content );
			pstmt.setInt(3, number);
			
			n = pstmt.executeUpdate(); 				//쿼리 업데이트 를 통해서 쿼리를 입력시킴
			
			response.sendRedirect("notic.jsp?Bname='"+BName+"'");

		}finally{
		    if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		    if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	%>

</body>
</html>