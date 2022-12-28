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


	<!-- 부트스트랩  CDM -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <!-- swiper 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

</head>
<body>

	<header>
      <div class="container" id="main-img">
         <a class="navbar-brand" href="#"> <img
            src="${pageContext.request.contextPath }/resources/img/saeduck.png"
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
                     data-bs-toggle="dropdown" aria-expanded="false"> 게시판입장 </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/board/boardList' />">게시판으로</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/user/userMyPage' />">내 게시판</a></li>
                        <li><a class="dropdown-item" href="#">Something else
                              here</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> Dropdown
                        link </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else
                              here</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> Dropdown
                        link </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else
                              here</a></li>
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> Dropdown
                        link </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else
                              here</a></li>
                     </ul></li>
               </ul>
            </div>

            <ul class="nav login-box">
               <li class="nav-item"><a href="<c:url value='/user/userLogin' />"
                  class="nav-link link-dark px-2">Login</a></li>
               <li class="nav-item"><a href="<c:url value='/user/userJoin' />"
                  class="nav-link link-dark px-2">Sign up</a></li>
            </ul>
         </div>
      </nav>
      
   </header>