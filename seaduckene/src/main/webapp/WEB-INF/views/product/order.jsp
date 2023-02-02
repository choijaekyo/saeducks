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

<!-- 부트스트랩  CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath }/resources/css/order.css"
	rel="stylesheet">	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- toss  -->
<script src="https://js.tosspayments.com/v1/payment"></script>


</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<!-- 주소록 모달  -->
	<div class="modal" id="addrListModal" data-bs-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주소록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<form action="" method="post">
						<div>
 							<c:forEach var="addr" items="${addrList }" varStatus="status" >
								<div class="form-check form-check-inline">
										<p data-zip="${status.index}">${addr.addressZipNum}</p>
										<p data-basic="${status.index}">${addr.addressBasic}</p>
										<p data-detail="${status.index}">${addr.addressDetail}</p>
										<button type="button" value="${status.index }" class="sbtn purple small rounded addrbtn">주소입력</button>
								</div>
								<hr>
								<br>
							</c:forEach> 
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="sbtn blue small rounded"
						data-bs-dismiss="modal" >닫기</button>				</div>
			</div>
		</div>
	</div>


	<section class="py-5">
		<div class="orderInfo container">

			<div class="row">
				<div class="col-md-12">
					<h2 class="order-title h2 ">주문상세</h2>
				</div>

				<form method="post" action="<c:url value="/product/order" />"
					class="order-form" id="orderform">
					<hr>
					<!-- 반복문으로 상품목록!! -->
					<c:forEach var="product" items="${basketList }">
						<c:if test="${product.basketQuantity != 0 }">
							<div class="container">
							<div class="productDetail ">
								<div class="row">
									<div
										class="col-md-4 offset-md-1 col-sm-12 order-imgBox text-center">
										<img id="productThumb"
											src="<c:url value='/product/display2?no=${product.basketProductNo }' />"
											alt="상품이미지">
									</div>
									<div class="col-md-6 col-sm-12 order-detailBox">
										<h5 class="h5">${product.basketProductName }</h5>
										<br>
										<p>
											<fmt:formatNumber value="${product.basketPrice }"
												pattern="#,###" />
											&nbsp;원
										</p>
										<p>${product.basketQuantity }&nbsp;개</p>
										<!--상품번호-->
										<input type="hidden" name="orderProductNo"
											value="${product.basketProductNo }" />
									</div>
								</div>
							</div>
							<hr>
						</div>
						</c:if>
					</c:forEach>

					<div class="container">
						<div class="col-md-3 offset-md-8 col-sm-12">
							<span class="h5">구매 상품 총 액&nbsp;</span><span><fmt:formatNumber
									value="${total}" pattern="#,###" />&nbsp;원</span>
						</div>
						<hr>
					</div>

					<div class="inputArea input-group" id="conf-email">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="userEmail">인증메일</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<div class="input-group">
								<input class="form-control" type="text" name="userEmail"
									id="userEmail" /> <input class="sbtn yellow small rounded"
									type="button" name="confBtn" id="confBtn" value="인증하기" />
							</div>
						</div>
					</div>

					<div class="inputArea input-group" id="conf-group">
						<div class="col-md-7 offset-md-3 col-sm-12 col-12">
							<div class="row">
								<div class="col-md-7 input-group beforeConf">
									<input class="form-control" type="text" name="confNum"
										id="confNum">
									<button type="button" class="btn btn-outline-secondary"
										id="confCheckBtn">확인</button>
								</div>
								<div class="col-md-7 input-group afterConf">
									<p id="confMailRes"></p>
								</div>
							</div>
						</div>
					</div>

					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderPaymentMethod">결제방법</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="orderPaymentMethod" id="account" value="account">
								<label class="form-check-label" for="account">무통장입금</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="orderPaymentMethod" id="tossPay" value="tossPay">
								<label class="form-check-label" for="tossPay">토스페이(카드결제)</label>
							</div>
						</div>
					</div>

					<div id="checkdeAccount">
						<div class="inputArea input-group">
							<div class="col-md-2 offset-md-1 col-sm-12 col-12"></div>
							<div class="col-md-9 col-sm-12 col-12">
								
								<i class="bi bi-chat-right-quote-fill"></i>
								<p>
									무통장입금 시 <strong>입금자명</strong>과 <strong>주문자명</strong>은 <strong>동일</strong>해야합니다.
									<br> 만일 입금자명과 주문자명이 상이한 경우 고객센터로 문의 부탁드립니다.
								</p>
								<br>
								<i class="bi bi-chat-right-quote-fill"></i>
								<p>
									입금은행 : 신한은행 <br>
									계좌번호 : 110-413-402222 <br>
									예금주명 : 박세덕 <br>
								</p>
							</div>
						</div>
						<div class="inputArea input-group">
							<div class="col-md-2 offset-md-1 col-sm-12 col-12">
								<label for="orderReturnBank">환불은행</label>
							</div>
							<div class="col-md-7 col-sm-12 col-12">
								<select class="form-select" name="orderReturnBank"
									id="orderReturnBank">
									<option selected value="none">은행명</option>
									<option value="shinhan">신한은행</option>
									<option value="kookmin">국민은행</option>
									<option value="nonghyup">농협</option>
								</select>
							</div>
						</div>
						<div class="inputArea input-group">
							<div class="col-md-2 offset-md-1 col-sm-12 col-12">
								<label for="orderReturnAccount">환불계좌번호</label>
							</div>
							<div class="col-md-7 col-sm-12 col-12">
								<input class="form-control" type="text"
									name="orderReturnAccount" id="orderReturnAccount"
									placeholder=" 특수문자 없이 숫자만 입력해 주세요. " />
							</div>
						</div>
					</div>


					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderRecipientName">수령인</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="orderRecipientName"
								id="orderRecipientName" />
						</div>
					</div>

					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderRecipientTel">수령인 연락처</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="orderRecipientTel"
								id="orderRecipientTel" placeholder=" 특수문자 없이 숫자만 입력해 주세요."
								maxlength="11" />
						</div>
					</div>

					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderAddressZipNum">우편번호</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<div class="btn-group" role="group">
								<div class="btn-group" role="group">
									<input class="form-control" type="text"
										name="orderAddressZipNum" id="orderAddressZipNum" readonly value="${addrList[0].addressZipNum }"   />
								</div>
								<button type="button"
									class="btn btn-outline-secondary findAddrBtn"
									onclick="searchAddress()">우편번호 찾기</button>
								<button type="button" data-bs-toggle="modal" data-bs-target="#addrListModal"
									class="btn btn-outline-secondary ListAddrBtn">주소록</button>
							</div>
						</div>
					</div>

					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderAddressBasic">주소</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="orderAddressBasic"
								id="orderAddressBasic" value="${addrList[0].addressBasic }" readonly />
						</div>
					</div>

					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="orderAddressDetail">상세주소</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="orderAddressDetail"
								id="orderAddressDetail" value="${addrList[0].addressDetail }" />
						</div>
					</div>



					<div class="inputArea input-group">
						<div
							class="col-md-1 offset-md-5 col-sm-2 offset-sm-4 col-2 offset-4">
							<button type="button" class="order_btn sbtn cyan small rounded"
								id="orderBtn">주문</button>
						</div>
						<div class="col-md-3 col-sm-6 col-6">
							<button type="button" onclick="history.back()"
								class="cancel_btn sbtn blue small rounded">취소</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<script>
	
	//선택된 주소값 뿌리기
	$('.addrbtn').on('click',function(e){
		const no = e.target.value;
		console.log(no);
		console.log($('.modal-body p'));
		
		for (let p of $('.modal-body p')) {
			console.log(p);	
			if ($(p).data('zip') == no) {
				console.log($(p).text());
				const zip = $(p).text();
				$('#orderAddressZipNum').val(zip);
			}
			if ($(p).data('basic') == no) {
				console.log($(p).text());
				const basic = $(p).text();
				$('#orderAddressBasic').val(basic);
			}
			if ($(p).data('detail') == no) {
				console.log($(p).text());
				const detail = $(p).text();
				$('#orderAddressDetail').val(detail);
			}
			$('#addrListModal').modal('hide');
		}
	});//주소값 뿌리기 끝

	// 정규식 만족여부 확인
	let accountFlag = false;
	let telFlag = false;
	let nameFlag = false;
	let emailFlag = false;

	// 사전 이메일 인증여부 확인
	const msg = '${msg}';
	console.log(msg);
	if (msg !== 'null') {
		$('#conf-email').css('display', 'none');
		emailFlag = true;
	}

	// 인증번호 이메일 전송
	let authCode = '';
	$('#confBtn').click(function() {
		const email = $('#userEmail').val();
		console.log('이메일: ' + email);

		if (email.trim() === '') {
			alert('인증받을 메일 주소를 먼저 입력해 주세요.');
		} else {
			$('#conf-group').css('display', 'block');

			$.ajax({
				type : 'post',
				url : '<c:url value="/user/userConfEmail" />',
				data : email,
				contentType : 'application/json',
				success : function(data) {
					alert('인증메일이 전송되었습니다.\n입력하신 메일주소에서 전송된 인증번호를 확인해주세요.');
					authCode = data;
					console.log(authCode);
					
				},
				error : function() {
					authCode = '보라보라돌이';
					alert('이메일 전송 실패');
				}
			});//end-ajax	
		}
	});//end 이메일 전송

	// 인증번호 비교
	$('#confCheckBtn').click(function() {
		const inputCode = $('#confNum').val();
		const $resultMsg = $('#confMailRes');
		if (inputCode === authCode) {
			$resultMsg.css('display', 'block');
			$resultMsg.html('인증이 완료되었습니다.');
			$('.beforeConf').css('display', 'none');
			$resultMsg.css('color', 'green');

			$('#userEmail').attr('readonly', true);
			$('#confBtn').attr('disabled', true);

		} else {
			$resultMsg.html('인증번호를 다시 확인해주세요.');
			$resultMsg.css('color', 'red');
			$('#confNum').focus();
		}
	}); //end 인증번호비교

	// 무통장입금 선택 시 환불계좌 입력창 
	$(function() {
		$('#account').change(function() {
			$('#checkdeAccount').css('display', 'block');
			$orderReturnAccount.css('border', '1px solid rgb(206, 212, 218)');
			accountFlag = false;
		});

		$('#tossPay').change(function() {
			$('#checkdeAccount').css('display', 'none');
			$('#orderReturnAccount').val('');
			$("select option").prop("selected", false);
			accountFlag = true;
		});
	});

	// 주소찾기
	function searchAddress() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('orderAddressZipNum').value = data.zonecode;
						console.log(data.zonecode);
						document.getElementById('orderAddressBasic').value = addr;
						console.log(addr);
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('orderAddressDetail').focus();
					}
				}).open();
	}

    /* 전화번호 문자열 입력 방지 */
    $('#userTel').keydown(function(e) {
        if (e.key >= 0 && e.key <= 9 || e.which == 8 || e.which == 37 || e.which == 39 || e.which == 46) {
        	return true;
		} else {
			return false;
		}
    });
    
	// 정규식
	const regAccount = /^[0-9]+$/;
	const regName = /^[가-힣a-zA-Z]+$/;
	const regTel = /^(010)[0-9]{8}$/; /* 010포함 숫자 11자리 */
	const regEmail = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;

	const $orderReturnAccount = $('#orderReturnAccount');
	$orderReturnAccount.keyup(function() {
		if (regAccount.test($('#orderReturnAccount').val())) {
			$orderReturnAccount.css('border', '2px solid rgb(34, 139, 34)');
			accountFlag = true;
		} else {
			$orderReturnAccount.css('border', '2px solid red');
		}
	});
	const $orderRecipientTel = $('#orderRecipientTel');
	$orderRecipientTel.keyup(function() {
		if (regTel.test($('#orderRecipientTel').val())) {
			$orderRecipientTel.css('border', '2px solid rgb(34, 139, 34)');
			telFlag = true;
		} else {
			$orderRecipientTel.css('border', '2px solid red');
		}
	});
	const $orderRecipientName = $('#orderRecipientName');
	$orderRecipientName.keyup(function() {
		if (regName.test($('#orderRecipientName').val())) {
			$orderRecipientName.css('border', '2px solid rgb(34, 139, 34)');
			nameFlag = true;
		} else {
			$orderRecipientName.css('border', '2px solid red');
		}
	});
	const $userEmail = $('#userEmail');
	$userEmail.keyup(function() {
		if (regEmail.test($('#userEmail').val())) {
			$userEmail.css('border', '2px solid rgb(34, 139, 34)');
			emailFlag = true;
		} else {
			$userEmail.css('border', '2px solid red');
		}
	});

	// 주문버튼 클릭, 공란 확인 이벤트
	$("#orderBtn")
			.click(
					function() {
						if (msg === 'null') {
							if (!$('#confBtn').is('[disabled]')) {
								alert('주문 시 본인인증을 위해 메일 인증을 꼭 진행해 주셔야 합니다.');
								return;
							}
						}
						if (!$('#account').is(":checked")
								&& !$('#tossPay').is(":checked")) {
							alert('결제방법을 선택해 주세요.');
							return;
						}
						if ($('#account').is(":checked")
								&& ($('#orderReturnBank > option:selected')
										.val() === 'none' || $(
										'#orderReturnAccount').val() === '')) {
							alert('무통장입금 선택 시 환불은행과 계좌번호는 꼭 등록해 주셔야합니다.');
							return;
						}

						if (!telFlag || !nameFlag || !emailFlag) {
							alert('입력양식을 확인해 주세요.');
							return;
						}
						if ($('#orderAddressDetail').val() === '') {
							alert('상품을 수령할 주소지를 입력해주세요.');
							return;
						}

						$('#orderform').submit();

					});

	const checkStock = '${result}';
	console.log(checkStock);
	if (checkStock === 'lack') {
		alert('상품의 재고수량이 부족합니다.\n 상품의 재고수량 이하로 주문해 주세요.')
	}
	
</script>
</html>