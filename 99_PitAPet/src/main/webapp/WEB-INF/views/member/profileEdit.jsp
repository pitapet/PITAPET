<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pit A Pet</title>
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/profileEdit.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/profileEdit.js"></script>
  </head>
  <body>
    <header id="header">
      <logo class="header__logo">
        <img src="img/logo.png" alt="logo" class="logo__img" />
      </logo>
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/list">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section4"><a href="${ path }/member/mypage">Mypage</a></li>
        <li data-menuanchor="section5"><a href="${ path }/logout">Logout</a></li>
      </ul>
    </header>
    <main id="fullpage">
      <!-- Section 1 MyPage -->
      <section class="section">
        <main id="main">
          <section class="main_user">
            <form class="form sign-up" name="memberEnrollFrm" action="" enctype="multipart/form-data" method="post">
              <img class="profileimage" src="./img/profile.jpg" />
              <div class="filebox">
                <label for="ex_file">이미지 변경</label>
                <input type="file" name="profile" id="ex_file" title="프로필사진" value="" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="userId" id="newId" placeholder="아이디" value="" readonly required />
              </div>
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" name="userPwd" id="pass1" placeholder="비밀번호" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" id="pass2" placeholder="비밀번호 확인" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="userName" id="userName" placeholder="이름" value="" readonly required />
              </div>
              <div class="input-group up">
                <i class="fas fa-mobile-alt"></i>
                <input type="tel" name="phone" id="phone" maxlength="11" placeholder="전화번호" value="" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="이메일" value="" required />
              </div>
              <button class="btn sign-ups">정보수정</button>
            </form>
          </section>
        </main>
      </section>
    </main>
  </body>
</html>