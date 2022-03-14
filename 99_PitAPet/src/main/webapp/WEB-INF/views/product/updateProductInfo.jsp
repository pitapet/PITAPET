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
            <p>상품 수정</p>
            <form id="updateProductInfoFrm" action="${ path }/product/update/productInfo" method="post">
              <table class="main__user__body__table">
                <tbody class="table__tbody">
                  <tr>
                    <th rowspan="6" class="table__img">상품사진</th>
                    <td rowspan="6">
                      <!-- 
                      <img class="product__img" src="${ path }/images/product/${ productInfoes.imageName }.png" alt="">
                      <input type="file" name="upFile" id="btnUpload">
                       -->
                    </td>
                  </tr>
                  <tr>
                    <th class="table__title">상품명</th>
                    <td colspan="3"><input type="text" name="title" id="title" value="${ product.no }" readonly></td>
                  </tr>
                  <tr>
                    <th class="table__content">상품설명</th>
                    <td colspan="3">
                      <textarea name="content" id="content" cols="50" rows="2" readonly>${ product.content }</textarea>
                    </td>
                  </tr>
                  <tr>
                    <th class="table__price">가격</th>
                    <td colspan="3"><input type="text" name="price" id="price" value="${ product.price }" readonly>원</td>
                  </tr>
                  <tr>
                    <th class="table__color">색상</th>
                    <td><input type="text" name="colorName" id="colorName" value="${ productInfoes.colorName }"></td>
                    <th>색상코드</th>
                    <td><input type="color" name="colorCode" id="colorCode" value="${ productInfoes.colorCode }"></td>
                  </tr>
                  <tr>
                    <th class="table__stock">재고수량</th>
                    <td colspan="3"><input type="number" name="stock" id="stock" min="0" max="1000" value="${ productInfoes.stock }"> 개</td>
                  </tr>
                </tbody>
              </table>
              <input type="submit" id="addProduct" value="등록"></input>
            </form>
          </div>
        </div>

      </section>
    </main>

  </section>
</main>
</body>
</html>