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
    <link rel="icon" type="image/png" sizes="152x152" href="img/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/find.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/find.js" defer></script>
  </head>
  <body>
  <div id="container" class="container">
      <!-- FORM SECTION -->
      <div class="row">
        <!-- SIGN UP -->
        <div class="col align-items-center flex-col sign-up">
          <div class="form-wrapper align-items-center">
            <form class="form sign-up" id="dofindId" action="${ path }/member/dofindId" method="post">
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="name" id="name" placeholder="이름을 입력해주세요."  required />
              </div>
              <div class="input-group up">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요." required />
              </div>
              <input type="submit" class="btn sign-ups" id="idSearch" value="아이디찾기"> 
              <p>
                <b onclick="toggle()" class="pointer"> 비밀번호가 기억 안나신다면! </b>
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
            <form id="dofidnPw" action="${ path }/member/dofindPw" method="post" class="form sign-in">
              <div class="input-group in">
                <i class="fas fa-user"></i>
                <input type="text" name="id" id="id" value="" placeholder="아이디를 입력해주세요." required />
              </div>
              <div class="input-group up">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required />
              </div>

              <input class="btn sign-ins" type="submit" value="비밀번호 찾기"></input>
              <p>
                <b><a href="${ path }/member/login"> 로그인 페이지로 돌아가기 </a></b>
              </p>
              <p>
                <b onclick="toggle()" class="pointer"> 아이디가 기억 안나신다면! </b>
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
            <h2>비밀번호 찾기</h2>
          </div>
          <div class="img sign-in"></div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
          <div class="img sign-up"></div>
          <div class="text sign-up">
            <h2>아이디 찾기</h2>
          </div>
        </div>
        <!-- END SIGN UP CONTENT -->
      </div>
      <!-- END CONTENT SECTION -->
    </div>
  </body>
</html>