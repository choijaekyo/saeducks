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


	<section id="findAccountRes">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p>고객님의 회원정보와 일치하는 아이디 목록입니다.</p>
					<div class="resultBox">
						<c:choose>
							<c:when test="${empty userIds}">
								<h6>일치하는 아이디가 없습니다.</h6>
								<h6>이름과 이메일을 확인해주시고,<br> 가입하신 정보가 없는 경우 신규 가입을 해주세요.</h6>
								<a href="<c:url value='/user/userFindAccount'/>">재시도</a> &nbsp;
		          				<a href="<c:url value='/user/userJoin' />">회원가입</a>
							</c:when>
							<c:otherwise>
								<c:forEach var="userId" items="${userIds }">
									<h6>${userId}</h6>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="foot-lnk col-12">
		          <a href="<c:url value='/user/userLogin'/>">로그인하기</a> <br>
		          <a href="<c:url value='/user/userFindPw' />">비밀번호 찾기</a>
		        </div>
			</div>
		</div>	
	</section>

	<%@ include file="../include/footer.jsp"%>

</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	console.log('${userIds  }');
</script>
</html>