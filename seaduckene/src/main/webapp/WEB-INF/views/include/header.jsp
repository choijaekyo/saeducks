<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>seaduck e ne</title>

	<!-- 제이쿼리 js -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<!-- 부트스트랩  CDM -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
    
    <!-- swiper 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

	<!-- summernote 추가 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js" defer></script>
	
</head>
<body>

	<header>
      <div class="container" id="main-img">
         <a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img
            src="${pageContext.request.contextPath }/resources/img/saeduckene.png"
            alt="Logo" class="d-inline-block align-text-top">
         </a>
      </div>
      <nav class="navbar navbar-expand-lg nav-category">
         <div class="container nav-container">
            <button class="navbar-toggler" type="button"
               data-bs-toggle="collapse" data-bs-target="#navbarNav"
               aria-controls="navbarNav" aria-expanded="false"
               aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav">
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 게시판테스트 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/board/boardList' />">게시판으로</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/user/userMyPage/2' />">내 게시판</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/board/boardWrite' />">글작성</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 주문테스트</a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/product/order' />">주문서</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/product/createProduct' />">상품등록</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/user/userBasket' />">장바구니</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/product/productDetail?productNo=4' />">상품상세</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 미디어 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/board/boardList/1' />">영화</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/board/boardList/2' />">드라마</a></li>
                        <li><a class="dropdown-item" href="#">애니</a></li>
                        <li><a class="dropdown-item" href="#">책</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 인물 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">배우</a></li>
                        <li><a class="dropdown-item" href="#">아이돌</a></li>
                        <li><a class="dropdown-item" href="#">유튜버</a></li>
                        <li><a class="dropdown-item" href="#">가수</a></li>
                        <li><a class="dropdown-item" href="#">운동선수</a></li>
                     </ul></li>
                 <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 여행 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">아프리카</a></li>
                        <li><a class="dropdown-item" href="#">중동</a></li>
                        <li><a class="dropdown-item" href="#">유럽</a></li>
                        <li><a class="dropdown-item" href="#">아시아</a></li>
                        <li><a class="dropdown-item" href="#">북아메리카</a></li>
                        <li><a class="dropdown-item" href="#">남아메리카</a></li>
                        <li><a class="dropdown-item" href="#">오세아니아</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 패션 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">상의</a></li>
                        <li><a class="dropdown-item" href="#">하의</a></li>
                        <li><a class="dropdown-item" href="#">신발</a></li>
                        <li><a class="dropdown-item" href="#">액세서리</a></li>
                        <li><a class="dropdown-item" href="#">화장품</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 음식 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">한식</a></li>
                        <li><a class="dropdown-item" href="#">중식</a></li>
                        <li><a class="dropdown-item" href="#">일식</a></li>
                        <li><a class="dropdown-item" href="#">양식</a></li>
                        <li><a class="dropdown-item" href="#">인도식</a></li>
                        <li><a class="dropdown-item" href="#">동남아식</a></li>
                     </ul></li>
               </ul>
            </div>

            <ul class="nav login-box">
            <c:choose>
            <c:when test="${login == null}">
               <li class="nav-item"><a href="<c:url value='/user/userLogin' />"
                  class="nav-link link-dark px-2">Login</a></li>
               <li class="nav-item"><a href="<c:url value='/user/userJoin' />"
                  class="nav-link link-dark px-2">Sign up</a></li>
            </c:when>
			<c:otherwise>
               <li class="nav-item"><a href="<c:url value='/user/userLogout' />"
                  class="nav-link link-dark px-2">Logout</a></li>
               <li class="nav-item"><a href="<c:url value='/user/userMyPage/1' />"
                  class="nav-link link-dark px-2">My Page</a></li>
			</c:otherwise>            
            </c:choose>
            </ul>
         </div>
      </nav>
      
   </header>