<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>        

<jsp:include page="/WEB-INF/views/member/mypageSidebar.jsp"/>

<style type="text/css">
	
	* {
   font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
   }
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    -webkit-font-smoothing: antialiased;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
	.order-list-wrap{
	    -webkit-text-size-adjust: 100%;
    color: #333;
    font-size: 14px;
    font-weight: 400;
    font-family: 'Pretendard', sans-serif;
    word-break: break-all;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    -webkit-font-smoothing: antialiased;
    -webkit-box-sizing: border-box;
    float: right;
    width: 820px;
    }
	
	
	.menu-title-area {
    position: relative;
    min-height: 30px;.search-box .search-head 
    position: relative;
    padding-right: 80px;
	}

	.menu-title-area .title-menu {
    display: inline-block;
    font-size: 24px;
    font-weight: 500;
	}
	
	.search-box {
    padding: 15px 18px;
    background: #F8F8F8;
    border: 1px solid #ECECEC;
	}
	
	.search-box .search-head {
    position: relative;
    padding-right: 80px;
	}

	.search-box .search-head .searn-period {
    font-size: 14px;
	}
	
	
	.search-box .search-head .btn-link-txt2 {
    position: absolute;
    top: 0;
    right: 0;
    color: #666;
}
.btn-link-txt2 {
    display: inline-block;
    vertical-align: top;
    font-size: 13px;
}
	button, [type="button"], [type="reset"], [type="submit"] {
	    -webkit-appearance: none;
	    appearance: none;
	    cursor: pointer;
	    /* border: 0; */
	    padding: 0;
	    background-image: none;
	}
	button {
	    background: none;
	    font-family: 'Pretendard', sans-serif;
	    cursor: pointer;
	    outline: none;
	    border: 0;
	    margin: 0;
	    padding: 0;
	}
	button, select {
	    text-transform: none;
	}
	button, input {
	    overflow: visible;
	}
	button, input, optgroup, select, textarea {
	    font: inherit;
	    color: inherit;
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    -webkit-appearance: none;
	    appearance: none;
	}
	
	button span {
    position: relative;
	}
	
	
	.btn-link-txt2 [class*="ico-arr-"] {
    vertical-align: middle;
    margin-top: -2px;
    margin-left: 5px;
    width: 11px;
    height: 11px;
}

.btn-link-txt2 span + i {
    margin-left: 5px;
    margin-right: 0;
}
.btn-link-txt2 i {
    vertical-align: middle;
    margin-top: -2px;
    margin-right: 3px;
}
[class*="ico-arr-"] {
    position: relative;
    display: inline-block;
    width: 12px;
    height: 12px;
    transition: .2s;
    -webkit-transition: .2s;
    transform: translateX(0);
    -webkit-transform: translateX(0);
}

.search-box .search-detail {
    padding-top: 18px;
}

fieldset, img {
    border: 0;
}

legend, caption {
    position: absolute;
    left: -99999px;
    display: block;
    width: 1px;
    height: 1px;
    overflow: hidden;
    text-indent: -99999px;
    clip: rect(0,0,0,0);
    *display: none;
}

.search-detail .radio-list {
    font-size: 0;
}

ol, ul {
    list-style: none;
}

.search-detail .radio-list li {
    display: inline-block;
}

.custom-radio {
	margin: 0 15px;
    position: relative;
    display: inline-block;
}	

.custom-radio input[type="radio"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}
input[type="checkbox"], input[type="radio"] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font: inherit;
    color: inherit;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    -webkit-appearance: none;
    appearance: none;
}
label, select, input, textarea {
    vertical-align: middle;
}
user agent stylesheet
input[type="radio" i] {
    background-color: initial;
    cursor: default;
    appearance: auto;
    box-sizing: border-box;
    margin: 3px 3px 0px 5px;
    padding: initial;
    border: initial;
}
input {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-variant-alternates: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    font-optical-sizing: ;
    font-kerning: ;
    font-feature-settings: ;
    font-variation-settings: ;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}

