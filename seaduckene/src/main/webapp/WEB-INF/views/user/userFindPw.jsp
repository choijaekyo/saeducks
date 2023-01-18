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


	<section class="py-5" id="userFindPw">
		<div class="container">
			<div class="row middleBox">
				<div class="col-sm-12">
					<h1 class="find-Pw h1">비밀번호 찾기</h1>
				</div>
				<form class="findPwForm" method="post" action="<c:url value='/user/userFindPw' />">
					<div class="middleBox col-sm-12">
						<div class="col-12">

							<div class="description-1">
								<label>가입 시 인증한 메일주소와 동일한 주소를 입력해 주세요.</label>
								<div>
									<input name="userId"
										class="form-control find-input" type="text" placeholder="아이디"
										id="userId" required /> <br>
									<input name="userEmail"
										class="form-control find-input" type="text" placeholder="이메일"
										id="userEmail" required />
								</div>
								<input type="button" class="btn btn-b btn-duck email-btn"
									value="이메일 인증" id="confBtn"> <br>
								<div class="input-group inputArea" style="display: none;"
									id="emailConf">
									<div class="col-md-12 col-sm-12 col-12 beforeConf">
										<input class="form-control" type="text" name="confNum"
											id="confNum" placeholder="이메일 인증 코드" required /> 
											<p id="confMailRes"></p>
											<input
											class="btn btn-lg " type="button"
											name="confCheckBtn" id="confCheckBtn" value="인증하기" />
									</div>
									<br>
									
								</div>
								<div>
									<label></label>
									<button type="button" value=""></button>
								</div>
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

		const msg = '${msg}';
		console.log('msg:' + msg);
		if(msg === 'noUser'){
			alert('입력하신 정보와 일치하는 계정이 없습니다.\n정확한 정보를 확인하신 후 재 시도 부탁드립니다. \n 서비스 이용 시 이메일 인증을 받지 않은 경우 \n 아이디 찾기가 어려운 점 양해 부탁드리며, \n 재가입 부탁드립니다.');
		}
		
		
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
						alert('임시 비밀번호가 인증받은 메일로 전송됩니다. \n 메일에서 임시 비밀번호를 확인하신 후 로그인 해주세요.');
						$('.findPwForm').submit();
						
					} else {
						$resultMsg.html('인증번호를 다시 확인해주세요.');
						$resultMsg.css('color', 'red');
						$('#confNum').focus();
					}
		}); //end 인증번호비교
		
		
	});
</script>


</html>