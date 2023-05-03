<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
    
<!-- Optional JavaScript -->
<script src="<%=ctxPath%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<!-- Font Awesome 6 Icons --> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!-- 글꼴 적용하기 -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

 
 
<style type="text/css">

	* {
		    overflow: hidden;
	
	}
	/* 모달 내용 스타일 */
	.approval-modal-content {
	  background-color: #fff;
	  margin: 5% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	  display: block;
	}
	
	/* 모달 닫기 버튼 스타일 */
	.approval-modal-close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.approval-modal-close:hover,
	.approval-modal-close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.card-body {
		height: 380px;
		overflow: scroll;
	}



</style> 
    

<script type="text/javascript">

	$(document).ready(function(){
	    
		setEventHandling();
		
		
	});	// END OF $(DOCUMENT).READY(FUNCTION(){
		
	function setEventHandling() {
		
		  // 모달 닫기 버튼 클릭 이벤트
		  const closeButtons = $(".approval-modal-close");			 // 모달 버튼 누를시 (어떤 것인지 설정 )

		  closeButtons.on("click", function () {
		    const modal = $("#provision3-modal", parent.document);     // approval-modal인 요소를 찾아 반환
			modal.css("display", "none");
		    
		    // 모달이 사라질 때 z-index 값을 초기값으로 되돌림
		    const navbar = $(".sticky-top", parent.document);
		    navbar.css("z-index", 1);
		    navbar.css("position", "sticky");
		    navbar.css("background-color", "#fff");
		    
		    modal.css("z-index", 0);
		  });
	}
	


</script>    
		
		
		
<div style="margin: 30px;">
		
	<span class="approval-modal-close">&times;</span>    <!--  &times; 는 X 표 -->
	<h2>결제대행서비스 이용 동의</h2>
</div>	        
		

				    
   
   <div class="container">
	<div class="row">
		
	
		<div style="border: solid 1px #666666;"></div>
		
		
		<div class="accordion col-12" id="accordionExample">		<!-- 아이디 값이 중요하다. -->
		   <div class="card">
		      <div class="card-header" id="headingOne">
		        <h2 class="mb-0">
		          <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		            개인정보 수집 · 이용 동의
		          </button>
		        </h2>
		      </div>
		
		      <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
		         <!-- .collapse show 는 맨 처음에는  내용물을 보여주도록 하는 것임. -->
		         <div class="card-body">
		           <div class="accordion-con" style="display: block;"><b>개인정보 수집· 이용 목적</b><br>
						상품 구매 및 상품 배송<br>
						<br>
						<b>개인정보 수집 항목</b><br>
						주문 정보 : 이름, 휴대전화, 이메일<br>
						배송 정보 : 이름, 주소, 휴대전화<br>
						<br>
						<b>개인정보 보유 및 이용 기간</b><br>
						이용자의 개인정보는 "자. 개인정보 파기절차 및 방법"의 기준으로 탈퇴요청 후 개인정보 수집 및 이용목적이 달성되면 지체없이 파기 합니다. 다만, 통신비밀보호법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br>
						- (전자상거래법) 계약 또는 청약철회 등에 관한 기록 : 5년<br>
						- (전자상거래법) 대금결제 및 재화등의 공급에 관한 기록 : 5년<br>
						- (전자상거래법) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
						- (통신비밀보호법) 로그인 기록(로그기록, 접속지의 추적자료) : 3개월<br>
						<br>
						회원에서 탈퇴한 후 회원 재가입, 임의해지 등을 반복적으로 행하여 회사가 제공하는 할인쿠폰, 이벤트 혜택 등으로 경제상의 이익을 취하거나 이 과정에서 명의를 무단으로 사용하는 편법과 불법행위를 하는 회원을 차단 하고자 회원 탈퇴 후 90일 동안 보관합니다 - 부정이용기록에 대한 기록 : 1년<br>
						<br>
						<b>※ 이용자(정보주체자)는 개인정보 수집 및 이용 동의를 거부할 권리가 있습니다. 단, 개인정보 수집 및 이용 동의 거부 시 서비스 이용제 제약이 있을 수 있습니다.</b></div>
			      </div>
			   </div>
		   
			</div>
		</div>
	</div>
</div>	

