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
            </div>
            
          </header> 
          
      	  <home class="main__home">
          	<div class="main__home__categories box">
            	<p>게시글 상세보기</p>
            </div>
            
            <div class="main__home__board box">
            <div id="view_all">
              <div id="board_top"><b> 조회수 : ${ board.readCount } </b></div>
              <div id="board_top"><b> 작성일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${ board.createDate }"/> </b></div>	
              <h1 class="board_tit">${ board.title }</h1>
              <br><br>
              <div class="board_writer">           
                  <div class="board_writer_view">
	                      <span id="a_kind"><b>작성자 | ${ board.writerId }&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                      					   애완동물 | ${ board.writerPet }</b></span>
	              </div>
              </div>
              <div class="view_cont_file">
              	<c:if test="${ !empty board.originalFileName }">
              		<img class="view_cont_file_img" src="${ path }/images/Community/boardImgs/${ board.originalFileName }" alt="board___file" />
              	</c:if>
              	<c:if test="${ empty board.originalFileName }">
	                <img class="view_cont_file_img" src="${ path }/images/Community/boardImgs/no-image.png" alt="board___file" />
		        </c:if>  		
              </div>
              <div class="board_contents">
                ${ board.content }
              </div>
              
              
               <%--글작성자/관리자인경우 수정삭제 가능 --%>
               <tr>
                  <th colspan="2">
                     <c:if test="${ ! empty loginMember && loginMember.id == board.writerId }">
                        <button type="button" class="btn-insert" onclick="location.href='${ pageContext.request.contextPath }/community/update?no=${ board.no }'">수정</button>
                        <button type="button" id="btnDelete" class="btn-insert">삭제</button>
                     </c:if>
                     
                  </th>
               </tr>
               
	            
           <!---------------------------- 댓글 ---------------------------->
	            <div id="comment-container">
	            <div class="comment-editor">
		            <form action="${ path }/community/writeReply" method="POST" id="frm-comment">
		            	<input type=hidden name="rv_no" value="${ reply.no }">
		            	<textarea name="cm_content" id="commentContent" rows="3" cols="30" placeholder="댓글을 입력해주세요."></textarea>
		            	<button type="submit" class="btn-insert">등록</button> 
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
	           
	            
	            
	        <div>
	            <button id="btn_list" type="button" onclick="location.href='${ pageContext.request.contextPath }/community/list'">목록으로</button>
	         </div>
	         
	         
	         
	            <script>
	               $(document).ready(() => {
	                  $("#btnDelete").on("click", () => {
	                     if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
	                        location.replace("${ pageContext.request.contextPath }/community/delete?no=${ board.no }");
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
        </div>
       </home> 
      </section>
    </main>
  </body>
</html>