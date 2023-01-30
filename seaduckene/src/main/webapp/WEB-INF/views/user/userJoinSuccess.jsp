<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seaduck e ne</title>

<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath }/resources/css/userJoinSuccess.css"
	rel="stylesheet">
</head>
<body>
<%@ include file="../include/header.jsp" %>

	<section id="userJoinSuccessPage" >
		<div class="container-fluid">
		<div class="row">
		 <div class="col-lg-12 col-md-12 col-sm-12" id="userJoin-wrap">
			<div class="title">
				<h2>회원가입</h2>
				<ol class="ps-0">
					<li style="font-size: 16px"><span>1</span> 정보입력</li>
					<li style="font-size: 16px">─</li>
					<li style="font-size: 18px"><span>2</span> 가입완료</li> 
				</ol>
			</div>
			<div class="content">회원가입이 완료되었습니다!
			</div>
			<div class="buttons">
				<a href='${pageContext.request.contextPath}/user/userLogin'><button class="btn btn-sm btn-success">로그인하러가기</button></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href='${pageContext.request.contextPath}/'><button class="btn btn-sm btn-info">홈으로 가기</button></a>
			</div>
		 </div>
		</div>
		</div>
	</section>
    

<%@ include file="../include/footer.jsp" %>
    
</body>
</html>