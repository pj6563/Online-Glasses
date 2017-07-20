<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
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
		String borName = request.getParameter("str"); //리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.
		if (borName == null) {
			borName = "community";
		}
	%>
	
<%
Connection conn = null;                                        // null로 초기화 한다.
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
String url = "jdbc:mysql://localhost:3306/og?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
String id = "root";                                                    // 사용자 계정
String pw = "1234";                                                // 사용자 계정의 패스워드

Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.

String sql = ("select * from bord where bord_name ='"+borName+"' limit 5");                        // sql 쿼리
pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.


rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
while(rs.next()){ 
	String title = rs.getString("title");
%>

<table>
	<tr>
		<th><%=title%>
		</tr>
	</th>
</table>
    <%}
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