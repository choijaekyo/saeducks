<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<form action="${pageContext.request.contextPath}/board/boardWrite" id="writeForm" method="post">

   <div class="container">
      <div class="form-group">
         <label for="exampleFormControlInput1">제목</label> 
         <input type="text" class="form-control" id="exampleFormControlInput1" name="boardTitle" placeholder="제목을 작성해주세요." >
      </div>

      <div class="form-group boardContent-summernote">
         <textarea class="form-control" id="summernote" rows="10" name="boardContent"></textarea>
      </div>

      <input type="hidden" name="boardUserNo" value="${login.userNo}"> 
      <input type="hidden" name="boardCategoryNo" value="${categoryNo}"> <br>

      <div>
         <button type="submit" class="btn btn-info" id="board-Write-button">등록하기</button>
         <a href='<c:url value='/board/boardList/${categoryNo}'/>' class="btn btn-secondary"
            id="WritelistBtn">목록으로</a>
      </div>

   </div>
</form>

<%@ include file="../include/footer.jsp"%>


<script>

	$(function() {
	    $('#board-Write-button').click(function() {
	       if($('input[name=boardTitle]').val().trim() === '') {
	          alert('제목은 필수 항목입니다.');
	          $('input[name=boardTitle]')
	          return;
	       } else if($('textarea[name=boardContent]').val().trim() === '') {
	          alert('내용은 필수 항목입니다.');
	          $('textarea[name=boardContent]')
	          return;
	       } else {
	          $('#writeForm').submit();
	       }
	    });
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
    	    onImageUpload: function(files) {
    	      console.log(files);
    	      $summernote.summernote('insertNode', imgNode);
    	    }
    	  }
    });
    
    /* function uploadSummernoteImageFile(file, el) {
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
	} */
  }); 
</script>
