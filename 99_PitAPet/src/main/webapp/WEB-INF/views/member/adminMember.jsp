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
    <title>Pit A Pet</title>
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/adminMember.css" />
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/plugin/list.js"></script>
    <script src="${ path }/js/adminMember.js"></script>
  </head>
  <body>
    <header id="header">
      <logo class="header__logo">
         <img src="${ path }/images/logo.png" alt="logo" class="logo__img" />
      </logo>
     <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/list">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/member/mypage">Mypage</a></li>
        <li data-menuanchor="section6"><a href="${ path }/logout">Logout</a></li>
      </ul>
    </header>
    <main id="fullpage">
      <!-- Section 1 Products -->
      <section class="section">
        <main id="main">
          <header class="main__header">
            <div class="main__header__categories box">
              <p>????????????</p>
              <div>
                <ul>
                  <li><a class="active" href="${ path }/member/adminMember">????????????</a></li>
                  <li><a href="adminProduct.html">????????????</a></li>
                  <li><a href="adminBoard.html">???????????????</a></li>
                </ul>
              </div>
            </div>
            <div class="main__header__best box">
              <p>????????? ??????</p>
              <div>
                <p>1. ?????? ?????? ??????</p>
                <br />
                <p>2. ???????????? ????????? ????????? ??????</p>
                <br />
                <p>3. ??????????????? ????????? ????????? ?????? X</p>
                <br />
                <p>4. ?????? ?????? ??????!</p>
              </div>
            </div>
            
          </header>
          <home class="main__home">
            <div class="main__home__categories box">
              <p>: : ???????????? : :</p>
              <!-- ??? ?????? ??? DB????????? ?????? -->
              <span>??? 84 ??????</span>
            </div>
            <div class="main__home__board box">
              <div id="list" class="main__home__board__members">
                <div class="members__nav">
                  <div class="members__search">
                    <div class="search-box">
                      <input class="search" type="text" placeholder="???????????? ????????? ?????????!" />
                      <div class="search-icon">
                        <i class="fas fa-search"></i>
                      </div>
                      <div class="cancel-icon">
                        <i class="fas fa-times"></i>
                      </div>
                    </div>
                  </div>
                  <div class="members__sort">
                    <button class="sort" data-sort="no">?????? ???</button>
                    <button class="sort" data-sort="title">?????? ???</button>
                    <button class="sort" data-sort="hits">????????? ???</button>
                    <button class="sort" data-sort="pets">???????????? ???</button>
                    <button class="sort" data-sort="enroll">?????? ?????? ???</button>
                  </div>
                </div>
                <table class="tbl_member">
                  <thead>
                    <tr>
                      <th>??????</th>
                      <th>?????????</th>
                      <th>???????????????</th>
                      <th>?????? ??????</th>
                      <th>?????? ??????</th>
                      <th>??????</th>
                    </tr>
                  </thead>
                  <!-- <tr>
                  <td>
                    ????????? ???????????? ????????????.
                  </td>
                </tr>	 -->
                  <tbody class="list">
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                    <tr>
                      <td class="no">1</td>
                      <td class="title">??? ????????????~</td>
                      <td class="writer">?????????</td>
                      <td class="enroll">2021/12/24</td>
                      <td class="hits">12</td>
                      <td>
                        <input type="button" value="X" />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </home>
        </main>
      </section>
    </main>
  </body>
</html>