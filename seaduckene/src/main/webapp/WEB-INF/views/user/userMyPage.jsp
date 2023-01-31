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
						  <li class="breadcrumb-item active myBoard" data-head="2"><a data-toggle="tab" href="#myboard">내 글</a></li>
						</c:when>
						<c:otherwise>
						  <li class="breadcrumb-item myBoard" data-head="2"><a data-toggle="tab" href="#myboard">내 글</a></li>
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
					  
					  <li class="breadcrumb-item" data-head="4"><a data-toggle="tab" href="#myOrder">주문정보</a></li>
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
						<c:if test="${user.userProfilePath == '프로필 경로'}">
							<img alt="프로필 사진" src="<c:url value='/resources/img/profile.png' />" id="image_section">
						</c:if>
						<c:if test="${user.userProfilePath != '프로필 경로'}">
							<img alt="프로필 사진" src="<c:url value='/user/getProfile' />" id="image_section">
						</c:if>
							<div class="clearfix">
								<div class="file-upload">
									<span>+</span>
									<input name="profilePic" type="file" class="upload" id="user-profile-pic" accept="image/*" > <br>
								</div>
							</div>
							<span>기본 정보</span> <br> <br>
							<p>아이디</p>
							<div class="input-group inputArea">
			                    <div class="col-md-12 col-sm-12 col-12">
			                    	<input name="userNo" value="${user.userNo}" type="hidden">
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
				            		<input name="userTel" class="form-control join-input" type="text" placeholder="전화번호" value="${user.userTel}" id="userTel" maxlength="11" required/>
			                    </div>
		               		</div> <br>
		               		<span class="basic-info">카테고리 정보</span> 
							<ul class="category-wrap">
							<c:forEach var="userCategory" items="${userCategoryList}" varStatus="status">
								<li class="li-category" data-index='${status.index}'>
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
							</ul>
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
							</ul>
							<input name="categoryIndex" type="hidden" id="category-index">
							
							<div class="optional-info"">
								<span class="basic-info">추가 정보</span> <br>
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input class="form-control join-input" type="text" placeholder="기본 주소" value="${userAddrList[0].addressBasic}" readonly />
				                    </div>
		                		</div>	
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input class="form-control join-input" type="text" placeholder="상세 주소" value="${userAddrList[0].addressDetail}" readonly />
				                    </div>
		                		</div>	
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
				                        <input class="form-control join-input" type="text" placeholder="우편번호" value="${userAddrList[0].addressZipNum}" readonly />
				                    </div>
		                		</div>	<br>
		                		<button type="button" onclick="showAddressModal()" class="btn btn-outline-success">주소록 확인</button>
								<div class="input-group inputArea">
				                    <div class="col-md-12 col-sm-12 col-12">
							            <c:if test="${user.userEmail == null}">
							            	<br>
							            	<span style="color: red;">*이메일을 등록하지 않으면 아이디나 비밀번호를 분실 시 찾을 수 없습니다.</span>
							            	<br>
							            </c:if>
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
							
							   <!-- 주소록 모달  -->
							   <div class="modal" id="addrListModal" data-bs-backdrop="static">
							      <div class="modal-dialog modalDesign">
							         <div class="modal-content myPage-modal-content">
							            <div class="modal-header pt-3 myPage-modal-header">
							               <h4 class="modal-title mx-auto">주소록</h4> 
							            </div>
							            <div class="modal-body myPage-modal-body" id="address-outter"> 
							            <c:if test="${userAddrList.size() == 0}">
							            	<h4>등록하신 주소가 없습니다.</h4>
							            </c:if>
							            <c:if test="${userAddrList.size() != 0}">
						                      <c:forEach var="addr" items="${userAddrList}" varStatus="status">
						                        <div class="address-infos div-address" data-index="${status.count}">
						                        	<hr>
						                        	<c:if test="${status.index == 0}">
							                        	<h5>메인 주소</h5>
						                        	</c:if>
						                        	<c:if test="${status.index != 0}">
							                        	<a class="set-main">메인주소로 설정</a>
						                        	</c:if>
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input name="addressBasic" class="form-control join-input addrBasic" type="text" placeholder="기본 주소" value="${addr.addressBasic}" readonly />
									                    </div>
							                		</div>
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input name="addressDetail" class="form-control join-input addrDetail" type="text" placeholder="상세 주소" value="${addr.addressDetail}" />
									                    </div>
							                		</div>
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input name="addressZipNum" class="form-control join-input addrZipNum" type="text" placeholder="우편번호" value="${addr.addressZipNum}" readonly />
									                    </div>
							                		</div>	<br>
													<input type="button" class="btn btn-sm btn-b btn-duck find-address" value="주소찾기">
													<c:if test="${status.index != 0}">
														<input type="button" class="btn btn-sm btn-b btn-danger address-del" value="삭제">
													</c:if>
													 <br>
						                        </div>
						                        <br>
						                     </c:forEach> 
							            </c:if>
							            </div>
							            <hr class="btn-hr">
							            <div class="modal-footer myPage-modal-footer">
							               <button type="button" class="btn btn-success address-add" >주소 추가</button>
							               <!-- 노드 복사용 더미 주소 div태그 -->
						                        <div style="display: none;">
						                        	<hr>
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input class="form-control join-input addrBasic" type="text" placeholder="기본 주소" value="dummy" readonly />
									                    </div>
							                		</div>	
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input class="form-control join-input addrDetail" type="text" placeholder="상세 주소" value="dummy"/>
									                    </div>
							                		</div>	
													<div class="input-group inputArea">
									                    <div class="col-md-12 col-sm-12 col-12">
									                        <input class="form-control join-input addrZipNum" type="text" placeholder="우편번호" value="dummy" readonly />
									                    </div>
							                		</div>	<br>
													<input type="button" class="btn btn-sm btn-b btn-duck find-address" value="주소찾기">
													<input type="button" class="btn btn-sm btn-b btn-danger address-del" value="삭제"> <br>
						                        </div>					               
							               <button type="button" class="btn btn-primary" >확인</button>
							               <button type="button" class="btn btn-light modal-cancel" onclick="hideAddrModal()" data-bs-dismiss="modal">닫기</button>
							            </div>
							            <input name="addressCount" type="hidden" id="address-count">
							         </div>
							      </div>
						      	<div id="modalMask"></div>
							   </div>
							</form>
					</div>
				</div>
			</div>
				
				<!-- 비밀번호 인증 모달 -->
			<div class="modal" id="myPageModal">
			  <div class="modal-dialog modalDesign">
			    <div class="modal-content myPage-modal-content">
			      <div class="modal-header pt-3 myPage-modal-header">
			        <h4 class="modal-title mx-auto">비밀번호 인증</h4>
			      </div>
			      <div class="modal-body myPage-modal-body">
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
			      	</form>
			      </div>
			      <div class="modal-footer myPage-modal-footer">
			        <button type="button" class="btn btn-primary modal-submit-btn">내용 수정하기</button>
			        <button type="button" class="btn btn-light modal-cancel" onclick="hidePwModal()" data-dismiss="modal">돌아가기</button>
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
			<table class="table table-striped text-center " style="table-layout:fixed;">
						
						<thead>
				            <tr>
				                <th scope="col"colspan="2">제목</th>
				                <th scope="col">작성일</th>
				                <th scope="col">조회수</th>
				            </tr>
				            </thead>
							<tbody id="contentDiv">
							
							</tbody>
							 </table>
							<div class="row justify-content-center row-div-2">
							  	<div class="col-1 w-auto mt-3">
							  		<button type="button" class="btn btn-primary btn-sm rounded" id="the-btn">더보기</button>
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
				                <th scope="row" colspan="2" class="align-middle basket"> <a class="basketA" href="${pageContext.request.contextPath}/product/productDetail?productNo=${b.basketProductNo}"> ${b.basketProductName } </a></th>
				                <td class="align-middle basket">&#8361;<fmt:formatNumber value="${b.basketPrice }" pattern="#,###" /></td>
				                <td class="align-middle basket">${b.basketQuantity }&nbsp;
				                <a class="basketA" href="${pageContext.request.contextPath}/product/plusQuantity?basketNo=${b.basketNo}&q=${b.basketQuantity}&pNo=${b.basketProductNo}"><i class="bi bi-plus-square"></i></a>
				                <a class="basketA" href="${pageContext.request.contextPath}/product/minusQuantity?basketNo=${b.basketNo}&q=${b.basketQuantity}"><i class="bi bi-dash-square" id="minusQuantity"></i></a></td>
				                <td class="align-middle basket" >&#8361;<fmt:formatNumber value="${b.basketQuantity*b.basketPrice}" pattern="#,###" /> </td>
				                <td class="align-middle basket"><button type="button" class="btn btn-danger basketDel" >삭제</button></td>
				                <td style="display:none">${b.basketNo} </td> 
				            </tr>
				            </c:forEach>
				            </tbody>
				        </table>
				        <div>
				        	<div class="col-md-2 offset-md-10 text-end" style="line-height: 25px;">
				                	총액:&nbsp;&#8361;<span id='totalPrice'><fmt:formatNumber value="${total }" pattern="#,###" /> </span>
				            </div>
				            <div class="col-md-2 offset-md-10 text-end">
				                <button type="button" class="btn btn-success" id="orderBtn">주문하기</button>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		
			<div class="tab-content">
			<c:choose>
			<c:when test="${toggle == 4}">					
				<div class="tab-pane active" id="myOrder">
			</c:when>
			<c:otherwise>
				<div class="tab-pane " id="myOrder">
			</c:otherwise>
		</c:choose>
				<div class="container">
				        <table class="table table-striped text-center " style="table-layout:fixed;">
				            <thead>
				            <tr>
				                <th scope="col"colspan="2">상품사진</th>
				                <th scope="col">상품</th>
				                <th scope="col">수량</th>
				                <th scope="col">결제가격</th>
				                <th scope="col">주문상태</th>
				                <th scope="col">비고 </th>
				            </tr>
				            </thead>
				            <tbody>
				            <c:forEach var="o" items="${order }" varStatus="status">
				            <tr>
				                <th scope="row" colspan="2" class="align-middle basket"><img id="productThumb" src="<c:url value='/product/display2?no=${o.orderProductNo }' />" alt="상품이미지" style="height:225px; width:225px;"> </th>
				                <td class="align-middle basket"><a class="basketA" href="${pageContext.request.contextPath}/product/productDetail?productNo=${o.orderProductNo}"> ${name[status.index] } </a></td>
				                <td class="align-middle basket">${o.orderQuantity }&nbsp;
				                    </td>
				                <td class="align-middle basket" >&#8361;<fmt:formatNumber value="${o.orderPrice}" pattern="#,###" /> </td>
				                <td class="align-middle basket">${o.orderStatus }</td>
				                <c:choose>
				                	<c:when test="${o.orderStatus =='취소요청' }">
				                		<td class="align-middle basket"> 취소요청완료 </td>
				                	</c:when>
				                	<c:when test="${o.orderStatus =='취소완료'  }">
				                		<td class="align-middle basket"> </td>
				                	</c:when>
				                	<c:when test="${o.orderStatus =='반품요청' }">
				                		<td class="align-middle basket"> 반품요청완료 </td>
				                	</c:when>
				                	<c:when test="${o.orderStatus =='반품완료' }">
				                		<td class="align-middle basket">  </td>
				                	</c:when>
				                	<c:otherwise>
				                		<td class="align-middle basket"> <button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/product/refund?no=${o.orderProductNo }'" >주문취소<br> 반품신청</button> </td>
				                	</c:otherwise>
				                </c:choose>
				                <td style="display:none">${o.orderNo} </td> 
				            </tr>
				            </c:forEach>
				            </tbody>
				        </table>
				        <div>
				        	
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

