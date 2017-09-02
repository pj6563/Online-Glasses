<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>청춘장학사</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/index.css">
</head>
<body>
<header>
      <nav class='navbar navbar-default'>
        <div class="container-fluid">
          <div class="navbar-header">
            <a class='navbar-brand' href="./index.html">
              <img src="../images/logo.jpg" alt="">
              <!-- <img src="./images/logo.jpg" alt=""> -->
            </a>
            <button type="button" class='navbar-toggle collapsed' data-toggle='collapse' data-target='#hamburgerMenu'>
              <span class='icon-bar'></span>
              <span class='icon-bar'></span>
              <span class='icon-bar'></span>
            </button>
          </div>

          <div class="collapse navbar-collapse" id="hamburgerMenu">
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
                <%
                  // 세션에 저장한 id 얻어옴
                  String loginId = (String)session.getAttribute("id");
                %>
                <%
                  //세션에 저장된 id가 없다면 '로그인' 출력
                  if(loginId == null) {
                %>
                <a href="login.jsp">
                  로그인
                </a>
                <%
                  //세션에 저장된 id가 있다면 '로그아웃' 출력
                  } else {
                %>
                  <%= loginId %>님, 반갑습니다
                  <a href="myPage.jsp">
                    마이페이지
                  </a>
                  <a href="logout.jsp">
                    로그아웃
                  </a>
                <% } %>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <div class="middle">
      <div class="m_img1">
        <a href="search.jsp">
          <img src="../images/indexCenterUp.jpg" alt="">
        </a>
       </div>
      <div class="m_img2">
      	<h1>414</h1>
        <a href="loding.html">
            <img src="../images/indexCenterDown.jpg" alt="">
        </a>
      </div>
    </div>

    <footer>
		<br>
		　　　　Project Team : Online Glasses<br>
		　　　　Phone  : 010-9659-9881<br>
		　　　　E-mail : clzk1588@daum.net<br><br>
    </footer>
  </body>
</html>

</body>
</html>