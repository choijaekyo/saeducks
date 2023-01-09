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
<link href="${pageContext.request.contextPath }/resources/css/userFindAccount.css"
	rel="stylesheet">
</head>
<body>
<%@ include file="../include/header.jsp" %>


	<section class="py-5" id="userFindAccount">
	    <div class="container">
		    <div class="row">
				<div class="col-sm-12" >
					<h1 class="find-account h1">아이디 찾기</h1>	 
				</div>
				<form action="">
					<div class="offset-sm-1 col-sm-11" >
						<p class="sub-title"><input class="form-check-input radio" name="isEmail" type="radio" data-check="1" id="checked-email"/> 본인확인 이메일로 인증하기</p>
						<div class="description-1" style="display:none;">
							<label>본인확인 이메일 주소와 입력한 이메일 주소가 같아야 인증번호를 받을 수 있습니다.</label>
							<div>
								<label></label>
								<input name="userId" class="form-control find-input" type="text" placeholder="아이디" id="userId" required />
		                        <input name="userEmail" class="form-control find-input" type="text" placeholder="이메일" id="userEmail" required />
	                		</div>	
							<input type="button" class="btn btn-lg btn-b btn-duck email-btn" value="이메일 인증" id="confBtn"> <br>
							<div class="input-group inputArea" style="display: none;" id="emailConf">
			                    <div class="col-md-12 col-sm-12 col-12 beforeConf">
									<input class="form-control join-input " type="text" name=""
										id="email-auth-code" placeholder="이메일 인증 코드" required />
									<input class="btn btn-outline-secondary" type="button"
												name="confCheckBtn" id="confCheckBtn" value="인증하기" />
			                    </div> <br>
			                    <p id="confMailRes"></p>
	                		</div>
							<div>
								<label></label>
								<button type="button" value=""></button>
							</div>
						</div>
					</div>
					<div class="offset-sm-1 col-sm-11" >
						<p class="sub-title"><input class="form-check-input radio" name="isEmail" type="radio" data-check="2" id="unchecked-email"/> 이메일 등록이 안된 경우 클릭하세요~</p>
						<div class="description-2" style="display:none;">
							<label>아직 해당 서비스는 제공하지 않습니다. <br>
							아이디를 새로 만들어보세요ㅜㅜ</label>
						</div>
					</div>
				</form>
	    	</div>
	    </div>
	</section>
	
	
<%@ include file="../include/footer.jsp" %>
    
</body>
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
	});
</script>
</html>