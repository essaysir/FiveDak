<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<jsp:include page="/WEB-INF/views/header-final.jsp"/>
<% String ctxPath = request.getContextPath();%>
<jsp:include page="/WEB-INF/views/member/mypageSidebar_admin.jsp"/>
<div class="col-md-9">
      <!-- 오른쪽에 들어갈 내용 -->
      		<h2 class="float-left"> 주문번호 ${requestScope.odto.orderSerial } 의 주문 상세 내역</h2>
      		<hr style="border: 1px solid; clear:both;"/>
      		
      		<h4>1: 주문번호 :  ${requestScope.odto.orderSerial }</h4>
      		<h4>2: 주문자 아이디 :  ${requestScope.odto.fk_orderMbrId }</h4>
      		<h4>3: 총 주문금액 :  <fmt:formatNumber value="${requestScope.odto.orderTotalPrice }" pattern="#,###"/></h4>
      		<h4>4 배송지 주소 :  ${requestScope.odto.combineAddress }</h4>
      		<h4>5: 수령인 연락처 :  ${requestScope.odto.recipMobile }</h4>
      		<h4>6: 운송장 번호 : ${requestScope.odto.orderTrackNo }</h4>
      		<h4>6: 주문제품 및 수량 :  ${requestScope.orderid }</h4>
      		<h4>7: 제품이미지 :  ${requestScope.orderid }</h4>
      		
      		



































      <!-- 오른쪽에 들어갈 내용 -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>