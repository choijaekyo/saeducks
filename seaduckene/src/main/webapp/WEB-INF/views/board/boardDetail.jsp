<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../include/header.jsp"%>



<div class="container">
	<div class="card" style="width: 18rem;" id="board-detail-card">
		<div class="card-body" id="board-detail-card-body">
			<h5 class="card-title">~~게시판 입니다.</h5>
			<p class="card-text">~~게시판에 걸맞는 글을 작성해 주세요.</p>
			<button id="board-detail-card-body-button" type="button"
				class="btn btn-primary">Home</button>
		</div>
	</div>
</div>


<div class="container text-center">
	<div class="row">
		<div class="col d-flex flex-row justify-content-end"
			id="board-detail-item">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="#" class="nav-link">글쓴이</a></li>
				<li class="nav-item"><a href="#" class="nav-link">날짜</a></li>
				<li class="nav-item"><a href="#" class="nav-link">추천</a></li>
				<li class="nav-item"><a href="#" class="nav-link">조회</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="container">

	<div class="card mb-4">
		<div class="card-body">
			<form>
				<div class="mb-3">
					<label for="title" class="form-label">제목</label> <input type="text"
						class="form-control" id="title" name="title"
						value="${board.title}" readonly>
				</div>
				<div class="mb-3" id="board-detail-content">
					<label for="content" class="form-label">내용</label>
					<textarea class="form-control" id="content" name="content"
						rows="15">${board.content}</textarea>
				</div>
				<div id="board-detail-button">
					<button class="right btn btn-info" id="modallistBtn">목록가기</button>
					<button class="right btn btn-info" id="modalModBtn">수정하기</button>
					<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="container">
	<div class="card-body">
		<div class="row gx-5">
			<div class="col-auto">
				<div class="avatar avatar-online">
					<img src="assets/img/avatars/6.jpg" alt="#" class="avatar-img">
				</div>
			</div>

			<div class="col">
				<div class="d-flex align-items-center mb-3">
					<h5 class="me-auto mb-0">Ollie Chandler</h5>
					<span class="text-muted extra-small ms-2">08:45 PM</span>
				</div>

				<div class="d-flex align-items-center">
					<div class="line-clamp me-auto">Hello! Yeah, I'm going to
						meet friend of mine at the departments stores now.</div>

					<div class="badge badge-circle bg-primary ms-5">
						<span>3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>
</div>

<%@ include file="../include/footer.jsp"%>

<script>



</script>

