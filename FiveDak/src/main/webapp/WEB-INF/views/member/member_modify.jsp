<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /Fivedak
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">
	
	* { font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif; }
	
	span.star {
		color: #ff471a;
	}
	
	div.form_modify {
		width: 70%;
		margin: 0 auto;
	}
	
	.error {
	color: #FF490F;
	}
	
	.text-guide-sm2 {
		color: #999;
    	font-weight: normal;	
    	font-size: 10pt;
    	margin-left: 200px;
	}
	
	#inputPwd1 ,#inputPwd2  {
		padding: 3px 15px; 
		font-size: 13px; 
		height:50px;
		border-radius: 6px;
		background-color: #fff;
   		border: 1px solid #ccc;
	}
	
	input.postaddress,
	input.email {
		padding: 3px 15px; 
		font-size: 13px; 
		height:50px;
		border-radius: 6px;
		background-color: #fff;
   		border: 1px solid #ccc;
	}
	.style_basic {
		padding: 3px 15px; 
		font-size: 13px; 
		height:50px;
		border-radius: 6px;
		background-color: #fff;
   		border: 1px solid #ccc;
	}
	
	input.exampleInputphonenum {
		width: 70px;
		height: 35px;
	}
	
	button.btn_setting {
		min-width: 180px;
		padding: 10px 25px 11px;
		cursor: pointer;
		border-radius: 6px;
    	font-weight: 400;
    	height: 50px;
	}
	
	button.check{
		color:#ffffff !important; 
		border: solid 1px #cccccc; 
		font-weight:bold; 
		background-color:#FFA751;
		width:140px;
	}
	button.check_success{
		color:red !important; 
		border: solid 1px #cccccc; 
		font-weight:bold; 
		background-color:#cccccc;
		width:140px;
	}
	
	button#find_address{
		color:#ffffff !important; 
		font-weight:bold; 
		background-color:#FFA751;
	}	
		
</style>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
let email_flag = false ; // 중복확인을 통과하면 true
let pwd_flag = false ;
let id_flag = false ;

$(document).ready(function(){
	setEventHandling();
	
	
	
	
      
});

function setEventHandling(){
	// 회원 가입 페이지 로드시 조건들
	loadPage();
	
	// PWD 유효성 검사 및 비밀번호 일치 검사
	$('input#inputPwd1').on('input',pwdCheck);
	$('input#inputPwd2').on('input',pwdSame);
	
	// 이메일 유효성 검사 및 중복 검사
	$('input#inputEmail1').on('input',EmailCheck);
	$('select.email_sel').on('change',EmailCheck);
	
	$('button.emailcheck').click(emailDuplicateCheck);
	
	// 휴대폰 번호에 숫자만 입력가능
	$('input.mobile1').on('keyup',mobileCheck);
	$('input.mobile1').on('keydown',mobileCheck);
	
	$('input.mobile2').on('keyup',mobileCheck);
	$('input.mobile2').on('keydown',mobileCheck);
	
	$("button#find_address").click(addressDaum);
	
	$('#birthyy, #birthmm, #birthdd').on('change', valiDate);
 	

} // END OF FUNCTION SETEVENTHANDLING()
function loadPage(){
		

	createMonth();
	createDay();
	createYear();

}// END OF FUNCTION LOADPAGE()

//날짜 유효성 func 만들기 
function valiDate() {

    const year = $('#birthyy').val();
    const month = $('#birthmm').val();
    const day = $('#birthdd').val();
    
    const date = new Date(year, month - 1, day);
    

    if (isNaN(date.getTime())) {
   const warningMsg = year + "년 " + month + "월은 " + day + " 까지 입니다."
      $('#dateWarning').text(warningMsg);
    } else {
      $('#dateWarning').text('');
    }
}// end of valiDate

function createYear(){
	const date = new Date();
	   const year = date.getFullYear();
	   $('select#birthyy').append("<option selected disabled value=''>선택</option>")
	     for (let i = year; i >= year - 100; i--) {
	       $('select#birthyy').append($('<option>', {
	         value: i,
	         text: i
	       }));
	     }
}// END OF FUNCTION CREATEYEAR(){

