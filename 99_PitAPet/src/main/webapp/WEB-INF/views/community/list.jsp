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
        <li data-menuanchor="section4"><a href="${ path }/member/mypage">Mypage</a></li>
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
                  <li><a href="${ path }/community/list">전체게시판</a></li>
                  <li><a href="${ path }/community/free">자유게시판</a></li> 
                  <li><a href="${ path }/community/question">질문게시판</a></li>
                   <!--<li><a href="${ path }/community/used">중고거래</a></li>   -->
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
            <div class="main__header__read box">
            	<c:if test="${ !empty loginMember }">
					<button type="button" id="btn-add" onclick="location.href='${ path }/community/write'">글쓰기</button>
				</c:if>	
            	<c:if test="${ empty loginMember }">
					<button type="button" id="btn-add" onclick="javascript:alert('로그인 후 작성 가능합니다.')">글쓰기</button>
				</c:if>	
					<br>
					 
				   <!-- 검색 -->
				  <form name=""form1 action="list.do" method="post">
	                  <label for="condition">검색조건</label>   
	                  <select name="search_option" id="board_condition">
	                  	 <option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
	                     <option value="title" <c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
	                     <option value="content" <c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
	                     <option value="writerId" <c:if test="${map.search_option == 'writerId'}">selected</c:if>>작성자</option>
	                  </select>
	                  
	                  <input id="id1" name="keyword" value="${map.keyword}" placeholder =" 검색어를 입력해 주세요." required >
	                  <input type="submit" value="검색" id="btn_search"></input>
               	  </form> <!-- condition이라는 파라미터 명으로 넘어간다. -->
				   
				   
					
					<c:choose>
						<c:when test="${ !empty keyword }">
							<p>
								<strong>${ keyword } </strong>키워드로 검색된
								<strong>${ totalRow }</strong>개의 게시글이 있습니다.
							</p>
						</c:when>
						<c:otherwise>
							<p><strong>${ totalRow }</strong>개의 파일이 있습니다.</p>
						</c:otherwise>
				</c:choose>
			
					
			</div>
          </header>
          
          
          <home class="main__home">
            <div class="main__home__categories box">
              <p>전체게시판</p>
              <span>총 ${ fn:length(list) }개 게시글</span>
            </div>
		 	
            <div class="main__home__board box">
            <c:if test="${ empty list }">			
					조회된 게시글이 없습니다.
		  	</c:if>
		  	
		 	<c:if test="${ !empty list }">	
            	<c:forEach var="board" items="${ list }">
	              <div class="infinite">
	              <article>
	                <div class="article__one">
	                   <a href="${ path }/community/view?no=${ board.no }">	
	                   	 <c:if test="${ !empty board.originalFileName }">
	                  		<img class="imgbox" src="${ path }/images/Community/boardImgs/${ board.originalFileName }" alt="board___file" />
	                  	 </c:if>	
	                   	 <c:if test="${ empty board.originalFileName }">
	                     	<img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="board___file" />
		                 </c:if>  	
	                   </a>
	                </div>
	                <div class="article__two">
	                  <div class="two__div">
	                    <div class="two__div__one">
		                    <!-- <img class="imgbox" src="${ path }/images/Community/boardImgs/no-image.png" alt="" />  -->
		                    <span><a href="${ path }/community/view?no=${ board.no }"><b>${ board.title }</b></a></span>
		                       
	                    </div>
	                    <div class="two__div__two">
	                      <span>${ board.writerId }</span>
	                    </div>
	                  </div>
	                  <div class="two__div__description">
	                  &emsp;&emsp;&emsp;
	                  	  <!-- ${ board.writerId }  -->
	                    <span
	                      >${board.content }</span>
	                  </div>
	                  <div class="two__div__footer">
	                  	<span><fmt:formatDate pattern="yyyy-MM-dd" value="${ board.createDate }"/> 작성</span>
	                    <span>${ count } 댓글</span>
	                    <span>${ board.readCount } 조회</span>
	                  </div>
	                </div>
	              </article>
	                </div>
	                <div class="pagination"></div>
	          	</c:forEach>    
	          	
	          	<div id="board_pageBar">
					<!-- 맨 처음으로 -->
					<button onclick="location.href='${ path }/community/list?page=1'">&lt;&lt;</button>
			
					<!-- 이전 페이지로 -->
					<button onclick="location.href='${ path }/community/list?page=${ pageInfo.prevPage }'">&lt;</button>
			
					<!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">				
							<button disabled>${ status.current }</button>
						</c:if>
						
						<c:if test="${ status.current != pageInfo.currentPage }">				
							<button onclick="location.href='${ path }/community/list?page=${ status.current }&count=${ pageInfo.listLimit }'">${ status.current }</button>
						</c:if>
					</c:forEach>
			
					<!-- 다음 페이지로 -->
					<button onclick="location.href='${ path }/community/list?page=${ pageInfo.nextPage }'">&gt;</button>
			
					<!-- 맨 끝으로 -->
					<button onclick="location.href='${ path }/community/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
				</div>	

	</div>
	          	
	          	
	          	
	          	<!--   더보기 구현
	          	<div id="more_btn_div" align="center">
	          		<a id="more_btn_a" href="javascript:moreList();">
	          			더보기
	          		</a>
	          	</div>
	          	 -->
	         </c:if>	
	          	
	         
	         


	          	
            </div>
          </home>
        </div>
      </section>
    </main>
  </body>
</html>