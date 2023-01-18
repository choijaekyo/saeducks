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
		                <input type="text" class="form-control" placeholder="주문자명" aria-label="userName" name="userName" id="userName" />
		                <span class="input-group-text">전화번호</span>
		                <input type="text" class="form-control" placeholder="주문자 연락처" aria-label="userPhonNumber" name="userPhonNumber" id="userPhonNumber" />
		                <span class="input-group-text">주문번호</span>
		                <input type="text" class="form-control" placeholder="주문번호" aria-label="orderNum" name="orderNum" id="orderNum" />
		                <span class="input-group-text">주문상태</span>
		                <select class="form-control selectOrderStatus" >
		                	<optgroup label="주문상태">
		                		<option>주문상태 전체</option>
			                	<option ${param.keyword == '배송준비중' ? 'selected' : '' } >배송준비중</option>
			                	<option ${param.keyword == '배송중' ? 'selected' : '' } >배송중</option>
			                	<option ${param.keyword == '취소요청' ? 'selected' : '' } >취소요청</option>
			                	<option ${param.keyword == '취소완료' ? 'selected' : '' } >취소완료</option>
			                	<option ${param.keyword == '반품요청' ? 'selected' : '' } >반품요청</option>
			                	<option ${param.keyword == '반품완료' ? 'selected' : '' } >반품완료</option>
		                	</optgroup>
		                </select>
	              	</div>
					<br>
             
                   <c:forEach var="li" items="${list }">
                   	<input type="hidden" value="${li.orderNum }" class="orderNums">
                    <div class="table-responsive">
                	<table class="table table-striped table-borderless" class="contentDiv" style="table-layout:fixed;">
                   	<thead>
                      <tr>
                        <th class="mx-auto">아이디</th>
                        <th>주문자명</th>
                        <th>주문자 연락처</th>
                        <th>이메일</th>
                        <th>주문일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.userId }</td>
                        <td class="border-start">${li.userName }</td>
                        <td class="border-start">${li.userTel }</td>
                        <td class="border-start">${li.userEmail }</td>
                        <td class="border-start">${li.orderRegDate }</td>
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
                        	<c:when test="${li.orderInvoiceNo != null || li.orderStatus == '취소완료' }">
                        		<td class="border-start">${li.orderInvoiceNo }</td>
                        	</c:when>
                        	<c:otherwise>
                        		<td class="border-start"><input type="text" name="invoiceNo" class="invoiceInp${li.orderNum }" maxlength="16" /><button class="invoiceBtn${li.orderNum }">등록</button></td>
                        	</c:otherwise>
                        </c:choose>
                        
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>수취인명</th>
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
                        <th>취소사유</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>${li.orderPaymentMethod }</td>
                        <td class="border-start">${li.orderReturnBank }</td>
                        <td class="border-start">${li.orderReturnAccount }</td>
                        <td class="border-start">${li.orderReturnReason }</td>
                        <td class="border-start">
	                    	<c:choose>
	                    		<c:when test="${li.orderStatus == '배송중'}">
	                    			<button class="refundBtn${li.orderNum }">반품완료</button>
	                    		</c:when>
	                    		<c:when test="${li.orderStatus != '취소완료' && li.orderStatus != '반품완료'}">
	                    			<button class="cancleBtn${li.orderNum }">취소완료</button>
									<button class="refundBtn${li.orderNum }">반품완료</button>
	                    		</c:when>
	                    	</c:choose>
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
    		
    		let msg = '${msg}';
    		if(msg === 'done'){
    			alert('송장번호 등록이 완료되었습니다.');
    		} else if (msg === 'cancle'){
    			alert('주문 취소가 완료되었습니다.');
    		} else if (msg === 'refund'){
    			alert('환불 처리가 완료되었습니다.');
    		}
    		
    		
    		let type = '';
	        let keyword = '';
    		// 검색이벤트
    	    $('.form-control').on('keydown', function(e) { 
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
    		
    		$('.selectOrderStatus').change(function() {
    			const option = $('.selectOrderStatus').val();
    			type = 'orderStatus';
    			keyword = option;
    			if(keyword === '주문상태 전체') {
    				location.href='${pageContext.request.contextPath}/admin/userSearch';
    			} else {
    				location.href='${pageContext.request.contextPath}/admin/userSearch?type='+type+'&keyword='+keyword;
    			}
			});

    		// 반복문 내 선택
    	    const orderNums = $('.orderNums');
    		console.log(orderNums);
    		for(let orderNum of orderNums){
    			// 송장번호 등록 
    			$('.invoiceBtn'+orderNum.value).click(function() {
    				const invoiceNum = $('.invoiceInp' + orderNum.value).val();
    				console.log('invoice' + invoiceNum);
					if(invoiceNum.trim() == ''){
						alert('송장번호를 입력해주세요.');
					} else {
						location.href='${pageContext.request.contextPath}/admin/invoice?invoiceNum=' + invoiceNum + '&orderNum=' +orderNum.value;
					}
				});
    		
    			// 주문 취소
    			$('.cancleBtn'+orderNum.value).click(function() {
    				if(confirm('취소 완료 시 복원이 불가합니다. \n 취소 처리 하시겠습니까?')){
    					location.href='${pageContext.request.contextPath}/admin/cancle?orderNum=' +orderNum.value;
    				}
    			});
    			
    			// 환불
    			$('.refundBtn'+orderNum.value).click(function() {
    				if(confirm('반품 완료 시 복원이 불가합니다. \n 반품 처리 하시겠습니까?')){
    					location.href='${pageContext.request.contextPath}/admin/refund?orderNum=' +orderNum.value;
    				}
    			});
    		}	
    		
    		
    			
    		
    		
		});
    
    </script>
  </body>
</html>