function createMonth(){
	let html = "";
		html += "<option selected disabled value=''>선택</option>";
	for(let i=1; i<=12; i++) {		
		if(i<10){
			html += "<option>0"+i+"</option>";
		}
		else{
			html += "<option>"+i+"</option>";
		}
	} //end of for ----------------------------------------------
	
	$("select#birthmm").html(html);
	
	
}; // 

function createDay(){
	let html = ``;
    	html += "<option selected disabled value=''>선택</option>";
      for(let i=1; i<=31; i++) {	    	
         if(i<10) {
            html += `<option>0\${i}</option>`;
         }
         else {
            html += `<option>\${i}</option>`;
         }
      }
      $("select#birthdd").html(html);

} // 

function btnFlag(flag,id){
	if( flag ){ // 중복확인이 된 경우
		$('button.'+id).removeClass("check");
		$('button.'+id).addClass("check_success");
	}
	else{
		$('button.'+id).removeClass("check_success");
		$('button.'+id).addClass("check");	
	}	
	
} // END OF FUNCTION BTNFLAG 

function pwdCheck(e){
	const regExp= /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{6,16}$/;
	// console.log($('input#inputPwd1').val().length);
	// console.log($(e.target).val().length);
	const target_val = $(e.target).val();
	const bool = regExp.test(target_val);
	
	if ( target_val.length < 6 || target_val.length > 16  ){
		// $(e.target).parent().find("span#error_pwd").text("6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용 필수");
		$('span#error_pwd').text("6 ~ 16자 사이이어야 합니다.");
	}
	else if ( !bool ){ // 정규표현식 조건에 맞지 않는 경우
		$('span#error_pwd').text("6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용 필수");
	}
	else{
		$('span#error_pwd').text("");
	}

} // END OF FUNCTION PWDCHECK()
function pwdSame(e){
	const pwd1 = $('input#inputPwd1').val(); // 비밀번호
	const pwd2 = $(this).val(); // 비밀번호 확인 
	
	if ( pwd1 == pwd2 ){
		$('span#error_pwd_check').text("");
	}
	else{
		$('span#error_pwd_check').text("비밀번호가 일치하지 않습니다.");
	}
	
	
}// END OF FUNCTION PWDSAME()

function EmailCheck(e){
	email_flag = false ;
	btnFlag(email_flag,'emailcheck');

	if(  $('select.email_sel').val() == 'other' ){
		const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		const bool = regExp.test( $('input#inputEmail1').val() );
		
		if( !bool ){ // 이메일이 정규표현식에 위배된 경우
			$('span#error_email').text("이메일이 적합한 형식이 아닙니다.");
		}
		else{ // 이메일이 정규표현식에 위배되지않은경우
			$('span#error_email').text("");		
		}
		
	}// end of if 
	else{
		const regExp = /^(?=.{4,16})(?!.*[^a-z0-9\-_])[a-z0-9\-_]*$/
		const bool = regExp.test( $('input#inputEmail1').val() );
		
		if ( !bool ){
			$('span#error_email').text("도메인을 제외한 이메일 아이디를 정확하게 입력해주세요.");
		}
		else{
			$('span#error_email').text("");
		}
		
	}// end of else 



}// END OF FUNCTION EMAILCHECK

function emailDuplicateCheck(){
	if ($('span#error_email').text() != ""){
		alert('이메일 조건을 만족해야 중복확인이 가능합니다');
		return ;
	}

	email_flag = true ;
	btnFlag(email_flag,'emailcheck');
	
}// END OF EMAILDUPLICATECHECK

function mobileCheck(e){
	var val = $(e.target).val();
    // 숫자 이외의 값이 입력되었다면
    if (isNaN(val)) {
      // 값을 빈 문자열로 변경
      $(e.target).val('');
    }
    
    const regExp = /^[0-9]{4}$/g; 
	const bool = regExp.test(val);
	
	if ( !bool ){
		$('span#error_mobile').text("4자리 숫자만 입력이 가능합니다.");  
	}
	else{
		$('span#error_mobile').text("");
	}
	
}// END OF MOBILECHECK

function addressDaum(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr ;
            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();	

} // END OF function addressDaum(){
	
