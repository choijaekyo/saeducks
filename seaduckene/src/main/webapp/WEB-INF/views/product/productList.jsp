<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<div class="container container-board-div2">
	<div class="row row-cols-1 row-cols-md-3 mb-3 text-center" style="margin-top: 20px;">
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


