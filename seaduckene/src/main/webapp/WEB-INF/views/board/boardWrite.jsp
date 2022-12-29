<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../include/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col mb-1">
			<button type="button" class="btn btn-outline-secondary rounded" disabled>대카테고리</button>
			<button type="button" class="btn btn-outline-secondary rounded" disabled>소카테고리</button>
			<button type="button" class="btn btn-outline-secondary rounded" disabled>작성자</button>
			<button type="button" class="btn btn-outline-secondary rounded" disabled>날짜</button>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col">
			<div id="summernote"></div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row justify-content-center m-2">
	  	<div class="col-1 w-auto">
	  		<button type="button" class="btn btn-primary rounded">글쓰기</button>
	  		<button type="button" class="btn btn-primary rounded">취소</button>
	  	</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>