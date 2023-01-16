<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors" />
    <meta name="generator" content="Hugo 0.104.2" />
    <title>Signin Template · Bootstrap v5.2</title>
    
    <!-- 부트스트랩  CDM -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 제이쿼리 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js" ></script>

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" />

	<style>
      html,
      body {
        height: 100%;
      }

      body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #fff9d6;
      }
    </style>
  </head>
  <body>
  	<div class="container w-100 m-auto">
      <div class="row">
	      <div class="col text-center">
	      	<a class="btn btn-primary" href="<c:url value='/product/createProduct' />">상품등록</a>
		    <a class="btn btn-danger" href="<c:url value='/admin/NoticeAddPage' />">공지등록</a>
		    <a class="btn btn-success" href="<c:url value='/board/notice' />">공지사항</a>
		    <a class="btn btn-info" href="<c:url value='/admin/userSearch' />">유저검색</a>
	      </div>
      </div>
     </div>
  </body>
</html>
