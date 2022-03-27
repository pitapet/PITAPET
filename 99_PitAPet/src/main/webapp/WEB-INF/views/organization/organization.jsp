<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
String a = request.getParameter("search_here");
String result = String.format("%s", a);

%>

<c:set var="path" value="${ pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Pit A Pet</title>
<link rel="icon" type="image/png" sizes="152x152"
   href="${ path }/images/logo.png" />

<link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
<link rel="stylesheet" href="${ path }/css/organization.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/91b5983e4b.js"
   crossorigin="anonymous"></script>
<script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
<script src="${ path }/js/plugin/jquery.fullPage.js"></script>
<script src="${ path }/js/organization.js"></script>
<style>

/* CSS 주석 */
#id1 {
   width: 500px;
   height: 50px;
   border-radius: 20px;
}

.organization {
   text-align: left;
}

/*개*/

/* Global */
:root {
  /* Color */
  --color-white: #ffffff;
  --color-light-white: #e1e2e1;
  --color-dark-white: #bdbdbd;
  --color-pink: #fe918d;
  --color-purple: #8c52ff;
  --color-dark-pink: #ff6863;
  --color-dark-grey: #4d4d4d;
  --color-grey: #616161;
  --color-light-grey: #7c7979;
  --color-blue: #0288d1;
  --color-dark-blue: #005b9f;
  --color-light-blue: #5eb8ff;
  --color-yellow: #fff7d1;
  --color-orange: #feb546;
  --color-black: #000000;
  --color-green: #00695c;
  --color-dark-green: #002232;
  --color-light-green: #4e7589;
  --color-bg-green: #20495c;

  /* Font size */
  --font-large: 48px;
  --font-medium: 28px;
  --font-regular: 18px;
  --font-small: 16px;
  --font-micro: 14px;

  /* Font weight */
  --weight-bold: 700;
  --weight-semi-bold: 600;
  --weight-regular: 400;

  /* Size */
  --size-border-radius: 4px;

  /* Annimation */
  --animation-duration: 300ms;

  /* dog */
  --color-fur: #ffb141;
  --color-fur-dark: #F5832C;
  --color-spot: #F9584C;
  --color-snout: #544258;
  --color-collar: #3EAB6C;
  --duration: .7s;
  --semi-duration: calc(var(--duration) / 2);
  --easing: cubic-bezier(.5, 0, .5, 1);
  --stagger: calc(-1 * var(--semi-duration) / 2);
}

@import url("https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap");

* {
  box-sizing: border-box;
  margin: 0px;
  padding: 0px;
}

html {
  opacity: 0;
}

ul {
  padding-left: 0;
}

li {
  list-style: none;
}

a:link,
a:visited,
a:active {
  text-decoration: none;
  color: var(--color-black);
}

.fp-prev {
  margin-left: 40px;
}

.fp-next {
  margin-right: 40px;
}

body {
  font-family: "Gowun Dodum", sans-serif;
  position: relative;
  text-align: center;
  overflow: hidden;
}

#fullpage {
  text-align: center;
}

html,
body,
#fullpage,
.section,
.slide,
.fp-tableCell {
  height: 100vh;
  width: 100vw;
  background-color: #f2f2f2;
}

#header {
  position: fixed;
  display: flex;
  justify-content: space-between;
  height: 50px;
  width: 100%;
  top: 0;
  padding: 40px;
  z-index: 100;
  background: transparent;
}

.header__logo {
  display: flex;
  align-items: center;
}

.logo__img {
  width: 30px;
}

.header__menu {
  display: flex;
  align-items: center;
  font-size: var(--font-medium);
}

.header__menu li {
  margin: 0 15px;
  list-style: none;
}

i {
  position: absolute;
  top: 85%;
  font-size: 40px;
  color: rgba(0, 0, 0, 0.5);
  animation: upDown 1.4s infinite ease-in-out alternate;
}

@keyframes upDown {
  from {
    transform: translatey(0px);
  }
  to {
    transform: translatey(-20px);
  }
}

.section__wrapper {
  display: grid;
  max-width: 95%;
  margin: auto;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  justify-content: center;
  align-items: center;
  
}

.organazation {
  display: flex;
  gap: 20px;
}

.organazation__description span {
  font-size: 20px;
}

.section__container {
  scrollbar-width: none; /* — Firefox */
}

