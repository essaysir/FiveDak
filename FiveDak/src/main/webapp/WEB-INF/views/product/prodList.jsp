<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header-final.jsp"/>

<script type="text/javascript">
	$(document).ready(function(){
		setEventHandling();
		
		
	});
	
	function setEventHandling(){
			$('select#orderBy').on('change',sel_goSearch);
			$('select#orderWay').on('change',sel_goSearch);
			$('select#sizePerPage').on('change',sel_goSearch);
			
			$("select#orderBy").val('${requestScope.orderBy}');
			$("select#sizePerPage").val('${requestScope.sizePerPage}');
			$("select#orderWay").val('${requestScope.orderWay}');
		
			$('div.card_prod').on('click',showDetail);
	};
	
	function sel_goSearch(){
		const prodListFrm = document.prodListFrm;
		prodListFrm.action = "searchProd.dak";
		prodListFrm.method="get";
		prodListFrm.submit();
		
	}
	
	function showDetail(e){
		const prodNum = $(e.target).parent().find('input#prodNum').text();
		console.log(prodName);
		location.href ="<%= ctxPath%>/product/productDetail.dak";
	}
	
</script>

<style type="text/css">
	a.page-link{
		color: black ;
	}
	a.activeNo{
		background-color: #FFA751 !important;
		border-color:#FFA751 !important; 
	}
	
	div.card_prod:hover{
		cursor:pointer ;
	}
	
</style>
<div class="container" style="margin-top: 50px;">
	<c:if test="${requestScope.searchWord != ''}">
		<h2 style="float:left;">${requestScope.searchWord} 검색결과</h2>
		<p style="float:right;">전체 <span style="color:red;">${requestScope.totalProduct }</span></p>
		<hr style="border: 1px solid; clear:both;"/>
		<p style="float:left;">전체 <span style="color:red;">${requestScope.totalProduct }</span></p>
		
		<form name="prodListFrm">
			<select id="orderBy" name="orderBy" class="mx-3"style="float:right;">
				<option value="AVERAGE_RATING">평균별점순</option>
				<option value="">신상품순</option>
				<option value="PRODUCT_SALES">판매량순</option>
				<option value="PRODUCT_DISCOUNT">가격순</option>
			</select>
			<select id="orderWay" name="orderWay" class="mx-3" style="float:right;">
				<option value="desc">내림차순</option>
				<option value="asc">오름차순</option>
			</select>
			<select id="sizePerPage" name="sizePerPage" class="mx-3" style="float:right;">
				<option value="6">6개</option>
				<option value="12">12개</option>
				<option value="24">24개</option>
			</select>
			<input type="hidden" id="searchWord" name="searchWord" value="${requestScope.searchWord}" />
		</form>
		
	  
	  		<c:forEach var="pdo" items="${requestScope.prodList}" varStatus="status">
			  <c:choose>
			  	<c:when test="${status.count%3 eq 1}">
			  		<div class="card-deck mb-5" style="clear:both;">
			  	</c:when>
			  </c:choose>
			  <div class="card card_prod">
			    <img src="<%=ctxPath %>/images/${pdo.prodImage1}" class="card-img-top" alt="...">
			    <div class="card-body">
			      <img src="<%=ctxPath %>/images/특급배송.png" style="flaot:left">
			      <p class="card-text" style="float:right;"><small class="text-muted"><i class="fa-solid fa-star" style="color:#FFA751;"></i>&nbsp;${pdo.prodAvgRating }</small></p>
			      <p class="card-text" style="clear:both;">[${pdo.brandDTO.brandName}] <span id="prodName">${pdo.prodName}</span></p>
			      <h5><span style=color:#f15220;>${pdo.discountPercent}%</span> <fmt:formatNumber value="${pdo.prodDiscount}" pattern="#,###"/>원 
			      <span class="text-muted" style="text-decoration: line-through;"><fmt:formatNumber value="${pdo.prodPrice}" pattern="#,###"/>원</span></h5>
			      <img src="<%=ctxPath %>/images/성분체크.png">
			      <img src="<%=ctxPath %>/images/신상품.png">
			      <input type="hidden" id="prodNum" name="prodNum" value="${pdo.prodNum}" />
			    </div>
			  </div>
			  <c:choose>
			  	<c:when test="${status.count%3 eq 0}">
			  		</div>
			  	</c:when>
			  </c:choose>
			  
			</c:forEach>  

		  
	
				
	</c:if>
















</div>



















	<nav class="my-5">
	        <div style='display:flex; width:80%; position:relative; left :175px;'>
	          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
	       </div>
	</nav>





<jsp:include page="../footer.jsp"/>