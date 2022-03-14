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
                  <li><a href="${ path }/community/free">자유게시판</a></li>  <!--  -->
                  <li><a href="${ path }/community/question">질문게시판</a></li>
                  <li><a href="${ path }/community/used">중고거래</a></li>
                </ul>
              </div>
            </div>
          </header> 
                 
      <h2>게시판 상세 조회</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ board.writerId }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${ board.readCount }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${ empty board.originalFileName }">
						<span> - </span>
					</c:if>
					<c:if test="${ !empty board.originalFileName }">
						<img src="${ pageContext.request.contextPath }/resources/images/file.png" width="20" height="20"/>
						<%-- 
						<a href="${ pageContext.request.contextPath }/resources/upload/board/${board.renamedFileName}"
							download=${ board.originalFileName }>
							<c:out value="${ board.originalFileName }" />
						</a>
						--%>
						<a href="javascript:fileDownload('${ board.originalFileName }', '${board.renameFileName}')">
							<c:out value="${ board.originalFileName }" />
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>${ board.content }</td>
			</tr>
			<%--글작성자/관리자인경우 수정삭제 가능 --%>
			<tr>
				<th colspan="2">
					<c:if test="${ ! empty loginMember && loginMember.id == board.writerId }">
						<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/update?no=${ board.no }'">수정</button>
						<button type="button" id="btnDelete">삭제</button>
					</c:if>
					
					<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/list'">목록으로</button>
				</th>
			</tr>
		</table>
		<div id="comment-container">
		   	<div class="comment-editor">
		   		<form action="${ pageContext.request.contextPath }/board/reply" method="POST">
		   			<input type="hidden" name="boardNo" value="${ board.no }">
					<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
		   		</form>
		   	</div>
		</div>
		<table id="tbl-comment">
		 	<c:forEach var="reply" items="${ board.replies }">
		   	<tr class="level1">
		   		<td>
		   			<sub class="comment-writer"><c:out value="${ reply.writerId }"/></sub>
		   			<sub class="comment-date"><fmt:formatDate type="date" value="${ reply.createDate }"/></sub>
		   			<br>
		   			<c:out value="${ reply.content }"/>
		   		</td>
		   		<td>
		   			<c:if test="${ ! empty loginMember && loginMember.id == reply.writerId }">
		  					<button class="btn-delete">삭제</button>
					</c:if>
		   		</td>
		   	</tr>
		  	</c:forEach>
		</table>
		   
		<script>
			$(document).ready(() => {
				$("#btnDelete").on("click", () => {
					if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
						location.replace("${ pageContext.request.contextPath }/board/delete?no=${ board.no }");
					}
				})
				
				/*
				$("#replyContent").on("focus", (e) => {
					if(${ empty loginMember }) {
						alert("로그인 후 이용해주세요!");
						
						$("#userId").focus();				
					}
				});
				*/
			});
			
			function fileDownload(oname, rname) {
				
				// encodeURIComponent()
				//  - 아스키문자(a~z, A~Z, 1~9, ... )는 그대로 전달하고 기타 문자(한글, 특수 문자 등)만 %XX(16진수 2자리)와 같이 변환된다.
				location.assign("${ pageContext.request.contextPath }/board/fileDown?oname=" + encodeURIComponent(oname) + "&rname=" + encodeURIComponent(rname));
			}
		</script>           
                   
           
        </div>
      </section>
    </main>
  </body>
</html>