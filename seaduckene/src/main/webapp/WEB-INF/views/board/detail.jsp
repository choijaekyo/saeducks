<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>



<div class="container first-board-detail">
	<div class="card" style="width: 18rem;" id="board-detail-card">
		<div class="card-body" id="board-detail-card-body">
			<h5 class="card-title">~~~게시판 입니다.</h5>
			<p class="card-text">~~~게시판에 걸맞는 글을 작성해 주세요.</p>
			<button id="board-detail-card-body-button" type="button"
				class="btn btn-primary">Home</button>
		</div>
	</div>
</div>


<div class="container text-center second-board-detail">
	<div class="row">
		<div class="col d-flex flex-row justify-content-end"
			id="second-board-detail-item">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="#" class="nav-link">글쓴이</a></li>
				<li class="nav-item"><a href="#" class="nav-link">날짜</a></li>
				<li class="nav-item"><a href="#" class="nav-link">추천</a></li>
				<li class="nav-item"><a href="#" class="nav-link">조회</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="container" id="board-detail">

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
					<a href="list" class="btn btn-outline-secondary">목록</a> <a
						href="modify?bno=${board.bno}" class="btn btn-outline-warning">수정</a>
					<a href="remove?bno=${board.bno}" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">삭제</a>
				</div>
			</form>
		</div>
	</div>
</div>




















<%@ include file="../include/footer.jsp"%>