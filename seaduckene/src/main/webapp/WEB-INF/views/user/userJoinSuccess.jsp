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
				<ol>
					<li style="font-size: 16px"><span>1</span> 약관동의 ─</li>
					<li style="font-size: 16px"><span>2</span> 정보입력 ─</li>
					<li style="font-size: 18px"><span>3</span> 가입완료</li> 
				</ol>
			</div>
			<div>회원가입이 완료되었습니다!
			</div>
		 </div>
		</div>
		</div>
	</section>
    

<%@ include file="../include/footer.jsp" %>
    
</body>
</html>