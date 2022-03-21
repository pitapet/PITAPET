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
    <link rel="stylesheet" href="${ path }/css/updateProductInfo.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
    <script src="${ path }/js/plugin/jquery.fullPage.js"></script>
    <script src="${ path }/js/updateProductInfo.js"></script>
</head>
<body>
<main id="fullpage">
  <section class="section">

    <main id="main">
      <section class="main__user">

        <div class="main__user__body">
          <div class="main__user__body__product">
            <p>상품 수정</p>
            <form id="updateProductInfoFrm" action="${ path }/product/update/productInfo" method="post"
            		enctype="multipart/form-data">
              <input type="hidden" name="no" value="${ productInfo.no }">
              <input type="hidden" name="originalFileName" value="${ productInfo.originalFileName }">
              <input type="hidden" name="renamedFileName" value="${ productInfo.renamedFileName }">
              
              <table class="main__user__body__table">
                <tbody class="table__tbody">
                  <tr>
                    <th rowspan="6" class="table__img">상품사진</th>
                    <td rowspan="6">
                      <img class="product__img" src="" alt="">
                      <input type="file" name="upfile" id="btnUpload">
                      <c:if test="${ !empty productInfo.originalFileName }">
                      	<c:out value="${ productInfo.originalFileName }"></c:out>
                      </c:if>
                    </td>
                  </tr>
                  <tr>
                    <th class="table__title">카테고리명</th>
                    <td colspan="3"><input type="text" name="title" id="title" value="${ product.title }" readonly></td>
                  </tr>
                  <tr>
                    <th class="table__content">카테고리 내용</th>
                    <td colspan="3">
                      <textarea name="content" id="content" cols="50" rows="2" readonly>${ product.content }</textarea>
                    </td>
                  </tr>
                  <tr>
                    <th class="table__price">가격</th>
                    <td colspan="3"><input type="text" name="price" id="price" value="${ productInfo.price }">원</td>
                  </tr>
                  <tr>
                    <th class="table__color">색상</th>
                    <td><input type="text" name="colorName" id="colorName" value="${ productInfo.colorName }"></td>
                    <th>색상코드</th>
                    <td><input type="color" name="colorCode" id="colorCode" value="${ productInfo.colorCode }"></td>
                  </tr>
                  <tr>
                    <th class="table__stock">재고수량</th>
                    <td colspan="3"><input type="number" name="stock" id="stock" min="0" max="1000" value="${ productInfo.stock }"> 개</td>
                  </tr>
                </tbody>
              </table>
              <input type="submit" id="updateProduct" value="등록"/>
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