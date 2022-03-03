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
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/product.js"></script>
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
        <li data-menuanchor="section3"><a href="${ path }/community/community">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/member/login">Login</a></li>
      </ul>
      </c:if>
      <!-- 로그인 후 버튼들 -->
      <c:if test="${ !empty loginMember }">
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/community">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/logout">Logout</a></li>
      </ul>
      </c:if>
    </header>
    <main id="fullpage">
      <!-- Section 1 Title -->
      <section class="section">
        <img src="${ path }/images/product/logo/logo.png" alt="production" />
        <p>“We do not need magic to change the world, we carry all the power we need inside ourselves already: we have the power to imagine better.”<br />- J.K. Rowling</p>
        <i class="fa-solid fa-angles-down"></i>
      </section>
      <!-- Section 2 Products -->
      <section class="section">
        <div class="products__wrapper">
          <div class="product__img__wrapper">
            <c:forEach var="productInfo" items="${ product.productInfoes }">
              <img class="product__img" name="imageName" src="${ path }/images/product/${ productInfo.imageName }.png" alt="product__prototype" />
            </c:forEach>
          </div>
          <div class="product__useable">
            <div class="product__description">
              <input type="hidden" name="no" value = "${ product.no }">
              <h2>${ product.title }</h2>
              <p>${ product.content }</p>
              <p id="price">${ product.price }원</p>
            </div>
            <div class="product__color">
            <p>색상</p>
            <c:forEach var="productInfo" items="${ product.productInfoes }">
	            <button style="background-color: ${ productInfo.colorCode };"></button>
            </c:forEach>
            </div>
            <div class="product__form">
              <!-- <button id="productCheck">Buy</button> -->
              <button id="purchase">Buy</button>
              <button>Cart</button>
            </div>
          </div>
        </div>
        
        <div class="product__add">
          <button onclick="location.href='${ path }/product/add'">등록하기</button>
        </div>
      </section>
    </main>
</body>
</html>