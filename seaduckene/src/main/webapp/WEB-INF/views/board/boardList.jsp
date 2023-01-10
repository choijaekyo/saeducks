<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<div class="container">
	<div class="row mb-1">
	  	<div class="col" style="position: relative;">
	  		<button type="button" class="btn btn-warning w-auto rounded btn-shadow">대카테고리고리</button>
	  		<button type="button" class="btn btn-success w-auto rounded">소소카테고리</button>
	  		<button type="button" class="btn btn-info w-auto rounded">전체상품</button>
	  		<a class="btn btn-info w-auto rounded" href="<c:url value='/board/boardWrite/${categoryNo}' />">글쓰기</a>
        </div>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="contentDiv">

			<!-- 비동기 방식으로 서버와 통신을 진행한 후 
				목록을 만들어서 붙일 예정. -->

	</div>
	<div class="row justify-content-center m-5">
	  	<div class="col-1 w-auto">
	  		<button type="button" class="btn btn-primary rounded" id="the-btn">더보기</button>
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
	
	//등록하기 버튼 클릭 이벤트
	$('#the-btn').click(function() {
		if(!isFinish) {
			page++;
			getList(page, false);
		} else {
			console.log('더이상 불러올 목록이 없다.');
		}
	});
	
	const categoryNo = '${categoryNo}';
	let str = '';
	let page = 1;
	let isFinish = false;
	console.log(categoryNo);
	getList(1, false);
	
	function getList(page, reset) {
		
		console.log('getList 함수 호출');
		console.log('page: ' + page);
		console.log('reset: ' + reset);
		
		if(reset === true) {
			str = ''; //화면 리셋 여부가 true라면 str변수를 초기화.
		}
		
		$.getJSON(
			'<c:url value="/board/boardLists?pageNum='+ page +'&categoryNo='+ categoryNo +'" />',
			function(list) {
				console.log(list.length);
				console.log(list);
				
				if(list.length === 0) isFinish = true;
				
				for(let i=0; i<list.length; i++) {
					
					str += 
					`<div class="col">
				    <div class="card shadow-sm detailButton" data-bno="` + list[i].boardNo + `">
				      <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">` + list[i].boardTitle + `</text></svg>
				      <div class="card-body">
				        <p class="card-text">` + list[i].boardContent + `</p>
				        <div class="d-flex justify-content-between align-items-center">
				          <small class="text-muted">9 mins</small>
				        </div>
				      </div>
				    </div>
			  		</div>`;		
				}
				
				$('#contentDiv').html(str);
			}
			
				
		); //end getJSON()
		
		$('#contentDiv').on('click', '.detailButton', function(e) {
			console.log($(this)[0]);
			const bno = $(this).data('bno');
			console.log(bno);
			location.href='${pageContext.request.contextPath}/board/boardDetail/' + bno;
			
			
		})
		
	}; //end getList()
	
	
});
</script>


