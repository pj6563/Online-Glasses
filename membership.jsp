<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<title>회원 가입</title>
<link rel="stylesheet" href="https://leejoin.000webhostapp.com:443/theme/noodle/css/mobile.css">
<link rel="stylesheet" href="https://leejoin.000webhostapp.com:443/theme/noodle/mobile/skin/connect/basic/style.css?ver=161020">
<link rel="stylesheet" href="https://leejoin.000webhostapp.com:443/theme/noodle/mobile/skin/member/basic/style.css?ver=161020">
<link rel="stylesheet" href="https://leejoin.000webhostapp.com:443/theme/noodle/css/bootstrap.min.css">
<link rel="stylesheet" href="https://leejoin.000webhostapp.com:443/theme/noodle/css/jquery.bxslider.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="./js/index.js" ></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "https://leejoin.000webhostapp.com:443";
var g5_bbs_url   = "https://leejoin.000webhostapp.com:443/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "1";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="https://leejoin.000webhostapp.com:443/theme/noodle/js/jquery.js"></script>
<script src="https://leejoin.000webhostapp.com:443/js/common.js"></script>
<script src="https://leejoin.000webhostapp.com:443/js/wrest.js"></script>
<script src="https://leejoin.000webhostapp.com:443/theme/noodle/js/bootstrap.min.js"></script>
<script src="https://leejoin.000webhostapp.com:443/theme/noodle/js/jquery.bxslider.min.js"></script>
<script src="https://leejoin.000webhostapp.com:443/js/modernizr.custom.70111.js"></script>
</head>
<body>

<div id="topss"></div>

<div id="wrapper">
    <div id="aside">
            </div>
    <div id="container">
        <div id="container_title">회원 가입</div>
<div class="mbskin">
    <div class="container">
        <div class="bd">
        <script src="https://leejoin.000webhostapp.com:443/js/jquery.register_form.js"></script>
            
        <form  action="membershipSer.jsp"  method="get" enctype="multipart/form-data" >
        <input type="hidden" name="w" value="">
        <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
        <input type="hidden" name="agree" value="1">
        <input type="hidden" name="agree2" value="1">
        <input type="hidden" name="cert_type" value="">
        <input type="hidden" name="cert_no" value="">
        <input type="hidden" name="mb_sex" value="">            
        <div class="tbl_frm01 tbl_wrap">
            <table>
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <th scope="row"><label for="reg_mb_id">아이디<strong class="sound_only">필수</strong></label></th>
                <td>
                    <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
  <input type="text" name="mb_id" value="" id="reg_mb_id" class="frm_input required " minlength="3" maxlength="20" required >
                    <span id="msg_mb_id"></span>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label></th>
  <td><input type="password" name="mb_password" id="reg_mb_password" class="frm_input required" minlength="3" maxlength="20" required></td>
            </tr>
            <tr>
                <th scope="row"><label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
                <td><input type="password" name="mb_password_re" id="reg_mb_password_re" class="frm_input required" minlength="3" maxlength="20" required></td>
            </tr>
            </table>
        </div>
    
        <div class="tbl_frm01 tbl_wrap">
            <table>
            <caption>개인정보 입력</caption>
            <tr>
                <th scope="row"><label for="reg_mb_name">이름<strong class="sound_only">필수</strong></label></th>
                <td>
