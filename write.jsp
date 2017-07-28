<!-- 약어 정리

b 
= body 의 b, 몸을 표현하기 위하여 사용
s
= search 의 s 검색을 표현하기 위해 사용

bor
= bord 의 bor 

ser
=servlet

sen
= send 
 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>장학</title>
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script type="text/javascript" src="index.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="indCss.css">
	</head>
	<body>
	
		<div id="bTop" ><!-- html을 영역으로 나눈 부분 중 top부분(메뉴) start -->
			<nav class="menu"><!-- nav start -->
			    <ul class="menu">
				    <li>
				    	<a href="notic.jsp">공지사항</a>
				    </li>
				    <li>
				    	<a href="scalership.jsp">장학정보</a>
				    </li>
				    <li>
				    	<a href="cummunty.jsp">커뮤니티</a>
				    </li>
				    <li>
				    	<a href="servicecenter.jsp">고객센터</a>
				    </li>
				    <li>
				    	|
				    </li>
				    <li>
				    	<a href="manual.html">장학 활용법</a>
				    </li>  
			    </ul>
		    </nav><!-- nav end -->
		</div><!-- html을 영역으로 나눈 부분 중 top부분(메뉴) end -->
		
		<div id="bMiddle"><!-- html을 영역으로 나눈 부분 중 middle 부분(내용) start -->
		
			<div id="search">
				<div class="sTop">
					나에게 딱 맞는 장학금 찾기					
				</div>
<!-- DB 호출 시작 -->
  <%
		request.setCharacterEncoding("utf-8");
		String key_name = request.getParameter("str");
//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.
		if (key_name == null) {
			key_name = "NO!";
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

String sql = ("select * from bord");                        // sql 쿼리
pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.


rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
while(rs.next()){ 
	String title = rs.getString("title");
	String content = rs.getString("content");
	
%>
    
 	<form action = "#" accept-charset="utf-8" name = "coment" method = "get">
 	<table style="border:0.5px solid blue;">
			<tr>
				<th style="border:0.5px solid blue;">제목
				<td style="border:0.5px solid blue;">
					<input type="text" 	maxlength="20">
				</td>
			</tr>
			<tr>
				<th>내용
				<td style="border:0.5px solid blue;">
					<input type="text" 	maxlength="20">
				</td>
			</tr>
			<tr>
				<th></th>
				<td style="text-align: right;">
					<a href="javascript:history.back()">
						<button type="button">취소</button>
					</a>
					<input type="submit" value="수정">
				</td>
			</tr>
	</table>
	</form>
  
  
    
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
			</div>
			
			<div id="bord">
				<div class="notic" onmouseover="senBorView">
					<a href="notic.jsp">공지사항</a>
					
				</div>
				<div class="scalership">
					<a href="scalership.jsp">장학정보</a>
				</div>
				<div class="community">
					<a href="cummunty.jsp">커뮤니티</a>
				</div>
			</div>
			<div class= "box";>
			
				<iframe src="borViewSer.jsp">
				</iframe>
			</div>
			
			
		</div><!-- html을 영역으로 나눈 부분 중 middle부분(내용) end -->
		
		
		


	</body>
</html>