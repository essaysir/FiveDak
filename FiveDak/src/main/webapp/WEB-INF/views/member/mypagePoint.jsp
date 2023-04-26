<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/member/mypageSidebar.jsp"/>




<style type="text/css">




</style>



<script type="text/javascript">	
	
	$(document).ready(function(){
	    
		
		
		let selectedValue = localStorage.getItem("selectedValue");    // localStorage에서 값 불러오기
		if (selectedValue != null) {
		    $("select#form-control-point").val(selectedValue); // 값이 저장되어 있다면 선택된 값으로 설정
		}
		
		setEventHandling();

	});	// END OF $(DOCUMENT).READY(FUNCTION()

		
	function setEventHandling () { 
		 $("select#form-control-point").change(PointSelectChange);    // select 값이 변경된다면 실행 
	}
	
	// // select 값이 변경된다면 실행 코드 
	function PointSelectChange() {
		selectedValue = $(this).val(); // 선택된 값을 저장
	    localStorage.setItem("selectedValue", selectedValue); // localStorage에 값 저장
	         
	    location.reload();  // 새로고침 하기 
	}

</script>




<div>
	
	<h2 style="float:left;">포인트 </h2>
      
    <select class="form-select-lg" style="float:right; border-radius: 5px; height: 30px; width: 90px;" id="form-control-point">
		
		<option value="option1">전체내역</option>
	    <option value="option2">지급내역</option>
	    <option value="option3">차감내역</option>

	</select> 
</div>

<div style="clear: both;">	

	<div style="border: solid 2px black; margin-bottom: 20px;"></div>



	<%-- <c:if test="">  포인트 기록이 있을경우를 만들 if 문 하나 --%>



	<!-- <table class="table table-hover">   테이블에 마우스 올라갔을때 반응
	  <thead>
	    <tr>
	      <th>날짜</th>
	      <th>내용</th>
	      <th>지급/차감</th>
	      <th>변동 포인트</th>
	      <th>보유 포인트</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <td>내용</td>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	      <td>@mdo</td>
	    </tr>
	  
	  
	    
		
	  
	  
	  
	  </tbody>
	</table> -->
	
	
	<%-- </c:if>  if 문 끝 나는 곳 --%>     




	<%-- 또다른 if 문 포인트 기록이 없으면 나타내 줄 HTML 부분  --%>
	
	<%-- <c:if test="">  포인트 기록이 없으면은 포인트 지급/차감내역이 없습니다. --%>
	
	<div style="text-align: center;">
	
		<span> 포인트 지급/ 차감 내역이 없습니다.</span>
	
	</div>
	<%-- </c:if>  if 문 끝 나는 곳 --%>  
	
<div>



	</div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>