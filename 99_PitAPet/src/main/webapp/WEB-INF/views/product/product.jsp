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
    <link rel="stylesheet" href="${ path }/css/product.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/product.js"></script>
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
        <img src="${ path }/images/product/logo/logo.png" alt="production" />
        <p>“We do not need magic to change the world, we carry all the power we need inside ourselves already: we have the power to imagine better.”<br />- J.K. Rowling</p>
        <i class="fa-solid fa-angles-down"></i>
      </section>
      <!-- Section 2 Products -->
      <section class="section">
        <div class="products__wrapper">
          <div class="product__img__wrapper">
            <img class="product__img" src="${ path }/images/product/1.png" alt="product__prototype" />
          </div>
          <div class="product__useable">
            <div class="product__description">
              <h2>Hand Gripper</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis iusto ipsum odio quas blanditiis doloremque, quae ipsa nesciunt neque, reiciendis consequatur, similique impedit illum
                temporibus ab? Vitae quo laborum animi. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam, enim! Dolores tempora quibusdam, similique nam natus ut ipsum sed doloremque
                officiis accusamus necessitatibus quis voluptas nulla, nostrum expedita vel id? Lorem ipsum dolor sit, amet consectetur adipisicing elit. Cumque illum sunt aut, animi beatae corporis
                veritatis ab quos tempora adipisci voluptatibus exercitationem nostrum necessitatibus consectetur vero eius! Veritatis, iure ab. Lorem ipsum dolor sit amet consectetur adipisicing
                elit. Accusantium tenetur vel minima id, veritatis ipsa obcaecati voluptas eius nesciunt quas quaerat non voluptatum inventore! Temporibus illo ipsam commodi est architecto. Lorem
                ipsum dolor sit amet consectetur adipisicing elit. Sit sint error accusantium? Dignissimos voluptate consequuntur quis quibusdam provident, nobis nostrum reprehenderit doloribus ad
                asperiores illo obcaecati culpa numquam eaque minima.
              </p>
            </div>
            <div class="product__form">
              <button>Buy</button>
              <button>Cart</button>
            </div>
          </div>
        </div>
      </section>
    </main>
</body>
</html>