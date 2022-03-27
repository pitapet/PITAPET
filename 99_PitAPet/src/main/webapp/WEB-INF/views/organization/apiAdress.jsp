<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- 해야하는일
1. 서치바 연동되게..웨안돼
2. css수정
3. 지도에 검색되는거 뜨게..
 -->

<c:set var="path" value="${ pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pit A Pet</title>
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/organization.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
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
.organization{
    text-align:left;
}
  
  </style>

       
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
      <!-- Section 1 Title 첫번째 페이지 -->
      <section class="section">
      <h1>Pit A Pet</h1>
      <p><br/><br/></p>
   
     <!--   <form action="${ pageContext.request.contextPath }/organization/organizationResult"  >-->
         <!-- <form action="${ pageContext.request.contextPath }/organization/organization" method="get"> -->
         <form>
         <div>
            <input class="search" type="text" name="search_here" id="id1" placeholder ="  검색해주세요." onchange=""> <!-- 검색창 -->
            
         </div>
         </form>
      
        <img src="${ path }/images/organization/organizationlogo.png" alt="logoimnidang" />
        <p class="title">"Pets are humanizing. They remind us we have an obligation and responsibility to preserve and nurture and care for all life"<br />- James Cromwell</p>


       
       
        <i class="fa-solid fa-angles-down"></i>
       </section>
    <!--   Section 2 Announcement about Pit A Pet 두번째 페이지 -->
      <section class="section">
        <div class="section__container">
          <p>WE ARE PIT A PET</p>
          <span>- Roger A. Caras -</span>
        </div>
      </section> 
      
      <!-- 세번째 페이지 -->
      
      <section class="section">
      <!-- 왼쪽 공백을 주기위한 blank영역 -->
     <div style="width: 10%; height:500px; padding:10px; float:left"></div> 
     <!-- 카카오 지도 api불러오기위한 영역설정 -->
      <div id="map" style="width:40%; height:500px; border:2px solid black; float:left;"></div>
     <!-- 카카오 지도를 그리는 javascript api 불러오기 -->
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e66a2e2d52d266c1e2f95dde68a87b8b"></script>
       
       <script>
       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new kakao.maps.LatLng(37.4989972, 127.0307203), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
      //지도에 마커를 생성하고 표시한다.
      var marker = new kakao.maps.Marker({
          position: new kakao.maps.LatLng(37.4989972, 127.0307203), // 마커의 좌표
          map: map // 마커를 표시할 지도 객체
      });
      
      // 마커 위에 표시할 인포윈도우를 생성한다
      var infowindow = new kakao.maps.InfoWindow({
          content : '<div style= padding:5px;">(임시로KH교육원)</div>' // 인포윈도우에 표시할 내용
      });
      // 인포윈도우를 지도에 표시한다
      infowindow.open(map, marker);
      

      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();

   // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
   // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

   // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
       
       </script>
       <!-- 중간에 blank 값 -->
       <div style="width: 5%; height:500px; padding:10px; float:left"></div>
       
        <div class="section__container" style= "overflow: scroll; width: 40%; height: 500px; padding: 10px; float:left"> <!-- 스크롤칸 못쨍이 -->
          <div class='organizationList' ></div>
        </div>
      </section>
    </main>
    
       <script>
       
                
          function ajax(){
            fetch("https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=f3345def06304416bd7e0a492ae18e39&Type=json").then(function(response){
                if(response.status !=200 ){
                    alert("서버와 통신에 실패했습니다.");
                }else {
                    return response.json();
                }
            }).then(function(jsonData){
               //console.log(data)
               //var data = jsonData.OrganicAnimalProtectionFacilit;
               var data = jsonData.OrganicAnimalProtectionFacilit[1].row; //
               
               var organizationList = document.querySelector(".organizationList");
               
               var tag = ""; //

              
               
               for(var i= 0; i < data.length; i++){
                   //console.log(data[i])
                   
                   var SUM_YY = data[i].SUM_YY; //집계년도
                   var SIGUN_NM = data[i].SIGUN_NM; //시군명
                   var SIGUN_CD = data[i].SIGUN_CD; //시군코드
                   var ENTRPS_NM = data[i].ENTRPS_NM //업체명
                   var TEL_NO = data[i].ENTRPS_TELNO //업체 전화번호
                   //MAP 위도 와 경도 
                   var X_LAT = data[i].REFINE_WGS84_LAT //위도
                   var Y_LOGT = data[i].REFINE_WGS84_LOGT //경도

          
               
              tag += '<section>'; //임시로 테스트 //섹션으로 나눔(0312)
              
                  tag += ' <div class="organization">';
                  tag += ' <div class="inner">';
                  tag += '<h3 class="ENTRPS_NM">'+ENTRPS_NM+"<br/><br/>"+'</h3>'; //업체명
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
        
            ajax();
        

       </script>
  </body>
</html>