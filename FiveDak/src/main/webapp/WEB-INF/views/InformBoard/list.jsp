<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%> 

<jsp:include page="/WEB-INF/views/member/serviceSidebar.jsp"/>

<style type="text/css">
.board_wrap {
    margin: 30px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 30px;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FF7E32;
    border-radius: 2px;
    font-size: 15px;
}

.bt_wrap a:first-child {
    margin-left: 0;
}

.bt_wrap a.on {
    background: #FF7E32;
    color: #fff;
}

.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 16px;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 20%;
}

.board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

</style>

<script type="text/javascript">
	$(document).ready(function(){
		
	<%--	if("${fn:trim(requestScope.searchWord)}" != "") {}	--%>
		if(("${requestScope.searchType}" != "") &&
		   ("${requestScope.searchWord}" != "")) {
			$("select#searchType").val("${requestScope.searchType}");
			$("input#searchWord").val("${requestScope.searchWord}");
		}
		
		$("input#searchWord").bind("keyup", (e) => {
			if(e.keyCode == 13) {	// 검색어에서 엔터를 치면 검색하러 가도록 한다.
				goSearch();
			}
		});
		
		// 특정 회원을 클릭하면 그 회원의 상세정보를 보여주도록 한다.
		$("div.boardDetail").click((e) => {
		//	alert($(e.target).parent().find(".userid").text());
			const num = $(e.target).parent().find(".num").text();
			
			location.href="<%= ctxPath%>/CSC/informBoardView.dak?num="+num;
		});
		
	});
	
	//Function Declaration
	function goSearch() {
		const frm = document.boardSearch;
		
	<%-- 	
		if(frm.searchWord.value.trim() == "") {
			alert("검색어를 올바르게 입력하세요!");
			return;	// 함수종료
		}
	--%>
		frm.action = "informBoardList.dak";
		frm.method = "get";
		frm.submit();
	}
</script>

<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
           <div class="container" style="position:relative;" >
				<div class="row" style="position: absolute; right: 0px; bottom: 0px;">
					<form method="post" class="search" name="boardSearch">
						<table class="pull-right">
							<tr>
								<td><select class="form-control" name="searchField">
										<option value="0">선택</option>
										<option value="title">제목</option>
										<option value="detail">내용</option>
								</select></td>
								<td><input type="text" class="form-control"
									placeholder="검색어 입력" name="searchText" ></td>
								<td><button type="submit" class="btn btn-secondary">검색</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
        </div>
        
        
 <%--
        <table id="memberTbl" class="table table-bordered" style="width: 90%; margin-top: 20px;">
	<thead>
    	<tr>
         	<th>아이디</th>
          	<th>회원명</th>
           	<th>이메일</th>
          	<th>성별</th>
       	</tr>
   	</thead>
        
   	<tbody>
   		<c:if test="${not empty requestScope.memberList}">
	    	<c:forEach var="mvo" items="${requestScope.memberList}">
	    		<tr class="memberInfo">
		         	<td class="userid">${mvo.userid}</td>
		          	<td>${mvo.name}</td>
		           	<td>${mvo.email}</td>
		          	<td>
		          		<c:choose>
			          		<c:when test="${mvo.gender eq '1'}">
			          			남
			          		</c:when>
			          		<c:otherwise>
			          			여
			          		</c:otherwise>
		          		</c:choose>
		          	</td>
		       	</tr>
	    	</c:forEach>
    	</c:if>
    	<c:if test="${empty requestScope.memberList}">
	    	<tr>
	         	<td colspan="4">가입된 회원이 없습니다.</td>
	       	</tr>
    	</c:if>
    </tbody>
</table>
        
         --%>       

        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">작성자</div>
                    <div class="date">작성일</div>
                </div>
                
                <c:if test="${not empty requestScope.boardList}">
	    			<c:forEach var="ndto" items="${requestScope.boardList}">
		                <div class="boardDetail">
		                    <div class="num">${ndto.note_id}</div>
		                    <div class="title">${ndto.note_title}</a></div>
		                    <div class="writer">운영자</div>
		                    <div class="date">${ndto.note_created_at}</div>
		                </div>
               	 	</c:forEach>
    			</c:if>
	    		
                
            </div>
            <div class="board_page">
                <ul class="pagination" style='margin:auto;'>${requestScope.pageBar}</ul>
            </div>
            <div class="bt_wrap">
                <a href="<%= ctxPath%>/CSC/informBoardWrite.dak" class="on">작성</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</body>

      
      
      <!-- 오른쪽에 들어갈 내용 -->
</div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>