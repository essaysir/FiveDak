<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../header-final.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />
<title>비밀번호 변경</title>
<style type="text/css"> 

	.box_pwdChange { border:1px solid #e4e4e4; width:930px; margin:0 auto; background:#fbfbfb; padding: 65px 0 85px 0; box-sizing: border-box; font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif; }
	.box_pwdChange .password_title {width:667px; height:128px; margin:80px auto 30px auto;}        
    .box_pwdChange .password_txt {font-size:13px; color:#666; width:360px; padding:5px 0 45px 0px; margin:0 auto;}


    .box_pwdChange .password_title1 {font-size: 36px; color:#333; line-height: 160%; font-weight: 600; padding-bottom: 13px; letter-spacing: -0.05em; text-align: center;}
    .box_pwdChange .password_title1 span {color:#ff7E32;}
    .box_pwdChange .password_title2 {font-size: 14px; color:#333; line-height: 140%; padding-bottom: 10px; text-align: center; font-weight: 500;}
    .box_pwdChange .password_box {width:384px; margin:35px auto 10px auto;}


    .box_pwdChange .input-box {position:relative; margin:10px 0; background: #fff; }
    .box_pwdChange .input-box > input{ background:transparent; border:none; border: solid 1px #ccc; padding:27px 0px 7px 5px; font-size:14pt; width:100%;  display: block; border-radius: 3px;}
      
    .box_pwdChange .input-box > input:placeholder-shown + label{ color:#555; font-size:19px; top:20px;  left: 13px;  font-weight: 400;  }
    .box_pwdChange .input-box > input::placeholder{ color:transparent; }
    .box_pwdChange .input-box > input:-ms-input-placeholder {color:transparent; }
    .box_pwdChange .input-box > input:focus + label, label{ color:#333; font-size:11pt; pointer-events: none; position: absolute; left: 5px; top:5px; transition: all 0.2s ease ; -ms-transition: all 0.2s ease; -webkit-transition: all 0.2s ease; -moz-transition: all 0.2s ease; -o-transition: all 0.2s ease; }
    .box_pwdChange .input-box > input:focus, input:not(:placeholder-shown){ border-bottom: solid 1px #ccc; outline:none; }


    .wrap_button {width:384px; margin:0 auto;}
    .box_pwdChange .password_button1 {width:187px; margin-right:2px; box-sizing: border-box; display: inline-block; *zoom: 1; *display: inline; vertical-align: middle; border: 1px solid; border-color: #999; text-align: center; overflow: hidden; text-decoration: none!important; cursor: pointer; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background-color: #fff;}
    .box_pwdChange .password_button1 a.password_button_gray {color:#555; width:187px; padding:13px 20px 14px 20px; box-sizing: border-box; display: block; font-size: 15px; font-weight: bold;} 

    .password_button1 a:link {text-decoration: none!important;}
    .password_button1 a:hover {text-decoration: none!important; background: #fafafa!important; width:187px; padding:13px 20px 14px 20px; }

    .box_pwdChange .password_button2 {width:187px; box-sizing: border-box; display: inline-block; *zoom: 1; *display: inline; vertical-align: middle; border: 1px solid; border-color: #c82370; text-align: center; overflow: hidden; text-decoration: none!important; cursor: pointer; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background-color: #ff7E32;}
    .box_pwdChange .password_button2 a.password_button_orange {color:#fff; width:187px; padding:13px 20px 14px 20px; box-sizing: border-box; display: block; font-size: 15px; font-weight: bold;} 

    .password_button2 a:link {text-decoration: none!important;}
	.password_button2 a:hover {text-decoration: none!important; background: #ff7232!important; width:187px; padding:13px 20px 14px 20px; }
</style>

</head>
<body>

<script type="text/javascript">
    var $j = jQuery.noConflict();
    var baseParamz = 'printType=1&strvalue2=goldgudtjr&strvalue3=1997-04-18&strvalue4=%ea%b9%80%ed%98%95%ec%84%9d';
    var req = 0;
    var resultCode = "0";
    var json = {};

    $j(function () {
        $j('#newpassword').blur(function () {
            var query = $j('#newpassword').val();

            if (!query || query.length == 0) {
                resultCode = "0";
                alert("비밀번호를 입력해 주세요");
                return;
            }

            if (query.length < 6) {
                resultCode = "0";
                alert("비밀번호는 6글자 이상이어야 합니다.");
                return;
            }

            var paramz = 'cmd=check&id=password&' + baseParamz + '&strvalue=' + encodeURIComponent(query);

            req = $j.ajax({
                type: "GET",
                url: "/account/wjoin_check.aspx?" + paramz,
                // dataType: "json",
                cache: false,
                timeout: 5000,
                beforeSend: function (xhr) { },
                complete: function (xhr, status) { },
                success: function (jsonStr) {
                    jsonStr = jsonStr.replace(/\'/g, "\"");
                    json = $j.parseJSON(jsonStr);

                    if (json.ResultMsgDetail != '') {
                        alert(json.ResultMsgDetail.replace(/<br\/>/g, "\r\n").replace("-", "").replace(" ", ""));
                    }

                    if (json.ResultCode != '') {
                        resultCode = json.ResultCode;
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    
                }
            });
        });
    });

    function submitChangePassword() {

        if (resultCode != "1") {
            //$j('#newpassword').focus();
            return;
        }
        if (document.frmPw.newpassword.value == "") {
            alert("새 비밀번호를 넣어주세요.");
            document.frmPw.newpassword.focus();
            return false;
        }
        if (document.frmPw.newpassword.value.length < 6) {
            alert("새 비밀번호가 6자리 이상이어야 합니다.");
            document.frmPw.newpassword.focus();
            return false;
        }
        if (document.frmPw.chknewpassword.value != document.frmPw.newpassword.value) {
            alert("비밀번호가 서로 일치하지 않습니다. 다시 입력해주세요.");
            document.frmPw.chknewpassword.focus();
            return false;
        }        

        document.frmPw.submit();
    }

    function pwdExpiredUpdate(isChanged) {
        document.frmPw.isChanged.value = isChanged;
        document.frmPw.submit();
    }
</script>

<form id="pwdChangeForm" method="post">
    <input type="hidden" name="">
    
        <!-- PC 비밀 번호 변경 -->    
        <div class="box_pwdChange">
            <div class="password_title1">이용자의 <span>비밀번호</span>를 변경해주세요.</div>
            <div class="password_title2">이용자의 소중한 개인정보를 보호하기 위해 비밀번호 변경을 주기적으로 안내 드리고 있습니다.<br>안전한 서비스 이용을 위해 새로운 비밀번호로 변경해주세요.</div>   

            <div class="password_box">
                <div class="input-box"> <input type="password" id="newpassword" name="newpassword" placeholder="새 비밀번호를 입력하세요"> <label for="newpassword">새 비밀번호</label> </div>
                
                <div class="input-box"> <input type="password" id="chknewpassword" name="chknewpassword" placeholder="새 비밀번호를 한번 더 입력하세요"> <label for="chknewpassword">새 비밀번호 확인</label> </div>
            </div>
    
            <div class="password_txt">비밀번호는 영문자, 숫자, 특수문자를 3가지 이상 사용하여 <br> 8자 이상, 16자 이하로 설정해주세요.</div>

            <div class="wrap_button">
                <div class="password_button1"><a href="" class="password_button_gray" onclick="">3개월 후 변경하기</a></div>
                <div class="password_button2"><a href="" class="password_button_orange" onclick="">비밀번호 변경하기</a></div>
            </div>    
        </div>
        <!-- PC 비밀 번호 변경 end --> 
</form>
</body>
</html>

<jsp:include page="../footer.jsp" />