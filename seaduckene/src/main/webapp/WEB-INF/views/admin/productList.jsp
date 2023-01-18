<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>유저검색</title>

    <!-- 부트스트랩  CDM -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 제이쿼리 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />

    <style>
      html,
      body {
        height: 100%;
      }

      body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #fff9d6;
      }
      
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
    </style>
  </head>
  <body>
    <div class="container w-100 m-auto">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-body">
				
					<div class="input-group mb-3">
		                <span class="input-group-text">상품번호</span>
		                <input type="text" class="form-control" placeholder="상품번호" aria-label="productNo" name="productNo" id="productNo" />
		                <span class="input-group-text">상품명</span>
		                <input type="text" class="form-control" placeholder="상품명" aria-label="productName" name="productName" id="productName" />
	              	</div>
					<br>
             
                   <c:forEach var="li" items="${list }">
                    <div class="table-responsive">
                	<table class="table table-striped table-borderless" class="contentDiv" style="table-layout:fixed;">
                   	<thead>
                      <tr>
                        <th class="mx-auto">상품번호</th>
                        <th>상품명</th>
                        <th>정상가</th>
                        <th>할인가</th>
                        <th>재고수량</th>
                        <th>등록일</th>
                        <th>수정일</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.productNo }</td>
                        <td class="border-start">${li.productName }</td>
                        <td class="border-start">${li.productPriceNormal }</td>
                        <td class="border-start">${li.productPriceSelling }</td>
                        <td class="border-start">${li.productStock }</td>
                        <td class="border-start"><fmt:formatDate value="${li.productRegDate }" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td class="border-start"><fmt:formatDate value="${li.productUpDate }" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td class="border-start"><a href="${pageContext.request.contextPath }/product/modifyProduct?no=${li.productNo }">수정</a></td>
                      </tr>
                    </tbody>
                   </table>
              	</div>
              	<hr>
               </c:forEach>
              
            </div>
          </div>
        </div>
      </div>
    </div>
	<a id="main" href="<c:url value='/admin/adminMain'/>" >main</a>
    <script>
	
    	
    	$(function() {
    		
    		let type = '';
	        let keyword = '';
    		// 검색이벤트
    	    $('.form-control').on('keydown', function(e) { 
    	         if (e.keyCode == 13) {
    	           if (this === document.getElementById('productNo')) {
    	         	 type = 'productNo';
    	         	 keyword = document.getElementById('productNo').value;
    	         	 location.href='${pageContext.request.contextPath}/admin/productList?type='+type+'&keyword='+keyword;
    	         	 $('#productNo').val('');
    	           } else if(this === document.getElementById('productName')) {
    	         	 type = 'productName';
    	         	 keyword = document.getElementById('productName').value;
    	         	 location.href='${pageContext.request.contextPath}/admin/productList?type='+type+'&keyword='+keyword;
    	         	 $('#productName').val('');
    	           } else {
    	             return;
    	           }
    	         } 
    	       });
 
    		
		});
    
    </script>
  </body>
</html>
