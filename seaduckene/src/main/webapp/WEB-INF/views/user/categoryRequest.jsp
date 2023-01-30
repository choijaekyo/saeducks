<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Insert title here</title>
	
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/categoryRequest.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
    <section class="form-signin w-100 m-auto">
      <div class="col-md-12">
        <h1 class="add-product-title h1 mt-4">카테고리 추가 건의</h1>
      </div>
      <div class="container">
        <div class="row">
          <form action="<c:url value='/user/categoryRequest'/>" method="post">
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="category">카테고리</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <div class="row">
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="majorCategory" id="majorCategory" >
                      <option selected disabled>대 카테고리</option>
                      <c:forEach var="list" items="${major}">
                        <option>${list}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="minorCategory" id="minorCategory" >
                      <option selected disabled>소 카테고리</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="cate">제목</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="categoryRequestitle" id="categoryRequestitle" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productContent">요청사유</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <textarea class="form-control" type="text" name="categoryRequesContent" id="categoryRequesContent" required ></textarea>
              </div>
            </div>

            <div class="inputArea input-group btns">
              <div class="btn-b" >
                <button type="submit" class="order_btn btn btn-outline-success">건의하기</button>
              </div>
              <div class="btn-b">
                <button type="button" class="cancel_btn btn btn-outline-secondary"  onclick="history.back()" >뒤로가기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    
    	<%@ include file="../include/footer.jsp" %>
</body>
</html>