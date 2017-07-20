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
				<div class="sMiddle">
					<form action="#">
						검색 1 검색 2 검색 3
					<button type="submit" value="검색">검색</button>
					</form>
				</div>
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