<input type="text" id="reg_mb_name" name="mb_name" value="" required  class="frm_input required ">
                                                        </td>
            </tr>
                      
            </tr>
                
            <tr>
                <th scope="row"><label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong></label></th>
                <td>
                                        <input type="hidden" name="old_email" value="">
                    <input type="email" name="mb_email" value="" id="reg_mb_email" required class="frm_input email required" size="50" maxlength="100">
                </td>
            </tr>
    
                
                
                
                        </table>
        </div>
    
        <div class="tbl_frm01 tbl_wrap">
            <table>
            <caption>기타 개인설정</caption>
                
                
                
            <tr>
                <th scope="row"><label for="reg_mb_mailling">메일링서비스</label></th>
                <td>
                    <input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling" checked>
                    정보 메일을 받겠습니다.
                </td>
            </tr>
    
                
                        <tr>
                <th scope="row"><label for="reg_mb_open">정보공개</label></th>
                <td>
                    <span class="frm_info">
                        정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다.
                    </span>
                    <input type="hidden" name="mb_open_default" value="">
                    <input type="checkbox" name="mb_open" value="1" id="reg_mb_open" checked>
                    다른분들이 나의 정보를 볼 수 있도록 합니다.
                </td>
            </tr>
                
            
            </table>
        </div>
    
        <div class="btn_confirm">
            <input type="submit" value="회원가입" id="btn_submit" class="btn_submit" accesskey="s">
            <a href="index.jsp" class="btn_cancel">취소</a>
        </div>
        </form>
    
        <script>
        $(function() {
            $("#reg_zip_find").css("display", "inline-block");
    
                                });
    
        // 인증체크
        function cert_confirm()
        {
            var val = document.fregisterform.cert_type.value;
            var type;
    
            switch(val) {
                case "ipin":
                    type = "아이핀";
                    break;
                case "hp":
                    type = "휴대폰";
                    break;
                default:
                    return true;
            }
    
            if(confirm("이미 "+type+"으로 본인확인을 완료하셨습니다.\n\n이전 인증을 취소하고 다시 인증하시겠습니까?"))
                return true;
            else
                return false;
        }
    
        // submit 최종 폼체크
        function fregisterform_submit(f)
        {
            // 회원아이디 검사
            if (f.w.value == "") {
                var msg = reg_mb_id_check();
                if (msg) {
                    alert(msg);
                    f.mb_id.select();
                    return false;
                }
            }
    
            if (f.w.value == '') {
                if (f.mb_password.value.length < 3) {
                    alert('비밀번호를 3글자 이상 입력하십시오.');
                    f.mb_password.focus();
                    return false;
                }
            }
    
            if (f.mb_password.value != f.mb_password_re.value) {
                alert('비밀번호가 같지 않습니다.');
                f.mb_password_re.focus();
                return false;
            }
    
            if (f.mb_password.value.length > 0) {
                if (f.mb_password_re.value.length < 3) {
                    alert('비밀번호를 3글자 이상 입력하십시오.');
                    f.mb_password_re.focus();
                    return false;
                }
            }
    
            // 이름 검사
            if (f.w.value=='') {
                if (f.mb_name.value.length < 1) {
                    alert('이름을 입력하십시오.');
                    f.mb_name.focus();
                    return false;
                }
            }
    
              
    
            // E-mail 검사
            if ((f.w.value == "") || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
                var msg = reg_mb_email_check();
                if (msg) {
                    alert(msg);
                    f.reg_mb_email.select();
                    return false;
                }
            }
    
                
            if (typeof f.mb_icon != 'undefined') {
                if (f.mb_icon.value) {
                    if (!f.mb_icon.value.toLowerCase().match(/.(gif)$/i)) {
                        alert('회원아이콘이 gif 파일이 아닙니다.');
                        f.mb_icon.focus();
                        return false;
                    }
                }
            }
    
            if (typeof(f.mb_recommend) != 'undefined' && f.mb_recommend.value) {
                if (f.mb_id.value == f.mb_recommend.value) {
                    alert('본인을 추천할 수 없습니다.');
                    f.mb_recommend.focus();
                    return false;
                }
    
                var msg = reg_mb_recommend_check();
                if (msg) {
                    alert(msg);
                    f.mb_recommend.select();
                    return false;
                }
            }
    
            if (!chk_captcha()) return false;
    
            document.getElementById("btn_submit").disabled = "disabled";
    
            return true;
        }
        </script>
        </div>
    </div>
</div>    </div>
</div>
<div id="bottomss"></div>
</body>
</html>
