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
  
  </style>
  
  </head>
  <body>
    <header id="header">
      <logo class="header__logo">
        <img src="${ path }/images/logo.png" alt="logo" class="logo__img" />
      </logo>
      <ul class="header__menu">
        <li data-menuanchor="section1"><a href="${ path }/">Home</a></li>
        <li data-menuanchor="section2"><a href="${ path }/product/product">Product</a></li>
        <li data-menuanchor="section3"><a href="${ path }/community/community">Community</a></li>
        <li data-menuanchor="section4"><a href="${ path }/organization/organization">Organization</a></li>
        <li data-menuanchor="section5"><a href="${ path }/member/login">Login</a></li>
      </ul>
    </header>
    <main id="fullpage">
      <!-- Section 1 Title -->
      <section class="section">
      <h1>Pit A Pet</h1>
      <p><br/><br/></p>
   
      <form>
      	<div>
      		<input id="id1" type="text" name="search_here" placeholder ="  검색해주세요." required >
      		
      	</div>
      </form>
      
        <img src="${ path }/images/organization/organizationlogo.png" alt="logoimnidang" />
        <p class="title">"Pets are humanizing. They remind us we have an obligation and responsibility to preserve and nurture and care for all life"<br />- James Cromwell</p>
        <i class="fa-solid fa-angles-down"></i>
      </section>
      <!-- Section 2 Announcement about Pit A Pet -->
      <section class="section">
        <div class="section__container">
          <p>WE ARE PIT A PET</p>
          <span>- Roger A. Caras -</span>
        </div>
      </section>
    </main>
  </body>
</html>