.section__container::-webkit-scrollbar {
  display: none; /* Chrome, Safari, Opera*/
}

}

/* 이하 강아지 움짤 css */
*, *:before, *:after {
  animation-timing-function: var(--easing) !important;
}

[class=🐕] {
  z-index: 1;
  height: 300px;
  width: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: auto;
}

[class=🐕] * {
  position: absolute;
  will-change: transform;
}

[class=🐕]:before {
  content: "";
  position: absolute;
  bottom: 13.3333333333%;
  left: 0;
  width: 100%;
  height: 3.3333333333%;
  background-color: #D3D1D1;
  border-radius: 2px;
  animation: shadow calc(1 * var(--semi-duration)) infinite;
}

@keyframes shadow {
  from, to {
    transform: scaleX(0.75);
  }
  45%, 55% {
    transform: scaleX(0.5);
  }
}

.neck {
  width: 50%;
  height: 100px;
  right: -5px;
  bottom: calc(100% - 10px);
  transform-origin: center bottom;
  transform: rotate(15deg);
  z-index: 2;
}

.neck > .fur {
  border-bottom-left-radius: 10px;
  height: 100%;
  width: 100%;
}

.neck > .fur:before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  height: 50px;
  width: 100%;
  background-color: var(--color-fur-dark);
  z-index: 1;
  transform-origin: right bottom;
  transform: rotate(15deg);
}

.collar {
  width: calc(100% + 10px);
  height: 15%;
  background-color: var(--color-collar);
  left: -5px;
  bottom: 30px;
  border-radius: 5px;
  animation: collar var(--semi-duration) calc(var(--semi-duration) / 4) infinite;
  z-index: 2;
}

@keyframes collar {
  from, to {
    transform: none;
  }
  50% {
    transform: translateY(-25%);
  }
}

.collar:after {
  content: "";
  width: 18%;
  height: 120%;
  border-radius: 50%;
  background: var(--color-snout);
  position: absolute;
  right: 0%;
  top: 110%;
  transform-origin: center top;
  animation: tag var(--semi-duration) infinite both;
}

@keyframes tag {
  from, to {
    transform: rotate(-15deg);
  }
  50% {
    transform: rotate(-15deg) scaleY(1.5);
  }
}

.head {
  height: 80%;
  width: 145%;
  left: -2%;
  bottom: 50%;
  transform-origin: left center;
  z-index: 2;
  animation: head var(--semi-duration) calc(var(--semi-duration) / 4) infinite;
}

@keyframes head {
  from, to {
    transform: rotate(-10deg);
  }
  50% {
    transform: rotate(-15deg);
  }
}

.head > .fur {
  height: 100%;
  width: 100%;
  border-bottom-right-radius: 80px;
}

.head > .fur:before {
  content: "";
  position: absolute;
  top: -80%;
  left: -30%;
  width: 100%;
  height: 0;
  padding-top: 100%;
  background-color: var(--color-spot);
  z-index: 1;
  border-radius: 50%;
}

.snout {
  --color: var(--color-snout);
  width: 25%;
  height: 0;
  padding-top: 25%;
  background-color: var(--color);
  top: 0;
  right: -5px;
  border-bottom-left-radius: 100%;
  z-index: 1;
}

.ears {
  bottom: 40%;
  height: 100%;
  width: 30%;
  left: 0;
  z-index: -1;
}

.ear {
  --color: var(--color-spot);
  width: 100%;
  height: 100%;
  bottom: 0;
  left: 0;
  transform-origin: left bottom;
  transform: rotate(-10deg);
  animation: ear-front calc(var(--duration) / 2) infinite;
}

@keyframes ear-front {
  50% {
    transform: rotate(-15deg);
  }
}

.ear:before {
  content: "";
  position: absolute;
  height: 25px;
  width: 15px;
  z-index: 2;
  top: -2px;
  right: -7px;
  border-top-left-radius: 100%;
  border-width: 2px;
  border-color: transparent;
  border-style: solid;
  border-left: 2px solid var(--color-snout);
  transform-origin: bottom left;
  animation: ear-mark var(--semi-duration) calc(-1 * var(--semi-duration)) infinite;
}

@keyframes ear-mark {
  from, to {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(25deg);
  }
}

