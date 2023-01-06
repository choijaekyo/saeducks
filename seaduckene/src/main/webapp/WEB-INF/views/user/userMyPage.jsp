<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<c:choose>
				<c:when test="${toggle == 2}">					
					<h2>내 게시판</h2>
				</c:when>
				<c:when test="${toggle == 3}">					
					<h2>장바구니</h2>
				</c:when>
				<c:otherwise>
					<h2>마이페이지</h2>
				</c:otherwise>
			</c:choose>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
					<c:choose>
						<c:when test="${toggle == 1}">		
						  <li class="breadcrumb-item active" data-head="1"><a data-toggle="tab" href="#myinfo">내 정보</a></li>
						</c:when>
						<c:otherwise>
						  <li class="breadcrumb-item" data-head="1"><a data-toggle="tab" href="#myinfo">내 정보</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${toggle == 2}">		
						  <li class="breadcrumb-item active" data-head="2"><a data-toggle="tab" href="#myboard">내 글</a></li>
						</c:when>
						<c:otherwise>
						  <li class="breadcrumb-item" data-head="2"><a data-toggle="tab" href="#myboard">내 글</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${toggle == 3}">		
						  <li class="breadcrumb-item active" data-head="3"><a data-toggle="tab" href="#myBasket">장바구니</a></li>
						</c:when>
						<c:otherwise>
						  <li class="breadcrumb-item" data-head="3"><a data-toggle="tab" href="#myBasket">장바구니</a></li>
						</c:otherwise>
					</c:choose>
					  
					  <li class="breadcrumb-item" data-head="4"><a data-toggle="tab" href="#">주문정보</a></li>
					</ol>
				</nav>				
			</div>
			<div class="tab-content">
		<c:choose>
			<c:when test="${toggle == 1}">					
				<div class="tab-pane active" id="myinfo" >
			</c:when>
			<c:otherwise>
				<div class="tab-pane" id="myinfo" >
				</c:otherwise>
			</c:choose>
					<div class="update-container">
						<form action="" method="post" enctype="multipart/form-data" id="user-update-form">
							<img alt="프로필 사진" src="<c:url value='/resources/img/profile.png' />" id="image_section">
							<div class="clearfix">
								<div class="file-upload">
									<span>+</span>
									<input name="profilePic" type="file" class="upload" id="user-profile-pic" accept=".jpg, .jpeg, .png, .gif, .bmp" > <br>
								</div>
							</div>
							<span>기본 정보</span> <br> <br>
							<p>아이디</p>
							<div class="input-group inputArea">
			                    <div class="col-md-12 col-sm-12 col-12">
			                        <input name="userId" class="form-control join-input" type="text" placeholder="아이디" value="${user.userId}" id="userId" readonly />
			                    </div>
		                	</div>							
							<input type="button" class="btn btn-b btn-duck btn-pw-modi" onclick="showModiPwModal()" value="비밀번호 변경하기" id=""> <br> <br>
							<p>이름</p>
							<div class="input-group inputArea">
			                    <div class="col-md-12 col-sm-12 col-12">
			                        <input name="userName" class="form-control join-input" type="text" placeholder="이름" value="${user.userName}" id="userName" required />
			                    </div>
		                	</div> <br>							
							<p>닉네임</p>
							<div class="input-group inputArea">
			                    <div class="col-md-12 col-sm-12 col-12">
			                        <input name="userNickname" class="form-control join-input" type="text" placeholder="닉네임" value="${user.userNickname}" id="userNickname" required />
			                    </div>
		                	</div>
							<input type="button" class="btn btn-sm btn-b btn-duck" value="중복 확인" id="nickname-check"> <br>
		   					<div class="input-group inputArea">
				                <div class="col-md-12 col-sm-12 col-12">
				            		<input name="userTel" class="form-control join-input" type="text" placeholder="전화번호" value="${user.userTel}" id="userTel" required/>
			                    </div>
		               		</div> <br>
		               		<span class="basic-info">카테고리 정보</span> 
							<ul class="category-wrap">
							<c:forEach var="userCategory" items="${userCategoryList}" varStatus="status">
								<li data-index='${status.index}'>
									<select  name="categoryMajorTitle" class="form-select join-category" aria-label="Default select example" >
		                                    <option selected disabled>대 카테고리</option>
		                                    <c:forEach var="i" begin="0" end="${majorLength}" step="1">
		                                    	<option>${categoryList[i].categoryMajorTitle}</option>
		                                    </c:forEach>
		                            </select>
		                            <select name="categoryMinorTitle" class="form-select join-category " aria-label="Default select example" >
		                                    <!-- <option selected disabled>소 카테고리</option> -->
		                            </select>
		                            <a href="##" id="del-category"><i class="bi bi-dash-square"></i></a>
								</li>
							</c:forEach>	               		
							</ul> <br>
							<span class="basic-info">카테고리 추가</span> 
							<a href="##" id="add-category"><i class="bi bi-plus-square"></i></a>
							<ul id="category-wrap" class="category-wrap"> <!-- JS로 ul 자식에 li를 추가해서 추가 카테고리 정보를 받는다. -->
								<li style="display: none;" >
									<select name="categoryMajorTitle" class="form-select join-category" aria-label="Default select example">
		                                    <option selected disabled>대 카테고리</option>
		                                    <c:forEach var="i" begin="0" end="${majorLength}" step="1">
		                                    	<option>${categoryList[i].categoryMajorTitle}</option>
		                                    </c:forEach>
		                            </select>
		                            <select name="categoryMinorTitle" class="form-select join-category " aria-label="Default select example" >
		                                    <option selected disabled>소 카테고리</option>
		                            </select>
		                            <a href="##" id="del-category"><i class="bi bi-dash-square"></i></a>
								</li>					
							</ul> <br>
							
							<div class="optional-info"">
								<span class="basic-info">추가 정보</span> <br>
								<input type="button" class="btn btn-sm btn-b btn-duck" onclick="searchAddress()" value="주소찾기"> <br>
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input name="addressBasic" class="form-control join-input" type="text" placeholder="기본 주소" value="${userAddr.addressBasic}" id="addrBasic" readonly />
				                    </div>
		                		</div>	
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input name="addressDetail" class="form-control join-input" type="text" placeholder="상세 주소" value="${userAddr.addressDetail}" id="addrDetail" />
				                    </div>
		                		</div>	
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input name="addressZipNum" class="form-control join-input" type="text" placeholder="우편번호" value="${userAddr.addressZipNum}" id="addrZipNum" readonly />
				                    </div>
		                		</div>	
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input name="userEmail" class="form-control join-input" type="text" placeholder="이메일" value="${user.userEmail}" id="userEmail" />
				                    </div>
		                		</div>	
								<input type="button" class="btn btn-lg btn-b btn-duck email-btn" value="이메일 인증" id="confBtn"> <br>
								<div class="input-group inputArea" style="display: none;" id="emailConf">
				                    <div class="col-md-12 col-sm-12 col-12 beforeConf">
										<input class="form-control join-input " type="text" name=""
											id="email-auth-code" placeholder="이메일 인증 코드" required />
										<input class="btn btn-outline-secondary" type="button"
													name="confCheckBtn" id="confCheckBtn" value="인증하기" />
				                    </div>
				                    <p id="confMailRes"></p>
		                		</div>	
	                		</div> <br>
							<input type="button" class="btn btn-sm btn-info btn-b" onclick="showUpdateModal()" value="수정하기" id="update"> &nbsp;&nbsp;
							<input type="button" class="btn btn-sm btn-danger btn-b" onclick="showDeleteModal()" value="탈퇴하기" id="delete"> &nbsp;&nbsp;
							<input type="button" class="btn btn-sm btn-b" onclick="history.back()" value="뒤로가기" id="back">
						</form>
					</div>
				</div>
				
			<div class="modal" id="myPageModal">
			  <div class="modal-dialog modalDesign">
			    <div class="modal-content" id="myPage-modal-content">
			      <div class="modal-header pt-3" id="myPage-modal-header">
			        <h4 class="modal-title mx-auto">비밀번호 인증</h4>
			      </div>
			      <div class="modal-body" id="myPage-modal-footer">
			      	<form action="" method="post" id="modal-submit">
				        <!-- <p>One fine body&hellip;</p> -->
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="currPw" class="form-control join-input" type="password" placeholder="현재 비밀번호" id="currPw" />
		                    </div>
	                	</div>					        
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="modiPw" class="form-control join-input modiPw" type="password" placeholder="변경 비밀번호" id="modiPw" />
		                    </div>
	                	</div>					        
						<div class="input-group inputArea">
		                    <div class="col-md-12 col-sm-12 col-12">
		                        <input name="checkPw" class="form-control join-input" type="password" placeholder="비밀번호 확인" id="checkPw" />
		                    </div>
	                	</div>					        
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
				
		<div class="tab-content">
		<c:choose>
			<c:when test="${toggle == 2}">					
				<div class="tab-pane active" id="myboard">
			</c:when>
			<c:otherwise>
				<div class="tab-pane" id="myboard">
			</c:otherwise>
		</c:choose>
					<div class="container">
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="contentDiv">

								<!-- 비동기 방식으로 서버와 통신을 진행한 후 
									목록을 만들어서 붙일 예정. -->
					
						</div>
						<div class="row justify-content-center row-div-2">
						  	<div class="col-1 w-auto mt-3">
						  		<button type="button" class="btn btn-primary rounded" id="the-btn">더보기</button>
						  	</div>
						</div>
					</div>
				</div>
		</div>
		
		<div class="tab-content">
		<c:choose>
			<c:when test="${toggle == 3}">					
				<div class="tab-pane active" id="myBasket">
			</c:when>
			<c:otherwise>
				<div class="tab-pane" id="myBasket">
			</c:otherwise>
		</c:choose>
					<div class="container">
				        <table class="table table-striped text-center " style="table-layout:fixed;">
				            <thead>
				            <tr>
				                <th scope="col"colspan="2">상품</th>
				                <th scope="col">가격</th>
				                <th scope="col">수량</th>
				                <th scope="col">소계</th>
				                <th scope="col">삭제</th>
				            </tr>
				            </thead>
				            <tbody>
				            <c:forEach var="b" items="${basket }" varStatus="status">
				            <tr>
				                <th scope="row" colspan="2" class="align-middle basket"> <a href="${pageContext.request.contextPath}/product/productDetail?productNo=${b.basketProductNo}"> ${b.basketProductName } </a></th>
				                <td class="align-middle basket">${b.basketPrice }</td>
				                <td class="align-middle basket">${b.basketQuantity }&nbsp;<a href="${pageContext.request.contextPath}/product/plusQuantity?basketNo=${b.basketNo}&q=${b.basketQuantity}"><i class="bi bi-plus-square"></i></a>
				                    <a href="${pageContext.request.contextPath}/product/minusQuantity?basketNo=${b.basketNo}&q=${b.basketQuantity}"><i class="bi bi-dash-square"></i></a></td>
				                <td class="align-middle basket" ><fmt:formatNumber value="${b.basketQuantity*b.basketPrice}" pattern="#,###" /> </td>
				                <td class="align-middle basket"><button type="button" class="btn btn-danger basketDel" >삭제</button></td>
				                <td style="display:none">${b.basketNo} </td> 
				            </tr>
				            </c:forEach>
				        </table>
				        <div>
				        	<div class="col-md-2 offset-md-10 text-end" style="line-height: 25px;">
				                	총액:&nbsp;<span id='totalPrice'><fmt:formatNumber value="${total }" pattern="#,###" /> </span>
				            </div>
				            <div class="col-md-2 offset-md-10 text-end">
				                <button type="button" class="btn btn-success" id="orderBtn">주문하기</button>
				            </div>
				        </div>
				    </div>
			</div>
		</div>
		
		<div class="tab-content">
		</div>
				
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
			
			if ($(this).data('head') == '1') {
				$('#userMyPage .title h2').text('마이페이지');
			} else if($(this).data('head') == '2') {
				$('#userMyPage .title h2').text('내 게시판');
			} else if($(this).data('head') == '3') {
				$('#userMyPage .title h2').text('장바구니');
			} else {
				$('#userMyPage .title h2').text('주문정보');
			}
			
		}); 
		
		// 대 카테고리 선택시 소 카테고리 바뀜.
		$('.category-wrap').on('change', 'select[name=categoryMajorTitle]', function(e) {
			const chosenMajor= $(this).val();
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
		$('.category-wrap').on('change', 'select[name=categoryMinorTitle]', function(e) {
		/* $('select[name=categoryMinorTitle]').change( function(e) { */
			const chosenMinor = $(this).val();
			const chosenMajor = $(this.previousElementSibling).val();
			console.log(chosenMinor);
			const chosenLiIndex = $(this.parentNode).data('index');
			
			const selectedMajors = $('select[name=categoryMajorTitle]');
			const selectedMajorsMaxIndex = selectedMajors.length;
			
			// 현재 선택된 모든 대 카테고리의 값을 반복문으로 조회.
			for (let i = 0; i < selectedMajorsMaxIndex; i++) {
				
				let selectedLiIndex = $(selectedMajors[i].parentNode).data('index');
				console.log(selectedLiIndex);
				
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
						alert('인증메일이 전송되었습니다.\n입력하신 메일주소에서 전송된 인증번호를 확인해주세요.');
					},
					error: function() {
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
		
		/*비밀번호 형식 검사 스크립트*/
		$('#userPw').keydown(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if(regex.test($(this).val() )) {
	            if($("#pwConfirm").val() === $(this).val() ) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
	                $("#pwConfirm").css('border', '2px solid rgb(34, 139, 34)');
	            } else {
	            	$(this).css('border', '2px solid red');
	            	$("#pwConfirm").css('border', '2px solid red');
	            }
            } else {
                $(this).css('border', '2px solid red');
            }            

		});
		
        /*비밀번호 확인검사*/
		$('#pwConfirm').keydown(function() {
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
        
        /* 이메일 확인검사 */
        $('#userEmail').keydown(function() {
        	$(this).css('color', 'black');
			const regex = /^[A-Za-z0-9+]+@[A-Za-z+]+.[A-Za-z+]{1,4}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
			
			if (regex.test($(this).val())) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
				
			} else {
                $(this).css('border', '2px solid red');
				 
			}
        	
        }); 
        
        // 카테고리 추가
       	const $lastLi = document.querySelector('#add-category').previousElementSibling.previousElementSibling.previousElementSibling.lastElementChild;
       	let indexLi = +($($lastLi).data('index'));
        $('#add-category').click(function() {
        	
        	console.log($lastLi);
     		indexLi = indexLi + 1;
        	console.log(indexLi);
        	
        	const $cloneLi = document.getElementById('category-wrap').firstElementChild.cloneNode(true);
        	$($cloneLi).attr('data-index', indexLi);
        	$($cloneLi).css('display', 'list-item');
        	
        	$('#category-wrap').append($cloneLi);
        	
        });
     	   
    	 // 카테고리 제거
        $('.category-wrap').on('click', '#del-category' ,function() {
        	console.log(this);
        	this.parentNode.remove();
        });
		
	}); // end jQuery
	
	// 즉시 실행 함수 
	(function() {
		const userCategoryList = ('${userCategoryList}').split('), ');
		const userCategoryIndex = +('${userMinorLength}') + 1;
		
		// 서버에서 favorite의 대 카테고리만 모아서 보냄.
		const userMajorCategories = ('${userMajorCategories}').substring(1, ('${userMajorCategories}').length - 1).split(', ');
		console.log(userMajorCategories);
		
		let i = 0;
		for (let userCategoryText1 of userCategoryList) {
			let userCategoryMajorAndMinor1 = userCategoryText1.substring(userCategoryText1.indexOf('jor') + 9, userCategoryText1.indexOf(', categoryRegDate')).split(', categoryMinorTitle=');
			
			const serverMajorCategory = userCategoryMajorAndMinor1[0];
			const serverMinorCategory = userCategoryMajorAndMinor1[1];
			
			const selectorLi = 'li[data-index=' + i + '] > select';
			
			// ======= 대 카테고리 favorite에 선택된 option태그 selected 처리 코드=========
			const serverMajorSelectNode =$(selectorLi)[0];
			serverMajorSelectNode.selectedIndex = userMajorCategories.indexOf(serverMajorCategory) + 1;
			
			// ======= 소 카테고리 option태그들 append 코드 =========
			
			const $serverMinorSelectNode = $(selectorLi)[0].nextElementSibling;
			/* $($serverMinorSelectNode).html(''); */
			
			const $optDefault = document.createElement('option');
			$($optDefault).attr('selected', 'true');			
			$($optDefault).attr('disabled', 'true');			
			$($optDefault).text('소 카테고리');			
			
			const $fragOpts = document.createDocumentFragment();
			$fragOpts.appendChild($optDefault);
			
			let arr = [];
			
			for (let userCategoryText2 of userCategoryList) {
				const userCategoryMajorAndMinor2 = userCategoryText2.substring(userCategoryText2.indexOf('jor') + 9, userCategoryText2.indexOf(', categoryRegDate')).split(', categoryMinorTitle=');
				
				if (userCategoryMajorAndMinor2[0] === serverMajorCategory) {
			        const $option = document.createElement('option');					
		            $option.textContent = userCategoryMajorAndMinor2[1];
		            $fragOpts.appendChild($option);
		            
		            arr.push(userCategoryMajorAndMinor2[1]);
				}
			}
	        $serverMinorSelectNode.appendChild($fragOpts);
	        
	        $serverMinorSelectNode.selectedIndex = arr.indexOf(serverMinorCategory) + 1;
	        
	        i = i + 1;
		}

	}());
	
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
		$('.modiPw').css('display', 'inline-block');
		$('.modiPw').attr('disabled', false);
		
		$('#myPageModal').show();
	}
	
	// 수정 모달 열기
	function showUpdateModal() {
		$('.modal-submit-btn').text('내용 수정하기');
		$('.modiPw').css('display', 'none');
		$('.modiPw').attr('disabled', true);
		$('.modal-submit-btn').attr('onclick', 'UpdateModal()');

		$('#myPageModal').show();
	}
	
	// 탈퇴 모달 열기
	function showDeleteModal() {
		$('.modal-submit-btn').text('탈퇴하기');
		$('.modiPw').css('display', 'none');
		$('.modiPw').attr('disabled', true);
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
		$('#currPw').val('');
		$('#modiPw').val('');
		$('#checkPw').val('');
		
		$('#myPageModal').hide();
	}
	//장바구니 삭제
	$('.basketDel').on('click',function(e){
		console.log('장바구니삭제 클릭')
		const bno = $(e.target.parentNode.nextElementSibling).html();
		console.log(bno);
		if(confirm('삭제하시겠습니까?')){
			location.href="<c:url value='/product/basketDel?basketNo="+bno+"'/>"
		}else{
			return;
		}
		
	});
	
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
	
	// 이벤트를 바인딩해서 input에 파일이 올라올때 (input에 change를 트리거할때) 위의 함수를 this context로 실행합니다.
	$("#user-profile-pic").change(function(){
	   readURL(this);
	});	
	
	
	$(function() {
		
		//등록하기 버튼 클릭 이벤트
		$('#the-btn').click(function() {
			if(!isFinish) {
				page++;
				getList(page, false);
			} else {
				console.log('더이상 불러올 목록이 없다.');
			}
		});
		
		let str = '';
		let page = 1;
		let isFinish = false;
		
		getList(1, false);
		
		function getList(page, reset) {
			
			console.log('getList 함수 호출');
			console.log('page: ' + page);
			console.log('reset: ' + reset);
			
			if(reset === true) {
				str = ''; //화면 리셋 여부가 true라면 str변수를 초기화.
			}
			
			$.getJSON(
				'<c:url value="/board/boardLists?pageNum='+ page +'" />',
				function(list) {
					console.log(list.length);
					console.log(list);
					
					if(list.length === 0) isFinish = true;
					
					for(let i=0; i<list.length; i++) {
						
						str += 
						`<div class="col">
					    <div class="card shadow-sm">
					      <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">` + list[i].boardTitle + `</text></svg>
					      <div class="card-body">
					        <p class="card-text">` + list[i].boardContent + `</p>
					        <div class="d-flex justify-content-between align-items-center">
					          <small class="text-muted">9 mins</small>
					        </div>
					      </div>
					    </div>
				  		</div>`;		
					}
					
					$('#contentDiv').html(str);
				}
				
					
			); //end getJSON()
			
		}; //end getList()
		
		$('#orderBtn').click(function() {
			location.href ="<c:url value = '/product/order' />";
		});
		
	});
	
	
</script>
</html>

