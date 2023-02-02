<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 write-wrap">
				<div class="titlebox">
					<p>수정하기</p>
				</div>

				<form action="${pageContext.request.contextPath}/board/boardUpdate"
					method="post" name="updateForm" id="modifyForm">
					<input type="hidden" name="boardNo" value="${ list.boardNo }">
					<input type="hidden" name="boardCategoryNo" value="${ list.boardCategoryNo }">

					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name="boardTitle" maxlength="50" value="${list.boardTitle}">
					</div>
					<div class="form-group boardContent-summernote">
						<label>내용</label>
						<textarea class="form-control" id="summernote" rows="10"
							name="boardContent"></textarea>
					</div>
					<div class="mt-3 float-end" style="color: #8c8c8c;">
      					<span class=textCount>0</span>
      					<span class=textTotal>/100000Byte &nbsp;</span>
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
	
	$(document).ready(function() {
	    $('#summernote').summernote({
	      height: 500,                 // 에디터 높이
	      minHeight: null,             // 최소 높이
	      maxHeight: null,             // 최대 높이
	      focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
	      lang: "ko-KR",					// 한글 설정
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
	 
	    
	    $('.note-editable').click(function() {
			console.log('기본 이벤트!');
			
			let boardContent = $('.note-editable').html();
			let boardContentLength = boardContent.length;
			let boardContentByteLength = 0;
			
			boardContentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
				return b
			})(boardContent);
			
			$('.textCount').text(boardContentByteLength);
		
		}); 
	    
	    
			$('.boardContent-summernote').keydown(function() {
				console.log('키 이벤트 발생');
				
				// textarea 값
				let boardContent = $('.note-editable').html();
				
				// textarea length
				let boardContentLength = boardContent.length;
				let boardContentByteLength = 0;
				
				console.log(boardContent, 'boardContent');
				console.log(boardContentLength, 'boardContentLength');
				
				boardContentByteLength = (function(s,b,i,c) {
					for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
					return b
				})(boardContent);
			
				if(boardContentByteLength >= 100000) {
					alert('글자수 제한!');
					return;
				};
				
				console.log('boardContentByteLength', boardContentByteLength);
				$('.textCount').text(boardContentByteLength);
				
			}); // 글자 수 event 끝.
	
	    
	    
		$(function() {
			
			const bno = '${ list.boardNo }';
			const no = '${list.boardCategoryNo}';
			console.log(bno);
			console.log(no);
			
			console.log('글 등록 버튼 이벤트 발생!');
	    	// textarea 값
			let boardContent = $('.note-editable').html();  
			
			// textarea length
			let boardContentLength = boardContent.length;
			let boardContentByteLength = 0;
			
			console.log(typeof(boardContent), 'boardContentByteLength');
			console.log(boardContentLength, 'boardContentLength');
			
			
			boardContentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
				return b
			})(boardContent);
			
			$('#updateBtn').click(function(e) {
				e.preventDefault();
				if($('input[name=boardTitle]').val().trim() === '') {
					alert('제목은 필수 항목입니다.');
					return;
				} else if($('#summernote').val().trim() === '') {
					alert('내용은 필수 항목입니다!');
					return;
				} else if(boardContentByteLength >= 100000) {
					alert('내용은 100000byte를 넘을 수 없습니다.');
					return;
				}  else if(boardContentByteLength === '11') {
					alert('100000byte를 넘을 경우 글을 수정할 수 없습니다!');
					return;
				} else {
					$('#modifyForm').submit();
				}
				
			}); 
			//수정 버튼 이벤트 처리 끝.

			$('#summernote').summernote('pasteHTML', `${list.boardContent}`);
			$('#delBtn').click(function() {
				if (confirm('정말 삭제하시겠습니까?')) {
					$('form[name=updateForm]').attr('action', '${pageContext.request.contextPath}/board/boardDelete');
					
					$('form[name=updateForm]').submit();
				}
			})

		});
	    
			
	    
	    
	    
	    
	    
	  }); 
</script>