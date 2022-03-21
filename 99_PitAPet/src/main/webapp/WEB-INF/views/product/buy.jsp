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
        <img src="img/logo.png" alt="logo" class="logo__img" />
      </logo>
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="index.html">Home</a></li>
        <li data-menuanchor="section2"><a href="product.html">Product</a></li>
        <li data-menuanchor="section3"><a href="community.html">Community</a></li>
        <li data-menuanchor="section4"><a href="organization.html">Organization</a></li>
        <li data-menuanchor="section5"><a href="login.html">Login</a></li>
      </ul>
    </header>
    <main id="fullpage">
      <!-- Section 1 MyPage -->
      <section class="section">
        <main id="main">
          <section class="main__user">
            <div class="main__user__header">
              <img class="main__user__header__profile" src="" alt="" />
              <div class="main__user__header__description">
                <p>${ loginMember.name }님 환영합니다.</p>
                <c:if test="${ loginMember.role == 'ROLE_USER' }">
                  <p>일반 회원</p>
                </c:if>
              </div>
            </div>
            <div class="main__user__body">
              <div class="main__user__body__category">
                <button class="category board" onclick="location.href='./mypage.html';">게시글 관리</button>
                <button class="category cart active" onclick="location.href='${ path }/product/cart/list';">장바구니</button>
                <button class="category prefernce" onclick="location.href='./profileEdit.html';">정보 수정</button>
                <button class="category resign" onclick="location.href='${ path }/';">회원 탈퇴</button>
              </div>

              <div class="main__user__body__product">
                <p>구매 목록</p>
                <table class="main__user__body__table">
                  <thead>
                    <tr>
                      <th class="table__image"></th>
                      <th class="table__title">상품 카테고리</th>
                      <th class="table__color">색상</th>
                      <th class="table__price">가격</th>
                      <th class="table__count">수량</th>
                    </tr>
                  </thead>

                  <c:if test="${ empty buyList }">
                    <tbody class="table__tbody">
                      <tr>
                        <td colspan="5">구매한 상품이 없습니다.</td>
                      </tr>
                    </tbody>
                  </c:if>
                  
                  <c:if test="${ !empty buyList }">
                  <tbody class="table__tbody">
                    <c:forEach var="buy" items="${ buyList }">
                    <tr>
                      <c:forEach var="productInfo" items="${ productInfoList }">
                        <c:if test="${ buy.productInfoNo == productInfo.no }">
                          <td><img alt="" src=""></td>
                          <c:forEach var="product" items="${ productList }">
                            <c:if test="${ productInfo.productNo == product.no }">
		                      <td>${ product.title }</td>
                            </c:if>
                          </c:forEach>
		                  <td>${ productInfo.colorName }</td>
	                      <td>${ productInfo.price }</td>
                        </c:if>
                      </c:forEach>
                      <td>${ buy.count }개</td>
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