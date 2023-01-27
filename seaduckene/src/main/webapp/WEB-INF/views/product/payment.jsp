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
	
	<%@ include file="../include/footer.jsp"%>
</body>

<script>
$(function(){
	
	
	const amount = '${total}';
	const orderId = '${login.userId}${orderVo.orderRecipientTel}';
	const orderName = 'seduckeneOrder' + '${orderVo.orderRecipientTel}';
	const customerName = '${orderVo.orderRecipientName}';
	
	var clientKey = '${clientKey}';
	console.log('클라이언트키:' + clientKey);
	var tossPayments = TossPayments(clientKey);
	
	function toss(){
		tossPayments.requestPayment('카드',{
			amount: amount,
			orderId : orderId,
			orderName : orderName,
			customerName : customerName,
			successUrl: 'http://localhost/product/success',
			failUrl : 'http://localhost/product/fail'
		});
	}
	toss();
	
});//end jQuery
	





</script>



<script>
	

	
</script>
</html>