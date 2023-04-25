<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<jsp:include page="../header-final.jsp"/>
<title>랭킹닭컴</title>
<div class="container" style="margin-top: 50px;">
	<c:if test="${requestScope.searchWord != ''}">
		<h2 style="float:left;">${requestScope.searchWord} 검색결과</h2>
		<p style="float:right;">전체 <span style="color:red;">1768</span></p>
		<hr style="border: 1px solid; clear:both;"/>
		<p style="float:left;">전체 <span style="color:red;">1768</span></p>
		<select style="float:right;">
			<option>평균별점순</option>
			<option>신상품순</option>
			<option>판매량순</option>
			<option>가격순</option>
		</select>
		<select style="float:right;">
			<option>오름차순</option>
			<option>내림차순</option>
		</select>
		<select style="float:right;">
			<option>10개</option>
			<option>20개</option>
			<option>40개</option>
		</select>
		
	  <div class="card-deck mb-5" style="clear:both;">
	  		<c:forEach var="pdo" items="${requestScope.prodList}">
			  <div class="card">
			    <img src="<%=ctxPath %>/images/${pdo.prodImage1}" class="card-img-top" alt="...">
			    <div class="card-body">
			      <img src="<%=ctxPath %>/images/특급배송.png" style="flaot:left">
			      <p class="card-text" style="float:right;"><small class="text-muted"><i class="fa-solid fa-star" style="color:#FFA751;"></i>&nbsp;${pdo.prodAvgRating }</small></p>
			      <p class="card-text" style="clear:both;">[${pdo.brandDTO.brandName}] ${pdo.prodName}</p>
			      <h5><span style=color:#f15220;>${pdo.discountPercent}%</span> ${pdo.prodPrice}원 <span class="text-muted" style="text-decoration: line-through;">${pdo.prodDiscount }원</span></h5>
			      <img src="<%=ctxPath %>/images/성분체크.png">
			      <img src="<%=ctxPath %>/images/신상품.png">
			    </div>
			  </div>
			</c:forEach>  

		  
	</div>
				
	</c:if>

	<c:if test="${requestScope.searchWord == ''}">
		<h2>랭킹</h2>
	</c:if>














</div>



















	<nav class="my-5">
	        <div style='display:flex; width:80%;'>
	          <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
	       </div>
	</nav>





<jsp:include page="../footer.jsp"/>