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
    <link rel="icon" type="image/png" sizes="152x152" href="../img/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/buy.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/buy.js"></script>
    
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
        <c:if test="${ loginMember.role == 'ROLE_ADMIN' }">
          <li data-menuanchor="section7"><a href="${ path }/product/list/product">Admin</a></li>
        </c:if>
      </ul>
      </c:if>
    </header>
    <main id="fullpage">
      <!-- Section 1 MyPage -->
      <section class="section">
        <main id="main">
          <section class="main__user">
            <div class="main__user__header">
              <div class="main__user__header__description">
                <p>${ loginMember.nickname }님 환영합니다.</p>
                <c:if test="${ loginMember.role == 'ROLE_USER' }">
                  <p>일반 회원</p>
                </c:if>
              </div>
            </div>
            <div class="main__user__body">
              <div class="main__user__body__category">
                <button class="category board" onclick="location.href='./mypage.html';">게시글 관리</button>
                <button class="category cart" onclick="location.href='${ path }/product/cart/list';">장바구니</button>
                <button class="category buy active" onclick="location.href='${ path }/product/buy/list';">구매목록</button>
                <button class="category prefernce" onclick="location.href='${ path }/member/passwordEdit';">비밀번호 변경</button>
                <button class="category prefernce" onclick="location.href='${ path }/member/petEdit';">애완동물 변경</button>
                <button class="category resign" onclick="location.href='${ path }/member/delete';">회원 탈퇴</button>
              </div>

              <div class="main__user__body__product">
                <p>구매 목록</p>
                <table class="main__user__body__table">
                  <thead>
                    <tr>
                      <th class="table__title">카테고리</th>
                      <th class="table__image">상품 사진</th>
                      <th class="table__color">색상</th>
                      <th class="table__price">상품 가격</th>
                      <th class="table__count">구매 수량</th>
                      <th class="table__amount">총 구매 금액</th>
                      <th class="table__date">구매 일자</th>
                    </tr>
                  </thead>

                  <c:if test="${ empty buyList }">
                    <tbody class="table__tbody">
                      <tr>
                        <td colspan="7">구매한 상품이 없습니다.</td>
                      </tr>
                    </tbody>
                  </c:if>
                  
                  <c:if test="${ !empty buyList }">
                  <tbody class="table__tbody">
                    <c:forEach var="buy" items="${ buyList }">
                    <tr>
                      <c:forEach var="productInfo" items="${ productInfoList }">
                        <c:if test="${ buy.productInfoNo == productInfo.no }">
                          <c:forEach var="product" items="${ productList }">
                            <c:if test="${ productInfo.productNo == product.no }">
		                      <td>${ product.title }</td>
                            </c:if>
                          </c:forEach>
                          <td><img class="product__img" src="${ path }/images/product/${ productInfo.renamedFileName }.png" alt=""></td>
		                  <td><button class="color__button" style="background-color: ${ productInfo.colorCode };"></button>
		                      ${ productInfo.colorName }</td>
	                      <td>${ productInfo.price } 원</td>
                        </c:if>
                      </c:forEach>
                      <td>${ buy.count } 개</td>
                      <td>${ buy.amount } 원</td>
                      <td>${ buy.buyDate }</td>
                    </tr>
                    </c:forEach>
                  </tbody>
                  </c:if>
                </table>

                <div id="pageBar">
                  <!-- 맨 처음으로 -->
                  <button class="setbutton" onclick="location.href='${ path }/product/buy/list?page=1'">&lt;&lt;</button>

                  <!-- 이전 페이지로 -->
                  <button class="movebutton" onclick="location.href='${ path }/product/buy/list?page=${ pageInfo.prevPage }'">&lt;</button>

                  <!--  5개 페이지 목록 -->
                  <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                    <c:if test="${ status.current == pageInfo.currentPage }">
                      <button class="pagebutton" disabled>${ status.current }</button>
                    </c:if>

                    <c:if test="${ status.current != pageInfo.currentPage }">
                      <button class="pagebutton" onclick="location.href='${ path }/product/buy/list?page=${ status.current }&count=${ pageInfo.listLimit }'">${ status.current }</button>
                    </c:if>
                  </c:forEach>

                  <!-- 다음 페이지로 -->
                  <button class="movebutton" onclick="location.href='${ path }/product/buy/list?page=${ pageInfo.nextPage }'">&gt;</button>

                  <!-- 맨 끝으로 -->
                  <button class="setbutton" onclick="location.href='${ path }/product/buy/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
                </div>

              </div>
            </div>
          </section>
        </main>
      </section>
    </main>
</body>
</html>