.ear > .fur {
  border-top-left-radius: 100%;
  height: 100%;
  width: 100%;
}

.ear:nth-child(2) {
  left: 15px;
  bottom: 5px;
  transform: rotate(-5deg);
  --color: var(--color-fur);
  z-index: -1;
  animation: ear-back calc(var(--duration) / 2) infinite both;
}

@keyframes ear-back {
  from, to {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(-10deg);
  }
}

.eye {
  --size: 6%;
  --color: var(--color-snout);
  width: var(--size);
  height: 0;
  padding: var(--size);
  left: 35%;
  top: 20%;
  border-radius: 50%;
  background-color: var(--color);
  z-index: 1;
}

.eye:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: var(--color);
  z-index: 1;
}

.eye:after {
  content: "";
  width: 100%;
  height: 100%;
  position: absolute;
  left: -50%;
  top: -50%;
  border-top-left-radius: 100%;
  border-width: 2px;
  border-color: var(--color);
  border-style: solid;
  border-bottom-color: var(--color-spot);
  border-right-color: var(--color-spot);
  transform: scale(1.25);
  z-index: 0;
}

.torso {
  width: 56.6666666667%;
  height: 33.3333333333%;
  animation: torso var(--semi-duration) both infinite;
}

@keyframes torso {
  from, to {
    transform: none;
  }
  50% {
    transform: translateY(15%);
  }
}

.torso > .fur {
  height: 100%;
  width: 185px;
  border-top-left-radius: 40px;
  transform-origin: left center;
  transform: rotate(-20deg) translateY(10px);
  z-index: 1;
}

.torso > .fur:after {
  height: 100%;
  width: 100%;
  border-bottom-left-radius: 200px 85px;
  border-bottom-right-radius: 100px;
}

