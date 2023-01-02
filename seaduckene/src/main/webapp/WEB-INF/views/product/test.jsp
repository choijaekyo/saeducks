<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<c:url value="/product/test2" />" method="post">
		<input name="test" value="1">
		<input name="test" value="2">
		<input name="test" value="3">
		<input name="test" value="4">
		<input type="submit" value="확인">
	</form>

</body>
</html>