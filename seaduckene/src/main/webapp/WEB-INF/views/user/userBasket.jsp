<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	<section class="py-5">
    <div class="container">
        <table class="table table-striped text-center ">
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
            <tr>
                <th scope="row" colspan="2" class="align-middle">프라모델프라</th>
                <td class="align-middle">10,000</td>
                <td class="align-middle">2 &nbsp;<a href="##"><i class="bi bi-plus-square"></i></a>
                    <a href="##"><i class="bi bi-dash-square"></i></a></td>
                <td class="align-middle">20,000</td>
                <td class="align-middle"><button type="button" class="btn btn-danger">삭제</button></td>
            </tr>
            <tr>
                <th scope="row" colspan="2" class="align-middle">프라모델</th>
                <td class="align-middle">10,000</td>
                <td class="align-middle">2&nbsp;<a href="##"><i class="bi bi-plus-square"></i></a>
                    <a href="##"><i class="bi bi-dash-square"></i></a></td>
                <td class="align-middle">20,000</td>
                <td class="align-middle"><button type="button" class="btn btn-danger">삭제</button></td>
            </tr>
            <tr>
                <th scope="row" colspan="2" class="align-middle">프라모델</th>
                <td class="align-middle">10,000</td>
                <td class="align-middle">2&nbsp;<a href="##"><i class="bi bi-plus-square"></i></a>
                    <a href="##"><i class="bi bi-dash-square"></i></a></td>
                <td class="align-middle">20,000</td>
                <td class="align-middle"><button type="button" class="btn btn-danger">삭제</button></td>
            </tr>
            </tbody>
        </table>
        <div>
            <div class="col-md-2 offset-md-10 text-end">
                <button type="button" class="btn btn-success">주문하기</button>
            </div>
        </div>
    </div>
</section> 

<%@ include file="../include/footer.jsp" %>
</body>
</html>