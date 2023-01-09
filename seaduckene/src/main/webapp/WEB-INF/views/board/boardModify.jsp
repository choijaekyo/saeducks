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
	
	$(document).ready(function() {
	    $('#summernote').summernote({
	      height: 500,                 // 에디터 높이
	      minHeight: null,             // 최소 높이
	      maxHeight: null,             // 최대 높이
	      focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	      lang: "ko-KR",					// 한글 설정
	      placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	      toolbar: [
	          // 글꼴 설정
	          ['fontname', ['fontname']],
	          // 글자 크기 설정
	          ['fontsize', ['fontsize']],
	          // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	          // 글자색
	          ['color', ['color']],
	          // 표만들기
	          ['table', ['table']],
	          // 글머리 기호, 번호매기기, 문단정렬
	          ['para', ['ul', 'ol', 'paragraph']],
	          // 줄간격
	          ['height', ['height']],
	          // 그림첨부, 링크만들기, 동영상첨부
	          ['insert',['picture','video']],
	          // 코드보기, 확대해서보기, 도움말
	          ['view', ['codeview']]
	        ],
	      // 추가한 글꼴
	      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	      // 추가한 폰트사이즈
	      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	      callbacks: {
	         onImageUpload : function(files, editor, welEditable){

	          // 파일 업로드(다중업로드를 위해 반복문 사용)
	          for (var i = files.length - 1; i >= 0; i--) {
	              uploadSummernoteImageFile(files[i], this);
	             }
	          }
	       } 
	    });
	    
	    function uploadSummernoteImageFile(file, el) {
	        var data = new FormData();	
	        data.append("file",file);
	            $.ajax({
	              url: '/../summer_image.do',
	              type: "POST",
	              enctype: 'multipart/form-data',
	              data: data,
	              cache: false,
	              contentType : false,
	              processData : false,
	              success : function(data) {
	                       var json = JSON.parse(data);
	                       $(el).summernote('editor.insertImage',json["url"]);
	                           jsonArray.push(json["url"]);
	                           jsonFn(jsonArray);
	                   },
	                   error : function(e) {
	                       console.log(e);
	                   }
	               });
		}
	  }); 
</script>