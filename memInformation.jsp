<!-- 약어 정리

b 
= body 의 b, 몸을 표현하기 위하여 사용
s
= search 의 s 검색을 표현하기 위해 사용

bor
= bord 의 bor 

ser
=servlet

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
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="indCss.css">
	</head>
	<body>
	
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

String sql = ("select * from user");                        // sql 쿼리
pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.


rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
while(rs.next()){ 
	String s_id = rs.getString("id");
	String s_pw = rs.getString("pw");
	String f_name = rs.getString("f_name");
	String l_name = rs.getString("l_name");
	String brith = rs.getString("brith");
	String address = rs.getString("address");
	String benefit = rs.getString("benefit");
	String income = rs.getString("income");
	String agree = rs.getString("agree");
%>

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
					회원정보 수정					
				</div>
				<div class="sMiddle">
					<form id="memInformation" action="memInformationser.jsp">
				  		<table> <!-- start table  -->
				  			<tr>
				              <td>
				                <label for="">아이디 * </label>
				              </td>
				              <td>
				          		
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">비밀번호 재설정 </label>
				              </td>
				              <td>
				                <input type="password" name="" value="">
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">비밀번호 재설정 확인 </label>
				              </td>
				              <td>
				                <input type="password" name="" value="">
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">이름 </label>
				              </td>
				              <td>
				                <input type="text" name="" value="">
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">주소 </label>
				              </td>
				              <td>
				                <input type="text" name="" value="">
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">생년월일 </label>
				              </td>
				              <td>
				                <select class="form-control">
				                  <option>1990</option>
				                  <option>1991</option>
				                  <option>1992</option>
				                  
				                </select>
				                <select class="form-control">
				                  <option>1</option>
				                  <option>2</option>
				                  <option>3</option>
				                  <option>4</option>
				                  <option>5</option>
				                  <option>6</option>
				                  <option>3</option>
				                  <option>3</option>
				                  <option>3</option>
				                  <option>3</option>                  
				                </select>
				
				                <select class="form-control">
				                  <option>10</option>
				                  <option>20</option>
				                  <option>30</option>
				                </select>
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">학력 </label>
				              </td>
				              <td>
				                <select class="form-control">
				                  <option>초등학교</option>
				                  <option>중학교</option>
				                  <option>고등학교</option>
				                </select>
				                <select class="form-control">
				                  <option>1</option>
				                  <option>2</option>
				                  <option>3</option>
				                </select>
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">수혜현황 </label>
				              </td>
				              <td>
				                <select class="form-control">
				                  <option>국가유공자</option>
				                  <option>소년소녀가장</option>
				                  <option>차상위계층</option>
				                </select>
				              </td>
				            </tr>
				
				            <tr>
				              <td>
				                <label for="">소득분위 </label>
				                
				              </td>
				              <td>
				                <select class="form-control">
				                  <option>1</option>
				                  <option>2</option>
				                  <option>3</option>
				                  <option>4</option>
				                  <option>5</option>
				                  <option>6</option>
				                  <option>7</option>
				                  <option>8</option>
				                  <option>9</option>
				                  <option>10</option>
				                  
				                </select>
				              </td>
				            </tr>
				  		</table> <!-- end table -->
				  		<input type="submit" value="저장">
				  	</form>
				</div>
			</div>
			
		</div><!-- html을 영역으로 나눈 부분 중 middle부분(내용) end -->
		
		
		

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
