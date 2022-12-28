<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!--Login 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/userLogin.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../include/header.jsp" %>
<section id="userLoginPage">
	<div class="login-wrap">
	  <div class="login-html">
	    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인 페이지</label>
	    <div class="login-form">
	      <div class="sign-in-htm">
	        <div class="group">
	          <label for="user" class="label"></label>
	          <input id="user" type="text" class="input" placeholder="아이디">
	        </div>
	        <div class="group">
	          <label for="pass" class="label"></label>
	          <input id="pass" type="password" class="input" data-type="password" placeholder="비밀번호">
	        </div>
	        <div class="group">
	          <input id="check" type="checkbox" class="check">
	          <label for="check"><span class="icon"></span>&nbsp;&nbsp;자동 로그인</label>
	        </div>
	        <div class="group">
	          <input type="submit" class="button" value="로그인">
	        </div>
	        <div class="hr"></div>
	        <div class="foot-lnk">
	          <a href="#">회원가입</a> <br>
	          <a href="#">비밀번호 찾기</a>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</section>

<%@ include file="../include/footer.jsp" %>
   

</body>
</html>