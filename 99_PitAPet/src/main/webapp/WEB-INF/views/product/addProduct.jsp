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
	<title>Insert title here</title>
	<script src="${ path }/js/plugin/jquery-3.6.0.min.js"></script>
	<script src="${ path }/js/addProduct.js"></script>
</head>
<body>
<h2>상품 등록</h2>
<div id="view-container">
    <form id="addProductFrm" action="${ path }/product/add" method="post">
        <table>
            <tr>
                <th>상품명</th>
                <td>
                    <input type="text" name="title" id="newTitle" list="titleList">
                    <datalist id="titleList">
                        <option value="HAND GRIPPER"></option>
                        <option value="PANDENT"></option>
                    </datalist>
                    영어 대문자로만 입력해주세요.
                </td>
            </tr>
            <tr>
                <th>가격</th>
                <td>
                    <input type="number" name="price" id="price"
                        min="5000" max="100000" step="500" required> 원
                	<!--  
                	<input type="text" name="price" id="price">
                	-->
                    숫자만 입력해주세요.
                </td>
            </tr>
            <tr>
                <th>상품설명</th>
                <td><textarea name="content" id="content" cols="30" rows="10"></textarea></td>
            </tr>
        </table>
            <!--
        <table>
            <tr>
                <th>색상명</th>
                <td>
                    <input type="text" name="colorName" id="colorName">
                </td>
            </tr>
            <tr>
                <th>색상코드</th>
                <td>
                    <input type="color" name="colorCode" id="colorCode">
                    HEX CODE로만 지정해주세요.
                </td>
            </tr>
                <tr>
                    <th>이미지 첨부</th>
                    <td>
                        <input type="file" name="" id="">
                    </td>
                </tr>
            <tr>
                <th>이미지명</th>
                <td>
                    <input type="text" name="imageName" id="imageName">
                </td>
            </tr>
            <tr>
                <th>재고수량</th>
                <td>
                    <input type="number" name="count" id="count"
                    min="0" max="100" step="1">
                </td>
            </tr>
        </table>
            -->
        <input type="submit" id="addProduct" value="등록"></input>
    </form>
</div>
</body>
</html>