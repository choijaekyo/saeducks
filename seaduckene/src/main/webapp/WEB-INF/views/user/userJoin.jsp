<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--Join 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/userJoin.css" rel="stylesheet">
    
</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section id="userJoinPage" >
		<div class="container-fluid">
		<div class="row">
		 <div class="col-lg-12 col-md-12 col-sm-12" id="userJoin-wrap">
			<div class="title">
				<h2>회원가입</h2>
				<ol class="ps-0">
					<li style="font-size: 18px"><span>1</span> 정보입력 </li>
					<li style="font-size: 16px"> ─</li>
					<li style="font-size: 16px"><span>2</span> 가입완료</li> 
				</ol>
			</div>
			<div class="join-container">
				<form action="<c:url value='/user/userJoin' />" method="post" enctype="multipart/form-data" id="user-join-form">
					<img alt="프로필 사진" src="<c:url value='/resources/img/profile.png' />" id="image_section">
					<div class="clearfix">
						<div class="file-upload">
							<span>+</span>
							<input name="profilePic" type="file" class="upload" id="user-profile-pic" accept="image/*" > <br>
						</div>
					</div>
					<span>기본 정보</span> <br>
					<div class="input-group inputArea">
	                    <div class="col-md-12 col-sm-12 col-12">
	                        <input name="userId" class="form-control join-input" type="text" placeholder="아이디" id="userId" required />
	                    </div>
                	</div>
					<input type="button" class="btn btn-sm btn-b btn-duck" value="중복 확인" id="account-check"> <br>
					<div class="input-group inputArea">
	                    <div class="col-md-12 col-sm-12 col-12">
	                        <input name="userPw" class="form-control join-input" type="password" placeholder="비밀번호" id="userPw" required />
	                    </div>
                	</div>
					<div class="input-group inputArea">
	                    <div class="col-md-12 col-sm-12 col-12">
	                        <input class="form-control join-input" type="password" placeholder="비밀번호 확인" id="pwConfirm" required />
	                    </div>
                	</div>
					<div class="input-group inputArea">
	                    <div class="col-md-12 col-sm-12 col-12">
	                        <input name="userName" class="form-control join-input" type="text" placeholder="이름" id="userName" required />
	                    </div>
                	</div>
					<div class="input-group inputArea">
	                    <div class="col-md-12 col-sm-12 col-12">
	                        <input name="userNickname" class="form-control join-input" type="text" placeholder="닉네임" id="userNickname" required />
	                    </div>
                	</div>
					<input type="button" class="btn btn-sm btn-b btn-duck" value="중복 확인" id="nickname-check"> <br>
   					<div class="input-group inputArea">
		                <div class="col-md-12 col-sm-12 col-12">
		            		<input name="userTel" class="form-control join-input" type="text" placeholder="전화번호" id="userTel" maxlength="11" required/>
	                    </div>
               		</div> <br>
					
					<span class="basic-info">카테고리 추가</span>
					<a href="##" id="add-category"><i class="bi bi-plus-square"></i></a>
					<ul id="category-wrap"> <!-- JS로 ul 자식에 li를 추가해서 추가 카테고리 정보를 받는다. -->
						<li style="display: none;" data-index='0' >
							<select  name="categoryMajorTitle" class="form-select join-category" aria-label="Default select example">
                                    <option selected disabled>대 카테고리</option>
                                    <c:forEach var="i" begin="0" end="${majorLength}" step="1">
                                    	<option>${categoryList[i].categoryMajorTitle}</option>
                                    </c:forEach>
                            </select>
                            <select  name="categoryMinorTitle" class="form-select join-category " aria-label="Default select example" >
                                    <option selected disabled>소 카테고리</option>
                            </select>
                            <a href="##" id="del-category"><i class="bi bi-dash-square"></i></a>
						</li>
						<li data-index='1'>
							<select  name="categoryMajorTitle" class="form-select join-category" aria-label="Default select example">
                                    <option selected disabled>대 카테고리</option>
                                    <c:forEach var="i" begin="0" end="${majorLength}" step="1">
                                    	<option>${categoryList[i].categoryMajorTitle}</option>
                                    </c:forEach>
                            </select>
                            <select  name="categoryMinorTitle" class="form-select join-category " aria-label="Default select example" >
                                    <option selected disabled>소 카테고리</option>
                            </select>
                            <a href="##" id="del-category"><i class="bi bi-dash-square"></i></a>
						</li>
					</ul>
						
					<br>
					<span class="optional-container">
						<input type="checkbox" id="optional-checkbox">
						<label for="optional-checkbox"></label><br><span class="addiction-description">쇼핑 서비스를 이용하시려면 클릭하세요~</span><br>
					</span> <br>
					<div class="optional-info" style="display: none;">
						<span class="basic-info">추가 정보</span> <br>
						<input type="button" class="btn btn-sm btn-b btn-duck" onclick="searchAddress()" value="주소찾기"> <br>
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="addressBasic" class="form-control join-input" type="text" placeholder="기본 주소" id="addrBasic" readonly />
		                    </div>
                		</div>	
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="addressDetail" class="form-control join-input" type="text" placeholder="상세 주소" id="addrDetail" />
		                    </div>
                		</div>	
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="addressZipNum" class="form-control join-input" type="text" placeholder="우편번호" id="addrZipNum" readonly />
		                    </div>
                		</div>	
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="userEmail" class="form-control join-input" type="text" placeholder="이메일" id="userEmail" />
		                    </div>
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
					</div> <br> <br>
					<input type="button" class="btn btn-sm btn-info btn-b" value="가입하기" id="user-join-submit"> &nbsp;&nbsp;
					<input type="button" class="btn btn-sm btn-danger btn-b" value="뒤로가기" onclick="back()">
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

	function back() {
		window.history.back();
	}

	let optionCheck = false;
	$(function() {
		
		$('.optional-container').click(function(e) {
			
			if ($('#optional-checkbox').is(":checked")) {
				$('#optional-checkbox').prop("checked",false);
				$('.optional-info').css('display','none');
				$('.addiction-description').text('쇼핑 서비스를 이용하시려면 클릭하세요~');
				optionCheck = false;
			} else {
				$('#optional-checkbox').prop("checked",true);
				$('.optional-info').css('display','block');
				$('.addiction-description').text('쇼핑 서비스를 이용하시려면 추가 정보를 입력하세요!');
				optionCheck = true;
			}
		});
		
		$('#category-wrap').on('change', 'select[name=categoryMajorTitle]', function(e) {
			const chosenMajor = $(this).val();
			const minorText1 = '${categoryList}';
			const minorText2 = minorText1.split('), ');
			const $category2 = this.nextElementSibling;
			$($category2).html('');
			
			const $optDefault = document.createElement('option');
			$($optDefault).attr('selected', 'true');			
			$($optDefault).attr('disabled', 'true');			
			$($optDefault).text('소 카테고리');			
			
			const $fragOpts = document.createDocumentFragment();
			$fragOpts.appendChild($optDefault);
			
            const $option = document.createElement('option');
            
			for (let minorText3 of minorText2) {
				
				let majorText = minorText3.substring(1, minorText3.indexOf(' '));
				let serverMajor = majorText.substring(majorText.indexOf('=') + 1, majorText.indexOf(','));
				
				if (chosenMajor === serverMajor) {
					
					const minorList = minorText3.substring(minorText3.indexOf('=[') + 2, minorText3.indexOf(']')).split(', ');
					
					 for (const minor of minorList) {
			            const $option = document.createElement('option');
			            $option.textContent = minor;
			            $fragOpts.appendChild($option);
			        }
					 
			        $category2.appendChild($fragOpts);
			        
					break;
				}
			}
			
		});
	
		// 카테고리 선택 시 중복 방지
		$('#category-wrap').on('change', 'select[name=categoryMinorTitle]', function(e) {
			const chosenMinor = $(this).val();
			const chosenMajor = $(this.previousElementSibling).val();
			
			const chosenLiIndex = $(this.parentNode).data('index');
			
			const selectedMajors = $('select[name=categoryMajorTitle]');
			const selectedMajorsMaxIndex = selectedMajors.length;
			
			// 현재 선택된 모든 대 카테고리의 값을 반복문으로 조회.
			for (let i = 1; i < selectedMajorsMaxIndex; i++) {
				
				let selectedLiIndex = $(selectedMajors[i].parentNode).data('index');
				
				if (selectedLiIndex !== chosenLiIndex) {
					if (selectedMajors[i].value === chosenMajor && selectedMajors[i].nextElementSibling.value === chosenMinor) {
						alert('이미 선택된 카테고리입니다.');
						this.selectedIndex = 0;
						return;
					}
				}
			}
		});
		
		let code = '';
		// 인증번호 이메일 전송
		$('.email-btn').click(() => {

			/* openLoading(); */
			

			const email = $('#userEmail').val();
			console.log('이메일: ' + email);
			
			if(email.trim() === ''){
				alert('인증받을 메일 주소를 먼저 입력해 주세요.');
			} else {
				$('#emailConf').css('display', 'block');
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userConfEmail" />',
					data: email,
					contentType: 'application/json',
					success: function(data) {
						code = data; // 인증번호를 전역변수에 저장.
						console.log(code);
						alert('인증메일이 전송되었습니다.\n입력하신 메일주소에서 전송된 인증번호를 확인해주세요.');
					},
					error: function() {
						code='보라천재';
						alert('이메일 전송 실패');
					}
				}); // end ajax(이메일 전송)

			} 

		}); // 이메일 전송 끝.
		
		// 인증번호 비교
		$('#confCheckBtn').click(function() {
				const inputCode = $('#email-auth-code').val();
				const $resultMsg = $('#confMailRes');
				
				if (inputCode == code) {
					$resultMsg.html('인증이 완료되었습니다.');
					$('.beforeConf').css('display','none');
					$resultMsg.css('color', 'green');
					
					$('#userEmail').attr('readonly', true);
					$('#confBtn').css('display', 'none');
					
				} else {
					$resultMsg.html('인증번호를 다시 확인해주세요.');
					$resultMsg.css('color', 'red');
					$('#confNum').focus();
				}
		}); //end 인증번호비교

		let idCheck = false;
		// 아이디 중복 확인.
		$('#account-check').click(function() {
			const userId = $('#userId').val();
			console.log();
			
			if(userId === '') {
				idCheck = false;
				$('#userId').focus();
				alert('아이디를 입력하세요.');
				return;
			} else if($('#userId').css('border-block-color') === 'rgb(255, 0, 0)') {
				idCheck = false;
				$('#userId').focus();
				alert('유효하지 않는 아이디입니다.');
				return;				
			}
			
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/user/checkId',
				contentType:'application/json',
				dataType: 'text',
				data:userId,
				success: function(result) {
					if (result === 'duplicated') {
						idCheck = false;
						$('#userId').css('border', '2px solid red');
						$('#userId').focus();
						alert('아이디가 이미 존재합니다.\n다른 아이디로 입력해주세요.');
					} else {
						idCheck = true;
						$('#userId').css('border', '2px solid rgb(34, 139, 34)');
						alert('사용가능한 아이디입니다!');
					}
				},
				error: function() {
					idCheck = false;
					$('#userId').css('border', '2px solid red');
					alert('아이디 확인에 실패했습니다.\n관리자에게 문의해주세요.');						
				}
				
			});
		});
		
		let nicknameCheck = false;
		// 닉네임 중복 확인.
		$('#nickname-check').click(function() {
			const userNickname = $('#userNickname').val();
			
			if(userNickname === '') {
				nicknameCheck = false;
				$('#userNickname').focus();
				alert('닉네임를 입력하세요.');
				return;
			} else if($('#userNickname').css('border-block-color') === 'rgb(255, 0, 0)') {
				nicknameCheck = false;
				$('#userNickname').focus();
				alert('유효하지 않는 닉네임입니다.');
				return;				
			}
			
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/user/checkNickname',
				contentType:'application/json',
				dataType: 'text',
				data:userNickname,
				success: function(result) {
					if (result === 'duplicated') {
						nicknameCheck = false;
						$('#userNickname').css('border', '2px solid red');
						$('#userNickname').focus();
						alert('이 닉네임은 이미 사용 중입니다.');
					} else {
						nicknameCheck = true;
						$('#userNickname').css('border', '2px solid rgb(34, 139, 34)');
						alert('사용가능한 닉네임입니다!');
					}
				},
				error: function() {
					nicknameCheck = false;
					$('#userNickname').css('border', '2px solid red');
					alert('닉네임 확인에 실패했습니다.\n관리자에게 문의해주세요.');						
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
		
		$('#userName').hover(function() {
			$(this).attr('placeholder', '한/영');
		}, function() {
			$(this).attr('placeholder', '이름');			
		});
		
		$('#userNickname').hover(function() {
			$(this).attr('placeholder', '한/영/숫자 10글자 이내, 특수문자 _ ! ?');
		}, function() {
			$(this).attr('placeholder', '닉네임');			
		});
		
		$('#userTel').hover(function() {
			$(this).attr('placeholder', '-(하이픈) 없이 입력하세요.');
		}, function() {
			$(this).attr('placeholder', '전화번호');			
		});
		
		/*아이디 형식 검사 스크립트*/
		$('#userId').keyup(function() {
            const regex = /^[A-Za-z0-9+]{4,12}$/; /* 영문 대/소문자, 숫자 4 ~ 12 */
			
            if(regex.test($(this).val() )) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
                /* document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다."; */

            } else {
                $(this).css('border', '2px solid red');
                /* document.getElementById("msgId").innerHTML = "유효하지 않은 아이디 입력방식입니다."; */
            }            
            /* console.log($(this).css('border-block-color')); */
            
            
		});
		/*비밀번호 형식 검사 스크립트*/
		$('#userPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if(regex.test($(this).val() )) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
                
	            if($("#pwConfirm").val() === $(this).val() ) {
	                $("#pwConfirm").css('border', '2px solid rgb(34, 139, 34)');
	            } else {
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
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
	                $("#userPw").css('border', '2px solid rgb(34, 139, 34)');        
	
	            } else {
	                $(this).css('border', '2px solid red');
	                $("#userPw").css('border', '2px solid red');
	            }      

            } else {
                $(this).css('border', '2px solid red');
            }   
		});
        
        /* 이름 확인검사 */
        $('#userName').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[가-힣a-zA-Z]+$/;
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 닉네임 확인검사 */
        $('#userNickname').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[\w가-힣\_\!\?]{1,10}$/; /* 한/영문/ 숫자 포함 10 글자 이내, 특수문자( _, !, ?) */
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 전화번호 문자열 입력 방지 */
        $('#userTel').keydown(function(e) {
            // Only ASCII character in that range allowed
            const ASCIICode = (e.which) ? e.which : e.keyCode;
            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                return false;
        });
        
        /* 전화번호 확인검사 */
        $('#userTel').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^(010)[0-9]{8}$/; /* 숫자 010포함 11 자리 */
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 이메일 확인검사 */
        $('#userEmail').keyup(function() {
        	$(this).css('color', 'black');
        	const regex = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
			
			if ($(this).val() === '') {
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
				if (regex.test($(this).val())) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
				} else {
	                $(this).css('border', '2px solid red');
				}
			}
        }); 
        
        /*  주소 확인 검사 */
        $('#addrDetail').keyup(function() {
			if ($(this).val() === '') {
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
			}
        });
        
        // 카테고리 추가
        $('#add-category').click(function() {
        	const $lastLi = this.nextElementSibling.lastElementChild;
     		
        	let indexLi = $($lastLi).data('index') + 1;
        	
        	const $cloneLi = document.getElementById('category-wrap').firstElementChild.cloneNode(true);
        	$($cloneLi).attr('data-index', indexLi);
        	$($cloneLi).css('display', 'list-item');
        	
        	$('#category-wrap').append($cloneLi);
        	
        });
        
        // 카테고리 제거
        $('#category-wrap').on('click', '#del-category' ,function() {
        	console.log(this);
        	this.parentNode.remove();
        });

        // 버튼 클릭, 버튼 엔터 이벤트 시 submit 실행 코드.
        $('#user-join-submit').click(join);
        $('#user-join-form').on('keyup', 'input', keyPressEnter);
	    
	    function keyPressEnter() {
	    	if (window.event.keyCode == 13) {
		    	join();				
			}
	    }
        
	    // 회원가입 정보 넘기기 전에 입력값 검증. 함수 선언.
 		function join() {
 			if (!idCheck) {
				alert('아이디 중복 확인이 필요합니다.');
				$('#userId').focus();
				return;
			} else if ($('#userPw').css('border-block-color') !== 'rgb(34, 139, 34)') {
				alert('비밀번호를 다시 확인하세요.');
				$('#userPw').focus();				
				return;
			} else if ($('#pwConfirm').css('border-block-color') !== 'rgb(34, 139, 34)') {
				alert('비밀번호를 다시 확인하세요.');
				$('#pwConfirm').focus();				
				return;
			} else if ($('#userName').css('border-block-color') !== 'rgb(34, 139, 34)') {
				alert('이름을 다시 확인하세요.');
				$('#userName').focus();				
				return;
			} else if (!nicknameCheck) {
				alert('닉네임 중복확인이 필요합니다.');
				$('#userNickname').focus();				
				return;
			} else if ($('#userTel').css('border-block-color') !== 'rgb(34, 139, 34)') {
				alert('전화번호를 다시 확인하세요.');
				$('#userTel').focus();				
				return;
			} else if ($('#userEmail').css('border-block-color') === 'rgb(255, 0, 0)') {
				alert('이메일을 다시 확인하세요.');
				$('#userEmail').focus();				
				return;
			} else {
				const majors = $('select[name=categoryMajorTitle]');
				
				if (majors.length <= 1) {
					alert('카테고리를 선택은 필수입니다.');
					return;
				}
				
				for (let i = 1; i < majors.length; i++) {
					if (majors[i].value === '대 카테고리') {
						alert('대 카테고리를 선택하세요.');
						majors[i].focus();				
						return;						
					}	  
				}
				
				const minors = $('select[name=categoryMinorTitle]');
				for (let i = 1; i < minors.length; i++) {
					if (minors[i].value === '소 카테고리') {
						alert('소 카테고리를 선택하세요.');
						minors[i].focus();				
						return;						
					}	  
				}
			}
        	
        	if (optionCheck === true) { 
				if ($('#addrBasic').val() === '') {
					alert('기본 주소를 입력해주세요.');
					$('#addrBasic').focus();
					return;
				} else if ($('#addrDetail').val() === '') {
					alert('상세 주소를 입력해주세요.');
					$('#addrBasic').focus();
					return;
				} else if ($('#confBtn').css('display') !== 'none') {
					alert('이메일 인증해주세요.');
					$('#userEmail').focus();
					return;
				} 
        	} else {
        		if ($('#addrDetail').val() === '' || $('#addrDetail').val() === '' || $('#addrBasic').val() === '') {
					if (!confirm('쇼핑 서비스의 추가 정보에 이메일과 주소를 설정하지 않으시면 나중에 회원 정보를 찾을 수 없습니다.')) {
						return;
					}
				}
			}
        	
        	$('#user-join-form').submit();
 		}
        
	}); // end jQuery
	
	const input = document.querySelector('#user-profile-pic');
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();
			
			reader.onload = function (e) {
			 $('#image_section').attr('src', e.target.result);  
			}
			
			reader.readAsDataURL(input.files[0]);
		}
	}
	 
    // 프로필 이미지파일 제한
	// 이벤트를 바인딩해서 input에 파일이 올라올때 (input에 change를 트리거할때) 위의 함수를 this context로 실행합니다.
	$("#user-profile-pic").change(function(){
		
		if (this.files[0]) {
			if (!this.files[0].type.includes('image/')) {
				alert("이미지 파일만 등록 가능합니다.");
				const dt = new DataTransfer();
				this.files = dt.files;
				
				 $('#image_section').attr('src', '<c:url value="/resources/img/profile.png" />');  
				return;
			} else {
				readURL(this);				
			}
		} else {
			 $('#image_section').attr('src', '<c:url value="/resources/img/profile.png" />');  
			readURL(this);
		}
	});	
	
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

