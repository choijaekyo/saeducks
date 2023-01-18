<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

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
		                <span class="input-group-text">이름</span>
		                <input type="text" class="form-control" placeholder="User Name" aria-label="userName" name="userName" id="userName" />
		                <span class="input-group-text">전화번호</span>
		                <input type="text" class="form-control" placeholder="User PhonNumber" aria-label="userPhonNumber" name="userPhonNumber" id="userPhonNumber" />
		                <span class="input-group-text">주문번호</span>
		                <input type="text" class="form-control" placeholder="OrderNumber" aria-label="orderNum" name="orderNum" id="orderNum" />
	              	</div>
			
             
                   <c:forEach var="li" items="${list }">
                    <div class="table-responsive">
                	<table class="table table-striped table-borderless" class="contentDiv">
                   	<thead>
                      <tr>
                        <th class="mx-auto">아이디</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.userId }</td>
                        <td class="border-start">${li.userTel }</td>
                        <td class="border-start">${li.userName }</td>
                        <td class="border-start">${li.userEmail }</td>
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>주문번호</th>
                        <th>주문수량</th>
                        <th>주문가격</th>
                        <th>주문상태</th>
                        <th>송장번호</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.orderNum }</td>
                        <td class="border-start">${li.orderQuantity }</td>
                        <td class="border-start">${li.orderPrice }</td>
                        <td class="border-start">${li.orderStatus }</td>
                        <c:choose>
                        	<c:when test="${li.orderInvoiceNo == null}">
                        		<td class="border-start"><input type="text" name="invoiceNo" class="invoiceNo${li.orderNum }" /><button>등록</button></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td class="border-start">${li.orderInvoiceNo }</td>
                        	</c:otherwise>
                        </c:choose>
                        
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>수취인</th>
                        <th>수취인 연락처</th>
                        <th>우편번호</th>
                        <th>동주소</th>
                        <th>상세주소</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.orderRecipientName }</td>
                        <td class="border-start">${li.orderRecipientTel }</td>
                        <td class="border-start">${li.orderAddressZipNum }</td>
                        <td class="border-start">${li.orderAddressBasic }</td>
                        <td class="border-start">${li.orderAddressDetail }</td>
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>결제방법</th>
                        <th>환불은행</th>
                        <th>환불계좌</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.orderPaymentMethod }</td>
                        <td class="border-start">${li.orderReturnBank }</td>
                        <td class="border-start">${li.orderReturnAccount }</td>
                        <td class="border-start">
	                        <button class="cancle">주문취소</button>
	                        <button class="refund">환불</button>
                        </td>
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
			
    		// 검색이벤트
    	    $('.form-control').on('keydown', function(e) { 
    	     	let type = '';
    	        let keyword = '';

    	         if (e.keyCode == 13) {
    	           if (this === document.getElementById('userName')) {
    	         	 type = 'name';
    	         	 keyword = document.getElementById('userName').value;
    	         	 location.href='${pageContext.request.contextPath}/admin/userSearch?type='+type+'&keyword='+keyword;
    	         	 $('#userName').val('');
    	           } else if(this === document.getElementById('userPhonNumber')) {
    	         	 type = 'phone';
    	         	 keyword = document.getElementById('userPhonNumber').value;
    	         	 location.href='${pageContext.request.contextPath}/admin/userSearch?type='+type+'&keyword='+keyword;
    	         	 $('#userPhonNumber').val('');
    	           } else if(this === document.getElementById('orderNum')) {
    	         	 type = 'orderNum';
    	         	 keyword = document.getElementById('orderNum').value;
    	         	 location.href='${pageContext.request.contextPath}/admin/userSearch?type='+type+'&keyword='+keyword;
    	         	 $('#orderNum').val('');
    	           } else {
    	             return;
    	           }
    	         } 
    	       });
    		
    		
		});
    
    </script>
  </body>
</html>
