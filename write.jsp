<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>글쓰기</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./js/index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/write.css">
  </head>
  
  <body>
	<!-- 최상단 메뉴바 start -->
    <div id="top">
    </div>
    <!-- 최상단 메뉴바 end -->
	
	<!-- 게시판 출력 start -->
    <div class="middle">
    	<div class="bord">
			<table>
				<!-- DB 호출 시작 -->
				  <%
				request.setCharacterEncoding("utf-8");
				String number = request.getParameter("number");
				
				
						
				//리퀘스트로 위에 넘긴 Get방식의 파라미터명을 써서 내용을 받는다.
				if (number != null && number != "0" ) {
								
					Connection conn = null;                                        // null로 초기화 한다.
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try{
						String url = "jdbc:mysql://localhost:3306/og?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
						String id = "root";                                                    // 사용자 계정
						String pw = "1234";                                                // 사용자 계정의 패스워드
						
						Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
						conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
						
						String sql = ("select * from bord where number="+number+" ");                        // sql 쿼리
						pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
						
						
						rs = pstmt.executeQuery();                                        // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
						while(rs.next()){ 
							String title = rs.getString("title");
							String content = rs.getString("content");
							String bord_name = rs.getString("bord_name");
						%>
						    
						 	<form action = "writeSer.jsp" accept-charset="utf-8" name = "coment" method = "get">
									<tr>
										<th >제목<br>　
										<td >
											<input name="title" type="text"  maxlength="20" value="<%=title%>"><br>
										</td>
									</tr>
									
									<tr>
										<th>내용
										<td >
											<textarea name="contnet" rows="10" cols="100%" ><%=content%></textarea>
										</td>
									</tr>
									<tr>
										<th></th>
										<td class="B">
											<a href="javascript:history.back()">
												<a href="javascript:history.back()" class="writeB" type="submit">취소</a>
											</a>
											<input type="submit" value="수정" class="writeB">
										</td>
									</tr>
								<input name="BName" type="hidden" value="<%=bord_name%>">
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
				}else{%>
					<form action = "writeSer.jsp?id=id&prioriy=1&BName=notic&authority=1" accept-charset="utf-8" name = "coment" method = "get">
					<tr>
						<th >제목<br>　
						<td >
							<input name="title" type="text"  maxlength="20" value="" class="left"><br>　
						</td>
					</tr>
					<tr>
						<th>내용
						<td >
							<textarea name="contnet" rows="10" cols="100%" class="left"></textarea>
						</td>
					</tr>
					<tr>
						<th></th>
						<td class="B">
							<a href="javascript:history.back()">
								<a href="javascript:history.back()" class="writeB" type="submit">취소</a>
							</a>
							<input type="submit" value="완료" class="writeB">
						</td>
					</tr>
			<%
			request.setCharacterEncoding("utf-8");
			String BName = request.getParameter("BName"); %>
			<input name="BName" type="hidden" value="<%=BName%>">
		</table>
		  </form>					
		<% }%>
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
