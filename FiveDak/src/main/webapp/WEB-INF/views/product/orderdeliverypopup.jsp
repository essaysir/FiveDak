<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<link rel="stylesheet" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">
    
    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Optional JavaScript -->
<script src="<%=ctxPath%>/js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<!-- Font Awesome 6 Icons -->

 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!-- 글꼴 적용하기 -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/static/pretendard.css" />

<style type="text/css">

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

.layer-inner {
    position: relative;
}
.layer-head {
    border-bottom: 1px solid #ccc;
    padding: 20px 30px;
}
.layer-head .layer-pop-title {
    font-size: 20px;
    font-weight: 500;
    line-height: 20px;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.layer-content {
    padding: 20px 0 0;
}
.layer-content .inner {
    padding: 0 30px;
}

.lineless-table table {
    width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
    border-spacing: 0;
}

col {
    display: table-column;
}

tbody {
    display: table-row-group;
}
tr {
    display: table-row;
}

th, td {
    display: table-cell;
}
.blind {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}


.layer-pop.dlv-addr-pop .lineless-table th {
    color: #333;
    font-size: 15px;
}
.lineless-table.type2 th {
    padding: 3px 0;
}
.lineless-table th {
    text-align: left;
    font-weight: normal;
    padding: 10px 0;
    font-size: 13px;
    vertical-align: middle;
}
.lineless-table.type2 th .es {
    vertical-align: top;
}

.lineless-table.type2 td {
    padding: 3px 0;
}
.lineless-table td {
    text-align: left;
    font-weight: normal;
    padding: 10px 0;
    font-size: 15px;
    vertical-align: middle;
}

.lineless-table .es:after {
    display: inline-block;
    content: "";
    margin-top: 5px;
    margin-left: 2px;
    width: 5px;
    height: 5px;
    border-radius: 50%;
    vertical-align: top;
    background: #FF6001;
}


table td, table th {
    word-break: keep-all;
    word-wrap: break-word;
    font-style: normal;
}


.w-full {
    width: 100% !important;
}
.input-text {
    height: 40px;
    padding: 5px 15px;
    background: #fff;
    color: #333;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-size: 13px;
    border-radius: 0;
}
button, input {
    overflow: visible;
}

.input-group .input-text {
    height: 100%;
    /* height: 40px; */
    padding: 3px 15px;
}
.input-group > .input-text {
    position: relative;
    display: table-cell;
    float: left;
    width: 100%;
    z-index: 2;
}
input[readonly] {
    background-color: #F3F8FF;
    border: 1px solid #ccc;
    opacity: 1;
    color: #333;
}

.input-group {
    height: 40px;
}

.input-mobile {width:32.8%;}

.input-group {
    position: relative;
    display: table;
    border-collapse: collapse;
    /* width: 100%; */
}
.input-group > .input-text + .input-group-form:last-child, .input-group > .input-text + .input-group-btn:last-child {
    padding: 0 0 0 5px;
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


.layer-pop.dlv-addr-pop .layer-bottom {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 20px 30px 30px;
    background: #fff;
}

.layer-bottom .btn-area {
    position: relative;
    text-align: center;
    clear: both;
}

.layer-bottom .btn-area:after {
    display: block;
    content: '';
    clear: both;
}


</style>

<script type="text/javascript">

	$(document).ready(function(){
	    setaddress();
	    $('button#changeDelivery').on('click', changeDelivery);
		$(".approval-modal-close").on('click', closeModal);
	});
	
	
	function allowOnlyNumbers(event) {
		  const input = event.target;
		  input.value = input.value.replace(/[^0-9]/g, '');
	}
	
	function changeDelivery(e) {
		  const recipientName = $('#recipientName').val();
		  const recipientPostcode = $('#recipientPostcode').val();
		  const recipientAddress = $('#recipientAddress').val();
		  const recipientDetailAddress = $("#recipientDetailAddress").val();
		  const recipientMobile1 = $('#recipientMobile1').val();
		  const recipientMobile2 = $('#recipientMobile2').val();
		  const recipientMobile3 = $('#recipientMobile3').val();

		  if(recipientName === '' || recipientPostcode === '' || recipientAddress === '' || recipientMobile1 === '' || recipientMobile2 === '' || recipientMobile3 === '') {
		    alert('필수 입력사항을 입력해주세요.');
		    return;
		  }
		  
		  const regex = /^\d{4}$/; // 전화번호 정규식 검사
		  
		  if (!regex.test(recipientMobile2) || !regex.test(recipientMobile3)) {
		    alert('핸드폰 번호를 정확하게 입력해주세요.');
		    return;
		  }
		  
		  
		  const address = '(' + recipientPostcode + ') ' + recipientAddress + ' ' + recipientDetailAddress; 
		  const mobile = recipientMobile1 + '-' + recipientMobile2 + '-' + recipientMobile3;
		  const parentWindow = window.parent;
		  
		  parentWindow.$('.recipientNameText').text(recipientName);
		  parentWindow.$('.recipientAddressText').text(address);
		  parentWindow.$('.recipientMobileText').text(mobile);
		  
		  parentWindow.$('#recipientName').val(recipientName);
		  parentWindow.$('#recipientPostcode').val(recipientPostcode);
		  parentWindow.$('#recipientAddress').val(recipientAddress);
		  parentWindow.$('#recipientDetailAddress').val(recipientDetailAddress);
		  parentWindow.$('#recipientMobile').val(recipientMobile1 + recipientMobile2 + recipientMobile3);
		  
		  closeModal();
		  
	}
	
	function closeModal() {
		const modal = $("#deliver-popup", parent.document);     // approval-modal인 요소를 찾아 반환 (부모창에)
		modal.css("display", "none");								// modal 창 css 를 건든다/
	    
	    // 모달이 사라질 때 z-index 값을 초기값으로 되돌림
	    const navbar = $(".sticky-top", parent.document);		// 클래스 .sticky-top 인 요소를 찾아 반환 (부모창에)
	    navbar.css("z-index", 1);								// z-index는 우선순위를 두는 코드이므로 네비게이션 바를 1로 두고 모달창을 0으로 둔다/
	    navbar.css("position", "sticky");						// 모달창을 키면서 네비게이션 바의 위치가 고정되어 있지 않았지만 네비게이션 바를 고정 시키기 위해 넣었다.
	    navbar.css("background-color", "#fff");					
	    
	    modal.css("z-index", 0);
	  }
	
	
	
function setaddress() {
	$("button#searchAddress").click(function() {
		
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('recipientPostcode').value = data.zonecode;
                document.getElementById("recipientAddress").value = addr;
            }
        }).open();
	
	});
	
}
</script>



