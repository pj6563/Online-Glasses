<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>검색</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/gallery.css">
  </head>
  
  <body>
	<!-- 최상단 메뉴바 start -->
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
	
	
	
	<script type="text/javascript">
	function onLoadEvent() {
		document.getElementById('boardPost').style.display = "none";
	}
	window.onload = onLoadEvent
	
function hiddenDiv(id) {
	if(id==1){
		document.getElementById('middle').style.display = "none";
		document.getElementById('boardPost').style.display = "block";
	}else {
		document.getElementById('middle').style.display = "block";
		document.getElementById('boardPost').style.display = "none";
	}
}
</script>


	
	<!-- 게시판 출력 start -->
    <div class="middle" >
    <input type="image" src="./images/list_change02.jpg" onclick="hiddenDiv(1)">
	<input type="image" src="./images/list_change01.jpg" onclick="hiddenDiv(2)">
		<!-- post roof start -->
		<div class="gallery" id="middle">
		
			<!-- DB 호출 시작 -->
			<!-- DB 호출 시작 -->
	<%
	request.setCharacterEncoding("utf-8");
	
	String id =(String)session.getAttribute("id");                       // request에서 id 파라미터를 가져온다
    
	
	String highschool= "0";
	highschool = request.getParameter("highschool");
	String universty = "0";
	highschool = request.getParameter("universty");
	
	String averageGrades = request.getParameter("averageGrades");
	String semesterGrades = request.getParameter("semesterGrades");
	String yearGrades = request.getParameter("yearGrades");
	String income = request.getParameter("income");
	
	//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());

		Connection conn = null;                                        // null로 초기화 한다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sqlurl = "jdbc:mysql://localhost:3306/lws7402?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
			String sqlid = "lws7402";                                       // 사용자 계정
			String sqlpw = "online123";                                     // 사용자 계정의 패스워드
			
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(sqlurl,sqlid,sqlpw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			String sql = ("select * from scholership where period >= ?   ");                        // sql 쿼리
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, today );
			
			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			rs.last();

			int totalRecord = rs.getRow();
			if(id == null){
				out.println(totalRecord+"개의 장학금이 검색되었습니다.</br>회원가입을 하시면 가려진 정보를 볼 수 있습니다.");
			}else{
				out.println(totalRecord+"개의 장학금이 검색되었습니다.");
			}
			rs.first();
			while(rs.next()){ 
				String name = rs.getString("name");
				String period = rs.getString("period");
				String money = rs.getString("money");
				String agency = rs.getString("agency");
				String link = rs.getString("link");
				String address = rs.getString("address");
				String result = rs.getString("result");
				String school = rs.getString("school");
				String graduation = rs.getString("graduation");
				String images = rs.getString("images");
				
				%>
						<div class="tableBox">
						<!-- post view start -->
						<table>
								<tr>
									<th class="poster" colspan="2"> <img alt="" src="./images/scalership001.jpg" class="postImg">
								</tr>
								<tr>
									<th colspan="2">| <%=name %> |<br>
								</tr>
								<tr>
									<th colspan="2"><hr>
								</tr>
								<tr>
									<th>대상자
									<td>대학생 및 고등학교
								</tr>
								<tr>
									<th>혜택
									<td><%=money %>
								</tr>
								<tr>
									<th>기간
									<td>수정중
								</tr>
							</table>
						<!-- post view end -->
						</div>   
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
		<!-- post roof end -->
    </div>
	<!-- 게시판 출력 end -->
	
	
	<!-- 게시판 출력 start -->
    <div id="boardPost">
    	<div class="bord">
			<table class="tFix">
				<tr>
					<th class="number">번호
					<th class="title">제목
					<th class="author">혜택
					<th class="date">날짜
					<th class="hit">대상자
				</tr>
				<tr>
					<th colspan="5"><hr>
				</tr>
				<!-- DB 호출 시작 -->
	<%
	request.setCharacterEncoding("utf-8");
	

		
		try{
			String sqlurl = "jdbc:mysql://localhost:3306/lws7402?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
			String sqlid = "lws7402";                                       // 사용자 계정
			String sqlpw = "online123";                                     // 사용자 계정의 패스워드
			
			Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(sqlurl,sqlid,sqlpw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
			
			String sql = ("select * from scholership where period >= ?   ");                        // sql 쿼리
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, today );
			
			rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			rs.last();

			int totalRecord = rs.getRow();
			if(id == null){
				out.println(totalRecord+"개의 장학금이 검색되었습니다.</br>회원가입을 하시면 가려진 정보를 볼 수 있습니다.");
			}else{
				out.println(totalRecord+"개의 장학금이 검색되었습니다.");
			}
			int countn = 0;
			rs.first();
			while(rs.next()){ 
				String name = rs.getString("name");
				String period = rs.getString("period");
				String money = rs.getString("money");
				String agency = rs.getString("agency");
				String link = rs.getString("link");
				String address = rs.getString("address");
				String result = rs.getString("result");
				String school = rs.getString("school");
				String graduation = rs.getString("graduation");
				String images = rs.getString("images");
				
					countn +=1;
				%>
					
					<tr >
						<td class="number"><%=countn%>
						<td class="title"><a href="view.jsp?number='<%=name%>'"><%=name%></a>
						<td class="author"><%=money%>
						<td class="date"><%=period%>
						<td class="hit">?
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
		</div>
		<br>
		<br>
    </div>
	<!-- 게시판 출력 end -->
	
	
	<br>
	<br>
	<br>

    <footer>
		<br>
		　　　　Project Team : Online Glasses<br>
		　　　　Phone  : 010-9659-9881<br>
		　　　　E-mail : clzk1588@daum.net<br><br> 
    </footer>
  </body>
</html>











