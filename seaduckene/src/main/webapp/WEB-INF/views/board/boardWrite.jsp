<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col mb-1">
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>대카테고리</button>
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>소카테고리</button>
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>작성자</button>
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>날짜</button>
		</div>
	</div>
</div>

<form action="${pageContext.request.contextPath}/board/boardWrite"
	id="writeForm" method="post">
	
	<div class="container">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="exampleFormControlInput1" name="boardTitle"
				placeholder="제목을 작성해주세요.">
		</div>
 
		<div class="row">
			<div class="col">
				<textarea class="summernote" 
					id="exampleFormControlTextarea1" name="boardContent" rows="10"></textarea>
			</div>
		</div>
		<input type="hidden" name="boardUserNo" value="1">
		<input type="hidden" name="boardCategoryNo" value="1">
		<br>
		<button type="submit" class="btn btn-info">등록하기</button>
		<button type="button" class="btn btn-secondary">목록으로</button>
	</div>
</form>
		

<%@ include file="../include/footer.jsp"%>

<script>
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});
	});
</script>