let nicknameCheck = true;
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
			} else if($(this).data('head') == '4') {
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
		
		//let nicknameCheck = false; 맨위 jQuery 밖에 선언
		// 닉네임 중복 확인.
		$('#nickname-check').click(function() {
			const userNickname = $('#userNickname').val();
			console.log();
			
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
						$('#userNickname').focus();
						
						if ('${user.userNickname}' === userNickname) {
							nicknameCheck = true;
							$('#userNickname').css('border', '1px solid rgb(206, 212, 218)');
							alert('본인이 사용 중인 닉네임은 중복확인할 수 없습니다.');
						} else {
							nicknameCheck = false;
							$('#userNickname').css('border', '2px solid red');
							alert('이 닉네임은 이미 사용 중입니다.');
						}
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
		
		$('#currPw').hover(function() {
			$(this).attr('placeholder', '영문 대/소문자, 숫자 8 ~ 16 자리');
		}, function() {
			$(this).attr('placeholder', '현재 비밀번호');
		});
		
		$('#modiPw').hover(function() {
			$(this).attr('placeholder', '영문 대/소문자, 숫자 8 ~ 16 자리');
		}, function() {
			$(this).attr('placeholder', '변경 비밀번호');			
		});
		
		$('#checkPw').hover(function() {
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
		
		/* 비밀번호 모달 */
		/*현재 비밀번호 형식 검사 스크립트*/
		$('#currPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if (!$('#myPageModal').hasClass('modiPw')) {
	            if(regex.test($(this).val() )) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
	                
		            if($("#checkPw").val() === $(this).val() ) {
		                $("#checkPw").css('border', '2px solid rgb(34, 139, 34)');
		            } else {
		            	$("#checkPw").css('border', '2px solid red');
		            }
	            } else {
	                $(this).css('border', '2px solid red');
	            }
            }

		});
		
        /*변경 비밀번호 형식 검사 스크립트*/
		$('#modiPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if(regex.test($(this).val() )) {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
                
	            if($("#checkPw").val() === $(this).val() ) {
	                $("#checkPw").css('border', '2px solid rgb(34, 139, 34)');
	            } else {
	            	$("#checkPw").css('border', '2px solid red');
	            }
            } else {
                $(this).css('border', '2px solid red');
            }                  	
		});
        
        /*확인 비밀번호 형식 검사 스크립트*/
		$('#checkPw').keyup(function() {
            const regex = /^[A-Za-z0-9+]{8,16}$/; /* 영문 대/소문자, 숫자 8 ~ 16 */
            
            if ($('#myPageModal').hasClass('modiPw')) {
                if(regex.test($(this).val() )) {
    	            if($(this).val() === $("#modiPw").val()) {
    	                $(this).css('border', '2px solid rgb(34, 139, 34)');
    	                $("#modiPw").css('border', '2px solid rgb(34, 139, 34)');        
    	
    	            } else {
    	                $(this).css('border', '2px solid red');
    	                $("#modiPw").css('border', '2px solid red');
    	            }

                } else {
                    $(this).css('border', '2px solid red');
                }   
			} else {

                if(regex.test($(this).val() )) {
    	            if($(this).val() === $("#currPw").val()) {
    	                $(this).css('border', '2px solid rgb(34, 139, 34)');
    	                $("#currPw").css('border', '2px solid rgb(34, 139, 34)');        
    	
    	            } else {
    	                $(this).css('border', '2px solid red');
    	                $("#currPw").css('border', '2px solid red');
    	            }      

                } else {
                    $(this).css('border', '2px solid red');
                }   
			}
		});
        
        /* 이름 확인검사 */
        $('#userName').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[가-힣a-zA-Z]+$/;

			if ($(this).val() === '${user.userName}') {
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
				if (regex.test($(this).val())) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
					
				} else {
	                $(this).css('border', '2px solid red');
				}	
			}
        });
        
        /* 닉네임 확인검사 */
        $('#userNickname').keyup(function() {
        	$(this).css('color', 'black');
			const regex = /^[\w가-힣\_\!\?]{1,10}$/; /* 한/영문/ 숫자 포함 10 글자 이내, 특수문자( _, !, ?) */
			
			if ($(this).val() === '${user.userNickname}') {
				nicknameCheck = true;
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
				nicknameCheck = false;
				if (regex.test($(this).val())) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
				} else {
	                $(this).css('border', '2px solid red');
				}					
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
			const regex = /^(010)[0-9]{8}$/; /* 010포함 숫자 11자리 */

			
			if ($(this).val() === '${user.userTel}') {
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
				if (regex.test($(this).val())) {
	                $(this).css('border', '2px solid rgb(34, 139, 34)');
					
				} else {
	                $(this).css('border', '2px solid red');
				}					
			}
        });
               
        
        /* 이메일 확인검사 */
        $('#userEmail').keyup(function() {
        	$(this).css('color', 'black');
        	const regex = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
			
			if ($(this).val() === '${user.userEmail}' || $(this).val() === '') {
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
			if ($(this).val() === '${userAddrList[0].addressDetail}' || $(this).val() === '') {
				$(this).css('border', '1px solid rgb(206, 212, 218)');
			} else {
                $(this).css('border', '2px solid rgb(34, 139, 34)');
			}
        });
        
        // 카테고리 추가
       	const $lastLi = document.querySelector('#add-category').previousElementSibling.previousElementSibling.lastElementChild;
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
        $('.category-wrap').on('click', '#del-category' ,function(e) {
        	console.log(this);
        	console.log($(this).css('opacity'));
        	if($(this).css('opacity') == 0) {
        		
				$(this).hover(function() {
					$(this).css('cursor', 'default');
	        		e.preventDefault();
				});
        	}
        	this.parentNode.remove();
        });
    	 
    	// 주소추가 버튼 클릭 이벤트 타겟 전달하기.
    	$('#addrListModal').on('click', '.find-address', function(e) {
    		console.log(e);
    	
    		searchAddress(e);
    		//  커서를 상세주소 필드로 이동한다. - 주소 중복 제거 change 이벤트 때문에 포커스 다시 입힘.
    		e.target.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.focus();
   		});
    	
    	// 주소록 모달 내 주소 추가
    	let newAddrIndex = +('${userAddrList.size()}') + 1;
    	$('.address-add').click(function(e) {
	
    		console.log(newAddrIndex);
    		
	   		const $fragNode = document.createDocumentFragment();
	   		const $addrDiv = this.nextElementSibling.cloneNode(true);
	   		console.log($addrDiv);
	   		const $br = document.createElement('br');
	   		
	   		$($addrDiv).css('display', 'block');
	   		$($addrDiv).addClass('address-infos');
	   		$($addrDiv).data('index', newAddrIndex);
	   		
	   		$($addrDiv.querySelector('input.addrBasic')).attr('name', 'addressBasic');
	   		$($addrDiv.querySelector('input.addrBasic')).val('');
	   		$($addrDiv.querySelector('input.addrDetail')).attr('name', 'addressDetail');
	   		$($addrDiv.querySelector('input.addrDetail')).val('');
	   		$($addrDiv.querySelector('input.addrZipNum')).attr('name', 'addressZipNum');
	   		$($addrDiv.querySelector('input.addrZipNum')).val('');
	   		
			$fragNode.appendChild($addrDiv);
			$fragNode.appendChild($br);
			
	   		$('#address-outter').append($fragNode);
	   		newAddrIndex = newAddrIndex + 1;
   		});
    	
    	// 주소록 모달 내 주소 삭제
    	$('#address-outter').on('click', '.address-del' , function(e) {
			this.parentNode.nextElementSibling.remove();
			this.parentNode.remove();
		});
    	
    	// 주소록 모달 메인 주소로 설정
    	$('#addrListModal').on('click', '.set-main', function(e) {
   
    		const addressCount = $(this.parentNode).data('index');
    		console.log(addressCount);
    		
    		if (confirm('선택한 주소 정보를 메인 주소로 설정하시겠습니까?\n설정 시 기본 변경 사항들은 초기화 됩니다.')) {
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/changeMainAddress" />',
					contentType: 'application/json',
					dataType:'text',
					data: JSON.stringify(addressCount),
					success: function(data) {
						
						if (data === 'changed') {
							alert('메인 주소가 변경되었습니다.');
							location.reload(true);
						}
					},
					error: function() {
						alert('메인 주소 설정 전송 실패');
					}
				}); 
			}
    	});
    	
    	// 주소록 모달에서 addressDetail keyup 시 중복 체크 이벤트 추가
    	$('#address-outter').on('keyup', 'input.addrDetail', function(e) {
    		
    		console.log($('.address-infos'));
 			 for (let $addressInfo of $('.address-infos')) {
	    		if ($(this.parentNode.parentNode.parentNode).data('index') == $($addressInfo).data('index')) {
					continue;	
				}
	    		console.log($($addressInfo.querySelector('input.addrBasic')).val());
	    		console.log(this.parentNode.parentNode.previousElementSibling.firstElementChild.firstElementChild.value);
				if ($($addressInfo.querySelector('input.addrBasic')).val() === this.parentNode.parentNode.previousElementSibling.firstElementChild.firstElementChild.value
						&& $($addressInfo.querySelector('input.addrZipNum')).val() === this.parentNode.parentNode.nextElementSibling.firstElementChild.firstElementChild.value
						&& $($addressInfo.querySelector('input.addrDetail')).val().trim() === this.value.trim()) {

					alert('이미 입력된 주소입니다.');
					this.value = '';
					return;						
				}
			}  	
 			 
   		});

    	// 주소록 모달에서 addressBasic change 시 중복 체크 이벤트 추가
    	$('#address-outter').on('blur', 'input.addrBasic', function(e) {
    		
 			 for (let $addressInfo of $('.address-infos')) {
	    		if ($(this.parentNode.parentNode.parentNode).data('index') == $($addressInfo).data('index')) {
					continue;	
				}
				if ($($addressInfo.querySelector('input.addrDetail')).val() === this.parentNode.parentNode.nextElementSibling.firstElementChild.firstElementChild.value
						&& $($addressInfo.querySelector('input.addrZipNum')).val() === this.parentNode.parentNode.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.value
						&& $($addressInfo.querySelector('input.addrBasic')).val().trim() === this.value.trim()) {

					alert('이미 입력된 주소입니다.');
					this.value = '';
					this.parentNode.parentNode.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild.value ='';
					return;						
				}
			}  	
 			 
   		});
    	
	}); // end jQuery
	
	// 즉시 실행 함수 
	(function() {
		const userCategoryList = ('${userCategoryList}').split('), ');
		
		let i = 0;
		for (let userCategoryText1 of userCategoryList) {
			let userCategoryMajorAndMinor1 = userCategoryText1.substring(userCategoryText1.indexOf('jor') + 9, userCategoryText1.indexOf(', categoryRegDate')).split(', categoryMinorTitle=');
			
			// 서버에서 대 카테고리 전체를 받아서 선택된 대 카테고리 값과 매칭한다.
			const majorss = ('${categoryList}').split('), ');
			/* console.log(majorss); */
			
			let arrMajor = [];
			
			for (let majors of majorss) {
				arrMajor.push(majors.substring(majors.indexOf('e=') + 2, majors.indexOf(', c')));
			}
			
			const serverMajorCategory = userCategoryMajorAndMinor1[0];
			const serverMinorCategory = userCategoryMajorAndMinor1[1];
			
			const selectorLi = 'li[data-index=' + i + '] > select';
			
			// ======= 대 카테고리 favorite에 선택된 option태그 selected 처리 코드=========
			const $serverMajorSelectNode = $(selectorLi)[0];
			$serverMajorSelectNode.selectedIndex = arrMajor.indexOf(serverMajorCategory) + 1;
			
			// ======= 소 카테고리 option태그들 append 코드 =========
			
			const $serverMinorSelectNode = $(selectorLi)[1];
			/* $($serverMinorSelectNode).html(''); */
			
			const $optDefault = document.createElement('option');
			$($optDefault).attr('selected', 'true');			
			$($optDefault).attr('disabled', 'true');			
			$($optDefault).text('소 카테고리');			
			
			const $fragOpts = document.createDocumentFragment();
			
			$fragOpts.appendChild($optDefault);
			
			let arrMinor1 = [];
			
	       	for (let minorss of majorss) {
       			let minors =  minorss.substring(minorss.indexOf('=[') + 2, minorss.indexOf(']')).split(', ');
       			let majors =  minorss.substring(minorss.indexOf('e=') + 2, minorss.indexOf(','));
				
       			// 현재 li의 선택된 대 카테고리 === 서버에서 favorite의 대 카테고리
	       		if (serverMajorCategory === majors) {
	       			
	       			for (let minorOfMajor of minors) {
				        const $option = document.createElement('option');					
			            $option.textContent = minorOfMajor;
			            $fragOpts.appendChild($option);	
			            
			            arrMinor1.push(minorOfMajor);
					}
	       			
	       			$serverMinorSelectNode.appendChild($fragOpts);
	       			$serverMinorSelectNode.selectedIndex = arrMinor1.indexOf(serverMinorCategory) + 1;
	       			
	       		}
			}

	        
	        i = i + 1;
		}

	}());
	
	// 다음 주소 api 사용해보기

	function searchAddress(e) {
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
				
                console.log(e.target);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                e.target.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.value = addr;
                e.target.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.value = data.zonecode;
                
                // 커서를 기본주소 필드로 이동한다. - 주소 중복 제거 change 이벤트 때문에 포커스 기본 주소로 입힘.
                e.target.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.focus();
                 
				}
                
        }).open();
	}
	
	
	// 비밀번호 변경 모달 열기
	function showModiPwModal() {
		$('.modal-submit-btn').text('비밀번호 변경하기');
		$('.modiPw').css('display', 'inline-block');
		$('.modiPw').attr('disabled', false);
		$('.modal-submit-btn').attr('onclick', 'ModiPwModal()');
		$("#currPw").attr('onkeyup', 'keyPressEnterModiPw()');
		$("#modiPw").attr('onkeyup', 'keyPressEnterModiPw()');
		$("#checkPw").attr('onkeyup', 'keyPressEnterModiPw()');
		$("#currPw").css('border', 'none');
		$("#modiPw").css('border', 'none');
		$("#checkPw").css('border', 'none');
		
		$('#myPageModal').toggleClass('modiPw', true);
		$('#myPageModal').toggleClass('updateUser', false);
		$('#myPageModal').toggleClass('deleteUser', false);
		$('#myPageModal').show();
	}
	
	// 수정 모달 열기
	function showUpdateModal() {
		$('.modal-submit-btn').text('내용 수정하기');
		$('.modiPw').css('display', 'none');
		$('.modiPw').attr('disabled', true);
		$('.modal-submit-btn').attr('onclick', 'UpdateModal()');
		$("#currPw").attr('onkeyup', 'keyPressEnterUpdate()');
		$("#modiPw").attr('onkeyup', 'keyPressEnterUpdate()');
		$("#checkPw").attr('onkeyup', 'keyPressEnterUpdate()');
		$("#currPw").css('border', 'none');
		$("#modiPw").css('border', 'none');
		$("#checkPw").css('border', 'none');
		$('#user-update-form').attr('action', '${pageContext.request.contextPath}/user/userUpdate');
		
		$('#myPageModal').toggleClass('modiPw', false);
		$('#myPageModal').toggleClass('updateUser', true);
		$('#myPageModal').toggleClass('deleteUser', false);
		$('#myPageModal').show();
	}
	
	// 탈퇴 모달 열기
	function showDeleteModal() {
		$('.modal-submit-btn').text('탈퇴하기');
		$('.modiPw').css('display', 'none');
		$('.modiPw').attr('disabled', true);
		$('.modal-submit-btn').attr('onclick', 'DeleteModal()');
		$("#currPw").attr('onkeyup', 'keyPressEnterDelete()');
		$("#modiPw").attr('onkeyup', 'keyPressEnterDelete()');
		$("#checkPw").attr('onkeyup', 'keyPressEnterDelete()');
		$("#currPw").css('border', 'none');
		$("#modiPw").css('border', 'none');
		$("#checkPw").css('border', 'none');
		$('#user-update-form').attr('action', '${pageContext.request.contextPath}/user/userDelete');
		
		$('#myPageModal').toggleClass('modiPw', false);
		$('#myPageModal').toggleClass('updateUser', false);
		$('#myPageModal').toggleClass('deleteUser', true);
		$('#myPageModal').show();
		// 탈퇴 시 자동로그인 쿠키, 세션 지우기.
	}
	
	// 비밀번호 종류 모달 닫기
	function hidePwModal() {
		$('#currPw').val('');
		$('#modiPw').val('');
		$('#checkPw').val('');
		
		$('#myPageModal').hide();
	}
	
    // 비밀번호 종류 엔터 이벤트 시 submit 실행 코드.
    function keyPressEnterModiPw() {
    	if (window.event.keyCode == 13) {
    		ModiPwModal();				
		}
    }
    function keyPressEnterUpdate() {
    	if (window.event.keyCode == 13) {
    		UpdateModal();				
		}
    }
    function keyPressEnterDelete() {
    	if (window.event.keyCode == 13) {
    		DeleteModal();				
		}
    }
    
	
	// 주소록 모달 열기
	function showAddressModal() {
		$('#addrListModal').show();
	}
	
	// 주소록 모달 닫기
	function hideAddrModal() {
	
		for (let $addrBasic of $('.addrBasic')) {
			if ($addrBasic.value.trim() === '') {
				alert('주소 입력창이 비어있는 상태로 주소록 창을 닫을 수 없습니다.');
				return;
			}
		}
		for (let $addrDetail of $('.addrDetail')) {
			if ($addrDetail.value.trim() === '') {
				alert('주소 입력창이 비어있는 상태로 주소록 창을 닫을 수 없습니다.');
				return;
			}
		}
		for (let $addrZipNum of $('.addrZipNum')) {
			if ($addrZipNum.value.trim() === '') {
				alert('주소 입력창이 비어있는 상태로 주소록 창을 닫을 수 없습니다.');
				return;
			}
		}
		
		$('#addrListModal').hide();
	}
	
	
	// 비밀번호 변경 비동기 코드
	function ModiPwModal() {
		const currPw = $('#currPw').val().trim();
		const modiPw = $('#modiPw').val().trim();
		const checkPw = $('#checkPw').val().trim();
		const array = [currPw,modiPw,checkPw];
		
		if (currPw == '') {
			alert('현재 비밀번호를 입력하세요.');
			$('#currPw').focus();
			return;
		} else if($('#modiPw').css('border-block-color') !== 'rgb(34, 139, 34)') {
			alert('비밀번호를 다시 확인하세요.');
			$('#modiPw').focus();
			return;
		} else if($('#checkPw').css('border-block-color') !== 'rgb(34, 139, 34)') {
			alert('비밀번호를 다시 확인하세요.');
			$('#checkPw').focus();
			return;
		}
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/pwModify',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result === 'wrongPw') {
					alert('현재 비밀번호 입력이 잘못되었습니다.\n 다시 입력해주세요.');
					$('#currPw').focus();
				} else if(result ==='PwChanged') {
					alert('비밀번호가 성공적으로 변경되었습니다.');
					location.href='${pageContext.request.contextPath}/user/userMyPage/1';
				}
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
	}
	
	// 유저 정보 변경 비동기 코드
	function UpdateModal() {
		const currPw = $('#currPw').val().trim();
		const checkPw = $('#checkPw').val().trim();
		const array = [currPw,checkPw];
		
		if($('#currPw').css('border-block-color') !== 'rgb(34, 139, 34)') {
			alert('비밀번호를 다시 확인하세요.');
			$('#currPw').focus();
			return;
		} else if($('#checkPw').css('border-block-color') !== 'rgb(34, 139, 34)') {
			alert('비밀번호를 다시 확인하세요.');
			$('#checkPw').focus();
			return;
		} else if($('#userName').css('border-block-color') === 'rgb(255, 0, 0)') {
			hidePwModal();
			$('#userName').focus();
			alert('이름을 다시 확인하세요.');
			return;
		} else if(!nicknameCheck) {
			hidePwModal();
			$('#userNickname').focus();
			alert('닉네임 중복확인이 필요합니다.');
			return;
		} else if($('#userNickname').css('border-block-color')  === 'rgb(255, 0, 0)' ) {
			hidePwModal();
			$('#userNickname').focus();
			alert('닉네임을 다시 확인하세요.');
			return;
		} else if($('#userTel').css('border-block-color') === 'rgb(255, 0, 0)') {
			hidePwModal();
			$('#userTel').focus();
			alert('전화번호를 다시 확인하세요.');
			return;
		} else if($('#userEmail').css('border-block-color') === 'rgb(255, 0, 0)') {
			hidePwModal();
			$('#userEmail').focus();
			alert('이메일을 다시 확인하세요.');
			return;
		} else if ($('#userEmail').css('border-block-color') !== 'rgb(206, 212, 218)' && $('#emailConf').css('display') === 'none') {
			hidePwModal();
			$('#userEmail').focus();
			alert('이메일을 인증하세요.');
			return;
		}
		
		// 주소가 null 인 상태로 주소록 모달 창을 닫을 수가 없으니까 주소는 null 체크 안해도 됨.
		
		if ($('#emailConf').css('display') === 'block' && $('#confBtn').css('display') !== 'none') {
			$('#email-auth-code').focus();
			alert('이메일을 인증하세요.');
			return;
		}
			
		
		/* if (true) {
			
			console.log($('.address-infos'));
			
			// 메인 주소, 그 외 주소들과 추가한 주소의 null 체크
			// null 인 상태로 주소록 모달 창을 닫을 수가 없으니까 null 체크 안해도 됨.
			 for (let $addressInfo of $('.address-infos')) {
				console.log($addressInfo);
				console.log($($addressInfo).data('index'));
				if ($addressInfo.querySelector('.addrBasic').value.trim() === '') {
					alert('주소록에 생성한 주소란에 값을 입력해주세요.');
					hidePwModal();
					showAddressModal()
					
					$addressInfo.querySelector('.addrBasic').focus();
					return;
				} else if ($addressInfo.querySelector('.addrDetail').value.trim() === '') {
					alert('주소록에 생성한 주소란에 값을 입력해주세요.');
					hidePwModal();
					showAddressModal();
					
					$addressInfo.querySelector('.addrDetail').focus();
					return;
				} else if ($addressInfo.querySelector('.addrZipNum').value.trim() === '') {
					alert('주소록에 생성한 주소란에 값을 입력해주세요.');
					hidePwModal();
					showAddressModal();
					
					$addressInfo.querySelector('.addrZipNum').focus();
					return;
				}
			} 
		} */
		
		let category_index_list = [];
		let address_count_list = [];
		
		for (let $li_category of $('.li-category')) {
			category_index_list.push($($li_category).data('index'));
			
		}
		console.log(category_index_list);
		
		
		for (let $div_address of $('.div-address')) {
			address_count_list.push($($div_address).data('index'));
		}
		console.log(address_count_list);
		
		category_index_list = JSON.stringify(category_index_list);
		address_count_list = JSON.stringify(address_count_list);
		
		$('#category-index').val(category_index_list);
		$('#address-count').val(address_count_list);
			
		console.log(category_index_list);
		console.log(address_count_list);
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/userPwConfirm',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result == 1) {
					if (confirm('현재 적용된 내용으로 모든 정보가 수정됩니다.\n수정하시겠습니까?')) {
					
						$('#user-update-form').submit();
					}
				} else {
					alert('현재 비밀번호 입력이 잘못되었습니다.\n 다시 입력해주세요.');
					$('#currPw').focus();
				}
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
	}

	// 계정 삭제 비동기 코드
	function DeleteModal() {
		const currPw = $('#currPw').val().trim();
		const checkPw = $('#checkPw').val().trim();
		const array = [currPw,checkPw];
		
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/user/userPwConfirm',
			contentType: 'application/json',
			dataType:'text',
			data:JSON.stringify(array),
			success: function(result) {
				console.log(result);
				
				if (result == 1) {
					if (confirm('계정을 삭제하시면 되돌릴 수 없습니다.\n삭제하시겠습니까?')) {
					
						$('#user-update-form').submit();
					}
				} else {
					alert('현재 비밀번호 입력이 잘못되었습니다.\n 다시 입력해주세요.');
					$('#currPw').focus();
				}
			},
			error: function(request, status, error) {
				console.log('서버 연결에 실패했습니다.\n관리자에게 문의해주세요.');
			}
		});
		
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
	
	$('#orderBtn').click(function() {
	      const basket = '${basket}';
	      
	      if(basket=='[]'){
	         alert('주문할 물품이 존재하지 않습니다');
	         return
	      }else{
	         location.href ="<c:url value = '/product/order' />";
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
	
	
	$('.myBoard').click(function() {
		
	
		//더보기 버튼 클릭 이벤트
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
				'<c:url value="/board/boardMyList?pageNum='+ page +'" />',
				function(list) {
					console.log(list.length);
					console.log(list);
					
					if(list.length === 0) isFinish = true;
					
					for(let i=0; i<list.length; i++) {
						
						let date = new Date(list[i].boardRegDate)
						console.log(date);
						str += 
							`
				        
				            
				            
				            <tr>
				                <th scope="row" colspan="2" class="align-middle basket"><a href="${pageContext.request.contextPath}/board/boardDetail/`+list[i].boardNo+`" class="basketA">`+list[i].boardTitle+`</a></th>
				                <td class="align-middle basket">`+date.getFullYear()+`/`+(date.getMonth()+1)+`/`+date.getDate()+`</td>
				                <td class="align-middle basket">`+list[i].boardViews+`</td>
				            </tr>
				            
				       
				        `;		
					}
					$('#contentDiv').html(str);
					
				}
				
			); //end getJSON()
			
		} //end getList()
	});
	
	
	
</script>
</html>

