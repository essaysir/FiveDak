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
		    const modal = $("#provision1-modal", parent.document);     // approval-modal인 요소를 찾아 반환 (부모창에)
			modal.css("display", "none");								// modal 창 css 를 건든다/
		    
		    // 모달이 사라질 때 z-index 값을 초기값으로 되돌림
		    const navbar = $(".sticky-top", parent.document);		// 클래스 .sticky-top 인 요소를 찾아 반환 (부모창에)
		    navbar.css("z-index", 1);								// z-index는 우선순위를 두는 코드이므로 네비게이션 바를 1로 두고 모달창을 0으로 둔다/
		    navbar.css("position", "sticky");						// 모달창을 키면서 네비게이션 바의 위치가 고정되어 있지 않았지만 네비게이션 바를 고정 시키기 위해 넣었다.
		    navbar.css("background-color", "#fff");					
		    
		    modal.css("z-index", 0);
		  });
	}
	


</script>    
		
		<div style="margin: 30px;">
		
			<span class="approval-modal-close">&times;</span>    <!--  &times; 는 X 표 -->
			<h2>처리위탁 및 3자 제공 동의</h2>
		</div>	        
		
		
		
		<div class="container">
		<div class="row">
		
			<div style="border: solid 1px #666666;"></div>
		
		
		
		<div class="accordion col-12" id="accordionExample" style="overflow-anchor: none;">		<!-- 아이디 값이 중요하다. -->
		 <div class="card">
		    <div class="card-header" id="headingOne">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          개인정보 제 3자 제공 동의
		        </button>
		      </h2>
		    </div>
		
		    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
		       <!-- .collapse show 는 맨 처음에는  내용물을 보여주도록 하는 것임. -->
		       <div class="card-body">
		         <div class="accordion-con" style="display: block;">[개인정보 제3자 제공]<br>
				<br>
				가. 회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
				<br>
				① 이용자들이 사전에 동의한 경우<br>
				<br>
				② 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독당국의 요구가 있는 경우<br>
				<br>
				나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통 및 배송 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.<br>
				<br>
				다. 그 밖에 개인정보 제3자 제공이 필요한 경우에는 이용자의 동의를 얻는 등 합당한 절차를 통하여 제3자에게 개인정보를 제공할 수 있습니다.<br>
				<br>
				라. 회사는 이용자들의 거래의 이행을 위하여 아래와 같이 개인정보를 공유할 수 있습니다.<br>
				<br>
				공유받는 자 : 입점업체 <a href="javascript:void(0);" onclick="gfn_storeCompanyPop();">[전체보기]</a><br>
				<br>
				공유하는 항목 :<br>
				<br>
				1) 구매자정보(구매자id, 구매자명, 구매자주소, 구매자전화번호, 구매자휴대전화번호)<br>
				<br>
				2) 상품 구매, 취소, 반품, 교환정보<br>
				<br>
				3) 수령인정보(수령인명, 휴대폰번호, 전화번호, 수령인주소)<br>
				<br>
				4) 송장정보<br>
				<br>
				공유받는자의 이용목적 :<br>
				<br>
				상품(서비스) 배송(전송), 반품, 교환, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매) 계약의 이행을 위해 필요한 업무의 처리<br>
				<br>
				보유 및 이용기간 :<br>
				<br>
				서비스 제공기간 (관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유 기간)<br>
				<br>
				[수집한 개인정보의 위탁]<br>
				<br>
				가. 회사는 원활한 서비스를 위해여 개인정보 취급을 타인에게 위탁할 수 있습니다.<br>
				<br>
				나. 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>
				<br>
				다. 회사의 이용자의 개인정보 위탁 처리 시 수탁업체 및 위탁 목적은 아래와 같습니다.<br>
				<br>
				① 수탁업체 : 토스페이먼츠 주식회사, LG CNS, (주)케이지이니시스, NHN한국사이버결제 주식회사, NICE페이먼츠 주식회사, 엔에치엔페이코㈜, ㈜비바리퍼블리카, 주식회사 카카오페이<br>
				<br>
				위탁업무 내용 :　신용카드/계좌이체/가상계좌/무통장 결제처리, 에스크로, 현금영수증<br>
				<br>
				② 수탁업체 : 배송업체 <a href="javascript:void(0);" onclick="gfn_deliveryCompanyPop();">[전체보기]</a><br>
				<br>
				위탁업무 내용 : 상품(서비스) 배송(전송), 반품교환수거 서비스<br>
				<br>
				③ 수탁업체 : (주)다날, 페이레터(주)<br>
				<br>
				위탁업무 내용 :　휴대폰 결제 처리</div>
		       </div>
		    </div>
		 </div>
		 
		 <div class="card">
		    <div class="card-header" id="headingThree">
		      <h2 class="mb-0">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          처리위탁 제공 동의
		        </button>
		      </h2>
		    </div>
		    
		    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
		       <div class="card-body">
		          <div class="accordion-con" style="display: block;">[개인정보 제3자 제공]<br>
				<br>
				가. 회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
				<br>
				① 이용자들이 사전에 동의한 경우<br>
				<br>
				② 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독당국의 요구가 있는 경우<br>
				<br>
				나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통 및 배송 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.<br>
				<br>
				다. 그 밖에 개인정보 제3자 제공이 필요한 경우에는 이용자의 동의를 얻는 등 합당한 절차를 통하여 제3자에게 개인정보를 제공할 수 있습니다.<br>
				<br>
				라. 회사는 이용자들의 거래의 이행을 위하여 아래와 같이 개인정보를 공유할 수 있습니다.<br>
				<br>
				공유받는 자 : 입점업체 <a href="javascript:void(0);" onclick="gfn_storeCompanyPop();">[전체보기]</a><br>
				<br>
				공유하는 항목 :<br>
				<br>
				1) 구매자정보(구매자id, 구매자명, 구매자주소, 구매자전화번호, 구매자휴대전화번호)<br>
				<br>
				2) 상품 구매, 취소, 반품, 교환정보<br>
				<br>
				3) 수령인정보(수령인명, 휴대폰번호, 전화번호, 수령인주소)<br>
				<br>
				4) 송장정보<br>
				<br>
				공유받는자의 이용목적 :<br>
				<br>
				상품(서비스) 배송(전송), 반품, 교환, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매) 계약의 이행을 위해 필요한 업무의 처리<br>
				<br>
				보유 및 이용기간 :<br>
				<br>
				서비스 제공기간 (관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유 기간)<br>
				<br>
				[수집한 개인정보의 위탁]<br>
				<br>
				가. 회사는 원활한 서비스를 위해여 개인정보 취급을 타인에게 위탁할 수 있습니다.<br>
				<br>
				나. 회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>
				<br>
				다. 회사의 이용자의 개인정보 위탁 처리 시 수탁업체 및 위탁 목적은 아래와 같습니다.<br>
				<br>
				① 수탁업체 : 토스페이먼츠 주식회사, LG CNS, (주)케이지이니시스, NHN한국사이버결제 주식회사, NICE페이먼츠 주식회사, 엔에치엔페이코㈜, ㈜비바리퍼블리카, 주식회사 카카오페이<br>
				<br>
				위탁업무 내용 :　신용카드/계좌이체/가상계좌/무통장 결제처리, 에스크로, 현금영수증<br>
				<br>
				② 수탁업체 : 배송업체 <a href="javascript:void(0);" onclick="gfn_deliveryCompanyPop();">[전체보기]</a><br>
							<br>
							위탁업무 내용 : 상품(서비스) 배송(전송), 반품교환수거 서비스<br>
							<br>
							③ 수탁업체 : (주)다날, 페이레터(주)<br>
							<br>
							위탁업무 내용 :　휴대폰 결제 처리<br>
							<br>
							​​​​​​</div>
				         </div>
				      </div>
				   </div>
				</div>
			</div>
		</div>  
		