.custom-radio .radio-btn-type2:checked + label {
    color: #FF6001;
    border: 1px solid #FF6001;
}
.custom-radio .radio-btn-type2 + label {
    display: block;
    width: 120px;
    height: 36px;
    border: 1px solid #ccc;
    padding: 5px 0;
    text-align: center;
    color: #666;
    background: #fff;
    line-height: 1.6;
    font-size: 14px;
    cursor: pointer;
    border-radius: 100px;
}

.search-detail .radio-list ~ .period-setting {
    margin-top: 15px;
}
.period-setting {
    border-top: 1px solid #E4E4E4;
    padding-top: 20px;
}

.input-group.type-sm {
    height: 30px;
}

.input-group-wrap ~ .textarea-box, .input-group ~ .input-group {
    margin-top: 8px;
}
.input-group.type-sm {
    height: 30px;
}
.input-group {
    height: 40px;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: collapse;
    /* width: 100%; */
}

.input-group.type-sm > .input-group-form:last-child, .input-group.type-sm > .input-group-btn:last-child {
    padding: 0;
}
.input-group > .input-group-form:first-child + .input-group-form, .input-group > .input-group-form:first-child + .input-group-txt {
    padding: 0 5px 0 0;
}
.input-group.type-sm > .input-group-txt, .input-group.type-sm > .input-group-form, .input-group.type-sm > .input-group-btn {
    padding: 0 5px;
}
.input-group > .input-group-form:last-child, .input-group > .input-group-btn:last-child {
    padding: 0;
}
.input-group > .input-group-form, .input-group > .input-group-btn {
    display: table-cell;
    position: relative;
    white-space: nowrap;
    width: 1%;
    vertical-align: middle;
    border: 0;
    padding: 0 5px;
}
.wp100, .w-full {
    width: 100% !important;
}
.text-right {
    text-align: right !important;
}

.dis-inb {
    display: inline-block;
}

.input-group.type-sm .input-group-btn .btn-form {
    height: 30px;
    padding: 0 10px;
    min-width: auto;
    font-size: 13px;
    vertical-align: top;
}
.input-group .select-box, .input-group .btn-form {
    height: 40px;
}
.btn-black {
    color: #fff;
    background: #333;
    border: 1px solid #333;
}
.btn-form {
    display: inline-block;
    height: 42px;
    padding: 0 13px;
    text-align: center;
    border-radius: 3px;
}
a {
    background: transparent;
    text-decoration: none;
    color: inherit;
}

.input-group.type-sm .btn-form > span {
    line-height: 2.2;
}
.btn-form > span {
    display: inline-block;
    height: 100%;
    line-height: 2.8;
}

.input-group.type-sm .input-group-btn .btn-form {
    height: 30px;
    padding: 0 10px;
    min-width: auto;
    font-size: 13px;
    vertical-align: top;
}
.period-setting .btn-link-txt5 {
    margin-left: 10px;
}
.input-group .select-box, .input-group .btn-form {
    height: 40px;
}
.btn-link-txt5 {
    display: inline-block;
    vertical-align: top;
    color: #666;
    font-size: 13px;
}
.btn-form {
    display: inline-block;
    height: 42px;
    padding: 0 13px;
    text-align: center;
    border-radius: 3px;
}
button, [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: none;
    appearance: none;
    cursor: pointer;
    /* border: 0; */
    padding: 0;
    background-image: none;
}
button {
    background: none;
    font-family: 'Pretendard', sans-serif;
    cursor: pointer;
    outline: none;
    border: 0;
    margin: 0;
    padding: 0;
}
button, select {
    text-transform: none;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    font: inherit;
    color: inherit;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    -webkit-appearance: none;
    appearance: none;
}


.input-group.type-sm .btn-form > span {
    line-height: 2.2;
}
.btn-form > i + span {
    margin-left: 5px;
}
.btn-form > span {
    display: inline-block;
    height: 100%;
    line-height: 2.8;
}
button span {
    position: relative;
}

