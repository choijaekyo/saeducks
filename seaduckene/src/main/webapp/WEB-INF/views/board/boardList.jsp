<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<div class="container">
	<div class="row mb-3">
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
				      <svg width="100%" height="225">
				      <defs>
				      <filter id="rounded-corners-2" primitiveUnits="objectBoundingBox">
				      <feImage preserveAspectRatio="none" width="110%" height="110%" x="-5%" y="0%"  xlink:href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' x='0px' y='0px' viewBox='0 0 400 40' height='40' width='400'%3E%3Crect fill='lightgray' x='0' y='0' rx='10' ry='10' width='400' height='40'/%3E%3C/svg%3E"/>
				         <feComposite operator="over" in="SourceGraphic"/>
				        </filter>
				      </defs>
				      
				      <image href="/board/getImg/` + list[i].boardImageUuid + `" width="100%" height="100%" style="opacity: 0.5;"/>
				      <text x="37%" y="50%" fill="#000" filter="url(#rounded-corners-2)">` + list[i].boardTitle + `</text>
				      </svg>
				      <div class="card-body">
				      
				        
				        <div class="d-flex justify-content-between align-items-center">
				          <small style="width: 100%;"><p class="text-end" style="color: #5c5e5e;">` + timeForToday(list[i].boardRegDate) + ` mins</p></small>
				        </div>
				      </div>
				    </div>
			  		</div>`;	
					/* <p class="card-text">` + list[i].boardContent + `</p> */
					/* <img src="/board/getImg/1ffbac24-1c3c-4028-988a-ec8e67912c94.png" style="width: 100%; height: 100%;"/> */
				}
				
				$('#contentDiv').html(str);
			}
			
				
		); //end getJSON()
		
		$('#contentDiv').on('click', '.detailButton', function(e) {
			console.log($(this)[0]);
			const bno = $(this).data('bno');
			console.log(bno);
			location.href='${pageContext.request.contextPath}/board/boardDetail/' + bno;
			
			
		});
		
		function timeForToday(value) {
			console.log(value);
	        const today = new Date();
	        const timeValue = new Date(value);

	        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	        if (betweenTime < 1) return '방금전';
	        if (betweenTime < 60) {
	            return betweenTime + '분전';
	        }

	        const betweenTimeHour = Math.floor(betweenTime / 60);
	        if (betweenTimeHour < 24) {
	            return betweenTimeHour + '시간전';
	        }

	        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	        if (betweenTimeDay < 365) {
	            return betweenTimeDay + '일전';
	        }

	        return Math.floor(betweenTimeDay / 365) + '년전';
	 }
		
	}; //end getList()
	
	
});
</script>


