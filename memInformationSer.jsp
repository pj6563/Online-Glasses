<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/quize.css">
</head>
<body>



<%
	// 첨부된 파일을 받아서 올리는데 목적이 있다.
	// 위치는 현재 프로젝트 /upload
	String path = application.getRealPath("/tong01/img/");

	// 파일이 첨부된 경우에는 일반적으로 request로 받지 못한다.
	// 이유는 폼 태그에서 enctype이 지정되기 때문이다.
	// 그리고 받는 JSP에서는 Multi를 지원하는 객체로 받아야 한다.
	MultipartRequest mr = new MultipartRequest(	request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	// 인자 설명
	// 요청객체, 저장될 위치, 용량, 인코딩, 파일명변경객체
	// 고로 파라미터를 받기 전에 이미 파일이 저장될 곳을 정하여
	// MultipartRequest가 생성되어야 한다.
	
	
%>    

<%
request.setCharacterEncoding("utf-8");
String u_id = request.getParameter("id");
String u_pw = request.getParameter("pw");
String brith = request.getParameter("brith");
String address = request.getParameter("address");
String benefit = request.getParameter("benefit");
String income = request.getParameter("income");

Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
ResultSet rs = null;


try{
	
	String url = "jdbc:mysql://localhost:3306/leehost?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
	String id = "root";                                                    // 사용자 계정
	String pw = "1234";                                                // 사용자 계정의 패스워드

	Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
	conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

//	String sql ="insert into quiz values(?,?,?,?,?,?,?,?,?,?,?,?)";
	
	String sql ="update user set pw=?, brith = ?, address = ? , benefit=? , income=? wher id = ?";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1, mr.getParameter("pw") );
	pstmt.setString(2, mr.getParameter("brith") );
	pstmt.setString(3, mr.getParameter("address") );
	pstmt.setString(4, mr.getParameter("benefit"));
	pstmt.setString(5, mr.getParameter("income") );
	pstmt.setString(6, mr.getParameter("id")); 

	pstmt.executeUpdate(); 				//쿼리 업데이트 를 통해서 쿼리를 입력시킴
	
	out.println("정상적으로 수정되었습니다."); 
//rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	

}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
e.printStackTrace();
out.println(" 테이블 호출에 실패했습니다.");
}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
}

%>
<a href="javascript:history.back()" ><img src="img/back.jpg" id="back" width="40" height="40" ></a>
</body>
</html>