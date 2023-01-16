<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>세덕이네 상품 등록</title>

    <!-- 부트스트랩  CDM -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 제이쿼리 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>
<%-- 
<section class="py-5">
    <div class="col-md-12">
        <h1 class="add-product-title h1 ">상품등록</h1>
    </div>
    <div class="container">
        <div class="row">
            <form action="<c:url value='/product/createProduct'/>" method="post" class="productForm" enctype="multipart/form-data">
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="category">카테고리</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <div class="row">
                            <div class="col-6">
                                <select class="form-select" aria-label="Default select example" name="majorCategory" id="majorCategory">
                                    <option selected disabled>대 카테고리</option>
                                    <c:forEach var="list" items="${major }">
                                    	<option>${list }</option>
                                    </c:forEach>
                                  </select>
                            </div>
                            <div class="col-6">
                                <select class="form-select" aria-label="Default select example" name="minorCategory" id="minorCategory">
                                    <option selected disabled>소 카테고리</option>
                                  </select>
                            </div>
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
                        <input class="form-control" type="text" name="productPriceNormal" id="realPrice" required />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="salePrice">할인가</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="productPriceSelling" id="salePrice" required pattern="[0-9]+" />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="quantity">재고수량</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="text" name="productStock" id="quantity" required pattern="[0-9]+" />
                    </div>
                </div>
                
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="productContent">상품설명</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <textarea class="form-control" type="text" name="productDetail" id="productContent" required></textarea>
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="thumbnailImg">썸네일이미지</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="file" name="thumbnailImg" id="thumbnailImg" required />
                    </div>
                </div>
                <div class="input-group inputArea">
                    <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                        <label for="productImg">상품이미지(최대2개)</label>
                    </div>
                    <div class="col-md-7 col-sm-12 col-12">
                        <input class="form-control" type="file" name="productImg" id="productImg" multiple="multiple"  required  maxlength="2"/>
                    </div>
                </div>
 --%>
    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />

    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/createProduct.css" rel="stylesheet" />
    
    <style>

      html,body {
        height: 100%;
      }

      body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #fff9d6;
      }

    </style>
  </head>
  <body>
  <a href="<c:url value='/'/>" >홈으로</a>
    <section class="form-signin w-100 m-auto">
      <div class="col-md-12">
        <h1 class="add-product-title h1">상품등록</h1>
      </div>
      <div class="container">
        <div class="row">
          <form action="<c:url value='/product/createProduct'/>" method="post" class="productForm" enctype="multipart/form-data" >
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
                <input class="form-control" type="text" name="productPriceNormal" id="realPrice" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="salePrice">할인가</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="productPriceSelling" id="salePrice" required pattern="[0-9]+" />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="quantity">재고수량</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="productStock" id="quantity" required pattern="[0-9]+" />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="thumbnailImg">썸네일이미지</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="file" name="thumbnailImg" id="thumbnailImg" accept="image/*" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productImg">상품이미지(최대2개)</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="file" name="productImg" id="productImg" accept="image/*" multiple="multiple" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productContent">상품설명</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <textarea class="form-control" type="text" name="productDetail" id="productContent" required ></textarea>
              </div>
            </div>

            <div class="inputArea input-group">
              <div class="col-md-1 offset-md-5 col-sm-2 offset-sm-4 col-2 offset-4" >
                <button type="submit" class="order_btn btn btn-outline-success">등록</button>
              </div>
              <div class="col-md-3 col-sm-6 col-6">
                <button type="button" class="cancel_btn btn btn-outline-secondary" >취소</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>

    <script>
      const regprice = /^[0-9]$/;

      $(function () {
        //대카테고리 선택에 이은 소카테고리 분류
        $("#majorCategory").on("change", function (e) {
          const major = $(this).val();
          $("#minorCategory").empty();
          $.getJSON(
            '<c:url value="/product/getCategory?major=' + major + '"/>',
            function (list) {
              for (let i = 0; i < list.length; i++) {
                const $option = document.createElement("option");
                $option.textContent = list[i];
                $("#minorCategory").append($option);
              }
            }
          ); //endJSON
        }); //end 소카테고리
        
        
        $('form').on('blur', 'input[name^=productPrice]', function(e) {
        	const salePrice = $('#salePrice').val();
        	const realPrice = $('#realPrice').val();
    	    if (salePrice != '' && realPrice != '') {
        	
	        	if (+(realPrice) < +(salePrice)) {
					alert('할인가가 판매가를 넘을 수 없습니다.');
					this.value = '';
				}
			}
        });
        
        $('input[multiple=multiple]').change(function(e) {
        	if (this.files.length > 2) {
				alert('상품이미지는 최대 2개까지만 선택하세요!');
				
				const dt = new DataTransfer();
				this.files = dt.files;
			}
        });
        
      }); //end jQuery
    </script>
  </body>
</html>