function memberEditInfo(){
	
	
	// 비밀번호 
	if( $('input#inputPwd1').val() == "" || $('input#inputPwd2').val() == ""){
		alert('비밀번호와 비밀번호 확인은 필수 입력사항입니다.');	
		return ;
	}
	
	if ( $('span#error_pwd').text() != "" || $('span#error_pwd_check').text() != ""  ){
		alert('비밀번호와 비밀번호확인은 조건에 따라 입력하셔야 합니다.');
		return ;
	}
	
	// 이메일 	
	if( $('input#inputEmail1').val() == "" ) {
		alert('이메일은 필수 입력사항입니다.');	
		return ;
	}
	
	if( !email_flag ){
		alert('이메일 중복확인을 클릭해주세요');
		return ;
	}
	
	// 주소
	// console.log($('input#postcode').val());
	if ($('input#postcode').val() == ""){
		alert('우편번호는 필수입력사항입니다.');
		return ;
	}

	// 성별 
	const genderSelect = $("#gender");
	if (!genderSelect.val()) {
		 alert("성별을 선택해주세요.");
		 return ;
	}
	// 생년월일
	const birthyySelect = $("#birthyy");
	if (!birthyySelect.val()) {
		 alert("년도를 선택해주세요.");
		 return ;
	}
	
	const birthmmSelect = $("#birthmm");
	if (!birthmmSelect.val()) {
		 alert("월을 선택해주세요.");
		 return ;
	}
	const birthddSelect = $("#birthdd");
	if (!birthddSelect.val()) {
		 alert("일을 선택해주세요.");
		 return ;
	}
	//////////////////////////////////////
	
	
	const myfrm = document.myfrm;
	myfrm.action = "MemberEditInfoEnd.dak"
	myfrm.method = "post";
	myfrm.submit();
	
}// END OF FUNCTIO GOREGISTER
		
