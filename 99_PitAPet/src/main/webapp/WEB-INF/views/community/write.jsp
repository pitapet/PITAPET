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
              <p>게시글 작성하기</p>
            </div>
            
            <div class="main__home__board box">
				<form action="${ pageContext.request.contextPath }/community/write" method="post"
				enctype="multipart/form-data">
					<table id='tbl-board'>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writerId" value="${ loginMember.id }" readonly></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select name="job">
								    <option value="free">자유게시판</option>
								    <option value="question">질문게시판</option>
								    <option value="user">중고거래</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>첨부파일1</th>
							<td><input type="file" name="upfile"></td>
						</tr>
						<!-- 
						<tr>
							<th>첨부파일2</th>
							<td><input type="file" name="upfile"></td>
						</tr>
						-->
						<tr>
							<th>내용</th>
							<td><textarea name="content" cols="80" rows="35" ></textarea></td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" value="등록">
								<input type="reset" value="취소">
							</th>
						</tr>
					</table>
				</form>
			</div>
		</home>
		
        </div>
      </section>
    </main>
  </body>
</html>

<!-- SmartEditor2 -->
<script type="text/javascript" src = "${ path }/js/community.js"></script>
