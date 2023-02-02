<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
    <meta name="generator" content="Hugo 0.104.2" />
    <title>세덕이네 관리자 페이지</title>
    
    <!-- 부트스트랩  CDM -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 제이쿼리 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />

	<!-- summernote 추가 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js" defer></script>
	
	<style>
	
		a#main {
			display: block;
			width: 50px;
			height: 50px;
			border-radius: 50%;
			background: tomato;
			text-align: center;
			line-height: 50px;
			margin-right: 20px;
			text-decoration: none;
			color: white;
			
			position: fixed;
			bottom: 20px;
			right: 10px;
		}
		
	body {
        background-color: #fff9d6;
      }
	
	</style>
   
  </head>
  <body>
  	<form action="${pageContext.request.contextPath}/admin/adminNoticeCreate" id="notice-form" method="post">
	  	<div class="container">
	  		<div class="row">
			      <div class="form-group">
			         <label for="exampleFormControlInput1">제목</label> 
			         <input type="text" class="form-control" id="exampleFormControlInput1" name="noticeTitle">
			      </div>
			
			      <div class="form-group">
			         <textarea class="form-control" id="summernote" rows="10" name="noticeContent"></textarea>
			      </div>
			
			      <div>
			         <button type="button" class="btn btn-info" id="notice-Write-button">등록하기</button>
			         <a href='<c:url value='/admin/adminMain'/>' class="btn btn-secondary">메인으로</a>
			      </div>
	  		</div>
	  	</div>
  	</form>
  	<a id="main" href="<c:url value='/admin/adminMain'/>" >main</a>
  	<!-- 스와이프 js -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
  	
  	<script>
  	$(document).ready(function() {
  		let jsonArray = [];
  		
  		 $('#notice-Write-button').click(function() {
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
				$input.setAttribute('value', result[3]);
				$input.setAttribute('type', 'hidden');
				
				document.getElementById('notice-form').appendChild($input);  
			}
  			$('#notice-form').submit();
  		 });
  		
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
	  		    onImageUpload : function(files, editor, welEditable) {
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
  	
  </body>
</html>
