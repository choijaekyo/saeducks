<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
      
        .carousel-item{
            height: 50vh;
            
        }
        .cimg{
        	min-height: 50vh;
            object-fit: cover;
        }
        #inputQuantity{
			max-width:4rem;        
        }


    </style>

</head>


<body>
<%@ include file="../include/header.jsp" %>
<section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                        <c:forEach var="img" items="${imgList }" varStatus="status">
                        <c:if test="${status.index ==0 }">
                          <div class="carousel-item active">
                            <img src="<c:url value='/product/display?fileLoca=${img.productImageFolder }&fileName=${img.productImageFileName }' />" class="d-block w-100 cimg" alt="...">
                          </div>
                        </c:if>
                        <c:if test="${status.index!=0 }">
                        	<div class="carousel-item">
                            	<img src="<c:url value='/product/display?fileLoca=${img.productImageFolder }&fileName=${img.productImageFileName }' />" class="d-block w-100 cimg" alt="...">
                          	</div>
                        </c:if>  
                		</c:forEach>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      </div>
                  
                </div>
                <div class="col-md-6">
                    <div class="small mb-1">PNO:${vo.productNo }</div>
                    <h1 class="display-5 fw-bolder">${vo.productName }</h1>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-line-through">&#8361;${vo.productPriceNormal }</span>
                        <span>&#8361;${vo.productPriceSelling }</span>
                    </div>
                    <p class="lead">${vo.productDetail }</p>
                    <div class="d-flex" >
                        <input class="form-control text-center" id="inputQuantity" type="number" value="1" min="1" max="100">
                        <button class="btn btn-outline-dark flex-shrink-0" type="button" id="cartBtn">
                            <i class="bi-cart-fill me-1"></i>
                            Add to cart
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>

	<script>
		$(function(){
			const userNo = 10; //나중에 login 세션아이디로 대체할것!
			const pNo = '${vo.productNo}';
			const price = '${vo.productPriceSelling}';
			const pName ='${vo.productName}';
			$('#cartBtn').click(function(){
				let ea = $('#inputQuantity').val();
				console.log(ea);
				console.log(userNo);
				console.log(pNo);
				console.log(price);
			$.ajax({
				type:'post',
				url:'<c:url value="/product/insertBasket"/>',
				data: JSON.stringify({
					"basketProductNo":pNo,
					"basketProductName":pName,
					"basketUserNo":userNo,
					"basketQuantity":ea,
					"basketPrice":price
				}),
				dataType:'text',
				contentType: 'application/json',
				success: function(){
					alert('장바구니에 등록성공');
				},
				error:function(){
					alert('장바구니 추가 실패. 관리자에게 문의하세요');
				}
			}); // 장바구니 등록 비동기 통신 끝
				
			
				
			});//장바구니 추가 끝
			
			
		});// end jQuery
	</script>
