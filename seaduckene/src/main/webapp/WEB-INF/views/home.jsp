<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jsp"%>

<!--================ side =================-->
<div class="container" id="main_container_one">
	<div class="row">
		<div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	      	<c:forEach var="i" items="${mainListImg}">
	        	<div class="swiper-slide img-fluid"><a href="#" style="width: 100%; height: 100%; text-align: center; line-height: 50%;"><img src="<c:url value='/product/mainDisplayImg?fileLoca=${i.productImageFolder}&fileName=${i.productImageFileName}' />" alt=".."></a></div>
	        </c:forEach>
	      </div>
	    </div>
	</div>
</div>
<!--================ END side =================-->

<!--================ board list content =================-->
<div class="container">
	<div class="row">
		<section class="facilities_area section_gap" id="section_gap_id">
		    <div class="container">
		        <div class="section_title text-center">
		            <h2 class="title_w">내가 선택한 덕질</h2>
		            <p>All the dig in this world that I chose</p>
		        </div>
		        <div class="row mb_30">
		        	<c:forEach var="b" items="${boardList}">
		            <div class="col-lg-4 col-md-6">
		                <div class="facilities_item">
		                    <h4 class="sec_h4">
			                    <i class="bi bi-trophy-fill"></i>
			                    ${b.boardTitle}
		                    </h4>
		                    <%-- <p class="d-inline-block text-truncate">내용 : ${b.boardContent}</p> --%>
		                    <p>조회수 : ${b.boardViews}</p>
		                    <p>소카테고리 : ${b.categoryMinorTitle}</p>
		                    <%-- <p>작성자 : ${b.userNickname}</p> --%>
		                </div>
		            </div>
		            </c:forEach>
		        </div>
		    </div>
		</section>
	</div>
</div>
<!--================ END board list content =================-->


<%@ include file="include/footer.jsp"%>
