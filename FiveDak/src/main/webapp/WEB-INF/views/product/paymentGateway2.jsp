<%@page import="semiproject.dak.security.SecretMyKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String paymentKey = SecretMyKey.PAYMENTKEY; %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	const parentWindow = $(parent.document);
	const prdInfoAreaDivs = $(".prd-info-area", parentWindow);
	const numPrdInfoAreaDivs = prdInfoAreaDivs.length;
	let ordername = "";
	if (numPrdInfoAreaDivs == 1) {
	    ordername = prdInfoAreaDivs.first().data("productname");
	  } else if (numPrdInfoAreaDivs > 1) {
	    var productname = prdInfoAreaDivs.first().data("productname");
	    var n = numPrdInfoAreaDivs - 1;
	    ordername = productname + "외 " + n + "건";
	 }
	const totAmountPrice = parentWindow.find('#totAmountPrice').val();
	const usePoint = parentWindow.find('#usePoint').val();
	const amount = totAmountPrice - usePoint;
	
	const buyer_name = parentWindow.find('#orderName').val();
	const buyer_email = parentWindow.find('#orderEmail').val();
	const buyer_tel = parentWindow.find('#orderCell').val();

   var IMP = window.IMP;     // 생략가능
   IMP.init('<%= paymentKey%>');  // 중요!!  아임포트에 가입시 부여받은 "가맹점 식별코드". 

   // 결제요청하기
   IMP.request_pay({
       pg : 'html5_inicis', // 결제방식 PG사 구분
       pay_method : 'card',	// 결제 수단
       merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
       name : ordername,	 // 코인충전 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
       amount : 100,	  // '${coinmoney}'  결제 금액 number 타입. 필수항목. 
       buyer_email : buyer_name,  // 구매자 email
       buyer_name : buyer_email,	  // 구매자 이름 
       buyer_tel : buyer_tel,    // 구매자 전화번호 (필수항목)
       buyer_addr : '',  
       buyer_postcode : '',
       m_redirect_url : ''  // 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!
   }, function(rsp) {
       /*
		   if ( rsp.success ) {
			   var msg = '결제가 완료되었습니다.';
			   msg += '고유ID : ' + rsp.imp_uid;
			   msg += '상점 거래ID : ' + rsp.merchant_uid;
			   msg += '결제 금액 : ' + rsp.paid_amount;
			   msg += '카드 승인번호 : ' + rsp.apply_num;
		   } else {
			   var msg = '결제에 실패하였습니다.';
			   msg += '에러내용 : ' + rsp.error_msg;
		   }
		   alert(msg);
	   */

		if ( rsp.success ) { // PC 데스크탑용
			
			// 부모 윈도우의 insert method 호출해야함.
			parent.insertOrderInfo();
			closeModal();
			
        } else {
            /* location.href="/MyMVC";  */
            alert("결제에 실패하였습니다.");
            closeModal();
            //
       }

   }); // end of IMP.request_pay()----------------------------

}); // end of $(document).ready()-----------------------------

function closeModal() {
	const modal = $("#payment-popup", parent.document);     // approval-modal인 요소를 찾아 반환 (부모창에)
	modal.css("display", "none");								// modal 창 css 를 건든다/
    
    // 모달이 사라질 때 z-index 값을 초기값으로 되돌림
    const navbar = $(".sticky-top", parent.document);		// 클래스 .sticky-top 인 요소를 찾아 반환 (부모창에)
    navbar.css("z-index", 1);								// z-index는 우선순위를 두는 코드이므로 네비게이션 바를 1로 두고 모달창을 0으로 둔다/
    navbar.css("position", "sticky");						// 모달창을 키면서 네비게이션 바의 위치가 고정되어 있지 않았지만 네비게이션 바를 고정 시키기 위해 넣었다.
    navbar.css("background-color", "#fff");					
    
    modal.css("z-index", 0);
  }

</script>
</head>	

<body>
</body>
</html>
