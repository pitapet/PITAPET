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
    <link rel="stylesheet" href="${ path }/css/productList.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/productList.js"></script>

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
        <li data-menuanchor="section5"><a href="${ path }/logout">Logout</a></li>
      </ul>
      </c:if>
   </header>
   
   <main id="fullpage">
     <!-- Section 1 MyPage -->
    <section class="section">
    <main id="main">
      <section class="main__user">
        <div class="main__user__header">
          <p>관리자 계정으로 로그인 되었습니다.</p>
        </div>
        <div class="main__user__body">
          <div class="main__user__body__category">
            <button class="category board" onclick="location.href='../mypage.html';">게시글 관리</button>
            <button class="category cart active" onclick="location.href='${ path }/product/list/productInfo';">상품 관리</button>
            <button class="category prefernce" onclick="location.href='../profileEdit.html';">회원 관리</button>
          </div>

          <div class="main__user__body__product">
            <p>상품 관리</p>
            	<div class="product__page">
                  <a id="btn__product" href="${ path }/product/list/product">상품 카테고리</a>
                  <a id="btn__productInfo" href="${ path }/product/list/productInfo">상품 상세정보</a>
                </div>
              <div class="product__btn" id="btn__search">
                <span>상품명 : &nbsp;</span>
                <select name="selectTitle" id="selectTitle">
                  <option selected>------------</option>
                  <option value="footmat">FOOT MAT</option>
                </select>
                <button id="searchProduct">검색</button>
              </div>
              <div class="product__btn" id="btn__add">
              	<button id="btnAddProduct">카테고리 등록</button>
              </div>
              
            <table class="main__user__body__table">
              <thead>
                <tr>
                  <th class="table__no">카테고리 번호</th>
                  <th class="table__title">카테고리명</th>
                  <th class="table__content">카테고리 설명</th>
                  <th class="table__btn" colspan="2"></th>
                </tr>
              </thead>

              <c:if test="${ empty products }">
                <tbody class="table__tbody">
                  <tr>
                    <td colspan="6">조회된 상품이 없습니다.</td>
                  </tr>
                </tbody>
              </c:if>

              <c:if test="${ !empty products }">
              <tbody class="table__tbody">
                <c:forEach var="product" items="${ products }">
	                <tr>
	                  <td><!-- <input type="hidden" class="product__no" name="no" value="${ product.no }"> -->${ product.no }</td>
	                  <td>${ product.title }</td>
	                  <td>${ product.content }</td>
	                  <td><button type="button" class="btnUpdate" value="${ product.no }">수정</button></td>
                      <td><button type="button" class="btnDelete" value="${ product.no }">삭제</button></td>
	                  <!-- 
	                  <td class="product_icon"><img class="btnUpdate" src="${ path }/images/product/modify.png" onclick="location.href='${ path }/product/update?no=${ productInfo.no }'" alt=""></td>
	                  <td class="product_icon"><img class="btnDelete" src="${ path }/images/product/remove.png" alt=""></td>
	                   -->
	                </tr>
                </c:forEach>
              </tbody>
              </c:if>
            </table>

            <div id="pageBar">
              <!-- 맨 처음으로 -->
              <button class="setbutton" onclick="location.href='${ path }/product/list/product?page=1'">&lt;&lt;</button>

              <!-- 이전 페이지로 -->
              <button class="movebutton" onclick="location.href='${ path }/product/list/product?page=${ pageInfo.prevPage }'">&lt;</button>

              <!--  5개 페이지 목록 -->
              <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                <c:if test="${ status.current == pageInfo.currentPage }">
                  <button class="pagebutton" disabled>${ status.current }</button>
                </c:if>

                <c:if test="${ status.current != pageInfo.currentPage }">
                  <button class="pagebutton" onclick="location.href='${ path }/product/list/product?page=${ status.current }&count=${ pageInfo.listLimit }'">${ status.current }</button>
                </c:if>
              </c:forEach>

              <!-- 다음 페이지로 -->
              <button class="movebutton" onclick="location.href='${ path }/product/list/product?page=${ pageInfo.nextPage }'">&gt;</button>

              <!-- 맨 끝으로 -->
              <button class="setbutton" onclick="location.href='${ path }/product/list/product?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
            </div>

            
          </div>
        </div>
      </section>
    </main>
  </section>
</main>

</body>
</html>