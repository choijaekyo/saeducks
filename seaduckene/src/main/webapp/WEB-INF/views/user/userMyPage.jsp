<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--MyPage 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/userMyPage.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section id="userMyPage" >
		<div class="container">
		<div class="row mypage-wrap">
		 <div class="col-lg-12 col-md-12 col-sm-12 ">
			<div class="title">
				<h2>마이페이지</h2>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
					  <li class="breadcrumb-item active"><a data-toggle="tab" href="#myinfo">내 정보</a></li>
					  <li class="breadcrumb-item"><a data-toggle="tab" href="#myboard">내 글</a></li>
					  <li class="breadcrumb-item"><a data-toggle="tab" href="#">장바구니</a></li>
					  <li class="breadcrumb-item"><a data-toggle="tab" href="#">주문정보</a></li>
					</ol>
				</nav>				
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="myinfo" >
					<div class="join-container">
						<form action="" method="post" enctype="multipart/form-data">
							<img alt="프로필 사진" src="<c:url value='/resources/img/profile.png' />">
							<div class="clearfix">
								<div class="file-upload">
									<span>+</span>
									<input name="" type="file" class="upload" >
								</div>
							</div>
							<span>기본 정보</span> <br>
							<input name="" type="text" class="btn btn-a" placeholder="아이디" readonly> <br>
							<input type="button" class="btn btn-warning btn-b btn-pw-modi" onclick="showModiPwModal()" value="비밀번호 변경하기" id=""> <br>
							<input name="" type="password" class="btn btn-a" placeholder="비밀번호" id="userPw"> <br>
							<input name="" type="password" class="btn btn-a" placeholder="비밀번호 확인" id="pwConfirm"> <br>
							<input name="" type="text" class="btn btn-a" placeholder="이름"> <br>
							<input name="" type="text" class="btn btn-a" placeholder="닉네임"> <br> <br> <br>
							
							<span class="basic-info">상세 정보</span> 
							<span class="category-button">+</span>
							<ul id="category-wrap"> <!-- JS로 ul 자식에 li를 추가해서 추가 카테고리 정보를 받는다. -->
								<li>
									<select name="a">
										<optgroup  label="대분류">
											<option value="movie">영화</option>
											<option value="food">음식</option>
										</optgroup>
									</select>
									<select name="">
										<optgroup label="소분류">
										<!-- 대분류 선택에 따라 select 삭제후 다시 만들어서 추가한다  -->
											<option value="">태극기휘</option>
											<option value="">아발타</option>
										</optgroup>
									</select> 
								</li>
								<li>
									<select name="">
										<optgroup  label="대분류">
											<option value="movie">영화</option>
										</optgroup>
									</select>
									<select name="">
										<optgroup label="소분류">
											<option value="">태극기휘</option>
											<option value="">아발타</option>
										</optgroup>
									</select> 
								</li>
							</ul>
								
							<br>
							<label for="optional-checkbox"></label><br><span class="addiction-description">쇼핑 서비스를 이용하시려면 추가 정보를 입력하세요~</span>
							<br> <br>
							<div class="optional-info">
								<span class="basic-info">추가 정보</span> <br>
								<input type="button" class="btn btn-sm btn-b btn-primary" onclick="searchAddress()" value="주소찾기"> <br>
								<input name="" type="text" class="btn btn-a" placeholder="주소" id="addrBasic" readonly> <br>
								<input name="" type="text" class="btn btn-a" placeholder="상세주소" id="addrDetail"> <br>
								<input name="" type="text" class="btn btn-a" placeholder="우편번호" id="addrZipNum" readonly> <br>
								<input name="" type="text" class="btn btn-a" placeholder="전화번호" id="userTel"> <br>
								<input name="" type="text" class="btn btn-a" placeholder="이메일"> <br>
								<input type="button" class="btn btn-lg btn-b btn-primary email-btn" onclick="" value="이메일 인증"> <br>
							</div> <br> <br>
							<input type="button" class="btn btn-sm btn-info btn-b" onclick="showUpdateModal()" value="수정하기" id="update"> &nbsp;&nbsp;
							<input type="button" class="btn btn-sm btn-danger btn-b" onclick="showDeleteModal()" value="탈퇴하기" id="delete"> &nbsp;&nbsp;
							<input type="button" class="btn btn-sm btn-b" onclick="history.back()" value="뒤로가기" id="back">
						</form>
					</div>
				</div>
				<div class="tab-pane" id="myboard">
				</div>
			</div>
		</div>
		</div>
	 </div>
	</section>
	
	<section>
		<div class="modal" id="myPageModal">
		  <div class="modal-dialog modalDesign">
		    <div class="modal-content" id="myPage-modal-content">
		      <div class="modal-header" id="myPage-modal-header">
		        <h4 class="modal-title"></h4>
		        <button type="button" class="close" onclick="hideModal()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
		      <div class="modal-body" id="myPage-modal-footer">
		      	<form action="" method="post" id="modal-submit">
			        <!-- <p>One fine body&hellip;</p> -->
			        <input name="" type="password" class="btn btn-a currPw" placeholder="현재 비밀번호" id="currPw"> <br>
					<input name="" type="password" class="btn btn-a modiPw" placeholder="변경 비밀번호" id="modiPw"> <br class="modiPw">
					<input name="" type="password" class="btn btn-a checkPw" placeholder="비밀번호 확인" id="checkPw"> <br>
					<input type="submit" style="display: none" >							
		      	</form>
		      </div>
		      <div class="modal-footer" id="myPage-modal-footer">
		        <button type="button" class="btn btn-primary modal-submit-btn">내용 수정하기</button>
		        <button type="button" class="btn btn-light modal-cancel" onclick="hideModal()" data-dismiss="modal">돌아가기</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		  
			<div id="modalMask"></div>
		</div><!-- /.modal -->
		
	</section>

	<%@ include file="../include/footer.jsp" %>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(function() {
		
		
		 $('.title').on('click', 'li', function(e) {
			
			e.preventDefault();
			$('.title .breadcrumb .active').toggleClass('active');
			console.log(this);
			$(this).toggleClass('active');
			
			$('.tab-content .in').toggleClass('in');
			$('.tab-content .active').toggleClass('active');
			
			const id = $(this.firstElementChild).attr('href');
			
			$(id).toggleClass('in');
			$(id).toggleClass('active');
			
		}); 
		
		$('#category-wrap').on('change', 'select[name=a]', function(e) {
			
			const $category2 = this.nextElementSibling;
			
			const $optgroup = document.createElement('optgroup');
			$($optgroup).attr('label', '소분류');
			
			const $fragOPt = document.createDocumentFragment();
			
            const $option = document.createElement('option');
            $($option).attr('name', 'a')
            $option.textContent = '임시로 기능만 대충 구현';
            $fragOPt.appendChild($option);
			// for (const f of /* 소분류 갖는 colltection */) {
	        //    const $option = document.createElement('option');
	        //    $($option).attr('name', '/* 파라미터 값 */')
	        //    $option.textContent = /* 한글값 */;
	        //    $frag.appendChild($option);
	        //} 

	        $optgroup.appendChild($fragOPt);
			
	        $category2.replaceChild($optgroup, $category2.firstElementChild);
		});
		
		// 인증번호 이메일 전송
		$('#mail-check-btn').click(() => {

			/* openLoading(); */

			const email = $('#userEmail1').val() + $('#userEmail2').val();

			console.log('완성된 이메일' + email);

			$.ajax({
				type: 'GET',
				url: '<c:url value="/user/mailCheck?email=" />' + email,
				success: function(data) {
					console.log('통신 성공!');
					closeLoading();
					console.log('컨트롤러가 전달한 인증번호: ' + data);

					$('.mail-check-input').attr('disabled', false); // 비활성된 인증번호 입력창 활성화.
					code = data; // 인증번호를 전역변수에 저장.
					alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
				},
				error: function() {
					console.log('통신 실패!');
				}

			}); // end ajax(이메일 전송)

		}); // 이메일 전송 끝.
		
		$('#userPw').hover(function() {
			$(this).attr('placeholder', '영문 대/소문자, 숫자 8 ~ 16 자리');
		}, function() {
			$(this).attr('placeholder', '비밀번호');			
		});
		
		$('#pwConfirm').hover(function() {
			$(this).attr('placeholder', '영문 대/소문자, 숫자 8 ~ 16 자리');
		}, function() {
			$(this).attr('placeholder', '비밀번호 확인');			
		});

		$('#userTel').hover(function() {
			$(this).attr('placeholder', '000-0000-0000');
		}, function() {
			$(this).attr('placeholder', '전화번호');			
		});

		/*비밀번호 형식 검사 스크립트*/
		$('#userPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if(regex.test($(this).val() )) {
	            if($("#pwConfirm").val() === $(this).val() ) {
	                $(this).css('border', '3px solid yellowgreen');
	                $("#pwConfirm").css('border', '3px solid yellowgreen');
	            } else {
	            	$(this).css('border', '2px solid red');
	            	$("#pwConfirm").css('border', '2px solid red');
	            }
            } else {
                $(this).css('border', '2px solid red');
            }            

		});
        /*비밀번호 확인검사*/
		$('#pwConfirm').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            
            if(regex.test($(this).val() )) {
	            if($(this).val() === $("#userPw").val()) {
	                $(this).css('border', '3px solid yellowgreen');
	                $("#userPw").css('border', '3px solid yellowgreen');        
	
	            } else {
	                $(this).css('border', '2px solid red');
	                $("#userPw").css('border', '2px solid red');
	            }      

            } else {
                $(this).css('border', '2px solid red');
            }   
		});
	}); // end jQuery
	
	// 다음 주소 api 사용해보기

	function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                document.getElementById('addrZipNum').value = data.zonecode;
                document.getElementById('addrBasic').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrDetail').focus();
            }
        }).open();
	}
	
	
	// 비밀번호 변경 모달 열기
	function showModiPwModal() {
		$('.modal-submit-btn').text('비밀번호 변경하기');
		$('.modal-submit-btn').attr('onclick', 'ModiPwModal()');
		
		$('#myPageModal').show();
	}
	
	// 수정 모달 열기
	function showUpdateModal() {
		$('.modal-submit-btn').text('내용 수정하기');
		$('.modiPw').css('display', 'none');
		$('.modal-submit-btn').attr('onclick', 'UpdateModal()');

		$('#myPageModal').show();
	}
	
	// 탈퇴 모달 열기
	function showDeleteModal() {
		$('.modal-submit-btn').text('탈퇴하기');
		$('.modiPw').css('display', 'none');
		$('.modal-submit-btn').attr('onclick', 'DeleteModal()');
		
		$('#myPageModal').show();
	}
	
	function ModiPwModal() {
		const currPw = $('#currPw').val();
		const modiPw = $('#modiPw').val();
		const checkPw = $('#checkPw').val();
		const array = [currPw,modiPw,checkPw];
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/pwModify',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result === '1') {
					console.log('통신성공');
					
					/* $('#modal-submit').submit(); */
				} else if(result ==='0') {
					
				} else {
					
				}
				
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
	}
	
	function UpdateModal() {
		const currPw = $('#currPw').val();
		const checkPw = $('#checkPw').val();
		const array = [currPw,checkPw];
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/userUpdate',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result === '1') {
					console.log('통신성공!');
					
					/* $('#modal-submit').submit(); */
				} else if(result ==='0') {
					
				} else {
					
				}
				
				
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
	}

	function DeleteModal() {
		const currPw = $('#currPw').val();
		const checkPw = $('#checkPw').val();
		const array = [currPw,checkPw];
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/userDelete',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result === '1') {
					console.log('통신성공!!');
					
					/* $('#modal-submit').submit(); */
				} else if(result ==='0') {
					
				} else {
					
				}
				
				
				
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
	}
	
	// 모달 닫기
	function hideModal() {
		$('#myPageModal').hide();
	}
	
</script>
</html>

