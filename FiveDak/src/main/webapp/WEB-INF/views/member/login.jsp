<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>      
<jsp:include page="../header-final.jsp"/>

<style type="text/css">
.container-login{
      /* border: solid 2px blue; */
      min-height: 700px; 
      background:#f7f7f7; 
      margin-bottom:-100px;
   }
   
   
   .login_Box {
       width: 80%;
       margin: auto auto;
       padding: 150px 150px;
       margin-left: 500px;
       background:#f7f7f7; 
   }
   
   
   .checkBox {
      display: flex;
   }
   
   
   
   .login_Intro {
      /* border: solid 1px red; */
      margin: 0 0 20px;
   }
   
   
   .login_Intro > span {
      /* border: solid 1px green; */
      display: flex;
      
   }
   
   
   .find_Info > ul > li {
      
      /* border: solid 1px blue; */
      list-style: none;
      display: flex;
   }
   
   
   .loginbtn {
      margin: 15px 0 0;
      background-color: #ff6001;
      border: none;
      border-radius: 6px;
      width: 430px;
      height: 50px;
      
      font-size: 12pt;
      color: white;
      cursor: pointer;
   }

   section.container-login > div.login_Box > fieldset {
      border: none;
   }


/* ================== 아이디/비밀번호 입력 폼 ====================================================================== */

   section.container-login > div.login_Box > fieldset > form.loginFrm > div.inputBox1 > input.input_id,
   section.container-login > div.login_Box > fieldset > form.loginFrm > div.inputBox2 > input.input_pwd {
      border: solid 1px #ccc;
      border-radius: 6px;
      padding: 3px 15px;
      width: 432px;
      height: 48px;
      
      font-size: 12pt;
      color: #ccc;
   }
   
   
   section.container-login > div.login_Box > fieldset > form.loginFrm > div.inputBox1 > input.input_id {
      margin-bottom: 10px;
   }
   
   section.container-login > div.login_Box > fieldset > form.loginFrm > div.inputBox2 > input.input_pwd {
      margin-bottom: 12px;
   }

/* ================================================================================================================*/



   .joinbtn {
      background-color: #fff;
      border: solid 1px #ccc; 
      border-radius: 6px;
      width: 430px;
      height: 50px; 
      margin-left: 15px;
      
      font-size: 12pt;
      color: #000;
      cursor: pointer;
   }
   
   
   .find_Info > ul > li > a {
      text-decoration: none;
      color: #666;
   }
   
   
   /* 아이디 찾기 / 비밀번호 찾기 */
   .find_Info > ul > li {
      display: inline-block; 
      text-decoration: none;
      font-size: 10pt;
   }
   
   
   .login_Intro > span#hello {
      margin-bottom: 20px;   
      margin-right: 10px;
   }
   
   
   .login_Box > .login_Intro > img#logo_img {
      width: 12%;
      margin-right: 20px;
   }   
   
   .login_Box > .login_Intro > span.logo_hello {
      /* border: solid 1px yellow; */
      display: inline-block;
      vertical-align: baseline;
   }
   
   
   
   .nonMbr > ul > li {
      /* border: solid 2px orange; */
      list-style: none;
      margin-left: 100pt;
   }
   
   .nonMbr > ul > li > a {
      /* border: solid 1px black; */
      text-decoration: none;
      color: #666;
   }
   
   
   img#benefit {
      width: 35%;
   }


   .auto_loginBox {
      background: #FF6001;
      border: 1px solid #FF6001;
   }


   span.on {
   margin-right: 90px;
} 



/* 체크박스 커스텀 */
.chk_box { 
   display: block; 
   position: relative; 
   padding-left: 25px; 
   margin-bottom: 10px; 
   cursor: pointer; 
   font-size: 14px; 
   -webkit-user-select: none; 
   -moz-user-select: none; 
   -ms-user-select: none; 
   user-select: none; 
}

/* 기본 체크박스 숨기기 */
.chk_box input[type="checkbox"] {
   display: none;
}

/* 선택되지 않은 체크박스 스타일 꾸미기 */
.on { 
   width: 20px; 
   height: 20px; 
   background: #ddd; 
   position: absolute; 
   top: 0; 
   left: 0; 
   border-radius: 3px;
}

/* 선택된 체크박스 스타일 꾸미기 */
.chk_box input[type="checkbox"]:checked + .on {background: #ff6001;}
.on:after { content: ""; position: absolute; display: none;  border-radius: 3px;}
.chk_box input[type="checkbox"]:checked + .on:after {display: block;}
.on:after { width: 6px; height: 10px; border: solid #fff; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; top: 2px; }


</style>

<body>


<section class="container-login">

    <div class="login_Box">
        <div class="login_Intro">
            <span id="hello" style="font-size:32pt;">안녕하세요 :)</span>
            <img id="logo_img" src="../images/5조닭조투명이미지.png">
            <span class="logo_hello" style="font-size: 15pt; font-weight: bold;">입니다.</span>
        </div>


      <fieldset>
         <form class="loginFrm">
             <div class="inputBox1">
                 <input type="text" class="input_id" placeholder="아이디" maxlength="100"/>
             </div>
             <div class="inputBox2">
                 <input type="password" class="input_pwd" placeholder="비밀번호" maxlength="100"/>
             </div>
             
             
             <div class="checkBox">
               <label for="agree" class="chk_box">
                  <input type="checkbox" id="agree" checked="checked" />
                  <span class="on"></span>
                  아이디저장
               </label>
             </div>
             
             
             <button class="loginbtn" type="submit"><span>로그인</span></button>
         </form>
      </fieldset>
   
   
      <div class="find_Info position-relative" style="left:-14px;">
          <ul style="margin-top : 20px;">
              <li class="border-right"><a href="#" style="margin-right: 35px; margin-left: 80px;">아이디 찾기</a></li>
              <li style="margin-left:30px;"><a href="#">비밀번호 찾기</a></li>
          </ul>
      </div>
   
   
      <div >
         <button class="joinbtn position-relative" style="left:-20px;" href="#"><span>회원가입</span></button>
      </div>
      
<!--  <div class="nonMbr">
         <ul>
             <li>
                <a href="#"><span>비회원주문조회</span></a>
             </li>
         </ul>
      </div> -->
      
      <img id="benefit" alt="회원가입 혜택 이미지" src="../images/로그인페이지사진.png">


   </div>
      
</section>























<jsp:include page="../footer.jsp"/>
