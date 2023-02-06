<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp"%>

<div class="container mt-4">
	<div class="row text-center">
		<h4 class="h4">문의 사항</h4>
	</div>
	<form class="was-validated" action="${pageContext.request.contextPath}/admin/askWrite" method="post">
		
		<input type="hidden" name="askListUserNo" value="${empty login ? 0 : login.userNo}">
	
		<div class="mb-3">
			<select class="form-select" required aria-label="select example" name="askListSelectNo">
				<option selected disabled value="">선택하세요</option>
				<option value="1">카테고리</option>
				<option value="2">상품문의</option>
				<option value="3">사용자문의</option>
				<option value="4">기타문의</option>
			</select>
		</div>
		
		<div class="mb-3 form-floating">
			<textarea name="askListContent" onkeyup="autoHeight();" class="form-control" id="sss" placeholder="문의하실 내용을 입력하세요." required style="resize: none;"></textarea>
			<label for="sss">문의하실 내용을 입력하세요.</label>
		</div>

		<div class="col-12">
			<button class="sbtn cyan small rounded" type="submit">문의하기</button>
		</div>
	</form>
	
	<div class="row mt-4 text-center">
		<h4 class="h4">내가 문의한 내용</h4>
	</div>
	<div class="row">
		<c:forEach var="i" items="${askList}" >
			<div class="list-group mb-2">
				<div class="list-group-item list-group-item-secondary" >
				  <div class="d-flex w-100 justify-content-between">
				    <div>
				      <h6 class="mb-0">사용자</h6>
				      <p class="mb-0 opacity-75"  style="white-space:pre;">${i.askListContent}</p>
				    </div>
				    <small class="opacity-50 text-nowrap">
				    	<c:set var="now" value="${i.askListRegDate}" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a h:mm" type="date"/>
				    </small>
				  </div>
				</div>
				<c:if test="${not empty i.askListReplyContent}">
					<div class="list-group-item list-group-item-action" >
					  <div class="d-flex w-100 justify-content-between">
					    <div>
					      <h6 class="mb-0">관리자</h6>
					      <p class="mb-0 opacity-75" style="white-space:pre;">${i.askListReplyContent}</p>
					    </div>
					    <small class="opacity-50 text-nowrap">
					    	<c:set var="now" value="${i.askListUpdateDate}" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a h:mm" type="date"/>
					    </small>
					  </div>
					</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
	function autoHeight() {
		var textEle = $('textarea');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight);
	};
</script>