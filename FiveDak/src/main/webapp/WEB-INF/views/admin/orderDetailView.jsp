<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<jsp:include page="/WEB-INF/views/header-final.jsp"/>
<% String ctxPath = request.getContextPath();%>
<jsp:include page="/WEB-INF/views/member/mypageSidebar_admin.jsp"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('select#orderStatus').val('${requestScope.odto.orderStatus}');
		
		
		
		
		
	});
</script>
<div class="col-md-9">
      <!-- 오른쪽에 들어갈 내용 -->
      		<h2 class="float-left"> 주문번호 ${requestScope.odto.orderSerial } 의 주문 상세 내역</h2>
      		<hr style="border: 1px solid; clear:both;"/>
      		
 <div style="border: solid 1px black;">
            <table class="table">
               <tbody>
                  <tr>
                     <th class="MemberShowDetailth">주문번호</th>
                     <td>${requestScope.odto.orderSerial}</td>    
                  </tr>
                  <tr>
                     <th class="MemberShowDetailth">주문자 아이디</th>
                     <td>${requestScope.odto.fk_orderMbrId }</td>
                     <th class="MemberShowDetailth">주문금액</th>
                     <td><fmt:formatNumber value="${requestScope.odto.orderTotalPrice }" pattern="#,###"/></td>
                  </tr>
                  <tr>
                     <th class="MemberShowDetailth">주문 날짜</th>
                     <td>${requestScope.odto.orderDate }</td>
                  </tr>
                  <tr>
                     <th class="MemberShowDetailth">운송장 번호</th>
                     <td>${requestScope.odto.orderTrackNo }</td>
                     <th class="MemberShowDetailth">배송상태여부</th>
                  	<td>
                  		<select id="orderStatus">
                  			<option value="1">결제완료</option>
                  			<option value="2">출고완료</option>
                  			<option value="7">미배송중</option>
                  			<option value="3">배송중</option>
                  			<option value="4">배송완료</option>
                  			<option value="6">결제취소</option>
                  		</select>
                  	 <button type="button" class="btn" style="background-color: #FF7E32;">수정</button>
                  	</td>
                  </tr>
				<c:forEach var="pdto" items="${requestScope.pdtoList}">
					<tr>
						<th>주문 상품 이름</th>	
						<td>${pdto.prodName}</td>
						
						<th>브랜드 명</th>
						<td>${pdto.brandDTO.brandName}</td>
						
					</tr>
					
					<tr>
						<th></th>
					</tr>
				
				
				
				</c:forEach>                  
                  
                  
                  
               </tbody>
            </table>
         </div>
         
         <div style = "text-align: center; margin-top: 50px;">
            <button type="button" class="btn" style="background-color: #FF7E32;">뒤로가기</button>
            <button type="button" class="btn" style="background-color: #FF7E32;">수정하기</button>
            <button type="button" class="btn btn-primary" style="background-color: #FF7E32;">삭제하기</button> 
         </div> 
      		



































      <!-- 오른쪽에 들어갈 내용 -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>