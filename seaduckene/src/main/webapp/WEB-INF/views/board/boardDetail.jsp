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

			<p>
				<fmt:formatDate value="${list.boardRegDate}" pattern="MM-dd HH:mm" />
			</p>
			<!-- 			<li class="nav-item"><a href="#" class="nav-link">추천</a></li>
				<li class="nav-item"><a href="#" class="nav-link">조회</a></li> -->

		</div>
	</div>
</div>


<form action="${pageContext.request.contextPath}/board/boardModify"
	id="writeForm" method="post">

	<div class="container">
		<div class="card mb-4">
			<div class="card-body">
				<div class="mb-3">
					<input type="hidden" name="boardNo" value="${ list.boardNo }">
					<label for="title" class="form-label">제목</label> <input type="text"
						class="form-control" id="title" name="boardTitle"
						value="${list.boardTitle}" readonly>
				</div>
				<div class="mb-3" id="board-detail-content">
					<label for="content" class="form-label">내용</label>
					<textarea class="form-control" id="summernote" name="boardContent"
						readonly rows="15"></textarea>

				</div>
				<div id="board-detail-button">
					<a href='<c:url value='/board/boardList'/>'
						class="right btn btn-info" id="modallistBtn">목록가기</a>
					<button type="submit" class="right btn btn-info" id="modalModBtn">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</form>

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
					<h5 class="me-auto mb-0" name="replyBoardNo" id="replyBoardNo">nick</h5>
					<span class="text-muted extra-small ms-2">date</span>
				</div>
				<div class="d-flex align-items-center">
					<input type="hidden" value="${login.userNo}" id="replyUserNo"></input>
					<textarea class="form-control" rows="3" id="reply"></textarea>
				</div>
				<br>
				<div>
					<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
					<button type="button" id="replyCancel">취소하기</button>
				</div>
			</div>
			<hr>

			<div id="replyList">
				<!-- <div class=col>
				<div class="d-flex align-items-center mb-3"></div>
				<div class="reply-content"> <strong class='left'>nick</strong>
					<small class='left'>date</small> <a href='#' class='right'>
					<textarea class="form-control" rows="3" id="reply"></textarea>
					<span class='glyphicon glyphicon-pencil'></span>수정</a> <a href='#' class='right'>
					<span class='glyphicon glyphicon-remove'></span>삭제</a>
				</div>
				<p class='clearReply'>댓글</p>
			</div> -->
			<!-- <button type="button" class="form-control" id="moreList">더보기</button> -->
		</div>
	</div>
</div>
<hr>
</div>


<!-- 모달  -->
<div class="modal fade" id="replyModal" role="dialog">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn btn-default pull-right"
					data-dismiss="modal">닫기</button>
				<h4 class="modal-title">댓글수정</h4>
			</div>
			<div class="modal-body">
				<!-- 수정폼 id값을 확인하세요-->
				<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply"
						placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
							<input type="hidden" id="modalRno"> <input
								type="password" class="form-control" placeholder="비밀번호"
								id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
				</div>
				<!-- 수정폼끝 -->
			</div>
		</div>
	</div>
</div>






<script>
	$(document).ready(function() {

		$(function() {
			$('#summernote').summernote({
				toolbar : false
			});
			$('#summernote').summernote('disable');
			$('#summernote').summernote('pasteHTML', '${list.boardContent}');
			$('.note-statusbar').hide();
			$('.note-editable').css('background', '	#FFFFFF');
		});

		$('#replyRegist').click(function() {

			const boardNo = '${list.boardNo}';
			const reply = $('#reply').val();
			const replyUserNo = $('#replyUserNo').val();
			console.log('dwadwadwa' + replyUserNo);
			console.log(reply);
			console.log(boardNo);

			/* const data = {
					"boardNo":boardNo,
					"reply":reply,
					"replyBoardNo":replyBoardNo,
					"replyUserNo":replyUserNo
			};
			console.log(data); */

			/* if(reply === '') {
				alert('내용을 입력하세요!')
				return;
			} */

			$.ajax({
				type : 'post',
				url : '<c:url value="/reply/replyRegist" />',
				data : JSON.stringify({
					"replyBoardNo" : boardNo,
					"replyContent" : reply,
					"replyUserNo" : replyUserNo
				}),
				dataType : 'text',
				contentType : 'application/json',
				success : function(data) {
					console.log('통신 성공!: ' + data);
					$('#replyContent').val('');
					getList(1, true);
				},
				error : function() {
					alert('등록에 실패했습니다. 관리자에게 문의해주세요.');
				}

			}); //ajax 끝.

		});//댓글 등록 이벤트 끝.

		let page = 1;
		let strAdd = '';

		getList(1, true);

		function getList(pageNum, reset) {

			const bno = '${list.boardNo}';
			
			$.getJSON(
					"<c:url value='/reply/getList/' />" + bno + "/" + pageNum,
					function(data) {
						console.log(data);
						
						console.log("data " + data);
						
						const total = data.total;
						const reply = data.replyList;
						
						console.log("total "+ total);
						console.log("reply "+ reply);
						
						if(reset) {
							strAdd = '';
							page = 1; 
						}
						
						console.log('현재 페이지: ' + page);
						if(total <= page * 5) {
							$('#moreList').css('display', 'none');
						} else {
							$('#moreList').css('display', 'block');
						}
						
						if(data.length <= 0) return;
						
						for(let i=0; i<data.length; i++) {
							strAdd +=
				`<div class=col>
				<div class="d-flex align-items-center mb-3">${replyList.userNickname}</div>
				<div class="reply-content"> <strong class='left'></strong>
					<small class='left'>${replyList.replyRegDate}</small> <a href='#' class='right'>
					<textarea class="form-control" rows="3" id="reply">${replyList.replyContent}</textarea>
				</div>
				<p class='clearReply'>댓글</p>
			</div>`; 
						}
						
						$('#replyList').html(strAdd);
					}
					
			)

		}

	})
</script>
<%@ include file="../include/footer.jsp"%>
