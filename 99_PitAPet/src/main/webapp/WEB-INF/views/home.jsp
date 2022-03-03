<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${ path }/css/index.css" />
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/index.js"></script>
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
        <li data-menuanchor="section3"><a href="${ path }/community/community">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/logout">Logout</a></li>
      </ul>
      </c:if>
    </header>
    <main id="fullpage">
      <!-- Section 1 Title -->
      <section class="section">
        <div class="section__div">
          <div class="title__div title">Pit</div>
          <div class="title__div">
            <span class="title">&nbsp;A&nbsp;Pet</span>
          </div>
        </div>
      </section>
      <!-- Section 2 Announcement about Pit A Pet -->
      <section class="section">
        <div class="section__container">
          <p>WE ARE PIT A PET</p>
          <span>- Roger A. Caras -</span>
        </div>
      </section>
      <!-- Section 3 Page Description -->
      <section id="section" class="section">
        <div class="slide">
          <h2>Why Pit A Pet?</h2>
        </div>
        <div class="slide">
          <h2>As a friends</h2>
        </div>
        <div class="slide">
          <h2>Create better world for our Companion</h2>
        </div>
      </section>
      <!-- Section 4 Quotes -->
      <section class="section">
        <div class="section__container">
          <p>
            Pets have given us their absolute all<br />
            We are the center of their universe<br />
            We are the focus of their <strong>love</strong> and faith and trust<br />
            They serve us in return for scraps<br />
            It is without a doubt the best deal man has ever made<br />
          </p>
          <span>- Pit A Pet -</span>
        </div>
      </section>
      <!-- Section 5 About Us -->
      <section class="section">
        <h2>About Us</h2>
      </section>
    </main>
</body>
</html>