.order-list-head {
    position: relative;
    padding: 18px 0;
}


.order-list-head .date {
    display: inline-block;
    font-size: 20px;
    font-weight: 700;
    vertical-align: top;
}

address, caption, cite, code, dfn, em, strong, th, var {
    font-style: normal;
}


.order-list-head .order-num {
    display: inline-block;
    margin-left: 5px;
    font-size: 15px;
    color: #666;
    line-height: 1.4;
    vertical-align: bottom;
}

.order-content-box {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 20px;
}

.order-content-box .order-state-bar {
    position: relative;
    border-radius: 2px;
    background: #f5f5f5;
    padding: 10px 8px;
    margin-bottom: 15px;
}

.order-content-box .order-state-bar .txt-state {
    color: #FF6001;
    font-weight: 500;
    font-size: 14px;
    margin-right: 8px;
}

.text-guide-sm {
    font-size: 12px;
    color: #666;
    font-weight: normal;
}

.order-content-box .order-state-bar .btn-link-txt2 {
    position: absolute;
    top: 10px;
    right: 18px;
}

.btn-link-txt2 {
    display: inline-block;
    vertical-align: top;
    font-size: 13px;
}

.prd-info-area {
    position: relative;
    
}

.prd-info-area .inner {
    display: table;
    table-layout: auto;
    width: 100%;
}


.prd-info-area .column.img {
    width: 80px;
    height: 80px;
    overflow: hidden;
    position: relative;
}
.prd-info-area .column {
    display: table-cell;
    vertical-align: top;
    text-align: center;
}

.prd-info-area .column.img img {
    width: 80px;
    height: 80px;
}
img {
    max-width: 100%;
    vertical-align: top;
}


.prd-info-area .column.tit {
    padding: 0 10px 0 15px;
    text-align: left;
}

.prd-info-area .column.tit .tit {
    font-size: 15px;
    color: #333;
    margin-bottom: 3px;
}

.prd-info-area .column.tit .price-item > li {
    font-size: 14px;
    color: #333;
    display: inline-block;
    vertical-align: middle;
    margin-right: 4px;
}

.prd-info-area .column.tit .price-item > li:not(:first-child):before {
    display: block;
    content: '';
    width: 2px;
    height: 2px;
    position: absolute;
    top: 50%;
    left: 0;
    background: #666;
    transform: translateY(-50%);
}

.prd-info-area .column.price {
    width: 130px;
    vertical-align: middle;
    text-align: right;
    word-break: keep-all;
}

.prd-info-area .column.price .num {
    font-size: 18px;
    color: #333;
    font-weight: 700;
}

.prd-info-area .column.dlv {
    width: 70px;
    vertical-align: middle;
}

.prd-info-area .column.dlv {
    width: 70px;
    vertical-align: middle;
}

.prd-info-area .column.dlv .btn-option {
    margin-top: 5px;
}
.btn-option.btn-default {
    color: #666;
}
.btn-default {
    background: #fff;
    color: #333;
    border: 1px solid #ccc;
}
.btn-option {
    height: 32px;
    /* height: 28px; */
    padding: 5px 10px;
}
[class*="btn-basic-"], [class*="btn-option"] {
    border-radius: 6px;
}
[class*="btn-basic-"], [class*="btn-option"], [class*="btn-rud-"] {
    display: inline-block;
    text-align: center;
    border: 1px solid transparent;
    box-sizing: border-box;
    vertical-align: top;
}
address, caption, strong[lang=en], em, cite, b {
    font-weight: normal;
    font-style: normal;
}

.btn-option > span {
    font-size: 13px;
    line-height: 1.6;
    font-weight: 500;
}
[class*="btn-basic-"] > span, [class*="btn-option"] > span, [class*="btn-rud-"] > span {
    display: inline-block;
    vertical-align: top;
}
.text-grey3 {
    color: #999 !important;
}


