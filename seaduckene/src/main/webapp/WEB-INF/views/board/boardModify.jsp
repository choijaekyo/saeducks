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

				<form action="${pageContext.request.contextPath}/Board/boardUpdate"
					method="post" name="updateForm">
					<div class="form-group">
						<label>번호</label> <input class="form-control" name="bno" value=""
							readonly>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value="" readonly>
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title"
							value="">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" id="summernote" rows="10"
							name="content"></textarea>
					</div>
					
					<br>

					<button type="button" id="listBtn" class="btn btn-dark">목록</button>
					<button type="button" id="updateBtn" class="btn btn-primary">변경</button>
					<button type="button" id="delBtn" class="btn btn-info">삭제</button>
					
				</form>

			</div>
		</div>
	</div>
</section>


<%@ include file="../include/footer.jsp"%>


<script>
	$(function() {
		//목록 이동 처리
		$('#listBtn')
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/board/boardList";
						});

		//수정 버튼 이벤트 처리
		$('#updateBtn').click(function() {
			if ($('input[name=title]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else if ($('textarea[name=content]').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('textarea[name=content]').focus();
				return;
			} else {
				document.updateForm.submit();
			}
		});

		$('#delBtn')
				.click(
						function() {
							if (confirm('정말 삭제하시겠습니까?')) {
								$('form[name=updateForm]')
										.attr('action',
												'${pageContext.request.contextPath}/Board/boardDelete');
								$('form[name=updateForm]').submit();
							}
						});

	});
</script>