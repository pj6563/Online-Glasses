<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bord</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./js/index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/notic.css">
  </head>
  
  <body>
	<!-- 최상단 메뉴바 start -->
    <header>
      <nav class='navbar navbar-default'>
        <div class="container-fluid">
          <div class="navbar-header">
            <a class='navbar-brand' href="./index.html">
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
                <a href="notic.jsp?Bname='notic'">
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
                <a href="login.jsp">
                  로그인
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- 최상단 메뉴바 end -->
	
	<!-- 게시판 출력 start -->
    <div class="middle">
    	<div class="bord">
			<table class="tFix">
				<tr>
					<th class="number">번호</th>
					<th class="title">제목</th>
					<th class="author">작성자</th>
					<th class="date">날짜</th>
					<th class="hit">조회</th>
				</tr>
			</table>
			
			<table>
				<!-- DB 호출 시작 -->
				  <%
						request.setCharacterEncoding("utf-8");
						String Bname = request.getParameter("Bname");
						
				//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.

				Connection conn = null;                                        // null로 초기화 한다.
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
				String url = "jdbc:mysql://localhost:3306/og?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
				String id = "root";                                                    // 사용자 계정
				String pw = "1234";                                                // 사용자 계정의 패스워드
				
				Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
				conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
				
				String sql = ("select * from bord where bord_name="+Bname+"");                        // sql 쿼리
				pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
				
				
				int countn =0;// 목록의 글 갯수 값 확인을 위한 숫자
				
				rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
				while(rs.next()){ 
					String title = rs.getString("title");
					String content = rs.getString("content");
					String author = rs.getString("author");
					String date = rs.getString("date");
					String hit = rs.getString("hit");
					String number = rs.getString("count");
					
					countn += 1;
					
					
				%>
					
					<tr class="BContent">
						<td class="number"><%=countn%>
						<td class="title"><a href="view.jsp?number='<%=number%>'"><%=title%></a>
						<td class="author"><%=author%>
						<td class="date"><%=date%>
						<td class="hit"><%=hit%>
					</tr>
				
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
			</table>
			
			<br>
			<div class="BBox">  
				<a href="write.jsp?BName=<%=Bname%>" class="writeB">글쓰기</a>
			</div>
		</div>
		<br>
		<br>
    </div>
	<!-- 게시판 출력 end -->
	
    <footer>
		<br>
		　　　　Project Team : Online Glasses<br>
		　　　　Phone  : 010-9659-9881<br>
		　　　　E-mail : clzk1588@daum.net<br><br> 
    </footer>
  </body>
</html>
