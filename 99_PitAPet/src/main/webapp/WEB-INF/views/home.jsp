<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<link rel="stylesheet" href="${ path }/css/index.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
<script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
<script src="${ path }/js/plugin/jquery.fullPage.js"></script>
<script src="${ path }/js/index.js"></script>

<style>
.left_pic_box {
	float: left;
	width: 50%;
}

.right_pic_box {
	float: right;
	width: 50%;
}

.center_utube_box{
	float : center;
	width:100%;
}

<!-- -->
/* html,body{
  height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}*/
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}



</style>
</head>
<body>
	<header id="header">
		<logo class="header__logo"> 
		<img src="${ path }/images/logo.png" alt="logo" class="logo__img" /> </logo>
		<!-- 로그인 전 버튼들 -->
		<c:if test="${ empty loginMember }">
			<ul class="header__menu">
				<li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
				<li data-menuanchor="section2"><a
					href="${ path }/product/product">Product</a></li>
				<li data-menuanchor="section3"><a
					href="${ path }/community/list">Community</a></li>
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
		</c:if>
	</header>
	<main id="fullpage">
		<!-- Section 1 Title -->
		<section class="section">
			<div class="section__div">
				<div class="title__div title">Pit</div>
				<div class="title__div">
					<span class="title">&nbsp;A&nbsp;Pet</span>
				</div>
			</div>
		</section>

		<!-- Section 2 Announcement about Pit A Pet -->
		<section class="section">
			<div class="section__container">
				<div class="simuruk_dog">
					<h1>
						PIT A PET <br />
						<br />
					</h1>
					<img src="${ path }/images/simurukDog.gif" alt="">
				</div>
				<span><br />인간과 동물의 관계를 떠나, 자연의 법칙에 의해 탄생된 모든 생명은 <br />
				<br /> 생명자체로서 보호받고 존중받을 권리가 있습니다.</span>
			</div>
		</section>

		<!-- Section 3 Page Description 옆으로 넘기는 페이지-->
		<section id="section" class="section">
			<div class="slide">
				<!-- 첫번째 옆페이지 -->
				<div class="center_utube_box" >
				</br>
				</br></br></br>
					<iframe width="1080" height="850" align="middle"
						src="https://www.youtube.com/embed/99cp00wr_S4?autoplay=1&mute=1"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
	
				</div>
			</div>
			
			<!-- 두번째 옆페이지 -->
			<div class="slide" >
				<div class="left_pic_box">
				   <img src="${ path }/images/dontbuy.JPG" alt="입양하세요." width="50%"
	                  height="70%">
	            </div>
	              
	            <div class="right_pic_box">
					<!-- 버튼들 -->
					<a href="https://www.animal.go.kr/front/index.do"><button>동물보호관리시스템 홈페이지</button></a>
					</br></br></br>
					<a href="https://www.animal.or.kr/front/index.do"><button>동물자유연대 홈페이지</button></a>
					</br></br></br>
					<a href="http://pawinhand.kr/"><button>포인핸드 홈페이지</button></a>
					</br></br></br>
					<a href="https://www.karma.or.kr/"><button>한국동물구조관리협회 홈페이지</button></a></br>
				</div>
			</div>
			
			<div class="slide">
				<h3>"I LOVE ♥ PET"</h3>
				</br>
				<h2>사랑한다면 지켜주세요.</h2>
			</div>
		</section>

      <section class="section">
        <div class="center">
          <div class="fisrt">
            <p class="fist__word">About</p>
            <p class="fist__word">Us</p>
          </div>
          <div class="card">
            <div class="additional">
              <div class="user-card">
                <div class="level center">&nbsp;&nbsp;&nbsp;&nbsp;조장</div>
                <img class="center" src="${path }/images/hannanim.jpg" alt="한나님" />
              </div>
              <div class="more-info">
                <h1>주한나</h1>
                <div class="coords">
                  <span>5조</span>
                  <p>열심히 했는데도 구현하지 못한 것들이 많아서 아쉽습니다. 그리고 너무 잘 따라와주신 5조 팀원 분들 감사합니다:)</p>
                </div>
                <div class="stats">
                  <div>
                    <div class="title">이메일</div>
                    <a href="mailto:jamongju96@gmail.com?"><i class="fa-solid fa-at"></i></a>
                  </div>
                  <div>
                    <div class="title">깃허브</div>
                    <a href="https://github.com/juhannah" target="_blank"><i class="fa-brands fa-github"></i></a>
                  </div>
                  <div>
                    <div class="title">SNS</div>
                    <a href="" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  </div>
                  <div>
                    <div class="title">Coffee</div>
                    <i class="fa fa-coffee"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="general">
              <h1>주한나</h1>
              <p>5조의 조장.</p>
              <p>상품 조회, 결제 담당</p>
              <p>장바구니, 구매 목록 담당</p>
              <span class="more">마우스를 올려주세요.</span>
            </div>
          </div>
          <div class="card green">
            <div class="additional">
              <div class="user-card">
                <div class="level center">&nbsp;&nbsp;&nbsp;&nbsp;조원</div>
                <img class="center" src="${path}/images/soheenim.jpg" alt="" />
              </div>
              <div class="more-info">
                <h1>박소희</h1>
                <div class="coords">
                  <span>5조</span>
                  <p>수업에서 다루지 않았던 api들을 다루느라 애를 많이 먹었지만, 백앤드 개발자가 됨에 있어 많은 것을 배우고 알아갈 수 있었던 좋은 경험이었습니다.</p>
                </div>
                <div class="stats">
                  <div>
                    <div class="title">이메일</div>
                    <a href="mailto:psh960505@gmail.com?"><i class="fa-solid fa-at"></i></a>
                  </div>
                  <div>
                    <div class="title">깃허브</div>
                    <a href="https://github.com/soheepark05" target="_blank"><i class="fa-brands fa-github"></i></a>
                  </div>
                  <div>
                    <div class="title">SNS</div>
                    <a href="" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  </div>
                  <div>
                    <div class="title">Coffee</div>
                    <i class="fa fa-coffee"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="general">
              <h1>박소희</h1>
              <p>5조의 조원.</p>
              <p>Pit a pet의 index화면 담당</p>
              <p>Organizaion파트 담당</p>
              <span class="more">마우스를 올려주세요.</span>
            </div>
          </div>
          <div class="card green">
            <div class="additional">
              <div class="user-card">
                <div class="level center">&nbsp;&nbsp;&nbsp;&nbsp;조원</div>
                <img class="center" src="${path}/images/sungsoonim.jpg" alt="성수님" />
              </div>
              <div class="more-info">
                <h1>윤성수</h1>
                <div class="coords">
                  <span>5조</span>           
                  <p>세미 프로젝트 때와는 다른 파트를 맡아서 했는데 익숙치 않아서 어렵기도 했지만 새로운 걸 한다는 재미도 있었습니다 다들 고생하셨어요~!</p>
                </div>
                <div class="stats">
                  <div>
                    <div class="title">이메일</div>
                    <a href="mailto:yss961207@gmail.com?"><i class="fa-solid fa-at"></i></a>
                  </div>
                  <div>
                    <div class="title">깃허브</div>
                    <a href="https://github.com/yss2623" target="_blank"><i class="fa-brands fa-github"></i></a>
                  </div>
                  <div>
                    <div class="title">SNS</div>
                    <a href="" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  </div>
                  <div>
                    <div class="title">Coffee</div>
                    <i class="fa fa-coffee"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="general">
              <h1>윤성수</h1>
              <p>5조의 조원.</p>
              <p>회원가입, 로그인 기능 담당</p>
              <p>회원관리 관리자 페이지 담당</p>
              <p>마이페이지(비밀번호 변경, 애완동물 변경)담당</p>
              <span class="more">마우스를 올려주세요.</span>
            </div>
          </div>
          <div class="card green">
            <div class="additional">
              <div class="user-card">
                <div class="level center">&nbsp;&nbsp;&nbsp;&nbsp;조원</div>
                <img class="center" src="${path}/images/jungjinnim.jpg" alt="정진님" />
              </div>
              <div class="more-info">
                <h1>임정진</h1>
                <div class="coords">
                  <span>5조</span>
                  <p>부족한 점이 많았는데 도와주신 조원분들 덕분에 무사히 마칠수 있었습니다. 감사합니다!</p>
                </div>
                <div class="stats">
                  <div>
                    <div class="title">이메일</div>
                    <a href="mailto:dlawjdwls98@gmail.com?"><i class="fa-solid fa-at"></i></a>
                  </div>
                  <div>
                    <div class="title">깃허브</div>
                    <a href="https://github.com/jungjinl" target="_blank"><i class="fa-brands fa-github"></i></a>
                  </div>
                  <div>
                    <div class="title">SNS</div>
                    <a href="" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  </div>
                  <div>
                    <div class="title">Coffee</div>
                    <i class="fa fa-coffee"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="general">
              <h1>임정진</h1>
              <p>5조의 조원.</p>
              <p>커뮤니티 게시글 목록 조회 담당</p>
              <span class="more">마우스를 올려주세요.</span>
            </div>
          </div>
          <div class="card green">
            <div class="additional">
              <div class="user-card">
                <div class="level center">&nbsp;&nbsp;&nbsp;&nbsp;조원</div>
                <img class="center" src="${path}/images/hyungyunim.jpg" alt="" />
              </div>
              <div class="more-info">
                <h1>임현규</h1>
                <div class="coords">
                  <span>5조</span>
                  <p>프로젝트를 통하여 Frontend의 기초를 다시 돌아보게 되는 계기가 되었고 팀 프로젝트를 통해 협업이 어떤건지 알게되어 좋은 경험이 되었습니다.</p>
                </div>
                <div class="stats">
                  <div>
                    <div class="title">이메일</div>
                    <a href="mailto:anwjr7878@gmail.com?"><i class="fa-solid fa-at"></i></a>
                  </div>
                  <div>
                    <div class="title">깃허브</div>
                    <a href="https://github.com/gyulsbox" target="_blank"><i class="fa-brands fa-github"></i></a>
                  </div>
                  <div>
                    <div class="title">SNS</div>
                    <a href="" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  </div>
                  <div>
                    <div class="title">Coffee</div>
                    <i class="fa fa-coffee"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="general">
              <h1>임현규</h1>
              <p>5조의 조원</p>
              <p>Pit a Pet의 전체 Frontend 담당</p>
              <p>JavaScript 및 UI/UX 담당</p>
              <span class="more">마우스를 올려주세요.</span>
            </div>
          </div>
        </div>
      </section>
</body>
</html>
