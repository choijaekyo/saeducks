<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Insert title here</title>
	
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/userAskCategoryBoardDetail.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
    <section class="form-signin w-100 m-auto">
      <div class="col-md-12">
        <h1 class="add-product-title h1 mt-4">${askCategoryBoard.askBoardTitle}</h1>
      </div>
      <div class="container">
        <div class="row">	
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="category">카테고리</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <div class="row">
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="askBoardMajorCategory" id="majorCategory" disabled>
                      <option selected disabled>${askCategoryBoard.askBoardMajorCategory}</option>
                    </select>
                  </div>
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="askBoardMinorCategory" id="minorCategory" disabled>
                      <option selected disabled>${askCategoryBoard.askBoardMinorCategory}</option>
                    </select>
                  </div>
                </div>
              </div>
            </div><!-- 
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="cate">제목</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="askBoardTitle" id="title" required />
              </div>
            </div> -->
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productContent">상세 내용</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <p class="form-control" id="content" >${askCategoryBoard.askBoardContent}</p>
              </div>
            </div>
           <c:if test="${empty askCategoryBoard.askBoardReplyContent}">
            <div class="form-control m-auto text-center" style="width: 60%">곧 답변드리겠습니다.</div>
           </c:if>
           <c:if test="${not empty askCategoryBoard.askBoardReplyContent}">
            <div class="form-control m-auto text-center" style="width: 60%">${askCategoryBoard.askBoardReplyContent}</div>
           </c:if>

            <div class=" btns ps-0">
              <div class="btn-b">
                <button type="button" class="cancel_btn sbtn blue small rounded"  onclick="history.back()" >뒤로가기</button>
              </div>
            </div>
        </div>
      </div>
    </section>
    
    	<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(function() {
}); // end jQuery

</script>
</html>