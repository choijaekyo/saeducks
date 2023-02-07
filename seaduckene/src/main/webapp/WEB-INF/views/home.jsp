<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jsp"%>

<section>
<div class="container">
	<div class="row">
		<div class="col-12 text-center mt-4">
			<h2>세상 모든 덕질</h1>
			<h1>세덕이네</h1>
			<p>당신의 즐거운 덕질을 위해 <br>커뮤니티와 쇼핑을 한 번에!</p>
		</div>
	</div>
</div>
<!--================ side =================-->
<div class="container " id="main_container_one">
	<div class="row">
		<div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	      	<c:forEach var="i" items="${mainListImg}">
	        	<div class="swiper-slide img-fluid"><a href="<c:url value='/product/productDetail?productNo=${i.productImageProductNo }'/>" style="width: 100%; height: 100%; text-align: center; line-height: 50%;"><img src="<c:url value='/product/mainDisplayImg?fileLoca=${i.productImageFolder}&fileName=${i.productImageFileName}' />" alt=".."></a></div>
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
		            <p>내가 선택한 카테고리의 인기글</p>
		        </div>
		        <div class="row mb_30 mt-2">
		        	<c:forEach var="b" items="${boardList}">
		        	<input type="hidden" value="${b.boardNo}" class="bno">
		            <div class="col-lg-4 col-md-6">
		                <div class="facilities_item items${b.boardNo}">
		                    <h5 class="sec_h4 text-truncate">
			                    <i class="bi bi-bookmark-star"></i>
			                    ${b.boardTitle}
		                    </h5>
		                    <%-- <p class="d-inline-block text-truncate">내용 : ${b.boardContent}</p> --%>
		                    <p>조회수 : ${b.boardViews}</p>
		                    <p>소카테고리 : ${b.categoryMinorTitle}</p>
		                    <p>작성자 : ${b.userNickname}</p>
		                </div>
		            </div>
		            </c:forEach>
		        </div>
		    </div>
		</section>
	</div>
</div>
<!--================ END board list content =================-->
</section>


<%@ include file="include/footer.jsp"%>


<script>

	$(function () {
		
		$('.facilities_item').hover(function() {
			$('.facilities_item').css('cursor', 'pointer');
		});
			
		const bnoo = $('.bno');
		console.log(bnoo);
		for (let $bnoo of bnoo) {
			$('.items' + $bnoo.value).click(function() {
				location.href='${pageContext.request.contextPath}/board/boardDetail/'+$bnoo.value;
			});
		}
		
	});

	if ('${msg}' === 'adminLogout') {
		alert('관리자 계정을 로그아웃하셨습니다.');
	} else if ('${msg}' === 'askCategoryBoard') {
		alert('게시글 문의가 정상적으로 요청되었습니다.');
	}
</script>
