<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Insert title here</title>
	
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/askCategoryBoard.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
    <section class="form-signin w-100 m-auto">
      <div class="col-md-12">
        <h1 class="add-product-title h1 mt-4">게시글별 문의사항</h1>
      </div>
      <div class="container">
        <div class="row">	
          <form action="<c:url value='/admin/askCategoryBoard'/>" id="askCategoryBoard-form" method="post">
          	<input type="hidden" name="askBoardUserNo" value="${login.userNo}">
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="category">카테고리</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <div class="row">
                  <div class="col-6">
                    <input class="form-control" value="${category.categoryMajorTitle}" name="askBoardMajorCategory" id="majorCategory" readonly/>
                  </div>
                  <div class="col-6">
                    <input class="form-control" value="${category.categoryMinorTitle}" name="askBoardMinorCategory" id="minorCategory" readonly/>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="cate">제목</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="askBoardTitle" id="title" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productContent">요청사유</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <textarea class="form-control"  name="askBoardContent" id="content" required ></textarea>
              </div>
            </div>

            <div class="inputArea input-group btns">
              <div class="btn-b" >
                <button type="button" class="order_btn sbtn cyan small rounded" id="submit-btn">문의하기</button>
              </div>
              <div class="btn-b">
                <button type="button" class="cancel_btn sbtn blue small rounded"  onclick="history.back()" >뒤로가기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    
    	<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(function() {
	
    // 버튼 클릭, 버튼 엔터 이벤트 시 submit 실행 코드.
    $('#submit-btn').click(submit);
    $('#askCategoryBoard-form').on('keyup', 'input', keyPressEnter);
	
    function keyPressEnter() {
    	if (window.event.keyCode == 13) {
    		submit();				
		}
    }
    
	function submit() {

		if ($('#title').val().trim() === '') {			
			alert('문의 제목을 입력해주세요.');
			$('#title').focus();
			return;
		} else if ($('#content').val().trim() === '') {
			alert('문의 내용을 입력해주세요.');
			$('#content').focus();
			return;
		} 
		
   		$('#askCategoryBoard-form').submit();
		
	}
	
}); // end jQuery

</script>
</html>