.torso > .legs {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.torso .spot {
  width: 120px;
  height: 120px;
  bottom: 40px;
  left: -20px;
  border-radius: 50%;
  background-color: var(--color-spot);
  z-index: 1;
  animation: spot var(--duration) calc(-1 * var(--semi-duration)) both infinite;
}
@keyframes spot {
  from, 66%, to {
    transform: none;
  }
  33% {
    transform: translateX(10px);
  }
}
.torso .spot:after {
  content: "";
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background-color: inherit;
  position: absolute;
  bottom: -10px;
  right: 5px;
}
.torso > .tail {
  --color: var(--color-spot);
  bottom: calc(100% - 15px);
  left: 0;
  transform-origin: center bottom;
  transform: rotate(-45deg);
}

.tail {
  height: 15px;
  width: 20px;
  background-color: var(--color);
  border-top-right-radius: 10px 100%;
  border-top-left-radius: 10px 100%;
  animation: tail var(--semi-duration) infinite;
}

@keyframes tail {
  from, to {
    transform: rotate(-45deg) translateX(-15%);
  }
  50% {
    transform: rotate(-25deg) translateX(15%);
  }
}

.tail > .tail {
  bottom: calc(90%);
  transform-origin: bottom left;
  transform: rotate(-10deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  animation: tail-inner var(--semi-duration) var(--stagger) infinite;
}

@keyframes tail-inner {
  from, to {
    transform: rotate(-10deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  }
  50% {
    transform: rotate(5deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  }
}

.legs > .leg {
  bottom: 5px;
  --color: var(--color-fur);
}

.legs > .leg:nth-child(1), .legs .leg:nth-child(3) {
  right: 15px;
}

.legs > .leg:nth-child(3), .legs > .leg:nth-child(4) {
  --color: var(--color-fur-dark);
  z-index: -1;
}

.legs > .leg:nth-child(1), .legs .leg:nth-child(4) {
  --delay: 0s;
}

.legs > .leg:nth-child(2), .legs > .leg:nth-child(3) {
  --delay: calc(-1 * var(--duration) / 2 ) ;
}

.legs > .leg:nth-child(2) {
  left: 0;
}

.legs > .leg:nth-child(4) {
  left: 0;
}

.leg {
  position: absolute;
  height: 65px;
  width: 45px;
  background-color: var(--color);
  transform-origin: center 5px;
  animation: leg infinite var(--duration) var(--delay, 0s);
}

.leg > .leg-inner {
  animation: leg-inner infinite var(--duration) calc(var(--delay));
  transform: rotate(90deg);
}

@keyframes leg-inner {
  from, to {
    transform: none;
  }
  33% {
    transform: rotate(70deg);
  }
  76% {
    transform: none;
  }
}

@keyframes leg {
  from, to {
    transform: none;
  }
  33% {
    transform: rotate(-55deg);
  }
  66% {
    transform: rotate(-20deg);
  }
}

.leg > .fur {
  width: 144.4444444444%;
  height: 100%;
}

.leg > .fur:after {
  width: 45px;
  bottom: 0;
  top: initial;
  transform: rotate(15deg);
}

.fur {
  position: absolute;
  overflow: hidden;
}

.fur:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 150%;
  top: 0;
  left: 0;
  background-color: var(--color, var(--color-fur));
  transform-origin: center bottom;
}

.leg-inner {
  position: absolute;
  height: 65%;
  width: 100%;
  top: calc(100%);
  transform-origin: center top;
}

.leg-inner:before {
  content: "";
  width: 45px;
  height: 45px;
  background-color: var(--color);
  position: absolute;
  border-radius: 50%;
  top: -22.5px;
}

.leg-inner > .fur {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  overflow: hidden;
}

.leg-inner > .fur:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 150%;
  top: 0;
  left: 0;
  background-color: var(--color);
  transform-origin: center top;
  transform: rotate(15deg);
}

html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  background-color: #E3E3E3;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  position: relative;
}

@media screen and (max-width: 2559px) {
  /* Global */
  :root {
    /* Font size */
    --font-large: 40px;
    --font-medium: 20px;
    --font-regular: 15px;
    --font-small: 13px;
    --font-micro: 10px;
  }
}


.search, h1 {
   margin-bottom: 100px;
   }
   
h1 {
   font-size: 48px;
}   


/*공 애니메이션*/
html, body { 
  height: 100%;
}
.box {
  padding-right: 300px;
  margin-left : auto;
  width: 40px;
  height: 140px;
  // border: solid 1px black;
  position: relative;
  
  .shadow {
    position: absolute;
    width: 100%;
    height: 10px;
    background-color: grey;
    bottom: 0;
    border-radius: 100%;
    transform: scaleX(.8);
    opacity: .6;
    animation: shadowScale 1s linear infinite;
  }
}
.gravity {
  width: 40px;
  height: 40px;
  animation: bounce 1s cubic-bezier(0.68, 0.35, 0.29, 0.54) infinite;
}
.ball {
  width: 60px;
  height: 60px;
  background-image: url('https://cdn2.iconfinder.com/data/icons/activity-5/50/26BD-soccer-ball-128.png');
  background-size: cover;
  animation: roll .7s linear infinite;
}

@keyframes roll {
  0% {}
  100% { transform: rotate(360deg) }
}
@keyframes bounce {
  0% {}
  50% { transform: translateY(100px) }
  100% {}
}
@keyframes shadowScale {
  0% {}
  50% { transform: scaleX(1); opacity: .8;}
  100% {}
}





</style>


</head>
<body>
   <header id="header">
      <logo class="header__logo"> <img
         src="${ path }/images/logo.png" alt="logo" class="logo__img" /> </logo>
      <!-- 로그인 전 버튼들 -->
      <c:if test="${ empty loginMember }">
<<<<<<< HEAD
         <ul class="header__menu">
            <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
            <li data-menuanchor="section2"><a
               href="${ path }/product/product">Product</a></li>
            <li data-menuanchor="section3"><a
               href="${ path }/community/community">Community</a></li>
            <li data-menuanchor="section4"><a
               href="${ path }/organization/organization">Organization</a></li>
            <li data-menuanchor="section5"><a href="${ path }/member/login">Login</a></li>
         </ul>
      </c:if>
      <!-- 로그인 후 버튼들 -->
      <c:if test="${ !empty loginMember }">
         <ul class="header__menu">
            <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
            <li data-menuanchor="section2"><a
               href="${ path }/product/product">Product</a></li>
            <li data-menuanchor="section3"><a
               href="${ path }/community/community">Community</a></li>
            <li data-menuanchor="section4"><a
               href="${ path }/organization/organization">Organization</a></li>
            <li data-menuanchor="section5"><a href="${ path }/logout">Logout</a></li>
         </ul>
=======
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
>>>>>>> 7e69ff4cb0ab0ff28dfd8f05b393d32449d4a8fe
      </c:if>
   </header>
   <main id="fullpage">
      <!-- Section 1 Title 첫번째 페이지 -->
      <section class="section">
         <h1>Pit A Pet</h1>
         <p>
            <br /> <br />
         </p>

         <!--   <form action="${ pageContext.request.contextPath }/organization/organizationResult"  >-->
         <!-- <form action="${ pageContext.request.contextPath }/organization/organization" method="get"> -->
         <form method="get">
            <div>
               <input class="search" type="text" name="search_here" id="id1"
                  placeholder="  검색해주세요." value="">
               <!-- onchange="ajax()검색창 -->
         
            </div>
            <div style="height: 100px; width: 100px;">
                        <!-- 강아지 움짤 코드 -->
            <div class="🐕">
               <div class="torso">
                  <div class="fur">
                     <div class="spot"></div>
                  </div>
                  <div class="neck">
                     <div class="fur"></div>
                     <div class="head">
                        <div class="fur">
                           <div class="snout"></div>
                        </div>
                        <div class="ears">
                           <div class="ear">
                              <div class="fur"></div>
                           </div>
                           <div class="ear">
                              <div class="fur"></div>
                           </div>
                        </div>
                        <div class="eye"></div>
                     </div>
                     <div class="collar"></div>
                  </div>
                  <div class="legs">
                     <div class="leg">
                        <div class="fur"></div>
                        <div class="leg-inner">
                           <div class="fur"></div>
                        </div>
                     </div>
                     <div class="leg">
                        <div class="fur"></div>
                        <div class="leg-inner">
                           <div class="fur"></div>
                        </div>
                     </div>
                     <div class="leg">
                        <div class="fur"></div>
                        <div class="leg-inner">
                           <div class="fur"></div>
                        </div>
                     </div>
                     <div class="leg">
                        <div class="fur"></div>
                        <div class="leg-inner">
                           <div class="fur"></div>
                        </div>
                     </div>
                  </div>
                  <div class="tail">
                     <div class="tail">
                        <div class="tail">
                           <div class="tail -end">
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
               </div>
            </div>
            <!-- // 강아지 움짤 코드  -->

            
            </div>
            
            
            <!-- 공 튀기는 움짤 코드 -->
         
               <div class="box">
                  <div class="shadow"></div>
                  <div class="gravity">
                     <div class="ball"></div>
                  </div>
               </div>


            
         </form>
<%-- 
         <img src="${ path }/images/organization/organizationlogo.png"
            alt="logoimnidang" /> --%>
         <!-- <p class="title">
            "Pets are humanizing. They remind us we have an obligation and
            responsibility to preserve and nurture and care for all life"<br />-
            James Cromwell
         </p> -->




         <i class="fa-solid fa-angles-down"></i>
      </section>
      <!--   Section 2 Announcement about Pit A Pet 두번째 페이지 -->
<!--       <section class="section">
         <div class="section__container">
            <p>WE ARE PIT A PET</p>
            <span>- Roger A. Caras -</span>
         </div>
      </section>
 -->




      <!--                                세번째 페이지                               -->

      <section class="section">
         <!-- 왼쪽 공백을 주기위한 blank영역 -->
         <div style="width: 10%; height: 500px; padding: 10px; float: left"></div>
         <!-- 카카오 지도 api불러오기위한 영역설정 -->
         <div id="map"
            style="width: 40%; height: 500px; border: 2px solid black; float: left;"></div>
         <!-- 카카오 지도를 그리는 javascript api 불러오기 -->
         <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e66a2e2d52d266c1e2f95dde68a87b8b"></script>

  <script>
  
  var mapContainer = document.getElementById('map'), //지도를 표시할 div 
  mapOption = { 
      center: new kakao.maps.LatLng(37.4989972, 127.0307203),  //지도의 중심좌표 -->왜안되냐
      level: 3 // 지도의 확대 레벨
 };

 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
   // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
 var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
 var zoomControl = new kakao.maps.ZoomControl();
 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   
    
 ajax();
        //함수시작
          function ajax(){
            fetch("https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=f3345def06304416bd7e0a492ae18e39&Type=json").then(function(response){
                if(response.status !=200 ){
                    alert("서버와 통신에 실패했습니다.");
                }else {
                    return response.json();
                }
            }).then(function(jsonData){
             
               
               var data = jsonData.OrganicAnimalProtectionFacilit[1].row; //
               
               var organizationList = document.querySelector(".organizationList");
               
               var tag = ""; //
              //되는것(숫자): SIGUN_CD, SUM_YY, 
               var res = data.filter(it =>it.SIGUN_NM.includes('<%=result%>')); 
           
              
               for(var i= 0; i < res.length; i++){
            	   
     
                  var SUM_YY = res[i].SUM_YY; //집계년도
                  var SIGUN_NM = res[i].SIGUN_NM; //시군명
                   var SIGUN_CD = res[i].SIGUN_CD; //시군코드
                   var ENTRPS_NM = res[i].ENTRPS_NM //업체명
                 var TEL_NO = res[i].ENTRPS_TELNO //업체 전화번호
                   //MAP 위도 와 경도 
                   var X_LAT = res[i].REFINE_WGS84_LAT //위도
                   var Y_LOGT = res[i].REFINE_WGS84_LOGT //경도
                   
           
               
            //이건 위에 데이터에 나와있는 기관의 핀넘버 넣는곳
          
             mapOption = { 
                     center: new kakao.maps.LatLng(res[0].REFINE_WGS84_LAT, res[0].REFINE_WGS84_LOGT), // 지도의 중심좌표 -->왜안되냐
                     level: 4 // 지도의 확대 레벨
                 };
                   //console.log(res[i].REFINE_WGS84_LAT)

               // var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                var marker = new kakao.maps.Marker({
                	
                    position: new kakao.maps.LatLng(X_LAT, Y_LOGT), // 마커의 좌표(위도,경도)
                    map: map // 마커를 표시할 지도 객체
                    
                 });
              //  console.log(Y_LOGT);
                // 마커 위에 표시할 인포윈도우를 생성한다()
            var infowindow = new kakao.maps.InfoWindow({
               content : '<div style= "padding:5px;">'+ENTRPS_NM+'</div>' // 인포윈도우에 표시할 내용(업체명)
            });
            // 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker);
            
           
            
            
               
              tag += '<section>'; //임시로 테스트 //섹션으로 나눔(0312)
              
                  tag += ' <div class="organization">';
                  tag += ' <div class="inner">';
                  tag += '<h3 class="ENTRPS_NM">'+'<a href="https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=${ENTRPS_NM}"  target="_">'+ENTRPS_NM+"<br/><br/>"+'</a>'+'</h3>'; //업체명 --->>>이거 누르면 네이버 어디로 이동하게
        
    
            //    console.log(ENTRPS_NM);
               // tag += `<a href="https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q="+\ENTRPS_NM  target="_">"이곳을 누르세요"</a>` ;
               
              //  tag += '<a href="https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=강아지와고양이"  target="_">'+'<button>'+ENTRPS_NM+"으로 이동"+'</button>'+'</a>' ;
                
                
                //tag += '<a href="#" onclick="location.href =https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q="+ target="_" return false">'+'<buttom>'+"버튼을 누르세요"+'</buttom>'+'</a>' ;    
                 
                  tag += '<p class="SIGUN_NM">'+"- 시군명: "+SIGUN_NM+'</p>'; //시군명
                  tag += '<p class="TEL_NO">'+"- 전화번호: "+TEL_NO+'</p>';
                  tag += ' <p class="SIGUN_CD">'+"- 시군코드: "+SIGUN_CD+'</p>'; //시군코드
                  tag += '<p class="SUM_YY">'+"- 등록년도: "+SUM_YY+'</p>'; //집계년도
                  
                  
                  tag += '<p>'+"<br/><hr><br/>"+'</p>';
                               
                  
                  tag += '</div>';
                  tag += '</div>';
                  
                  tag += '</section>';
                  
                  
                                }//end for
               organizationList.innerHTML = tag;
            })
        }
        
        //   ajax();
        

       </script>
         <!-- 중간에 blank 값 -->
         <div style="width: 5%; height: 500px; padding: 10px; float: left"></div>

         <div class="section__container"
            style="overflow: scroll; width: 40%; height: 500px; padding: 10px; float: left">
            <!-- 스크롤칸 못쨍이 -->
            <div class='organizationList'></div>
         </div>
      </section>
   </main>

   
</body>
</html>
