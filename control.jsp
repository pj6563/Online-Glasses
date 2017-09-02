<%@page import="java.text.Format"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>청춘장학</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/index.css">
  </head>
  <body>
    <header>
      <nav class='navbar navbar-default'>
        <div class="container-fluid">
          <div class="navbar-header">
            <a class='navbar-brand' href="./index.jsp">
              <img src="./images/logo.jpg" alt="">
            </a>
            <button type="button" class='navbar-toggle collapsed' data-toggle='collapse' data-target=''>
              <span class='icon-bar'></span>
              <span class='icon-bar'></span>
              <span class='icon-bar'></span>
            </button>
          </div>

          <div class="collapse navbar-collapse">
            <ul id='navMenu' class='nav navbar-nav'>
              <li class='menu'>
                <a href="search.jsp">
                  맞춤장학
                </a>
              </li>
              <li class='menu'>
                <a href="notic.jsp?Bname='notice'">
                  공지사항
                </a>
              </li>
              <li class='menu'>
                <a href="gallery.jsp">
                  장학정보
                </a>
              </li>
              <li class='menu'>
                <a href="notic.jsp?Bname='community'">
                  커뮤니티
                </a>
              </li>
              <li class='menu'>
                <a href="notic.jsp?Bname='service'">
                  Q&A
                </a>
              </li>
            </ul>
            <ul id='loginMenu' class='nav navbar-nav navbar-right'>	
              <li class='menu'>
              <%String id =(String)session.getAttribute("id");                       // request에서 id 파라미터를 가져온다
              
              String ch =(String)session.getAttribute("authority");
              
				if(id != null){
		             int authority = Integer.parseInt(ch);
					if(authority == 0){
						%><a href="logout.jsp">
		               	Logout
		                </a>
		                <a href="dbList.jsp">
		               	관리자
		                </a>	
					<%}else{
					 %><a href="logout.jsp">
	               	Logout<%=id %>
	                </a><%}	
				}else{
              %>
                <a href="login.jsp">
                  로그인
                </a>
                <%} %>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
	
	<table>
		
		
		<!-- DB 호출 시작 -->
		<%
			request.setCharacterEncoding("utf-8");
			String tB = request.getParameter("Bname");//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.

			int Bname = Integer.parseInt(tB);
			
			Connection conn = null;               // null로 초기화 한다.
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			%><%=Bname%> <%
			
				
			try{
				String sqlurl = "jdbc:mysql://localhost:3306/lws7402?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
				String sqlid = "lws7402";                                       // 사용자 계정
				String sqlpw = "online123";                                     // 사용자 계정의 패스워드
				
				Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
				conn=DriverManager.getConnection(sqlurl,sqlid,sqlpw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
				

				if (  Bname == 1){
					%>
					<tr>
						<th>id
				<th>　|　
						<th>author
				<th>　|　
						<th>title
				<th>　|　
						<th>content
				<th>　|　
						<th>date
				<th>　|　
						<th>hit
				<th>　|　
						<th>priority
				<th>　|　
						<th>bord_name
				<th>　|　
						<th>authority
				<th>　|　
						
				<th>
					</tr>
					<%
				
				String sql = ("select * from board");                        // sql 쿼리
				pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				
				
				int countn =0;// 목록의 글 갯수 값 확인을 위한 숫자
				
					
				rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
				while(rs.next()){ 
					String name = rs.getString("count");
					String period = rs.getString("author");
					String money = rs.getString("title");
					String agency = rs.getString("contents");
					String link = rs.getString("date");
					String detail = rs.getString("hit");
					String address = rs.getString("priority");
					String result = rs.getString("board_name");
					String school = rs.getString("authority");

				%>
			<form action="controlSer.jsp" method="get">
			<tr>
				<th><input name="008" type="text" value="<%=name%>" style="width: 40px;">
				<th>　|　
				<th> <input name="001" type="text" value="<%=period%>"  style="width: 150px;">
				<th>　|　
				<th><input name="002" type="text" value="<%=money%>"  style="width: 200px;"> 
				<th>　|　
				<th> <input name="003" type="text" value="<%=agency%>" style="width: 200px;">
				<th>　|　
				<th> <input name="004" type="text" value="<%=link%>" style="width: 150px;">
				<th>　|　
				<th> <input name="005" type="text" value="<%=detail%>" style="width: 40px;">
				<th>　|　
				<th> <input name="006" type="text" value="<%=address%>" style="width: 40px;">
				<th>　|　
				<th><input name="007" type="text" value="<%=result%>" style="width: 150px;"> 
				<th>　|　
				<th><input name="009" type="text" value="<%=school%>" style="width: 40px;"> 
				<th><input type="submit" class="submitB" value="수정">
			</tr>
			</form>
				
				    <%
				}
			}else if(Bname == 2){

				%>
				<tr>
					<th> 제목 
						<th> | 
					<th> 기간
						<th> | 
					<th> 금액
						<th> | 
					<th> 주최
						<th> | 
					<th> 링크
						<th> | 
					<th> 세부내용
						<th> | 
					<th> 지역
						<th> | 
					<th> 결과
						<th> | 
					<th> 학교
						<th> | 
					<th> 학점
						<th> | 
					<th> 학력
						<th> | 
					<th> 이미지 주소
					
				</tr>
				<%
			
			String sql = ("select * from scholership");                        // sql 쿼리
			pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
			
			
			int countn =0;// 목록의 글 갯수 값 확인을 위한 숫자
			
				
			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			while(rs.next()){ 
				String name = rs.getString("name");
				String period = rs.getString("period");
				String money = rs.getString("money");
				String agency = rs.getString("agency");
				String link = rs.getString("link");
				String detail = rs.getString("detail");
				String address = rs.getString("address");
				String result = rs.getString("result");
				String school = rs.getString("school");
				String grade = rs.getString("grade");
				String graduation = rs.getString("graduation");
				String imagelink = rs.getString("imgage");

			%>
		<tr>
				<th><input name="001" type="text" value="<%=name%>" style="width: 150px;">
				<th>　|　
				<th> <input name="002" type="text" value="<%=period%>"  style="width: 120px;">
				<th>　|　
				<th><input name="003" type="text" value="<%=money%>"  style="width: 100px;"> 
				<th>　|　
				<th> <input name="004" type="text" value="<%=agency%>" style="width: 60px;">
				<th>　|　
				<th> <input name="005" type="text" value="<%=link%>" style="width: 150px;">
				<th>　|　
				<th> <input name="006" type="text" value="<%=detail%>" style="width: 300px;">
				<th>　|　
				<th> <input name="007" type="text" value="<%=address%>" style="width: 100px;">
				<th>　|　
				<th><input name="008" type="text" value="<%=result%>" style="width: 50px;"> 
				<th>　|　
				<th><input name="009" type="text" value="<%=school%>" style="width: 100px;"> 
				<th>　|　
				<th><input name="010" type="text" value="<%=grade%>" style="width: 40px;"> 
				<th>　|　
				<th><input name="011" type="text" value="<%=graduation%>" style="width: 40px;"> 
				<th>　|　
				<th><input name="012" type="text" value="<%=imagelink%>" style="width: 100px;"> 
			</tr>

			
			    <%						
			}
				}else if(Bname == 3){

					%>
					<tr>
						<th> id
						<th>　| 
						<th> pw
						<th> | 
						<th> first name
						<th> | 
						<th> last name
						<th> | 
						<th>birth
						<th> | 
						<th>adress
						<th> | 
						<th>benifit
						<th> | 
						<th>incom
						<th> | 
						<th>agree
						<th> | 
						
					</tr>
					<%
				
				String sql = ("select * from user");                        // sql 쿼리
				pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				
				
				int countn =0;// 목록의 글 갯수 값 확인을 위한 숫자
				
					
				rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
				while(rs.next()){ 
					String name = rs.getString("id");
					String period = rs.getString("pw");
					String money = rs.getString("f_name");
					String agency = rs.getString("l_name");
					String link = rs.getString("brith");
					String detail = rs.getString("address");
					String address = rs.getString("benefit");
					String result = rs.getString("income");
					String school = rs.getString("agree");

				%>
			<tr>
				<th><input name="001" type="text" value="<%=name%>" style="width: 40px;">
				<th>　|　
				<th> <input name="002" type="text" value="<%=period%>"  style="width: 150px;">
				<th>　|　
				<th><input name="003" type="text" value="<%=money%>"  style="width: 200px;"> 
				<th>　|　
				<th> <input name="004" type="text" value="<%=agency%>" style="width: 200px;">
				<th>　|　
				<th> <input name="005" type="text" value="<%=link%>" style="width: 150px;">
				<th>　|　
				<th> <input name="006" type="text" value="<%=detail%>" style="width: 40px;">
				<th>　|　
				<th> <input name="007" type="text" value="<%=address%>" style="width: 40px;">
				<th>　|　
				<th><input name="008" type="text" value="<%=result%>" style="width: 150px;"> 
				<th>　|　
				<th><input name="009" type="text" value="<%=school%>" style="width: 40px;"> 
			</tr>
				
				    <%						
				}
					}else if(Bname == 4){

						%>
						<tr>
							<th> | 제목 
						<th> | 
							<th> | 기간
							<th> | 금액
							<th> | 주최
							<th> | 링크
							<th> | 세부내용
							<th> | 지역
							<th> | 결과
							<th> | 학교
							<th> | 학점
							<th> | 학력
							<th> | 이미지 주소
							
						</tr>
						<%
					
					String sql = ("select * from scholership");                        // sql 쿼리
					pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
					
					
					int countn =0;// 목록의 글 갯수 값 확인을 위한 숫자
					
						
					rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
					while(rs.next()){ 
						String name = rs.getString("name");
						String period = rs.getString("period");
						String money = rs.getString("money");
						String agency = rs.getString("agency");
						String link = rs.getString("link");
						String detail = rs.getString("detail");
						String address = rs.getString("address");
						String result = rs.getString("result");
						String school = rs.getString("school");
						String grade = rs.getString("grade");
						String graduation = rs.getString("graduation");
						String imagelink = rs.getString("imgage");

					%>
				<tr>
					<th> <br><%=name%>
					<th> <%=period%>
					<th> <%=money%>
					<th> <%=agency%>
					<th> <%=link%>
					<th> <%=detail%>
					<th> <%=address%>
					<th> <%=result%>
					<th> <%=school%>
					<th> <%=grade%>
					<th> <%=graduation%>
					<th> <%=imagelink%>
				</tr>
					
					    <%						
					}
						}
				
			}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
				e.printStackTrace();
				out.println(" 테이블 호출에 실패했습니다.");
			}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
				if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
				if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
				if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
			}%>
		</table>
	<footer>
		<br>
		　　　　Project Team : Online Glasses<br>
		　　　　Phone  : 010-9659-9881<br>
		　　　　E-mail : clzk1588@daum.net<br><br> 
    </footer>
</body>
</html>