<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/views/header-final.jsp"/>

<style type="text/css"> 
	
	* {
		font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
	}
	
	li {
		list-style: none;
	}
	
	
	
	
	
	#cart_option button {
	background:#fff; color:#333; border:1px solid #ccc;
	}
	
	
	ul#cart_firstul {
		padding: 0;
	}
	
	
	
	 
	
    
    
    /* Checkbox Customizing */
    .custom-checkbox input[type="checkbox"]:checked+.custom-control-label::before {
      background-color: #fd6f06;
      border-color: #fd6f06;
    }

    .custom-checkbox input[type="checkbox"]:checked+.custom-control-label::after {
      color: white;
    }
    
    /* X shape button */
    .cross-button {
      cursor: pointer;
      color: #000;
      font-size: 18px;
      margin-left: 10px;
    }
    
    
    /* prod box area */
    
	.product-info-container{border-top:solid 1px #E0E0E0;}
	
    .product-info-box {
    	margin:0;
		padding-top: 20px;
 		
 		border-bottom: solid 1px #E0E0E0;
 		border-left: solid 1px #E0E0E0;
 		border-right: solid 1px #E0E0E0;
	}
	
    
    .prod-bottom-box {
    	margin:0;
	    text-align: center;
		height: 40px;
    	background-color: #F8F8F8;
    	
    }
    .prod-bottom-box .price-txt .num{font-size:14px;}
	.prod-bottom-box .price-txt .num-total{font-weight:700; font-size:16px}
    .prod-bottom-box .price-txt{margin-top: 8px; color:#333; font-size:13px;}
	.prod-bottom-box .price-txt .txt{color:#666}
    .prod-top-box {margin: 0; padding-bottom: 20px;}
    
    .prod-cart-img {
		width: 110px;
		height: 110px;
		position: relative;
	}
	
	/* quantity input element */
    .quantity-input-container {
      display: flex;
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 2px;
      
      width: 80px;
      height: 30px; 
    }

    .quantity-minus {
      cursor: pointer;
      padding: 2px;
    }

    .quantity-plus {
      cursor: pointer;
      padding: 2px;
    }

    .quantity-input {
      width: 100%;
      flex: 1;
      text-align: center;
      border: none;
    } /* quantity input element */
	
	.prod-info-description {margin-left: 20px;}
	.prod-info-description .text {color:#333;} 
	.prod-total-price {padding-left: 50px; text-align: right;}   /* prod box area */
    
	
	.order-button {
      display: block;
      width: 100%;
      padding: 10px 20px;
      margin: 20px 0;
      background-color: #FF7E32;
      color: #fff;
      font-size: 24px;
      font-weight: 700;
      text-align: center;
      border-radius: 5px;
      transition: background-color 0.3s ease-in-out;
      border: solid 1px #ff7e32;
    }

    .order-button:hover {
      background-color: #e35f0a;
    }
    
    /* total box */
    .cart-total-box dl {margin: 0; padding: 0;}
    .cart-total-box dt, .cart-total-box dd {color:#333;}
    .cart-total-box { border: 1px solid #000;}
    .no-spacing > div {padding-right: 0; padding-left: 0;}
    .price-info {border-right: 1px solid #000;}
	
	.price-info:after {
    position: absolute;
    top: 36px;
    right: -16px;
    content: '';
    width: 32px;
    height: 32px;
    background: url(https://www.rankingdak.com/resources/pc/images/icon/ico_bullet.png) 0 -60px;
	}
	.cart-total-box .col-sm-3:nth-child(1) .price-info:after{background-position:-190px -60px}
	.cart-total-box .col-sm-3:nth-child(3) .price-info:after{background-position:-50px -60px}
	.cart-total-box .col-sm-3 span{font-size: 20pt; font-weight: 700;}
	.cart-total-box .col-sm-3 .price-total-info span{color:#ff7e32;}
	
	
	.checkbox-col{margin-left: 20px;}
</style>
    




	<div class="container">
		<div id="cart_title_page" class="mt-4 mb-4">
			<h3 class="font-weight-bold">장바구니</h3>
		</div> 
		
		<div id="cart_option" class="row">
			<div class="col-2">
				<div class="custom-control custom-checkbox">
			      <input type="checkbox" class="custom-control-input" id="selectAll">
			      <label class="custom-control-label" for="selectAll"></label>
			      <span class="h6"> 전체해제</span>
			    </div>
			</div>
			<div class="offset-9">
				<button type="button" id="del-cart-selected" class="btn">
					<span>선택삭제</span>
				</button>
			</div>
		</div>
	
		
		
		<div id="cart_main">
					<div class="product-info-container mt-4">
						<div class="product-info-box row">
							<div class="col-12 prod-top-box row"> 
								<div class="align-self-center checkbox-col">
									<div class="custom-control custom-checkbox">
								      <input type="checkbox" class="custom-control-input" id="cart-item-1">
								      <label class="custom-control-label" for="cart-item-1"></label>
									</div>
								</div>
								
								<div>
								    <img class="prod-cart-img" src="../images/Chicken.png">
								</div>
								
								<div class="col-5 prod-info-description mr-4">
									<a href="#" class="text">[맛있닭] 소스 닭가슴살·오븐구이 10+3 or 12+3</a>  <!-- 여기 부분은 링크 로 넘어갈수 있기 때문에 값이 변경되어야 한다. -->
									<p class="tit text">오븐구이 혼합 10팩 ★한입소스 3팩증정★</p>
									<ul style="padding: 0" class="h6">
										<li>
											<span class="text">27,000</span>원     <!-- 여기도 받아온 값으로 변경해야 하는 부분  -->
										</li>
									</ul>
								</div>
								
								<div class="quantity-input-container align-self-center ml-4">
							   		 <span class="quantity-minus"><i class="fa-solid fa-minus"></i></span>
							    	 <input type="text" class="quantity-input" value="1">
							    	 <span class="quantity-plus"><i class="fa-solid fa-plus"></i></span>
							    </div>
								
								
								<div class="align-self-center prod-total-price">
									<span class="h6">21,270,000</span>원	
								</div>
								
								<div id="cart_main_point" class="align-self-center mx-4">
									<span>21,270P</span>
								</div>
								<div class="align-self-center ml-4">
									<i class="fa fa-times cross-button align-self-center"></i>
								</div>
							</div>
							<div class="col-sm-12 prod-bottom-box">
								<p class="price-txt">
	                               <span class="txt">상품</span>
	                               <span class="num">73,800</span>원
	                               - <span class="txt">할인</span>
	                               <span class="num discount">0</span>원
	                               = <span class="num-total">73,800</span>원
	                           </p>
							</div>
						</div>
						
						
						
						
						<!-- 추가적으로 장바구니에 더 담아 왔을시 추가하는 부분이다 위와 코드는 같다.  -->
						<div class="product-info-box row">
							<div class="col-12 prod-top-box row"> 
								<div class="align-self-center checkbox-col">
									<div class="custom-control custom-checkbox">
								      <input type="checkbox" class="custom-control-input" id="cart-item-2">
								      <label class="custom-control-label" for="cart-item-2"></label>
									</div>
								</div>
								
								<div>
								    <img class="prod-cart-img" src="../images/Chicken.png">
								</div>
								
								<div class="col-5 prod-info-description mr-4">
									<a href="#" class="text">[맛있닭] 소스 닭가슴살·오븐구이 10+3 or 12+3</a>  <!-- 여기 부분은 링크 로 넘어갈수 있기 때문에 값이 변경되어야 한다. -->
									<p class="tit text">오븐구이 혼합 10팩 ★한입소스 3팩증정★</p>
									<ul style="padding: 0" class="h6">
										<li>
											<span class="text">27,000</span>원     <!-- 여기도 받아온 값으로 변경해야 하는 부분  -->
										</li>
									</ul>
								</div>
								
								<div class="quantity-input-container align-self-center ml-4">
							   		 <span class="quantity-minus"><i class="fa-solid fa-minus"></i></span>
							    	 <input type="text" class="quantity-input" value="1">
							    	 <span class="quantity-plus"><i class="fa-solid fa-plus"></i></span>
							    </div>
								
								
								<div class="align-self-center prod-total-price">
									<span class="h6">1,327,000</span>원	
								</div>
								
								<div id="cart_main_point" class="align-self-center mx-4">
									<span>0P</span>
								</div>
								<div class="align-self-center ml-4">
									<i class="fa fa-times cross-button align-self-center"></i>
								</div>
							</div>
							<div class="col-sm-12 prod-bottom-box">
								<p class="price-txt">
	                               <span class="txt">상품</span>
	                               <span class="num">73,800</span>원
	                               - <span class="txt">할인</span>
	                               <span class="num discount">0</span>원
	                               = <span class="num-total">73,800</span>원
	                           </p>
							</div>
						</div>
						<div class="product-info-box row">
							<div class="col-12 prod-top-box row"> 
								<div class="align-self-center checkbox-col">
									<div class="custom-control custom-checkbox">
								      <input type="checkbox" class="custom-control-input" id="cart-item-3">
								      <label class="custom-control-label" for="cart-item-3"></label>
									</div>
								</div>
								
								<div>
								    <img class="prod-cart-img" src="../images/Chicken.png">
								</div>
								
								<div class="col-5 prod-info-description mr-4">
									<a href="#" class="text">[맛있닭] 소스 닭가슴살·오븐구이 10+3 or 12+3</a>  <!-- 여기 부분은 링크 로 넘어갈수 있기 때문에 값이 변경되어야 한다. -->
									<p class="tit text">오븐구이 혼합 10팩 ★한입소스 3팩증정★</p>
									<ul style="padding: 0" class="h6">
										<li>
											<span class="text">27,000</span>원     <!-- 여기도 받아온 값으로 변경해야 하는 부분  -->
										</li>
									</ul>
								</div>
								
								<div class="quantity-input-container align-self-center ml-4">
							   		 <span class="quantity-minus"><i class="fa-solid fa-minus"></i></span>
							    	 <input type="text" class="quantity-input" value="1">
							    	 <span class="quantity-plus"><i class="fa-solid fa-plus"></i></span>
							    </div>
								
								
								<div class="align-self-center prod-total-price mx-2">
									<span class="h6">27,000</span>원	
								</div>
								
								<div id="cart_main_point" class="align-self-center mx-4">
									<span>0P</span>
								</div>
								<div class="align-self-center ml-4">
									<i class="fa fa-times cross-button align-self-center"></i>
								</div>
							</div>
							<div class="col-sm-12 prod-bottom-box">
								<p class="price-txt">
	                               <span class="txt">상품</span>
	                               <span class="num">73,800</span>원
	                               - <span class="txt">할인</span>
	                               <span class="num discount">0</span>원
	                               = <span class="num-total">73,800</span>원
	                           </p>
							</div>
						</div>
					</div><!-- Product info box-->
					
		
			
			<div class="container mt-5 cart-total-box">
			  <div class="row no-spacing">
			    <div class="col-sm-3">
			      <div class="text-center p-3 price-info">
			        <dl>
			          <dt>상품 금액</dt>
			          <dd><span>89,700</span>원</dd>
			        </dl>
			      </div>
			    </div>
			    <div class="col-sm-3">
			      <div class="text-center p-3 price-info">
			        <dl>
			          <dt>할인금액</dt>
			          <dd><span>0</span>원</dd>
			        </dl>
			      </div>
			    </div>
			    <div class="col-sm-3">
			      <div class="text-center p-3 price-info">
			        <dl>
			          <dt>배송비</dt>
			          <dd><span>3,000</span>원</dd>
			        </dl>
			      </div>
			    </div>
			    <div class="col-sm-3">
			      <div class="text-center p-3 price-total-info">
			        <dl>
			          <dt>총 결제금액</dt>
			          <dd><span>89,700</span>원</dd>
			        </dl>
			      </div>
			    </div>
			  </div>
			</div>
			
			<div id="order">
			<button class="order-button">
		      <span>39,600원 주문하기</span>
		    </button>
			</div>
			
		</div>
	
	</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>