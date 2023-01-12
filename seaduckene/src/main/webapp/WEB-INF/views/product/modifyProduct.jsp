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
<link
	href="${pageContext.request.contextPath }/resources/css/createProduct.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<section class="py-5">
		<div class="col-md-12">
			<h1 class="add-product-title h1 ">상품수정</h1>
		</div>
		<div class="container">
			<div class="row">
				<form action="<c:url value='/product/modifyProduct'/>" method="post"
					class="productForm" enctype="multipart/form-data">
					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="category">카테고리</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<div class="row">
								<div class="col-6">
									<select class="form-select" aria-label="Default select example"
										name="majorCategory" id="majorCategory">
										<option selected disabled>대 카테고리</option>
										<c:forEach var="list" items="${major }">
											<c:choose>
												<c:when test="${list ==cvo.categoryMajorTitle }">
													<option selected="selected">${list }</option>
												</c:when>
												<c:otherwise>
													<option>${list }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
								<div class="col-6">
									<select class="form-select" aria-label="Default select example"
										name="minorCategory" id="minorCategory">
										<option selected>${cvo.categoryMinorTitle }</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="productName">상품명</label> <input type="text"
								name="productNo" style="display: none"
								value="${product.productNo }">
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="productName"
								id="productName" required value="${product.productName }" />
						</div>
					</div>
					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="realPrice">판매가</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="productPriceNormal"
								id="realPrice" required value="${product.productPriceNormal }" />
						</div>
					</div>
					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="salePrice">할인가</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text"
								name="productPriceSelling" id="salePrice" required
								pattern="[0-9]+" value="${product.productPriceSelling }" />
						</div>
					</div>
					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="quantity">재고수량</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="productStock"
								id="quantity" required pattern="[0-9]+"
								value="${product.productStock }" />
						</div>
					</div>

					<div class="input-group inputArea">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="productContent">상품설명</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<textarea class="form-control" type="text" name="productDetail"
								id="productContent" required>${product.productDetail }</textarea>
						</div>
					</div>

					<div class="optional-container">
						<div class="col-12 text-center">
							<div>
								<input class="form-check-input" type="checkbox" value=""
									id="imgCheck"> <label class="form-check-label"
									for="imgCheck"> 사진변경시 누르세요 </label>
							</div>

						</div>
					</div>

					<div class="modifyImg" style="display: none;">
						<div class="input-group inputArea">
							<div class="col-md-2 offset-md-1 col-sm-12 col-12">
								<label for="thumbnailImg">썸네일이미지</label>
							</div>
							<div class="col-md-7 col-sm-12 col-12">
								<input class="form-control" type="file" name="thumbnailImg"
									id="thumbnailImg" />
							</div>
						</div>
						<div class="input-group inputArea">
							<div class="col-md-2 offset-md-1 col-sm-12 col-12">
								<label for="productImg">상품이미지(최대2개)</label>
							</div>
							<div class="col-md-7 col-sm-12 col-12">
								<input class="form-control" type="file" name="productImg"
									id="productImg" multiple="multiple" />
							</div>
						</div>
					</div>

					<div class="inputArea input-group">
						<div
							class="col-md-1 offset-md-5 col-sm-2 offset-sm-4 col-2 offset-4">
							<button type="submit" class="order_btn btn btn-outline-success">등록</button>
						</div>
						<div class="col-md-3 col-sm-6 col-6">
							<button type="button"
								class="cancel_btn btn btn-outline-secondary">취소</button>
						</div>
					</div>


				</form>

			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>

<script>
	const regprice = /^[0-9]$/;

	$(function() {

		//대카테고리 선택에 이은 소카테고리 분류
		$('#majorCategory').on(
				'change',
				function(e) {
					const major = $(this).val();
					$('#minorCategory').empty();
					$.getJSON('<c:url value="/product/getCategory?major='
							+ major + '"/>', function(list) {
						for (let i = 0; i < list.length; i++) {
							const $option = document.createElement('option');
							$option.textContent = list[i];
							$('#minorCategory').append($option);
						}

					}

					);//endJSON

				});//end 소카테고리
		//사진 변경창 뜨기
		$('#imgCheck').click(function(e) {
			if ($('#imgCheck').is(":checked")) {
				$('.modifyImg').css('display', 'block');
			} else {
				$('.modifyImg').css('display', 'none');
			}

		})

	});//end jQuery
</script>