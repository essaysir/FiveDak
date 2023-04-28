<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header-final.jsp"/>
<% String ctxPath = request.getContextPath();%>
<jsp:include page="/WEB-INF/views/member/mypageSidebar_admin.jsp"/>
<div class="col-md-9">
      <!-- 오른쪽에 들어갈 내용 -->
      		<h2 class="float-left"> 주문번호 ${requestScope.orderid } 의 주문 상세 내역</h2>
      		<hr style="border: 1px solid; clear:both;"/>
      		
      		<h4>1: 주문번호 :  ${requestScope.orderid }</h4>
      		<h4>2: 주문자 아이디 :  ${requestScope.orderid }</h4>
      		<h4>1: 주문번호 :  ${requestScope.orderid }</h4>
      		<h4>1: 주문번호 :  ${requestScope.orderid }</h4>
      		
      		



































      <!-- 오른쪽에 들어갈 내용 -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>