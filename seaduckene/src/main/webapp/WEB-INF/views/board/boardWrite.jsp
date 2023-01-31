<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<div class="container" style="margin-top: 20px;">
   <div class="row">
      <div class="mb-3">
	  	<div class="col col align-self-center" style="position: relative;">
        	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='15'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
			  <ol class="breadcrumb" style="margin-bottom: 0; font-size: 28px; color: #ffc107; margin-top:10px;">
			    <li class="breadcrumb-item" id="majorTitle">${category.categoryMajorTitle}</li>
			    <li class="breadcrumb-item" id="minorTitle">${category.categoryMinorTitle}&nbsp;&nbsp;</li>
			  </ol>
			</nav>
        </div>
	</div>
   </div>
   <div class="row">
      <div class="col mb-1">
		<p>작성자: ${nickName }</p>
      </div>
   </div>
</div>

<form action="${pageContext.request.contextPath}/board/boardWrite" id="writeForm" method="post">

   <div class="container">
      <div class="form-group">
         <label for="exampleFormControlInput1">&nbsp;제목</label> 
         <input type="text" class="form-control" id="exampleFormControlInput1" name="boardTitle" placeholder="제목을 작성해주세요." maxlength="50" >
      </div>

      <div class="form-group boardContent-summernote">
         <textarea class="form-control" id="summernote" rows="10" name="boardContent"></textarea>
      </div>

      <input type="hidden" name="boardUserNo" value="${login.userNo}"> 
      <input type="hidden" name="boardCategoryNo" value="${categoryNo}"> <br>

      <div>
         <button type="button" class="btn btn-info btn-sm" id="board-Write-button">등록하기</button>
         <a href='<c:url value='/board/boardList/${categoryNo}'/>' class="btn btn-secondary btn-sm" 
            id="WritelistBtn">목록으로</a>
      </div>

   </div>
</form>

<%@ include file="../include/footer.jsp"%>


<script>                                                                                                                                                                                                                                                 

	$(document).ready(function() {
		let jsonArray = [];
	
		
    $('#board-Write-button').click(function() {
       console.log('글 등록 버튼 이벤트 발생!');
       
       if($('input[name=boardTitle]').val().trim() === '') {
          alert('제목은 필수 항목입니다.');
          $('input[name=boardTitle]')
          return;
         } else if($('textarea[name=boardContent]').val().trim() === '') {
            alert('내용은 필수 항목입니다.');
            $('textarea[name=boardContent]')
            return;
         } else {
            console.log('jsonArray: ' + jsonArray);
            console.log('길이: ' + jsonArray.length);
            
            for(var i = 0; i<jsonArray.length; i++){
               console.log('반복문 동작!');
               var str = jsonArray[i].url;
               console.log(str);
               // str의 값 : common/getImg.do?savedFileName=bc395afe-2324-438d-ae68-1a0a75d0a431.png 
               // '='를 기준으로 자른다.
               var result = str.split('/');
               console.log('정제된 데이터: ' + result);

               const $input = document.createElement('input');
               $input.setAttribute('name', 'filename');
               $input.setAttribute('type', 'hidden');
               $input.setAttribute('value', result[3]);

               document.getElementById('writeForm').appendChild($input);
               
            }            
           
            $('#writeForm').submit();
            
         }
    });

	
		// https://programmer93.tistory.com/31 여기서 봄
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
		['insert',['picture']]
		// 코드보기, 확대해서보기, 도움말
		,['view', ['codeview']]
        ],
      // 추가한 글꼴
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
      // 추가한 폰트사이즈
      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
      callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			// onImageUpload : function(files) {
		    onImageUpload : function(files, editor, welEditable) {
				/* uploadSummernoteImageFile(files[0],this);*/
				for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i], this);
                }
			},
		onPaste: function (e) {
			var clipboardData = e.originalEvent.clipboardData;
			if (clipboardData && clipboardData.items && clipboardData.items.length) {
				var item = clipboardData.items[0];
				if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
					e.preventDefault();
				}
			}
		}
	  }
    });
    
    function uploadSummernoteImageFile(file, editor) {

		var formData = new FormData();
		formData.append("file",file);

		$.ajax({
			data : formData,
			type : 'POST',
			url : '<c:url value="/board/uploadSummernoteImageFile"/>',
			enctype: 'multipart/form-data',
			cache: false,
			contentType : false,
			processData : false,
			success : function(result) {
            	//항상 업로드된 파일의 url이 있어야 한다.
               console.log(result);
               jsonArray.push(result);
				$(editor).summernote('insertImage', result.url);
			}
		});
	}
   

   //새로고침, 브라우저 종료, 뒤로가기 감지 이벤트
   $(window).on('beforeunload', function(){
      deleteTempFile();
      $('#summernote').summernote('reset');
      return "Any changes will be lost";
    });
    //폼 submit 때는 경고창 뜨지 않도록 하기
    $(document).on("submit", "form", function(event){
        $(window).off('beforeunload');
    });
    
    function deleteTempFile() {
      let deleteFiles = [];
    	for(var i = 0; i<jsonArray.length; i++){
            console.log('반복문 동작!');
            var str = jsonArray[i].url;
            console.log(str);
            var result = str.split('/');
            console.log('정제된 데이터: ' + result);
            deleteFiles.push(result[3]);
      }

      console.log(deleteFiles);
      
      $.ajax({
         type: 'post',
         contentType: 'application/json',
         url: '${pageContext.request.contextPath}/board/tempDelete',
         data: JSON.stringify(deleteFiles)
      });
	} 
  }); 

</script>
