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
<script type="text/javascript">
	console.log('${category.categoryMajorTitle}');
</script>

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
                <%--   <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false">안씀</a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/admin/adminLogin' />">관리자 로그인</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/admin/adminMain' />">관리자메인</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/admin/userSearch' />">주문목록</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/admin/productList' />">상품목록</a></li>
               
                     </ul></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 주문테스트</a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/product/order' />">주문서</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/product/createProduct' />">상품등록</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/user/userBasket' />">장바구니</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/product/productDetail?productNo=4' />">상품상세</a></li>
                     </ul></li> --%>
                  <c:forEach var="mj" items="${majorListHeader}" varStatus="st">
	                  <li class="nav-item dropdown"><a
	                     class="nav-link dropdown-toggle" href="#" role="button"
	                     data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-caret-down-fill"></i> ${mj } </a>       
	                     <ul class="dropdown-menu">
		                     <c:forEach var="ctHeader" items="${ctListHeader }">
				             	<c:if test="${ctHeader.categoryMajorTitle == majorListHeader[st.index]}">
				                    <li><a class="dropdown-item" href="<c:url value='/board/boardList/${ctHeader.categoryNo }' />">${ctHeader.categoryMinorTitle  }</a></li>  		
		                    	</c:if>   	
		                     </c:forEach>
	                    </ul>   
	                 </li>
                 </c:forEach>
                 
                  <%-- <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 공지 & 건의 (구현 임시 링크) </a>
                     <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value='/board/notice' />">공지사항</a></li>
                        <li><a class="dropdown-item" href="<c:url value='#' />">Q & A</a></li>
                        <li><a class="dropdown-item" href="<c:url value='#' />">????</a></li>
                     </ul></li> --%>
               </ul>
            </div>

            <ul class="nav login-box">
            <c:choose>
            <c:when test="${admin!=null }">
            	<li class="nav-item admin_logout"><a href="<c:url value='/admin/adminLogout' />"
                  class="nav-link link-dark px-2">관리자접속중</a></li>
               <li class="nav-item"><a href="<c:url value='/admin/adminMain' />"
                  class="nav-link link-dark px-2">관리자메인</a></li>
            </c:when>
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
   
   <script>
	$(document).ready(function() {
		
		
		$('.admin_logout .link-dark').hover(function() {
			$(this).text('로그아웃 하기');
		}, function() {
			$(this).text('관리자접속중');
			
		});
		
		
		var $dropdown = $(".navbar-nav .dropdown");
		var $dropdownToggle = $(".dropdown-toggle");
		var $dropdownMenu = $(".dropdown-menu");
		var showClass = "show";
		
		$(window).on("load resize", function() {
		if (this.matchMedia("(min-width: 768px)").matches) {
		      $dropdown.hover(
		        function() {
		          var $this = $(this);
		          $this.addClass(showClass);
		          $this.find($dropdownToggle).attr("aria-expanded", "true");
		          $this.find($dropdownMenu).addClass(showClass);
		        },
		        function() {
		          var $this = $(this);
		          $this.removeClass(showClass);
		          $this.find($dropdownToggle).attr("aria-expanded", "false");
		          $this.find($dropdownMenu).removeClass(showClass);
		        }
		      );
		} else {
		    $dropdown.off("mouseenter mouseleave");
		}

		});
		
		
	});

   </script>