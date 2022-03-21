<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pit A Pet</title>
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/product.css" />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.bxslider.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/product.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- iamport.payment.js 
    -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
</head>
<body>
	<header id="header">
      <logo class="header__logo">
        <img src="${ path }/images/logo.png" alt="logo" class="logo__img" />
      </logo>
      <!-- 로그인 전 버튼들 -->
      <c:if test="${ empty loginMember }">
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/list">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/member/login">Login</a></li>
      </ul>
      </c:if>
      <!-- 로그인 후 버튼들 -->
      <c:if test="${ !empty loginMember }">
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/list">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/member/mypage">Mypage</a></li>
        <li data-menuanchor="section6"><a href="${ path }/logout">Logout</a></li>
      </ul>
      </c:if>
    </header>
    <main id="fullpage">
      <!-- Section 1 Title -->
      <section class="section">
        <div class="husky">
          <div class="mane">
            <div class="coat"></div>
          </div>
          <div class="body">
            <div class="head">
              <div class="ear"></div>
              <div class="ear"></div>
              <div class="face">
                <div class="eye"></div>
                <div class="eye"></div>
                <div class="nose"></div>
                <div class="mouth">
                  <div class="lips"></div>
                  <div class="tongue"></div>
                </div>
              </div>
            </div>
            <div class="torso"></div>
          </div>
          <div class="legs">
            <div class="front-legs">
              <div class="leg"></div>
              <div class="leg"></div>
            </div>
            <div class="hind-leg"></div>
          </div>
          <div class="tail">
            <div class="tail">
              <div class="tail">
                <div class="tail">
                  <div class="tail">
                    <div class="tail">
                      <div class="tail"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="position: absolute">
          <defs>
            <filter id="squiggly-0">
              <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="0" />
              <feDisplacementMap id="displacement" in="SourceGraphic" in2="noise" scale="2" />
            </filter>
            <filter id="squiggly-1">
              <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="1" />
              <feDisplacementMap in="SourceGraphic" in2="noise" scale="3" />
            </filter>

            <filter id="squiggly-2">
              <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="2" />
              <feDisplacementMap in="SourceGraphic" in2="noise" scale="2" />
            </filter>
            <filter id="squiggly-3">
              <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="3" />
              <feDisplacementMap in="SourceGraphic" in2="noise" scale="3" />
            </filter>

            <filter id="squiggly-4">
              <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="4" />
              <feDisplacementMap in="SourceGraphic" in2="noise" scale="1" />
            </filter>
          </defs>
        </svg>
        <i class="fa-solid fa-angles-down"></i>
      </section>
      <!-- Section 2 Products -->
      <section class="section">
      <c:forEach var="product" items="${ products }">
      <div class="slide">
        <div class="products__wrapper">
          <div class="product__img__wrapper">
            <div class="bxslider">
              <c:forEach var="productInfo" items="${ product.productInfoes }">
                <div>
                  <img class="product__img" name="renamedFileName" src="${ path }/images/product/${ productInfo.renamedFileName }.png" alt="product__prototype" />
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="product__useable">
            <div class="product__description">
              <input type="hidden" name="no" value="${ product.no }">
              <h2>${ product.title }</h2>
              <p>${ product.content }</p>
            </div>
            <div class="product__color">
	          <p>색상</p>
		        <div id="bx-pager">
		          <c:forEach var="productInfo" items="${ product.productInfoes }" varStatus="status">
			        <button id="colorBtn${ status.index }" style="background-color: ${ productInfo.colorCode };"></button>
		          </c:forEach>
		        </div>
            </div>
            <div class="product__form">
              <div class="selectColorCount">
                <form id="addCartFrm" action="${ path }/product/cart/add" method="post">
	              <select name="productInfoNo" id="selectProductInfo">
	                <c:forEach var="productInfo" items="${ product.productInfoes }">
	                  <option value="${ productInfo.no }">${ productInfo.colorName } (${ productInfo.price } 원)</option>
	                </c:forEach>
	              </select>
                  <input type="number" class="product__input" name="count" id="count" value="1"/> 개
                  <input type="submit" id="btnCart" class="btnCart" value="Cart"/>
                </form>
                <c:forEach var="productInfo" items="${ product.productInfoes }">
	             <input type="hidden" class="product__input" name="price" id="${ productInfo.no }" value="${ productInfo.price }"/>
                </c:forEach>
	             <input type="hidden" name="memberNo" id="memberNo" value="${ loginMember.no }"/>
	             <input type="hidden" name="name" id="name" value="${ loginMember.name }"/>
	             <input type="hidden" name="email" id="email" value="${ loginMember.email }"/>
	             <input type="hidden" name="phone" id="phone" value="${ loginMember.phone }"/>
                 <button class="btnBuy">Buy</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>
      </section>
    </main>
    <script>
    $(document).ready(function(){
        var IMP = window.IMP;
        var code = "imp49883029"; // 가맹점 식별코드
        IMP.init(code);

        $(".btnBuy").on('click', () => {
        	// 셀렉트한 상품번호, 가격 가져오기
        	var productInfoNo = $("#selectProductInfo option:selected").val();
       		var price = $('input[id=' + productInfoNo + ']').val();
        	var count = $('input[name=count]').val();
    	    var amount = (price * count);
    	    
        	var memberNo = $('input[name=memberNo]').val();
        	var name = $('input[name=name]').val();
        	var email = $('input[name=email]').val();
        	var phone = $('input[name=phone]').val();
        	
            // 결제 요청
            IMP.request_pay({
                pg : 'kakao',
                pay_method : 'card', 
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : productInfoNo,
                amount : amount,
                buyer_email : email,
                buyer_name : name,
                buyer_tel : phone
            }, function(rsp) {
                if (rsp.success) {
                    alert("결제가 완료되었습니다.");
                    console.log(rsp);

                    //var result = {
                    //    "imp_uid" : rsp.imp_uid,
                    //    "merchant_uid" : rsp.merchant_uid,
                    //    "biz_email" : rsp.buyer_email,
                    //    "pay_date" : new Date().getTime(),
                    //    "amount" : rsp.amount,
                    //    "card_no" : rsp.card_no
                    //}
                    
                    var data = {
                    	"productInfoNo" : productInfoNo,
    					"memberNo" : memberNo,
    					"count" : count,
    					"amount" : amount
                    }

                    console.log("결제 성공" + data.productInfoNo);

                    $.ajax({
                        url : 'http://localhost:8088/pitapet/product/buy/add',
                        type : 'POST',
                        data : data,
                        success : function(result){
    	                    var rs = confirm("상품을 구매하였습니다. 구매 목록을 확인하시겠습니까?");
    	                    if(rs){
    	                    	location.replace("http://localhost:8088/pitapet/product/buy/list");
    	                    } else {
    	                    	location.replace("http://localhost:8088/pitapet/product/product");
    	                    }
                        },
                        error : function(){
                            console.log("상품 구매에 실패하였습니다. 다시 시도해주세요.");
                        }
                    }) // ajax
                
                } else {
                    alert("결제에 실패하였습니다.");
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
	                console.log(msg);
	                location.replace("http://localhost:8088/pitapet/product/product");
                }
            
            }); // pay
        }); // btn click
    });// document ready

    </script>
</body>
</html>