.order-content-box .addr-info-line {
    position: relative;
    margin-top: 20px;
    padding-top: 20px;
}

.order-content-box .addr-info-line:before {
    position: absolute;
    top: 0;
    left: -20px;
    width: calc(100% + 40px);
    height: 1px;
    background: #eee;
    content: '';
}

.order-content-box .addr-info-line p {
    color: #666;
}

.order-div-item {
	margin-bottom: 5px;
}

button.btn_review_write {
      border: solid 1px #FF7E32;
      color: #FF7E32;
      background-color: white;
      font-size: 10pt;
      font-weight: bold;
      border-radius: 10px;
      height: 35px;
      padding: 7px;
      width: 88px;
   }



</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		setPeriodSpan();
				
	});
	
	function setPeriodSpan() {
		
		const searchParams = new URLSearchParams(window.location.search);

		
		const radioValue = searchParams.get('mypage-order-search-radio');
		const periodOptionValue = searchParams.get('periodOption');
		if (radioValue != periodOptionValue) {
			radioValue = '1MONTH';
		}
		
		let prodType;
		let startdate;
		switch (radioValue) {
		  case '2WEEKS':
		    prodType = '최근 2주일';
		    startdate = moment().subtract(2, 'weeks').format('YYYY-MM-DD');
		    $("#mypage-order-search-radio-2weeks").prop('checked', true);
		    break;
		  case '1MONTH':
		    prodType = '최근 1개월';
		    startdate = moment().subtract(1, 'month').format('YYYY-MM-DD');
		    $("#mypage-order-search-radio-1month").prop('checked', true);
		    break;
		  case '3MONTHS':
		    prodType = '최근 3개월';
		    startdate = moment().subtract(3, 'months').format('YYYY-MM-DD');
		    $("#mypage-order-search-radio-3months").prop('checked', true);
		    break;
		  case '6MONTHS':
		    prodType = '최근 6개월';
		    startdate = moment().subtract(6, 'months').format('YYYY-MM-DD');
		    $("#mypage-order-search-radio-6months").prop('checked', true);
		    break;
		  case '12MONTHS':
		    prodType = '최근 12개월';
		    startdate = moment().subtract(12, 'months').format('YYYY-MM-DD');
		    $("#mypage-order-search-radio-12months").prop('checked', true);
		    break;
		  default:
		    prodType = '최근 1개월';
		  	startdate = moment().subtract(1, 'month').format('YYYY-MM-DD');
		  	$("#mypage-order-search-radio-1month").prop('checked', true);
		    break;
		}
		const endDate = moment().format('YYYY-MM-DD');
		
		$(".searn-period").text("조회기간 " + startdate + " ~ " + endDate + "(" + prodType + ")");
		
	}
	
	
	function myPageOrderSearch() {
		var selectedValue = $('.radio-list input[type="radio"]:checked').val();
		$("#mypage-order-search-period").val(selectedValue);
		
		var startdate;
		switch (selectedValue) {
		  case '2WEEKS':
		    startdate = moment().subtract(2, 'weeks').format('YYYY-MM-DD');
		    break;
		  case '1MONTH':
		    startdate = moment().subtract(1, 'month').format('YYYY-MM-DD');
		    break;
		  case '3MONTHS':
		    startdate = moment().subtract(3, 'months').format('YYYY-MM-DD');
		    break;
		  case '6MONTHS':
		    startdate = moment().subtract(6, 'months').format('YYYY-MM-DD');
		    break;
		  case '12MONTHS':
		    startdate = moment().subtract(12, 'months').format('YYYY-MM-DD');
		    break;
		  default:
		    startdate = moment().format('YYYY-MM-DD');
		}
		
		var endDate = moment().format('YYYY-MM-DD');
		
		$("#mypage-order-search-start-date").val(startdate);
		$("#mypage-order-search-end-date").val(endDate);
		
		$("#myPageOrderList").submit();
		
		
	}
	
	function goReviewWrite(product_id, order_serial) {
	      
	      
	      location.href= "reviewWrite.dak?product_id="+product_id+"&order_serial="+order_serial;
	      
	   }
	
	

