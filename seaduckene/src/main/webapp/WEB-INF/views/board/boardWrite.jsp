<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col mb-1">
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>작성자</button>
			<button type="button" class="btn btn-outline-secondary rounded"
				disabled>날짜</button>
		</div>
	</div>
</div>

<form action="${pageContext.request.contextPath}/board/boardWrite"
	id="writeForm" method="post">
	<div class="input-group inputArea">
		<div class="container">
			<div class="col-12">
				<label for="category">카테고리</label>
			</div>
			<div class="col-12">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<select class="form-select" aria-label="Default select example"
							name="majorCategory" id="majorCategory">
							<option selected disabled>대 카테고리</option>
							<c:forEach var="list" items="${major }">
								<option>${list }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-3 col-sm-12">
						<select class="form-select" aria-label="Default select example"
							name="minorCategory" id="minorCategory">
							<option selected disabled>소 카테고리</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="form-group">
			<label for="exampleFormControlInput1">제목</label> <input type="text"
				class="form-control" id="exampleFormControlInput1" name="boardTitle"
				placeholder="제목을 작성해주세요.">
		</div>

		<div id="summernote" class="summernote"></div>
		<input type="hidden" name="boardUserNo" value="1"> <input
			type="hidden" name="boardCategoryNo" value="1"> <br>

		<div>
			<button type="button" class="btn btn-info" id="board-Write-button">등록하기</button>
			<a href='<c:url value='/board/boardList'/>' class="btn btn-secondary"
				id="WritelistBtn">목록으로</a>
		</div>

	</div>
</form>

<%@ include file="../include/footer.jsp"%>


<script>
	$(function() {

		$('#board-Write-button').click(function() {
			if ($('input[name=boardTitle]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=boardTitle]')
				return;
			} else if ($('textarea[name=boardContent]').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('textarea[name=boardContent]')
				return;
			} else {
				$('#writeForm').submit();
			}
		});
	});

	$(document).ready(
			function() {

				//Bootstrap 4 + daemonite material UI + Summernote wysiwyg text editor
				//doc : https://github.com/summernote/summernote

				$('#summernote')
						.summernote(
								{
									minHeight : 200,
									placeholder : 'Write here ...',
									focus : false,
									airMode : false,
									fontNames : [ 'Roboto', 'Calibri',
											'Times New Roman', 'Arial' ],
									fontNamesIgnoreCheck : [ 'Roboto',
											'Calibri' ],
									dialogsInBody : true,
									dialogsFade : true,
									disableDragAndDrop : false,
									toolbar : [
											// [groupName, [list of button]]
											[
													'para',
													[ 'style', 'ul', 'ol',
															'paragraph' ] ],
											[ 'fontsize', [ 'fontsize' ] ],
											[
													'style',
													[ 'bold', 'italic',
															'underline',
															'clear' ] ],
											[
													'font',
													[ 'strikethrough',
															'superscript',
															'subscript' ] ],
											[ 'height', [ 'height' ] ],
											[
													'misc',
													[ 'undo', 'redo', 'print',
															'help',
															'fullscreen' ] ] ],
									popover : {
										air : [
												[ 'color', [ 'color' ] ],
												[
														'font',
														[ 'bold', 'underline',
																'clear' ] ] ]
									},
									print : {
									//'stylesheetUrl': 'url_of_stylesheet_for_printing'
									}
								});
			});
</script>

