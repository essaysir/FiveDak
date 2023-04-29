<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header-final.jsp"/>

<jsp:include page="/WEB-INF/views/member/mypageSidebar_admin.jsp"/>

<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	
	let lenHIT = 1 ;
	

</script>

<div class="col-md-9">
      <!-- 오른쪽에 들어갈 내용 -->
      		<h2 class="float-left">전체제품목록</h2>
      		<h5 class="float-right" style="position:relative; top:10px;">전체 제품 수 :  </h5>
			<hr style="border: 1px solid; clear:both;"/>
	
	<form name="memberFrm">
	
	<select id="searchType" name="searchType" clase="mx-1" style="margin-left : 200px ;">
		<option value="">선택하세요</option>
		<option value="name">제품명</option>
		<option value="email">브랜드</option>
		<option value="userid">아이디</option>
	</select>
	
	<input type="text" id="searchWord" name="searchWord"/>
	
	<input type="text" style="display:none;"/> 
		 
	<button class="btn btn-warning mx-5" style="margin-right:30px;" type="button" onclick="">검색</button>

	</form>

	<table id="prodTbl" class="table table-bordered" style="width: 90%; margin-top: 20px;">
	        <thead>
	           <tr>
	              <th>제품번호</th>
	              <th>브랜드</th>
	              <th>제품명</th>
	              <th>판매량</th>
	           </tr>
	        </thead>
	
			<tbody>
				
			</tbody>
	</table>
		
	<nav class="my-5">
	        <div style='display:flex; width:80%;'>
	          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
	       </div>
	</nav>
        
      
      
      <!-- 오른쪽에 들어갈 내용 -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
