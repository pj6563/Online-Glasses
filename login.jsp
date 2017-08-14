<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="index.js" ></script>
	<link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

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
                <a href="notic.jsp?Bname='scholaship'">
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
	    	<form action="loginSer.jsp" method="get">
				<table class="setTable">
					<tr>
						<th class="iName">ID
						<th><input name="id" type="text" >
						<th class="loginB" rowspan="2">
								<a href="write.jsp" onclick="document.forms[0].submit();return false;" class="writeB">로그인</a>
						</th>
					</tr>
					
					<tr>
						<th class="iName">PW
						<th><input name="pw" type="password" >
					</tr>
					<tr>
						<th class="tB" colspan="3">
							<img alt="" src="">
						<a href="write.jsp" class="insteaLogin">
							<img alt="" src="./images/kakaologin.png">
						</a>
						<a href="write.jsp" class="insteaLogin">
							<img alt="" src="./images/naverlogin.png">
						</a>
					</tr>
				</table>
			</form>
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
