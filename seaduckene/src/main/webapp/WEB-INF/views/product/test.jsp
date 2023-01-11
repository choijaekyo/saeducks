<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<link href="${pageContext.request.contextPath }/resources/css/order.css"
	rel="stylesheet">

<!-- toss  -->
<script src="https://js.tosspayments.com/v1/payment"></script>

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	
		<span>총 주문금액</span>
		<span>35,000 원</span>
		<button id="payment-button">결제하기</button>

	<%@ include file="../include/footer.jsp"%>
</body>

<script>
	
	var clientKey = 'test_ck_Lex6BJGQOVDZG4A9EdO8W4w2zNbg';
	var tossPayments = TossPayments(clientKey);
	var button = document.getElementById('payment-button');
	button.addEventListener('click',function(){
		tossPayments.requestPayment('카드',{
			amount: 35000,
			orderId : 'abcde123456ab',
			orderName : '내가 좋아하는 디즈니',
			customerName : '똥개',
			successUrl: 'http://localhost/product/success',
			failUrl : 'http://localhost/product/fail'
		});
	});




</script>



<script>
	

	
</script>
</html>