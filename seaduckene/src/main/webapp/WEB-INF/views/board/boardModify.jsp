<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-9 write-wrap">
				<div class="titlebox">
					<p>수정하기</p>
				</div>

				<form action="${pageContext.request.contextPath}/board/boardUpdate"
					method="post" name="updateForm" id="modifyForm">
					<input type="hidden" name="boardNo" value="${ list.boardNo }">

					<%-- <div class="form-group">
						<label>번호</label> <input class="form-control" name="bno" value="${list.boardNo}"
							readonly>
					</div> --%>

					<%-- <div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value="${list.userNo}" readonly>
					</div> --%>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name="boardTitle"
							value="${list.boardTitle}">
					</div>
					<div class="form-group boardContent-summernote">
						<label>내용</label>
						<textarea class="form-control" id="summernote" rows="10"
							name="boardContent">${list.boardContent}</textarea>
					</div>

					<br>

					<button type="button" onclick="history.back(-1)"
						class="btn btn-dark">취소</button>


					<button type="submit" id="updateBtn" class="btn btn-primary">변경</button>


					<button type="button" id="delBtn" class="btn btn-info">삭제</button>

				</form>

			</div>
		</div>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>


<script>

	
	$(function() {
		

		/* //수정 버튼 이벤트 처리
		$('#updateBtn').click(function() {
			if ($('input[name=boardTitle]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=boardTitle]').focus();
				return;
			} else if ($('#summernote').text().trim() === '') {
				alert('내용은 필수 항목입니다!');
				$('#summernote').focus();
				return;
			} else {
				$('#modifyForm').submit();
			}
		}); //수정 버튼 이벤트 처리 끝. */

		$('#delBtn')
				.click(
						function() {
							if (confirm('정말 삭제하시겠습니까?')) {
								$('form[name=updateForm]')
										.attr('action',
												'${pageContext.request.contextPath}/board/boardDelete');
								$('form[name=updateForm]').submit();
							}
						})

	});
</script>