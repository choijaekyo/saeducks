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
				<ol>
					<li style="font-size: 16px"><span>1</span> 약관동의 ─</li>
					<li style="font-size: 18px"><span>2</span> 정보입력 ─</li>
					<li style="font-size: 16px"><span>3</span> 가입완료</li> 
				</ol>
			</div>
			<div class="join-container">
				<form action="<c:url value='/user/userJoin' />" method="post" enctype="multipart/form-data" id="user-join-form">
					<img alt="프로필 사진" src="<c:url value='/resources/img/profile.png' />">
					<div class="clearfix">
						<div class="file-upload">
							<span>+</span>
							<input name="profilePic" type="file" class="upload" id="user-profile-pic" > <br>
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
   					<div class="input-group inputArea">
		                <div class="col-md-12 col-sm-12 col-12">
		            		<input name="userTel" class="form-control join-input" type="text" placeholder="전화번호" id="userTel" required/>
	                    </div>
               		</div> <br>
					
					<span class="basic-info">카테고리 추가</span>
					<a href="##" id="add-category"><i class="bi bi-plus-square"></i></a>
					<ul id="category-wrap"> <!-- JS로 ul 자식에 li를 추가해서 추가 카테고리 정보를 받는다. -->
						<li style="display: none;" >
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
						<li>
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
						<input type="button" class="btn btn-lg btn-b btn-duck email-btn" onclick="" value="이메일 인증"> <br>
					</div> <br> <br>
					<input type="button" class="btn btn-sm btn-info btn-b" value="가입하기" id="user-join-submit"> &nbsp;&nbsp;
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
			const major = $(this).val();
			const minor1 = '${categoryList}';
			const minor2 = minor1.split('), ');
			
			const $category2 = this.nextElementSibling;
			$($category2).html('');
			
			const $optDefault = document.createElement('option');
			$($optDefault).attr('selected', 'true');			
			$($optDefault).attr('disabled', 'true');			
			$($optDefault).text('소 카테고리');			
			
			const $fragOpts = document.createDocumentFragment();
			$fragOpts.appendChild($optDefault);
			
            const $option = document.createElement('option');
            
			for (let minorText of minor2) {
				if (minorText.indexOf(major) !== -1) {
					
					console.log(minorText);
					
					const minoList = minorText.substring(minorText.indexOf('=[') + 2, minorText.indexOf(']')).split(', ');
					
					 for (const f of minoList) {
			            const $option = document.createElement('option');
			            $option.textContent = f;
			            $fragOpts.appendChild($option);
			        }
					 
			        $category2.appendChild($fragOpts);
			        
					break;
				}
			}
			
		});
		
		
		// 인증번호 이메일 전송
		$('#mail-check-btn').click(() => {

			/* openLoading(); */

			const email = $('#userEmail').val();

			console.log('완성된 이메일' + email);

			$.ajax({
				type: 'GET',
				url: '<c:url value="/user/userConfEmail?email=" />' + email,
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
						$('#userId').css('border', '2px solid #ffc107');
						alert('사용가능한 아이디입니다!');
					}
				},
				error: function() {
					idCheck = false;
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
                $(this).css('border', '2px solid #ffc107');
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
	            if($("#pwConfirm").val() === $(this).val() ) {
	                $(this).css('border', '2px solid #ffc107');
	                $("#pwConfirm").css('border', '2px solid #ffc107');
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
	                $(this).css('border', '2px solid #ffc107');
	                $("#userPw").css('border', '2px solid #ffc107');        
	
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
                $(this).css('border', '2px solid #ffc107');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 닉네임 확인검사 */
        $('#userNickname').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[A-Za-z0-9가-힣+]{1,10}$/; /* 한/영문/ 숫자 포함 10 글자 이내, 특수문자( _, !, ?) */
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid #ffc107');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 전화번호 확인검사 */
        $('#userTel').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[0-9]{8,13}$/; /* 숫자 8~13 자리 */
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid #ffc107');
				
			} else {
                $(this).css('border', '2px solid red');
			}	
        });
        
        /* 이메일 확인검사 */
        $('#userEmail').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid #ffc107');
				
			} else {
                $(this).css('border', '2px solid red');
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

	    
        $('#user-join-submit').click(function() {
        	
        	if (idCheck === false) {
				alert('아이디 중복 확인이 필요합니다.');
				$('#userId').focus();
				return;
			} else if ($('#userPw').css('border-block-color') !== 'rgb(255, 193, 7)') {
				alert('비밀번호를 다시 확인하세요.');
				$('#userPw').focus();				
				return;
			} else if ($('#pwConfirm').css('border-block-color') !== 'rgb(255, 193, 7)') {
				alert('비밀번호를 다시 확인하세요.');
				$('#pwConfirm').focus();				
				return;
			} else if ($('#userName').css('border-block-color') !== 'rgb(255, 193, 7)') {
				alert('이름을 다시 확인하세요.');
				$('#userName').focus();				
				return;
			} else if ($('#userNickname').css('border-block-color') !== 'rgb(255, 193, 7)') {
				alert('닉네임을 다시 확인하세요.');
				$('#userNickname').focus();				
				return;
			} else if ($('#userTel').css('border-block-color') !== 'rgb(255, 193, 7)') {
				alert('전화번호를 다시 확인하세요.');
				$('#userTel').focus();				
				return;
			} else if (true) {
				const majors = $('select[name=categoryMajorTitle]');
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
			} else if (optionCheck === true) {
				if ($('#addrBasic').val() === '') {
					alert('기본 주소를 입력해주세요.');
					$('#addrBasic').focus();
					return;
				} else if ($('#addrDetail').val() === '') {
					alert('상세 주소를 입력해주세요.');
					$('#addrBasic').focus();
					return;
				} /* else if ($('#userEmail'). === '') {
					alert('상세 주소를 입력해주세요.');
					$('#addrBasic').focus();
					return;
				} */
			}
        	
        	
        	$('#user-join-form').submit();
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

