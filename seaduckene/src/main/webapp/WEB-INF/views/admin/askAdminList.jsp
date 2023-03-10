<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
    <meta name="generator" content="Hugo 0.104.2" />
    <title>세덕이네 관리자 페이지</title>
    
    <!-- 부트스트랩  CDM -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 제이쿼리 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />

	<style>
      body {
        display: flex;
        align-items: center;
        padding-bottom: 60px;
        background-color: #fff9d6;
      }
      
      a#main {
		display: block;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background: tomato;
		text-align: center;
		line-height: 50px;
		margin-right: 20px;
		text-decoration: none;
		color: white;
		
		position: fixed;
		bottom: 20px;
		right: 10px;
		}
    </style>
  </head>
  <body>

	<div class="container mt-5">
		<p class="col fs-2">일반 문의한 내용 <button class="btn btn-primary" id="adminAskCategoryBoard">게시글 문의 보기</button> </p>
		<div class="row mt-5 mb-3">
			<div class="col-8">
				<input type="text" class="form-control" placeholder="찾으실 사용자는?" aria-label="askSearch" name="askSearch" id="askSearch" />
			</div>
			<div class="col-2">
				<button class="btn btn-primary" id="askNoFullSearch">안달린거</button>
			</div>
			<div class="col-2">
				<button class="btn btn-primary" id="askYesFullSearch">전체보기</button>
			</div>
		</div>
		<div class="">
			<c:forEach var="i" items="${empty searchList ? askAdminList : searchList}" >
				<c:if test="${not empty searchList}">
					<div class="list-group mb-2">
						<div class="list-group-item list-group-item-secondary" >
						  <div class="d-flex w-100 justify-content-between">
						    <div>
						      <h6 class="mb-0">${empty i.askListUserName ? '탈퇴한 회원': '유저 : ' += i.askListUserName}</h6>
						      <p class="mb-0 opacity-75"  style="white-space:pre;">${i.askListContent}</p>
						    </div>
						    <small class="opacity-50 text-nowrap">
						    	<c:set var="now" value="${i.askListRegDate}" />
								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a h:mm" type="date"/>
						    </small>
						  </div>
						</div>
						<c:if test="${empty i.askListReplyContent}">
							<form class="was-validated" action="${pageContext.request.contextPath}/admin/askAdminReply" method="post">
		
								<input type="hidden" name="askNo" value="${i.askListNo}">
								
								<div class="row">
									<div class="col-11 mb-3 form-floating">
										<textarea name="reply" onkeyup="autoHeight();" class="form-control" id="sss" placeholder="관리자에게 할말을 적으라" required></textarea>
										<label for="sss">사용자에게 할말을 적으라</label>
									</div>
							
									<div class="col-1">
										<button class="btn btn-primary rounded" type="submit">답변하기</button>
									</div>
								</div>
							</form>
						</c:if>
						<c:if test="${not empty i.askListReplyContent}">
							<div class="list-group-item list-group-item-action" >
							  <div class="d-flex w-100 justify-content-between">
							    <div>
							      <h6 class="mb-0">관리자</h6>
							      <p class="mb-0 opacity-75" style="white-space:pre;">${i.askListReplyContent}</p>
							    </div>
							    <small class="opacity-50 text-nowrap">
							    	<c:set var="now" value="${i.askListUpdateDate}" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd a h:mm" type="date"/>
							    </small>
							  </div>
							</div>
						</c:if>
					</div>
				</c:if>
			</c:forEach>
			<c:if test="${empty searchList}">
				<div>
					<p>문의 사항이 없습니다.</p>
				</div>
			</c:if>
		</div>
	</div>
	<a id="main" href="<c:url value='/admin/adminMain'/>" >main</a>
	<script>
		function autoHeight() {
			var textEle = $('textarea');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight);
		};
		
		
		$(function() {
			let type = '';
	        let keyword = '';
	        
			$('.form-control').on('keydown', function(e) { 
				if (e.keyCode == 13) {
					if (this === document.getElementById('askSearch')) {
						type = 'name';
						keyword = document.getElementById('askSearch').value;
						location.href='${pageContext.request.contextPath}/admin/askAdminList?type='+type+'&keyword='+keyword;
						$('#askSearch').val('');	
					}
				}
			});
			
			$('#askYesFullSearch').on('click', function() {
				type = 'yes';
				keyword = 'yes';
				location.href='${pageContext.request.contextPath}/admin/askAdminList?type='+type+'&keyword='+keyword;
			});
			
			$('#askNoFullSearch').on('click', function() {
				type = 'no';
				keyword = 'no';
				location.href='${pageContext.request.contextPath}/admin/askAdminList?type='+type+'&keyword='+keyword;
			});
			
			$('#adminAskCategoryBoard').on('click', function() {
				location.href='${pageContext.request.contextPath}/admin/adminAskCategoryBoardList';
			});
		});
	</script>

  </body>
</html>