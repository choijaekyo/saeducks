<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section id="userJoinPage" >
		<div class="container-fluid">
		<div class="row">
		 <div class="col-lg-12 col-md-12 col-sm-12" id="userJoin-wrap">
			<div class="title">
				<h2>회원가입</h2>
				<ol>
					<li><span>1</span> 약관동의 ─</li>
					<li style="font-size: 20px" style="font-size: 20px"><span>2</span> 정보입력 ─</li>
					<li><span>3</span> 가입완료</li> 
				</ol>
			</div>
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
					<input name="" type="text" class="btn btn-a" placeholder="아이디" id="userId"> <br>
					<input type="button" class="btn btn-sm btn-b" value="중복 확인" id="account-check"> <br>
					<input name="" type="password" class="btn btn-a" placeholder="비밀번호" id="userPw"> <br>
					<input name="" type="password" class="btn btn-a" placeholder="비밀번호 확인" id="pwConfirm"> <br>
					<input name="" type="text" class="btn btn-a" placeholder="이름"> <br>
					<input name="" type="text" class="btn btn-a" placeholder="닉네임"> <br> <br>
					
					
					<span class="basic-info">상세 정보</span> <br> 
					<span class="category-button" id="add-category">+</span>
					<ul id="category-wrap"> <!-- JS로 ul 자식에 li를 추가해서 추가 카테고리 정보를 받는다. -->
						<li id="dummy-category" style="display: none;">
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
							<span class="category-button" id="del-category">-</span>
						</li>
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
							<span class="category-button" id="del-category">-</span>
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
							<span class="category-button" id="del-category">-</span>
						</li>
					</ul>
						
					<br>
					<span class="optional-container">
						<input type="checkbox" id="optional-checkbox">
						<label for="optional-checkbox"></label><br><span class="addiction-description">쇼핑 서비스를 이용하시려면 클릭하세요~</span><br>
					</span> <br>
					<div class="optional-info" style="display: none;">
						<span class="basic-info">추가 정보</span> <br>
						<input type="button" class="btn btn-sm btn-b btn-primary" onclick="searchAddress()" value="주소찾기"> <br>
						<input name="" type="text" class="btn btn-a" placeholder="주소" id="addrBasic" readonly> <br>
						<input name="" type="text" class="btn btn-a" placeholder="상세주소" id="addrDetail"> <br>
						<input name="" type="text" class="btn btn-a" placeholder="우편번호" id="addrZipNum" readonly> <br>
						<input name="" type="text" class="btn btn-a" placeholder="전화번호" id="userTel"> <br>
						<input name="" type="text" class="btn btn-a" placeholder="이메일" id="userEmail"> <br>
						<input type="button" class="btn btn-lg btn-b btn-primary email-btn" onclick="" value="이메일 인증"> <br>
					</div> <br> <br>
					<input type="submit" class="btn btn-sm btn-info btn-b" value="가입하기"> &nbsp;&nbsp;
					<input type="button" class="btn btn-sm btn-danger btn-b" value="뒤로가기">
				</form>
			</div>
		</div>
		</div>
	 </div>
	</section>

	<%@ include file="../include/footer.jsp" %>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(function() {

		$('.optional-container').click(function(e) {
			
			if ($('#optional-checkbox').is(":checked")) {
				$('#optional-checkbox').prop("checked",false);
				$('.optional-info').css('display','none');
				$('.addiction-description').text('쇼핑 서비스를 이용하시려면 클릭하세요~');
			} else {
				$('#optional-checkbox').prop("checked",true);
				$('.optional-info').css('display','block');
				$('.addiction-description').text('쇼핑 서비스를 이용하시려면 추가 정보를 입력하세요!');
			}
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

		
		$('#account-check').click(function() {
			const userId = $('#userId').val();
			
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/user/checkId',
				contentType:'application/json',
				dataType: 'text',
				data:userId,
				success: function(result) {
					if (result === 'duplicated') {
						$('#userId').css('border', '2px solid red');
						$('#userId').focus();
						alert('아이디가 이미 존재합니다.\n다른 아이디로 입력해주세요.');
					} else {
						$('#userId').css('border', '3px solid yellowgreen');
						alert('사용가능한 아이디입니다!');
					}
				},
				error: function() {
					alert('아이디 확인에 실패했습니다.\n관리자에게 문의해주세요.');						
				}
				
			});
		});
		
		$('#userId').hover(function() {
			$(this).attr('placeholder', '영문 대/소문자, 숫자 4 ~ 12 자리');
		}, function() {
			$(this).attr('placeholder', '아이디');			
		});
		
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
		
		/*아이디 형식 검사 스크립트*/
		$('#userId').keyup(function() {
            const regex = /^[A-Za-z0-9+]{4,12}$/; /* 영문 대/소문자, 숫자 4 ~ 12 */
			
            if(regex.test($(this).val() )) {
                $(this).css('border', '3px solid yellowgreen');
                /* document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다."; */

            } else {
                $(this).css('border', '2px solid red');
                /* document.getElementById("msgId").innerHTML = "유효하지 않은 아이디 입력방식입니다."; */
            }            
            
		});
		/*비밀번호 형식 검사 스크립트*/
		$('#userPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if(regex.test($(this).val() )) {
                $(this).css('border', '3px solid yellowgreen');
                /* document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다."; */

            } else {
                $(this).css('border', '2px solid red');
                /* document.getElementById("msgId").innerHTML = "유효하지 않은 아이디 입력방식입니다."; */
            }            

            if($("#pwConfirm").val() === $(this).val() ) {
                $("#pwConfirm").css('border', '3px solid yellowgreen');
                /* document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다"; */
            } else {
            	$("#pwConfirm").css('border', '2px solid red');
                /* document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요"; */
            }
		});
        /*비밀번호 확인검사*/
		$('#pwConfirm').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if($(this).val() === $("#userPw").val()) {
                $(this).css('border', '3px solid yellowgreen');
                /* document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다."; */
                
	            if(regex.test($(this).val() )) {
	                $(this).css('border', '3px solid yellowgreen');
	                /* document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다."; */
	
	            } else {
	                $(this).css('border', '2px solid red');
	                /* document.getElementById("msgId").innerHTML = "유효하지 않은 아이디 입력방식입니다."; */
	            }   

            } else {
                $(this).css('border', '2px solid red');
                /* document.getElementById("msgId").innerHTML = "유효하지 않은 아이디 입력방식입니다."; */
            }      
            
		});
        
        $('#add-category').click(function() {
        	const $cloneLi = document.getElementById('category-wrap').firstElementChild.cloneNode(true); 
        	$($cloneLi).css('display', 'list-item');
        	
        	$('#category-wrap').append($cloneLi);
        	
        });
        
        $('#category-wrap').on('click', '#del-category' ,function() {
        	console.log(this);
        	this.parentNode.remove();
        });
        
        


		$('#userTel').hover(function() {
			$(this).attr('placeholder', '000-0000-0000');
		}, function() {
			$(this).attr('placeholder', '전화번호');			
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
</script>
</html>

