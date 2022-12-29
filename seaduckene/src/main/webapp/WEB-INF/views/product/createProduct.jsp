<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>seaduck e ne</title>

<!-- 부트스트랩  CDM -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet">
</head>
<body>
<section class="py-5">
    <div class="col-md-12">
        <h1 class="add-product-title ">상품등록</h1>
    </div>
    <div class="container">
        <div class="row">
            <form action="#" method="post" class="productForm">
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="category">카테고리</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <div class="row">
                            <div class="col-6">
                                <select class="form-select" aria-label="Default select example" name="majorCategory" id="majorCategory">
                                    <option selected disabled>대 카테고리</option>
                                    <option value="jor1">대1</option>
                                    <option value="jor2">대2</option>
                                    <option value="jor3">대3</option>
                                  </select>
                            </div>
                            <div class="col-6">
                                <select class="form-select" aria-label="Default select example" name="minorCategory" id="minorCategory">
                                    <option selected disabled>소 카테고리</option>
                                    <option value="nor1">소1</option>
                                    <option value="nor2">소2</option>
                                    <option value="nor3">소3</option>
                                  </select>
                            </div>
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="productName">상품명</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="productName" id="productName" required />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="realPrice">판매가</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="realPrice" id="realPrice" required />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="salePrice">할인가</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="salePrice" id="salePrice" required />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="quantity">재고수량</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="quantity" id="quantity" required />
                    </div>
                </div>

                <div class="container inputArea">
                    <div class="row">
                        <div class="col">
                            <div id="summernote"></div>
                        </div>
                    </div>
                </div>

            </form>

        </div>
    </div>
</section>

    
</body>
</html>