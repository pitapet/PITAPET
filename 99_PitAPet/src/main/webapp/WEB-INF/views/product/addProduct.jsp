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
    <link rel="icon" type="image/png" sizes="152x152" href="../img/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="${ path }/css/plugin/jquery.fullPage.css" />
    <link rel="stylesheet" href="${ path }/css/addProduct.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/addProduct.js"></script>
</head>
<body>
<main id="fullpage">
	<section class="section">
	
	  <main id="main">
	    <section class="main__user">
	
	      <div class="main__user__body">
	        <div class="main__user__body__product">
	          <p>상품 카테고리 등록</p>
	          
	          <form id="addProductFrm" action="${ path }/product/add/product" method="post">
	              <table class="main__user__body__table">
	                <tbody class="table__tbody">
	                  <tr>
	                      <th>카테고리명</th>
	                      <td><input type="text" name="title" id="title"></td>
	                  </tr>
	                  <tr>
	                      <th>카테고리 내용</th>
	                      <td><input type="text" name="content" id="content"></td>
	                  </tr>
	                  <!-- 
	                  <tr>
	                      <th>가격</th>
	                      <td><input type="number" name="price" id="price"> 원</td>
	                  </tr>
	                   -->
	                </tbody>
	              </table>
	              <input type="submit" id="addProduct" value="등록"></input>
	              <button id="btnClose">취소</button>
	            </form>
	            
	          </div>
	        </div>
	
	      </section>
	    </main>
	
	  </section>
	</main>
</body>
</html>