</script>



	
	<div class="col-md-9">
		<div style="margin-left:40px;">
			<h2 style="padding-bottom: 10px; margin: 20px 0px 60px 0px; color:#333; border-bottom : solid 1px #333;">회원정보수정</h2>
			  <div class="form_modify">
			  	<fieldset class="form-group-area">
					  <div class="form-group row" >
					  	  <label class="col-3">아이디<span class="star">*</span></label>
					 	  <input type="text" class="col-9" name="userid" value="${sessionScope.loginuser.mbrId}" readonly />
					  </div>
					  <div class="form-group row" style="margin-bottom:0px;">
					  	   <label for="inputPwd1" class="col-3">비밀번호<span class="star">*</span></label>
					  	   <input type="password" id="inputPwd1" name="password" class="form-control col-9" placeholder="6 ~ 16자 영문, 숫자, 특수문자 1개 이상씩 혼용 필수">
					  		<div style="margin-left: 200px;">
					  			<span id="error_pwd" class= "error"style="font-size: 13px;"></span>
					  		</div>
					  </div>
					  <div class="form-group row" style="margin-top:10px">
					  	   <label for="inputPwd2" class="col-3">비밀번호 확인<span class="star">*</span></label>
					  	   <input type="password" id="inputPwd2" class="form-control col-9" placeholder="비밀번호 확인">
					  	   <div>
					  	   		<p class="text-guide-sm2"style="margin-bottom: 0px;">※ 6 ~ 16자 영문, 숫자, 특수문자 1개 이상씩 혼용 필수.</p>
					  	   		<p class="text-guide-sm2" style="margin-bottom: 0px;">※ 특수문자는 !, @, #, $, %, ^, &, * 만 사용 가능.</p>
					  	   </div>
					  	   <div style="margin-left: 200px;">
					  			<span id="error_pwd_check" class= "error"style="font-size: 13px;"></span>
					  	   </div>
					 	   
					  </div>
					  <div class="form-group row" >
					  	  <label class="col-3">이름<span class="star">*</span></label>
					 	  <input type="text" name="name" class="col-9" value="${sessionScope.loginuser.mbrName}" readonly/>
					 	  <div>
					  	   		<p class="text-guide-sm2"style="margin-bottom: 0px;">※ 이름은 변경이 불가합니다.</p>
					  	  </div>
					  </div>
					  <div class="form-group row">
					  	   <label class="col-3">우편번호<span class="star">*</span></label>
					  	   <input type="text" id="postcode" name="postcode" size="6" maxlength="5" class="form-control col-2" readonly style="width:100px;height:50px;border-radius: 6px;"/>
						   <%-- 우편번호 찾기 --%>
				           <button type="button" class="btn mx-3" id="find_address">우편주소 찾기</button> 
					  </div>
					  <div class="form-group row">
					  	   <label class="col-3" for="address">주소</label>
					  	   <input id="address" type="text" class="form-control col-4 postaddress" name="address" placeholder="주소" readonly /><br/>
				           <input id="detailAddress" type="text" class="form-control col-4 postaddress" name="detailAddress"  placeholder="상세주소" />	
					  </div>
					  
					  <div class="form-group row">
						  <label class="col-3" for="exampleInputphonenum1">연락처<span class="star">*</span></label>
						  <div class="form-group phonenum" style="display:flex; margin-bottom:0px;"> 
						    <input name="hp1" type="text" class="form-control col-3 exampleInputphonenum" id="exampleInputphonenum1" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
						    <input name="hp2" type="text" class="form-control col-3 exampleInputphonenum mobile1" maxlength="4" />&nbsp;-&nbsp;
						    <input name="hp3" type="text" class="form-control col-3 exampleInputphonenum mobile2" maxlength="4" />
						  </div>
						  <div><span id="error_mobile" class="error" style="font-size: 13px;"></span></div>
					  </div>
					  
					  <div class="form-group row" style="margin-bottom:0px;">
					  	  <label for="inputEmail1" class="col-3">이메일<span class="star">*</span></label>
					  	  <input name="email" type="text" class="form-control col-4 email" id="inputEmail1" aria-describedby="emailHelp" placeholder="이메일 주소">
						  	<div class="form-group col-md-3" style="margin-bottom: 0px;">
						      <select class="style_basic email_sel" onchange="EmailCheck()">
						        <option value="other" selected>직접입력</option>
						        <option value="1">naver.com</option>
						        <option value="2">hanmail.com</option>
						        <option value="3">daum.net</option>
						        <option value="4">google.com</option>
						        <option value="5">gamil.com</option>
						      </select>
						    </div>
						    <div class="form-group col-md-1" style="padding-left:0px;">
						    	<button type="button" class="btn emailcheck check" style="height: 50.22222px !important;width: 106px !important;">중복확인</button>
						    </div>
						    <div style="margin: 0px 0px 0px 190px; position:relative; top:-13px;">
				  				<span id="error_email" class="error" style="font-size: 13px;"></span>
				  			</div>
					  </div>  
					  
					  
					  <div class="form-group row" style="margin-bottom: 0px;">
						   <label class="col-3">생년월일<span class="star">*</span></label>
						   <select id="birthyy" class="style_basic col-2" name="birthyy" required/></select>
					  	   <select id="birthmm" class="style_basic col-2" name="birthmm" style="margin-left: 2%"></select>
           				   <select id="birthdd" class="style_basic col-2" name="birthdd" style="margin-left: 2%"></select>
					  </div>
					  <div style="margin: 0px 0px 0px 180px;">
					  	<span id="dateWarning" class="error" style="font-size: 13px;"></span>
					  </div>
					  
					  <div class="form-group row" style="margin-top:10px">
					  	  <label  class="col-3">성별</label>
					  	  <div >
						      <select name="gender" id="gender" class="style_basic">
						        <option value="" selected disabled>성별선택</option>
						        <option value="1">남자</option>
						        <option value="2">여자</option>
						      </select>
						 </div>
					  </div>
					  
				</fieldset>
				<div class="text-center my-5">
					<button class="btn_setting" type="reset" style="margin: 0 2px 0 0; color: #fff; background: #ccc;border: 1px solid transparent;">취소하기</button>
					<button class="btn_setting" type="button" style="background: #ff6001; color: #fff; border: 1px solid #ff6001;" onclick="memberEditInfo()">수정완료</button>
				</div>
			</div>
		</div>
	</div>