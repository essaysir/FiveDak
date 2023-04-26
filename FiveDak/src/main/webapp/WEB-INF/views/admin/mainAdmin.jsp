<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header-final.jsp"/>

<jsp:include page="/WEB-INF/views/member/mypageSidebar_admin.jsp"/>

<script type="text/javascript">


</script>

<div class="col-md-9">
      <!-- 오른쪽에 들어갈 내용 -->
      		<h2 class="float-left">전체주문내역</h2>
      		<h5 class="float-right" style="position:relative; top:10px;">전체 주문 수 : 100 / 미배송중 : 45 </h5>
			<hr style="border: 1px solid; clear:both;"/>
		<form name="orderListFrm">
			<select id="orderWay" name="orderWay" class="mx-3 form-select float-right">
				<option value="desc">1개월</option>
				<option value="asc">3개월</option>
				<option value="asc">6개월</option>
				<option value="asc">12개월</option>
			</select>
			
			<select id="sizePerPage" name="sizePerPage" class="mx-3 form-select float-right">
				<option value="6">전체</option>
				<option value="12">결제완료</option>
				<option value="24">출고완료</option>
				<option value="24">미배송중</option>
				<option value="12">배송중</option>
				<option value="24">배송완료</option>
				<option value="12">결제취소</option>
			</select>
			<input type="hidden" id="searchWord" name="searchWord" value="${requestScope.searchWord}" />
		</form>
		
		<table class="table table-hover my-5">
		  <tr>
		    <th>주문번호</th>
		    <th>고객아이디</th>
		    <th>주문금액</th>
		    <th>배송주소</th>
		    <th>운송장 번호</th>
		    <th>수령인 연락처</th>
		    <th>배송상태여부</th>
		  </tr>
		  
		  <tr>
		    <td>1</td>
		    <td>홍길동</td>
		    <td>25,000</td>
		    <td>서울시 강서구</td>
		    <td>25</td>
		  </tr>
		  
		  <tr>
		    <td>2</td>
		    <td>김철수</td>
		    <td>30</td>
		    <td>25</td>
		    <td>25</td>
		  </tr>
		  
		  <tr>
		    <td>3</td>
		    <td>이영희</td>
		    <td>28</td>
		    <td>25</td>
		    <td>무</td>
		  </tr>
		  
		</table>
		
      
      
      
      <!-- 오른쪽에 들어갈 내용 -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
