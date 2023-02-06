<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<section>
	<div class="container mt-4"> 
	  <div class="row">
      <div class="mb-3">
	  	<div class="col col align-self-center" style="position: relative;">
        	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='15'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb" style="margin-bottom: 0; font-size: 25px; color: #ffc107;">
			    <li class="breadcrumb-item mt-1" id="majorTitle">${category.categoryMajorTitle}</li>
			    <li class="breadcrumb-item mt-1" id="minorTitle">${category.categoryMinorTitle}&nbsp;&nbsp;</li>
			  </ol>
			</nav>
        </div>
	</div>
   </div>
</div>
<div class="container container-board-div2">
	<div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
	<c:forEach var="proVo" items="${productList}">
		  <div class="col productcard">
		  <a href="${pageContext.request.contextPath }/product/productDetail?productNo=${proVo.productNo}" id="cardA">
		    <div class="card mb-4 rounded-3 shadow-sm">
		      <div class="card-header py-3">
		        <h4 class="my-0 fw-normal">${proVo.productName }</h4>
		      </div>
		      
		      		<img id="productThumb" src="<c:url value='/product/display2?no=${proVo.productNo }' />" alt="상품이미지" style="height:225px;">
		      
		      <div class="card-body">
		        <h1 class="card-title pricing-card-title">&#8361;<fmt:formatNumber value="${proVo.productPriceSelling}" pattern="#,###" /></h1>
		        <ul class="list-unstyled mt-3 mb-4">
		          <li>${proVo.productDetail}</li>
		          <li>재고수량:${proVo.productStock}</li>
		          <c:if test="${proVo.productStock == 0 }">
		          	<li style="color:red;">품절</li>
		          </c:if>
		        </ul>
		      </div>
		    </div>
		    </a>
		  </div>
	  </c:forEach>
	</div>
</div>
</section>
<%@ include file="../include/footer.jsp"%>

<script>

$(function() {
	
	
	const categoryNo = '${categoryNo}';
	let str = '';
	let page = 1;
	let isFinish = false;
	console.log(categoryNo);
	getList(1, false);
		
		$('#contentDiv').on('click', '.detailButton', function(e) {
			console.log($(this)[0]);
			const bno = $(this).data('bno');
			console.log(bno);
			location.href='${pageContext.request.contextPath}/board/boardDetail/' + bno;
		});
	
	
});
</script>


