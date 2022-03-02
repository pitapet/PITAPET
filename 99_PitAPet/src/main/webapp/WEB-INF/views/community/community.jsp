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
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/community.js"></script>
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <title>Pit A Pet</title>
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/img/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/community.css" />
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
        <div class="title__box">
          <img src="${ path }/images/Community/logo/logo.png" alt="" />
          <p class="title">
            “To effectively communicate, we must realize that we are all different in the way we perceive the world and use this understanding as a guide to our communication with others.”<br />– Tony
            Robbins
          </p>
          <i class="fa-solid fa-angles-down"></i>
        </div>
      </section>
      <!-- Section 2 Announcement about Pit A Pet -->
      <section class="section">
        <div class="main">
          <header class="main__header">
            <div class="main__header__categories box">
              <p>카테고리</p>
              <div>
                <ul>
                  <li><a href=""></a>전체게시판</li>
                  <li><a href=""></a>자유게시판</li>
                  <li><a href=""></a>질문게시판</li>
                  <li><a href=""></a>중고거래</li>
                </ul>
              </div>
            </div>
            <div class="main__header__best box">
              <p>실시간 베스트</p>
              <div>
                <p>갑자기 너무 추워요</p>
                <span>32 댓글</span>
              </div>
              <div>
                <p>흠좀무..</p>
                <span>32 댓글</span>
              </div>
              <div>
                <p>송파구 맛집좀</p>
                <span>32 댓글</span>
              </div>
            </div>
            <div class="main__header__read box"></div>
          </header>
          <home class="main__home">
            <div class="main__home__categories box">
              <p>전체게시판</p>
              <span>총 84 게시글</span>
            </div>
            <div class="main__home__board box">
              <article>
                <div class="article__one">
                  <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                </div>
                <div class="article__two">
                  <div class="two__div">
                    <div class="two__div__one">
                      <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                      <span>Aloofelicidad</span>
                    </div>
                    <div class="two__div__two">
                      <span>1일전</span>
                    </div>
                  </div>
                  <div class="two__div__description">
                    <p>제목이 어쩌고 저쩌고...</p>
                    <span
                      >내용이 어쩌고.. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam doloribus autem quo quia nam suscipit libero, culpa at non nihil animi quis aut sapiente optio
                      soluta odio neque ipsa sint!</span
                    >
                  </div>
                  <div class="two__div__footer">
                    <span>5 댓글</span>
                    <span>60 조회</span>
                  </div>
                </div>
              </article>
              <article>
                <div class="article__one">
                  <img class="imgbox" src="${ path }/images/Community/boardImgs/ex4.jpg" alt="" />
                </div>
                <div class="article__two">
                  <div class="two__div">
                    <div class="two__div__one">
                      <img class="imgbox" src="${ path }/images/Community/boardImgs/ex4.jpg" alt="" />
                      <span>Aloofelicidad</span>
                    </div>
                    <div class="two__div__two">
                      <span>1일전</span>
                    </div>
                  </div>
                  <div class="two__div__description">
                    <p>제목이 어쩌고 저쩌고...</p>
                    <span
                      >내용이 어쩌고.. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam doloribus autem quo quia nam suscipit libero, culpa at non nihil animi quis aut sapiente optio
                      soluta odio neque ipsa sint!</span
                    >
                  </div>
                  <div class="two__div__footer">
                    <span>5 댓글</span>
                    <span>60 조회</span>
                  </div>
                </div>
              </article>
              <article>
                <div class="article__one">
                  <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                </div>
                <div class="article__two">
                  <div class="two__div">
                    <div class="two__div__one">
                      <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                      <span>Aloofelicidad</span>
                    </div>
                    <div class="two__div__two">
                      <span>1일전</span>
                    </div>
                  </div>
                  <div class="two__div__description">
                    <p>제목이 어쩌고 저쩌고...</p>
                    <span
                      >내용이 어쩌고.. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam doloribus autem quo quia nam suscipit libero, culpa at non nihil animi quis aut sapiente optio
                      soluta odio neque ipsa sint!</span
                    >
                  </div>
                  <div class="two__div__footer">
                    <span>5 댓글</span>
                    <span>60 조회</span>
                  </div>
                </div>
              </article>
              <article>
                <div class="article__one">
                  <img class="imgbox" src="${ path }/images/Community/boardImgs/ex4.jpg" alt="" />
                </div>
                <div class="article__two">
                  <div class="two__div">
                    <div class="two__div__one">
                      <img class="imgbox" src="${ path }/images/Community/boardImgs/ex4.jpg" alt="" />
                      <span>Aloofelicidad</span>
                    </div>
                    <div class="two__div__two">
                      <span>1일전</span>
                    </div>
                  </div>
                  <div class="two__div__description">
                    <p>제목이 어쩌고 저쩌고...</p>
                    <span
                      >내용이 어쩌고.. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam doloribus autem quo quia nam suscipit libero, culpa at non nihil animi quis aut sapiente optio
                      soluta odio neque ipsa sint!</span
                    >
                  </div>
                  <div class="two__div__footer">
                    <span>5 댓글</span>
                    <span>60 조회</span>
                  </div>
                </div>
              </article>
              <article>
                <div class="article__one">
                  <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                </div>
                <div class="article__two">
                  <div class="two__div">
                    <div class="two__div__one">
                      <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />
                      <span>Aloofelicidad</span>
                    </div>
                    <div class="two__div__two">
                      <span>1일전</span>
                    </div>
                  </div>
                  <div class="two__div__description">
                    <p>제목이 어쩌고 저쩌고...</p>
                    <span
                      >내용이 어쩌고.. Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam doloribus autem quo quia nam suscipit libero, culpa at non nihil animi quis aut sapiente optio
                      soluta odio neque ipsa sint!</span
                    >
                  </div>
                  <div class="two__div__footer">
                    <span>5 댓글</span>
                    <span>60 조회</span>
                  </div>
                </div>
              </article>
            </div>
          </home>
        </div>
      </section>
    </main>
  </body>
</html>