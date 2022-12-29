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
<link href="${pageContext.request.contextPath }/resources/css/order.css"
	rel="stylesheet">

</head>
<body>
<%@ include file="../include/header.jsp" %>
<section class="py-5">
	<div class="orderInfo container">

		<div class="row">
			<div class="col-md-12">
				<h1 class="order-title h1 ">주문상세</h1>
			</div>
			<hr>
			<div class="container">
				<div class="productDetail ">
					<div class="row">
						<div
							class="col-md-4 offset-md-1 col-sm-12 order-imgBox text-center">
							<img src="" alt="상품이미지">
						</div>
						<div class="col-md-6 col-sm-12 order-detailBox">
							<h5>내가 좋아하는 디즈니</h5>
							<br>
							<p>가격</p>
							<p>수량</p>
						</div>
					</div>
				</div>
				<hr>
			</div>
			<form role="form" method="post" autocomplete="off" class="order-form">

				<input type="hidden" name="quantity" value="" />
				<!--총주문수량-->
				<input type="hidden" name="amount" value="" />
				<!--총주문금액-->
				<input type="hidden" name="productNo" value="" />
				<!--상품번호-->

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="payment">결제방법</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="paymentOption"
								id="account" value="account"> <label
								class="form-check-label" for="account">무통장입금</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="paymentOption"
								id="creditCard" value="creditCard"> <label
								class="form-check-label" for="creditCard">신용카드</label>
						</div>
					</div>
				</div>

				<div id="checkdeAccount">
					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="refundBank">환불은행</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<select class="form-select" aria-label="Default select example"
								name="refundBank" id="refundBank">
								<option selected disabled>은행명</option>
								<option value="shinhan">신한은행</option>
								<option value="kookmin">국민은행</option>
								<option value="nonghyup">농협</option>
							</select>
						</div>
					</div>
					<div class="inputArea input-group">
						<div class="col-md-2 offset-md-1 col-sm-12 col-12">
							<label for="refundAccount">환불계좌번호</label>
						</div>
						<div class="col-md-7 col-sm-12 col-12">
							<input class="form-control" type="text" name="refundAccount"
								id="refundAccount" required placeholder=" 특수문자 없이 숫자만 입력해 주세요. " />
						</div>
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="email">인증메일</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control"
									aria-label="Text input with dropdown button">
							</div>
							<div class="col-6">
								<select class="form-select" aria-label="Default select example"
									name="mail" id="mail">
									<option selected disabled>도메인</option>
									<option value="@naver.com">@naver.com</option>
									<option value="@daum.com">@daum.com</option>
									<option value="@hanmail.net">@hanmail.net</option>
								</select>
							</div>
						</div>
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12"></div>
					<div class="col-md-7 col-sm-12 col-12">
						<div class="row">
							<div class="col-3">
								<input class="btn btn-outline-secondary" type="button"
									name="confBtn" id="confBtn" value="인증하기" required />
							</div>
							<div class="col-5">
								<input class="form-control" type="text" name="confNum"
									id="confNum">
							</div>
						</div>
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="orderRec">수령인</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<input class="form-control" type="text" name="orderRec"
							id="orderRec" required />
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="orderPhon">수령인 연락처</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<input class="form-control" type="text" name="orderPhon"
							id="orderPhon" required />
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="userAddr1">우편번호</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<div class="btn-group" role="group"
							aria-label="Button g roup with nested dropdown">
							<div class="btn-group" role="group">
								<input class="form-control" type="text" name="userAddr1"
									id="userAddr1" required disabled />
							</div>
							<button type="button" class="btn btn-outline-secondary">우편번호
								찾기</button>
							<button type="button" class="btn btn-outline-secondary">주소록</button>
						</div>
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="userAddr2">주소</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<input class="form-control" type="text" name="userAddr2"
							id="userAddr2" required disabled />
					</div>
				</div>

				<div class="inputArea input-group">
					<div class="col-md-2 offset-md-1 col-sm-12 col-12">
						<label for="userAddr3">상세주소</label>
					</div>
					<div class="col-md-7 col-sm-12 col-12">
						<input class="form-control" type="text" name="userAddr3"
							id="userAddr3" required />
					</div>
				</div>

				<div class="inputArea input-group">
					<div
						class="col-md-1 offset-md-5 col-sm-2 offset-sm-4 col-2 offset-4">
						<button type="submit" class="order_btn btn btn-outline-success">주문</button>
					</div>
					<div class="col-md-3 col-sm-6 col-6">
						<button type="button" class="cancel_btn btn btn-outline-secondary">취소</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(function() {
		$('#account').change(function() {
			$('#checkdeAccount').css('display', 'block');
		});

		$('#creditCard').change(function() {
			$('#checkdeAccount').css('display', 'none');
		});
	});

	// 주소찾기 이벤트 변수명 수정 필수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	function searchAddress() {
		new daum.Postcode({
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
				document.getElementById("addrZipNum").value = data.zonecode;
				document.getElementById("addrBasic").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addrDetail").focus();
			}
		}).open();
	}

	// 이메일 인증 이벤트 변수명 수정 필수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// 인증번호 이메일 전송
	$('#mail-check-btn').click(function() {
		openLoading();
		const email = $('#userEmail1').val() + $('#userEmail2').val();
		console.log('완성된 이메일: ' + email);

		$.ajax({
			type : 'get',
			url : '<c:url value="/user/mailCheck?email=" />' + email,
			success : function(data) {
				closeLoading();
				console.log('컨트롤러가 전달한 인증번호: ' + data);
				$('.mail-check-input').attr('disabled', false); // 비활성된 인증번호 입력창을 활성화
				code = data; // 인증번호를 전역변수에 저장
				alert('인증번호가 전송되었습니다. 확인 후 정확하게 입력해주세요.');
			}
		}); // end ajax(이메일 전송)

	}); // end 이메일 전송

	// 인증번호 비교
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(
			function() {
				const inputCode = $(this).val(); // 사용자가 입력한 인증번호
				const $resultMsg = $('#mail-check-warn'); // span
				if (inputCode === code) {
					$resultMsg.html('인증이 완료되었습니다.');
					$resultMsg.css('color', 'green');
					$('#mail-check-btn').attr('disabled', true); // 이메일 인증을 더이상 하지 못하도록
					$('#userEmail1').attr('readonly', true);
					$('#userEmail2').attr('readonly', true);
					$(this).css('display', 'none');

					// 초기값을 사용자가 선택한 값으로 무조건 설정하는 방법(select에서 readonly 대용)
					// 2개를 함께 써야함
					// select에는 disabled 사용시 값이 전송되지 않아 사용 X, readonly는 먹히지 않음
					$('#userEmail2').attr('onFocus',
							'this.initialSelect = this.selectedIndex');
					$('#userEmail2').attr('onChange',
							'this.selectedIndex = this.initialSelect');
				} else {
					$resultMsg.html('인증번호를 다시 확인해주세요.');
					$resultMsg.css('color', 'red');
					$(this).focus();
				}
			}); // 인증번호 이벤트 끝
</script>
</html>