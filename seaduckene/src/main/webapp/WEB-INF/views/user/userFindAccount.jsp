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

<!--개인 디자인 추가-->
<link
	href="${pageContext.request.contextPath }/resources/css/userFindAccount.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../include/header.jsp"%>


	<section class="py-5" id="userFindAccount">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1 class="find-account h1">아이디 찾기</h1>
				</div>
				<form class="findAccountForm" method="post" action="<c:url value='/user/userFindAccount' />">
					<div class="middleBox col-sm-12">
						<div class=" col-sm-12">
						
				
							<p class="sub-title">
								<input class="form-check-input radio" name="isEmail"
									type="radio" data-check="1" id="checked-email" /> 본인 확인 이메일로
								인증하기
							</p>
							<div class="description-1" style="display: none;">
								<label>가입 시 인증한 메일주소와 동일한 주소를 입력해 주세요.</label>
								<div>
									<input name="userName"
										class="form-control find-input" type="text" placeholder="이름"
										id="userName" required /> <br>
									<input name="userEmail"
										class="form-control find-input" type="text" placeholder="이메일"
										id="userEmail" required />
								</div>
								<br>
								<input type="button" class="sbtn yellow small rounded email-btn"
									value="이메일 인증" id="confBtn"> <br>
									<br>
								<div class="input-group inputArea" style="display: none;"
									id="emailConf">
									<div class="col-md-12 col-sm-12 col-12 beforeConf">
										<input class="form-control find-input" type="text" name="confNum"
											id="confNum" placeholder="이메일 인증 코드" required /> 
											<br>
											<br>
											<input
											class="sbtn yellow small rounded " type="button"
											name="confCheckBtn" id="confCheckBtn" value="인증하기" />
									</div>
									<br>
									<p id="confMailRes"></p>
								</div>
								<div>
									<label></label>
									<button type="button" value=""></button>
								</div>
							</div>
						
						</div>
						<div class=" col-sm-12">
							<p class="sub-title">
								<input class="form-check-input radio" name="isEmail"
									type="radio" data-check="2" id="unchecked-email" /> 가입 시 이메일
								인증을 하지 않은 경우
							</p>
							<div class="description-2" style="display: none;">
								<label>아직 해당 서비스는 제공하지 않습니다. <br> 새로 회원가입 부탁드립니다.

								</label> <br>
								<br>
								<input class="sbtn cyan small rounded" type="button" id="joinBtn" value="신규가입"/>
							</div>
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
	$(function() {
		$('#userFindAccount').on('click', '.radio', function(e) {
			if ($(this).data('check') == 1) {
				$('.description-1').css('display', 'inline');
				$('.description-2').css('display', 'none');
			} else if ($(this).data('check') == 2) {
				$('.description-2').css('display', 'inline');
				$('.description-1').css('display', 'none');
			}
		}); 
		
		// 인증번호 이메일 전송
		let authCode = '';
		$('#confBtn').click(function() {
			
			const email = $('#userEmail').val();
			console.log('이메일: ' + email);
			
			if(email.trim() === ''){
				alert('인증받을 메일 주소를 먼저 입력해 주세요.');
			} else {
				$('#emailConf').css('display','block');
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/user/userConfEmail" />',
					data: email,
					contentType: 'application/json',
					success: function(data) {
						alert('인증메일이 전송되었습니다.\n입력하신 메일주소에서 전송된 인증번호를 확인해주세요.');
						authCode=data;
						console.log(data);
					},
					error: function() {
						authCode = 'fail';
						alert('이메일 전송 실패');
					}
				});//end-ajax	
			}
		});//end 이메일 전송


		// 인증번호 비교
		$('#confCheckBtn').click(
				function() {
					const inputCode = $('#confNum').val();
					const $resultMsg = $('#confMailRes');
					if (inputCode === authCode) {
						$('.findAccountForm').submit();
						
					} else {
						$resultMsg.html('인증번호를 다시 확인해주세요.');
						$resultMsg.css('color', 'red');
						$('#confNum').focus();
					}
		}); //end 인증번호비교
		
		
		$('#joinBtn').click(function() {
			location.href="<c:url value='/user/userJoin' />";
		});
		
	});
</script>
</html>