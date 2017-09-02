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
    <script type="text/javascript" src="./js/index.js" ></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/search.css">
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
    <div class="middle" >
    
    	<!-- form start -->
    	<form action="searchSer.jsp" method="post" enctype="multipart/form-data" >
    	
    	<div class="bordName">
    		| 맞춤장학 
    	</div>
    	
    	<!-- 게시판 left print start -->
    	<div class="bordLeft">
    	
    		<!-- education information input box start -->
    		<div class="education">
    			<table>
    				<tr>
    					<td class="boxName" colspan="4">학력사항
    				</tr>
    				<tr>
    					<td class="title">고등학교
    					<td class="width80"  colspan="1"><input type="text" placeholder="학교명입력" class="width100" name="highschool" >
    					<td class="title" >학년
    					<td class="selectBox">
    						<select name="highschoolG">
    							<option >1</option>
    							<option>2</option>
    							<option>3</option>
    							<option selected>졸업</option>
    						</select>
    				</tr>
    				<tr>
    					<td class="title">대학교
    					<td class="width80" colspan="1"><input type="text" placeholder="학교명입력" class="width100" name="universty" >
    					<td class="title">학년
    					<td class="selectBox" >
    						<select name="universtyG">
    							<option >1</option>
    							<option>2</option>
    							<option>3</option>
    							<option>4</option>
    						</select>
    				</tr>
    				<tr>
    					<td colspan="4">
    					<table class="notTable">
    						<tr>
    							<td class="title">평균&nbsp;&nbsp;&nbsp;학점
		    					<td >
		    						<input type="radio" id="a1" name="averageGrades" value="45" class="grades">
		    						<label for='a1'>~2.0</label>
		    					<td >
		    						<input type="radio" id="a2" name="averageGrades" value="25" class="grades">
		    						<label  for='a2'>~2.5</label>
		    					<td >
		    						<input type="radio" id="a3" name="averageGrades" value="30" class="grades">
		    						<label  for='a3'>~3.0</label>
		    					<td >
		    						<input type="radio" id="a4" name="averageGrades" value="35" class="grades">
		    						<label for='a4'>~3.5</label>
		    					<td  >
		    						<input type="radio" id="a5" name="averageGrades" value="40" class="grades">
		    						<label for='a5'>~4.0</label>
		    					<td  >
		    						<input type="radio" id="a6" name="averageGrades" value="20" class="grades">
		    						<label for='a6'>~4.5</label>
	    					</tr>
    						<tr>
    							<td class="title">전학기학점
		    					<td >
		    						<input type="radio" id="s1" name="semesterGrades" value="45" class="grades">
		    						<label for='s1'>~2.0</label>
		    					<td >
		    						<input type="radio" id="s2" name="semesterGrades" value="25" class="grades">
		    						<label  for='s2'>~2.5</label>
		    					<td >
		    						<input type="radio" id="s3" name="semesterGrades" value="30" class="grades">
		    						<label  for='s3'>~3.0</label>
		    					<td >
		    						<input type="radio" id="s4" name="semesterGrades" value="35" class="grades">
		    						<label for='s4'>~3.5</label>
		    					<td  >
		    						<input type="radio" id="s5" name="semesterGrades" value="40" class="grades">
		    						<label for='s5'>~4.0</label>
		    					<td  >
		    						<input type="radio" id="s6" name="semesterGrades" value="20" class="grades">
		    						<label for='s6'>~4.5</label>
	    					</tr>
    						<tr  >
    							<td class="title" >전년도학점
		    					<td class="paddingTB5">
		    						<input type="radio" id="y1" name="yearGrades" value="45" class="grades">
		    						<label for='y1'>~2.0</label>
		    					<td class="paddingTB5">
		    						<input type="radio" id="y2" name="yearGrades" value="25" class="grades">
		    						<label  for='y2'>~2.5</label>
		    					<td class="paddingTB5">
		    						<input type="radio" id="y3" name="yearGrades" value="30" class="grades">
		    						<label  for='y3'>~3.0</label>
		    					<td class="paddingTB5">
		    						<input type="radio" id="y4" name="yearGrades" value="35" class="grades">
		    						<label for='y4'>~3.5</label>
		    					<td  class="paddingTB5">
		    						<input type="radio" id="y5" name="yearGrades" value="40" class="grades">
		    						<label for='y5'>~4.0</label>
		    					<td  class="paddingTB5">
		    						<input type="radio" id="y6" name="yearGrades" value="20" class="grades">
		    						<label for='y6'>~4.5</label>
		    						
	    					</tr>
    					</table>
    				</tr>
    			</table>
    		</div>
    		<!-- education information input box end -->
    		
    		<!-- place information input box start -->
    		<div class="area">
    			<table>
    				<tr>
    					<td class="boxName" colspan="">학력사항
    				</tr>
    				<tr>
    					<td class="padding5055">
    						<!-- daum 주소 DB  start-->
	    					<input style="width: 34%;" type="text" id="sample3_postcode" placeholder="우편번호"> -&nbsp; <input type="button" onclick="sample3_execDaumPostcode()" value="주소 찾기"  class="movingB">
							<br>
							
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
							<input type="text" id="sample3_address" class="d_form large" placeholder="주소" style="width: 50%;">
							
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
							    // 우편번호 찾기 찾기 화면을 넣을 element
							    var element_wrap = document.getElementById('wrap');
							
							    function foldDaumPostcode() {
							        // iframe을 넣은 element를 안보이게 한다.
							        element_wrap.style.display = 'none';
							    }
							
							    function sample3_execDaumPostcode() {
							        // 현재 scroll 위치를 저장해놓는다.
							        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var fullAddr = data.address; // 최종 주소 변수
							                var extraAddr = ''; // 조합형 주소 변수
							
							                // 기본 주소가 도로명 타입일때 조합한다.
							                if(data.addressType === 'R'){
							                    //법정동명이 있을 경우 추가한다.
							                    if(data.bname !== ''){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있을 경우 추가한다.
							                    if(data.buildingName !== ''){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
							                document.getElementById('sample3_address').value = fullAddr;
							
							                // iframe을 넣은 element를 안보이게 한다.
							                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							                element_wrap.style.display = 'none';
							
							                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							                document.body.scrollTop = currentScroll;
							            },
							            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
							            onresize : function(size) {
							                element_wrap.style.height = size.height+'px';
							            },
							            width : '100%',
							            height : '100%'
							        }).embed(element_wrap);
							
							        // iframe을 넣은 element를 보이게 한다.
							        element_wrap.style.display = 'block';
							    }
							</script>
							<!-- daum 주소 DB end-->
						</td>
    				</tr>
    			</table>
    		</div>
    		<!-- place information input box end -->
    		
    		<!-- income information input box start -->
    		<div class="education">
    			<table>
    				<tr>
    					<td class="boxName" colspan="3">소득구간(분위)
    					
    				</tr>
    				<tr>
    					<td class="title">소득구간(분위)
    					<td>
    						<select name="income">
    							<option value="1">1</option>
    							<option value="1">2</option>
    							<option value="1">3</option>
    							<option value="1">4</option>
    							<option value="1">5</option>
    							<option value="1">6</option>
    							<option value="1">7</option>
    							<option value="1">8</option>
    							<option value="1">9</option>
    							<option value="1">10</option>
    							<option selected="selected"  value="0">모름</option>
    						</select>
    						<td>※나의 소득구간(분위)는? <a href="http://www.kosaf.go.kr/ko/main.do"><button class="movingB">조회</button></a>
    				</tr>
    				<tr>
    					<td>
    					<td  rowspan="2" colspan="2"  class="paddingTB5">&nbsp;
    						<a>기초수급자</a>&nbsp;
    						<a>기초수급자</a>&nbsp;
    						<a>기초수급자</a>&nbsp;
    						<a>기초수급자</a>&nbsp;
    						<a>기초수급자</a>&nbsp;
    				</tr>
    				<tr>
    					<td>
    				</tr>
    			</table>
    		</div>
    		<!-- income information input box end -->
    		
		</div>
		<!-- 게시판 left print end -->
		
		<!-- 게시판 rite print start -->
		<div class="bordRite">
			<table>
    			<tr>
    				<td class="riteBoxName" colspan="">나의 입력 정보
    			</tr>
    			<tr>
	    			<td class="height30" >
	    				
	    				자바스크립트로 DB 자료 불러와지면 엑션 아니면 NO ㅋㅋ
	    				
	    			</td>
    			</tr>    			
    		</table>
	    	<input type="submit" value=일시저장 class="left">
	    	<input type="submit" value="맞춤 장학금 검색" class="rite">

		</div>
		<!-- 게시판 left print end -->
		
		</form>
		<!-- form end -->
		
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
