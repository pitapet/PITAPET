<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="dofindPw" action="${ path }/member/dofindPw" method="post">
	아이디
	<input type="text" id="id" name="id" required>
	이메일
	<input type="email" id="email" name="email" required>
	<input type="submit" id="pwSearch" value="비번찾기">  
	</form>
</body>
</html>