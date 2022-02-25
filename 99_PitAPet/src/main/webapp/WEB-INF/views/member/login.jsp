<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pit A Pet</title>
    <meta name="description" content="Pit A Pet" />
    <meta name="author" content="fiveth" />
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/login.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/login.js" defer></script>
  </head>
  <body>
  <div id="container" class="container">
      <!-- FORM SECTION -->
      <div class="row">
        <!-- SIGN UP -->
        <div class="col align-items-center flex-col sign-up">
          <div class="form-wrapper align-items-center">
            <form class="form sign-up" name="memberEnrollFrm" action="${ pageContext.request.contextPath }/member/enroll" method="post">
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="id" id="newId" placeholder="아이디" required />
              </div>
              <input class="enroll__idcheck" type="button" id="checkDuplicate" value="중복검사" >
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="pass1" placeholder="비밀번호" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" id="pass2" placeholder="비밀번호 확인" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="name" id="name" placeholder="이름"  required />
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="nickname" id="nickname" placeholder="닉네임"  required />
              </div>
              <!-- <div class="input-group up">
                <i class="fas fa-images"></i>
                <input type="file" name="profile" id="profile" title="프로필사진" required />
              </div> -->
              <div class="input-group up">
                <i class="fas fa-mobile-alt"></i>
                <input type="tel" name="phone" id="phone" maxlength="11" placeholder="전화번호" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="이메일" required />
              </div>
              <div class="input-group up">
                <i class="fa-solid fa-paw"></i>
                <input type="text" name="pet" id="pet" placeholder="애완동물"  required />
              </div>
              <button class="btn sign-ups">회원가입</button>
              <p>
                <span> 이미 계정이 있으신가요? </span>
                <b onclick="toggle()" class="pointer"> 로그인 </b>
              </p>
              <p>
                <b onclick="location.href=${ path }/" style="cursor: pointer">메인으로 돌아가기</b>
              </p>
            </form>
          </div>
        </div>
        <!-- END SIGN UP -->
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in">
          <div class="form-wrapper align-items-center">
            <form action="${ path }/login" method="post" class="form sign-in">
              <div class="input-group in">
                <i class="fas fa-user"></i>
                <input type="text" name="id" id="id" value="" placeholder="아이디를 입력해주세요." />
              </div>
              <div class="input-group in">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="password" placeholder="패스워드를 입력해주세요." />
              </div>
              <div class="login__save">
                <input type="checkbox" name="saveId"/>
                <span>아이디 자동 저장</span>
              </div>
              <input class="btn sign-ins" type="submit" value="로그인"></input>
              <p>
                <b> 비밀번호를 잊으셨나요? </b>
              </p>
              <p>
                <span> 어랏, 계정이 없으신가요? </span>
                <b onclick="toggle()" class="pointer"> 회원가입 </b>
              </p>
              <p>
                <b onclick="location.href=${ path }/" style="cursor: pointer">메인으로 돌아가기</b>
              </p>
            </form>
          </div>
          <div class="form-wrapper"></div>
        </div>
        <!-- END SIGN IN -->
      </div>
      <!-- END FORM SECTION -->
      <!-- CONTENT SECTION -->
      <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
          <div class="text sign-in">
            <h2>Welcome</h2>
          </div>
          <div class="img sign-in"></div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
          <div class="img sign-up"></div>
          <div class="text sign-up">
            <h2>Be with us</h2>
          </div>
        </div>
        <!-- END SIGN UP CONTENT -->
      </div>
      <!-- END CONTENT SECTION -->
    </div>
  </body>
</html>