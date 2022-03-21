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
    
    <!-- SmartEditor2 라이브러리 
    <script type="text/javascript" src="${ path }/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ path }//code.jquery-1.11.0.min.js"></script> -->
    
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
     
      <!-- Section 2 Announcement about Pit A Pet -->
      <section class="section">
        <div class="main">
          <header class="main__header">
            <div class="main__header__categories box">
              <p>카테고리</p>
              <div>
                <ul>
                  <li><a href="${ path }/community/list">전체게시판</a></li>
                  <li><a href="${ path }/community/free">자유게시판</a></li>  
                  <li><a href="${ path }/community/question">질문게시판</a></li>
                  <li><a href="${ path }/community/used">중고거래</a></li>
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
              <p>게시글 수정</p>
            </div>
            
            <div class="main__home__board box">
            <div id="write_all">
            	<form action="${ pageContext.request.contextPath }/community/write" method="post" enctype="multipart/form-data">
				<div class="form-type">
					<p class="write_title">제목</p>
					<input type="text" class="form-control" id="title" value="${ board.title }"
						placeholder="제목을 입력해 주세요." name="title" required="required">
				</div>				
				
					<!------------- html편집기?????? ------------->
	
					 <!-- 내용 작성 -->
				<div class="form-type">
					<p class="write_title">글작성</p>
					<input type="file" name="upfile" placeholder="파일첨부">
					<c:if test="${ !empty board.originalFileName }">
					<img src="${ pageContext.request.contextPath }/resources/images/file.png" width="20" height="20"/>
					<c:out value="${ board.originalFileName }"></c:out>
				</c:if>
					<textarea class="form-control" rows="15" id="form-content"
						name="content" placeholder="내용을 입력해주세요." required="required"></textarea>
				</div>
				<div>
					<button type="reset" class="btn-insert" onclick="location.href='${ pageContext.request.contextPath }/community/list'">취소</button>
					<button type="submit" class="btn-insert">등록</button>
				</div>
			</form>
				
			</div>
			</div>
		</home>
		
        </div>
      </section>
    </main>
  </body>
</html>

<!-- SmartEditor2 -->
<script type="text/javascript" src = "${ path }/js/community.js"></script>