</script>


		
		<div class="order-list-wrap">
    <div class="frame-cnt-inner">
        <form id="myPageOrderList" name="myPageOrderList" action="" method="get"><div class="menu-title-area">
                <h3 class="title-menu">주문내역</h3>
                <div class="right">
                    <div class="input-group-wrap box-type">
                        <!-- <div class="input-group w200">
                            <label for="item1-1" class="blind">검색</label>
                            <input type="text" id="item1-1" name="srchProductNm" class="input-text" placeholder="주문 상품명 검색" value="">
                            <span class="input-group-btn">
                                    <button type="submit" class="btn-icon-search search-word" title=""><i class="ico-btn-search"></i><span class="blind">검색하기</span></button>
                                </span>
                        </div>// input-group -->
                    </div>
                </div>
            </div><!--// menu-title-area -->

            <input type="hidden" name="nowPageNo" value="1">
            <div class="search-box ui-toggle on" style="margin-top: 10px">
                <input type="hidden" id="mypage-order-search-period" name="periodOption" value="${mypage-order-search-radio }">
                <input type="hidden" id="mypage-order-search-start-date" name="startdate" value="${startdate }">
                <input type="hidden" id="mypage-order-search-end-date" name="enddate" value="${enddate }">
                <div class="search-head">
                    <p class="searn-period">조회기간 2023.04.03 ~ 2023.05.03(최근 1개월)</p>
                    <!-- <button type="button" class="btn-link-txt2 ui-toggle-btn toggle-on" id="btnDetail"><span>조회설정</span><i class="ico-arr-toggle"></i></button> -->
                </div><!--// search-head -->
                <div class="search-detail ui-toggle-content">
                    <fieldset>
                        <legend>상세 검색</legend>
                        <ul class="radio-list">
                            <li>
                                <div class="custom-radio">
                                    <input type="radio" id="mypage-order-search-radio-2weeks" class="radio-btn-type2" name="mypage-order-search-radio" value="2WEEKS"><label for="mypage-order-search-radio-2weeks">2주일</label>
                                </div>
                            </li>
                            <li>
                                <div class="custom-radio">
                                    <input type="radio" id="mypage-order-search-radio-1month" class="radio-btn-type2" name="mypage-order-search-radio" value="1MONTH"><label for="mypage-order-search-radio-1month">1개월</label>
                                </div>
                            </li>
                            <li>
                                <div class="custom-radio">
                                    <input type="radio" id="mypage-order-search-radio-3months" class="radio-btn-type2" name="mypage-order-search-radio" value="3MONTHS"><label for="mypage-order-search-radio-3months">3개월</label>
                                </div>
                            </li>
                            <li>
                                <div class="custom-radio">
                                    <input type="radio" id="mypage-order-search-radio-6months" class="radio-btn-type2" name="mypage-order-search-radio" value="6MONTHS"><label for="mypage-order-search-radio-6months">6개월</label>
                                </div>
                            </li>
                            <li>
                                <div class="custom-radio">
                                    <input type="radio" id="mypage-order-search-radio-12months" class="radio-btn-type2" name="mypage-order-search-radio" value="12MONTHS"><label for="mypage-order-search-radio-12months">12개월</label>
                                </div>
                            </li>
                        </ul>
                        <div class="period-setting ui-toggle-sub">
                            

                            <div class="input-group type-sm">
                                
                                <div class="input-group-form text-right w-full">
                                    <div class="input-group-btn dis-inb">
                                        <a href="javascript:;" onclick="myPageOrderSearch();" class="btn-form btn-black"><span>조회하기</span></a>
                                    </div>
                                    
                                </div>
                            </div>

                        </div><!--// period-setting -->
                    </fieldset>
                </div><!--// search-detail-->
            </div><!--// search-box -->
        </form><div class="order-list-area">
        
        
                    <ul class="order-list-inner">
                    	<c:forEach var="order" items="${orderlist}">
                        <li>
                                <div class="order-list-head">
                                    <strong class="date">${order.orderDate}</strong>
                                    <a href="javascript void:(0)" class="order-num">${order.orderSerial }
                                    </a>
                                    <div class="right">
                                        </div>
                                </div><!--// list-head -->
                                <div class="order-content-box">
                                	<c:choose>
									    <c:when test="${order.orderStatus eq 1}">
									        <c:set var="orderStatusString" value="결제완료" />
									    </c:when>
									    <c:when test="${order.orderStatus eq 2}">
									        <c:set var="orderStatusString" value="출고완료" />
									    </c:when>
									    <c:when test="${order.orderStatus eq 3}">
									        <c:set var="orderStatusString" value="배송중" />
									    </c:when>
									    <c:when test="${order.orderStatus eq 4}">
									        <c:set var="orderStatusString" value="배송완료" />
									    </c:when>
									    <c:when test="${order.orderStatus eq 5}">
									        <c:set var="orderStatusString" value="구매확정" />
									    </c:when>
									    <c:when test="${order.orderStatus eq 6}">
									        <c:set var="orderStatusString" value="결제취소" />
									    </c:when>
									    <c:otherwise>
									        <c:set var="orderStatusString" value="미배송중" />
									    </c:otherwise>
								</c:choose>

                                	
                                    <ul class="order-div-list">
										<c:forEach var="orderdetail" items="${order.orderdetailList}">                                    	
                                        <li class="order-div-item">
                                                <div class="order-state-bar">
                                                    <em class="txt-state ">
                                                        ${orderStatusString}</em>
                                                                </div><!--// state-bar -->
                                                <div class="prd-info-area">
                                                    <div class="inner">
                                                        <div class="column img"><a href='<%= ctxPath%>/product/productDetail.dak?prodNum=${orderdetail.orderDetailProd.prodNum}'><img src="<%=ctxPath %>/images/${orderdetail.orderDetailProd.prodImage1}" alt="상품이미지"></a></div>
                                                        <div class="column tit">
                                                            
                                                            <p class="tit"><a href='<%= ctxPath%>/product/productDetail.dak?prodNum=${orderdetail.orderDetailProd.prodNum}'>[${orderdetail.orderDetailProd.brandDTO.brandName}] ${orderdetail.orderDetailProd.prodName}</a></p>
                                                            <ul class="price-item">
                                                                <li><span class="num"><fmt:formatNumber type="number" value="${orderdetail.pricePerUnit }"  pattern="#,###"/></span>원</li>
                                                                <li><span class="num">${orderdetail.orderQuantity }</span>개</li>
                                                                </ul>
                                                        </div><!--// column  -->
                                                        <div class="column price text-left"><span class="num"><fmt:formatNumber type="number" value="${orderdetail.pricePerUnit * orderdetail.orderQuantity}"  pattern="#,###"/></span>원</div>
                                                        <div class="column dlv">
                                                        	<button type="button" id="btnCommentOK" class="btn_review_write" onclick="goReviewWrite('${orderdetail.orderDetailProd.prodNum}','${order.orderSerial }')"><i class="fa-solid fa-pen"></i> 후기작성</button>
                                                            <!-- <em class="btn-option btn-default"><span class="text-grey3">작성완료</span></em> -->
                                                                                    </div>
                                                    </div>
                                                </div><!--// prd-info-area -->
                                            </li><!--// order-div-item || 상품별 list 1 -->
                                            </c:forEach>
                                        </ul><!--// order-div-list -->
                                    <div class="addr-info-line">
                                    <p><i class="fa-solid fa-house"></i> [${order.orderPostcode }]&nbsp;${order.orderAddress}&nbsp;${order.orderDetailAddress }</p>
                                            </div><!--// addr-info-line -->
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                </div>
                
            </div><!--// frame-cnt-inner -->
</div>
		





</div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>