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