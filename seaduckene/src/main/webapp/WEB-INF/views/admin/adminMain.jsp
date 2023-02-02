<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
<meta name="generator" content="Hugo 0.104.2" />
<title>세덕이네 관리자 페이지</title>

<!-- 부트스트랩  CDM -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 제이쿼리 js -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />

<style>
	html, body {
		height: 100%;
	}
	
	body {
		display: flex;
		align-items: center;
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #fff9d6;
	}
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		color: white;
	}
	
	.sbtn.small {
	  padding: 8px 18px;  
	  font-size: 14px;
	}
	      
	/* Colors for .btn and .btn-two */
	.sbtn.blue    {background-color: #7fb1bf;}
	.sbtn.green   {background-color: #9abf7f;}
	.sbtn.red     {background-color: #fa5a5a;}
	.sbtn.purple  {background-color: #cb99c5;}
	.sbtn.cyan    {background-color: #7fccde;}
	.sbtn.yellow  {background-color: #f0d264;}
	
	.rounded {
	  border-radius: 10px;
	}
	      
	/* default button style */
	.sbtn {
	  position: relative;
	  border: 0;
	  padding: 15px 25px;
	  display: inline-block;
	  text-align: center;
	  color: white;
	}
	.sbtn:active {
	  top: 4px; 
	}
	      
	      
	 /* color classes for .btn */
	.sbtn.blue {box-shadow: 0px 4px #74a3b0;}
	.sbtn.blue:active {box-shadow: 0 0 #74a3b0; background-color: #709CA8;}
	
	.sbtn.green {box-shadow: 0px 4px 0px #87a86f;}
	.sbtn.green:active {box-shadow: 0 0 #87a86f; background-color: #87a86f;}
	
	.sbtn.red {box-shadow:0px 4px 0px #E04342;}
	.sbtn.red:active {box-shadow: 0 0 #ff4c4b; background-color: #ff4c4b;}
	
	.sbtn.purple {box-shadow:0px 4px 0px #AD83A8;}
	.sbtn.purple:active {box-shadow: 0 0 #BA8CB5; background-color: #BA8CB5;}
	
	.sbtn.cyan {box-shadow:0px 4px 0px #73B9C9;}
	.sbtn.cyan:active {box-shadow: 0 0 #73B9C9; background-color: #70B4C4;}
	
	.sbtn.yellow {box-shadow:0px 4px 0px #D1B757;}
	.sbtn.yellow:active {box-shadow: 0 0 #ff4c4b; background-color: #D6BB59;}
</style>
</head>
<body>
	<div class="container w-100 m-auto">
		<div class="row">
			<div class="col text-center">
				<a class="sbtn red small rounded" href="<c:url value='/' />">홈으로</a>
				<a class="sbtn purple small rounded"
					href="<c:url value='/product/createProduct' />">상품등록</a> <a
					class="sbtn purple small rounded"
					href="<c:url value='/admin/productList' />">상품목록</a> <a
					class="sbtn green small rounded"
					href="<c:url value='/admin/NoticeAddPage' />">공지등록</a> <a
					class="sbtn green small rounded"
					href="<c:url value='/board/notice' />">공지사항</a> <a
					class="sbtn yellow small rounded"
					href="<c:url value='/admin/userSearch' />">주문목록</a> <a
					class="sbtn cyan small rounded"
					href="<c:url value='/admin/askAdminList' />">고객문의</a>
			</div>
		</div>
	</div>
</body>
</html>
