<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<!-- summernote script -->
<script src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<script>
	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 3,
		spaceBetween : 1,
		slidesPerGroup : 1,
		loop : true,
		loopFillGroupWithBlank : true,
		autoplay : {
			delay : 1000,
			disableOnInteraction : false
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true
		}
	});
	
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
	
	/*
		// 서머노트에 text 쓰기
		$('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);
		
		
		// 서머노트 쓰기 비활성화
		$('#summernote').summernote('disable');
		
		// 서머노트 쓰기 활성화
		$('#summernote').summernote('enable');
		
		
		// 서머노트 리셋
		$('#summernote').summernote('reset');
		
		
		// 마지막으로 한 행동 취소 ( 뒤로가기 )
		$('#summernote').summernote('undo');
		// 앞으로가기
		$('#summernote').summernote('redo');
	*/
</script>
</body>
</html>