<div class="layer-inner">
                <div class="layer-head">
                    <button type="button" class="approval-modal-close close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="layer-pop-title" id="popTitle">배송지 추가</h4>
                    
                </div>

                <div class="layer-content">
                    <div class="inner">
                        <div class="lineless-table type2">
                            <table>
                                <colgroup>
                                    <col style="width:70px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">받는분 <em class="es"><span class="blind">필수입력</span></em></th>
                                    <td>
                                        <input type="text" id="recipientName" name="recipientName" title="" class="input-text w-full removeEmoji" placeholder="받는 분 입력" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소 <em class="es"><span class="blind">필수입력</span></em></th>
                                    <td>
                                        <div class="input-group">
                                            <input type="text" id="recipientPostcode" name="vPostcd" title="" class="input-text" placeholder="우편번호" readonly="readonly" value="">
                                            <span class="input-group-btn">
												<button id="searchAddress" type="button" class="btn btn-outline-secondary">우편번호 찾기</button>
											</span>
                                        </div>
                                        <div class="input-group w-full">
                                            <input type="text" id="recipientAddress" name="recipientAddress" title="" class="input-text" placeholder="기본주소" readonly="readonly" value="">
                                        </div>
                                        <div class="input-group w-full">
                                            <input type="text" id="recipientDetailAddress" name="recipientDetailAddress" title="" class="input-text removeEmoji" placeholder="상세주소" value="" maxlength="80">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대폰 <em class="es"><span class="blind">필수입력</span></em></th>
                                    <td>
                                        <div class="input-group w-full">
                                            <div class="input-group-form">
                                                <input type="text" id="recipientMobile1" name="recipientMobile1" title="" class="input-text input-mobile" value="010" maxlength="3" readonly>
                                                <input type="text" id="recipientMobile2" name="recipientMobile2" title="" class="input-text input-mobile" value="" maxlength="4" onkeydown="return allowOnlyNumbers(event)" onkeyup="allowOnlyNumbers(event)">
                                                <input type="text" id="recipientMobile3" name="recipientMobile3"title="" class="input-text input-mobile" value="" maxlength="4" onkeydown="return allowOnlyNumbers(event)" onkeyup="allowOnlyNumbers(event)">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!--// layer-content -->

                <div class="layer-bottom">
                    <div class="btn-area">
                        <button type="button" class="btn btn-secondary approval-modal-close">취소</button>
                        <button type="button" id="changeDelivery" class="btn btn-dark">확인</button>
                    </div>
                </div><!--// layer-bottom -->

                
            </div>