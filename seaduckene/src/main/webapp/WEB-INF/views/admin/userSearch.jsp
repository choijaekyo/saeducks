<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>유저검색</title>

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
        <div class="col">
          <div class="card">
            <div class="card-body">
              <div class="input-group mb-3">
                <span class="input-group-text">이름</span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Username"
                  aria-label="Username"
                  name="Username"
                  id="Username"
                />
                <span class="input-group-text">전화번호</span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="UserPhonNumber"
                  aria-label="UserPhonNumber"
                  name="UserPhonNumber"
                  id="UserPhonNumber"
                />
                <span class="input-group-text">주문번호</span>
                <input
                  type="text"
                  class="form-control"
                  placeholder="OrderNumber"
                  aria-label="OrderNumber"
                  name="OrderNumber"
                  id="OrderNumber"
                />
              </div>
              <div class="table-responsive">
                <table class="table table-striped table-borderless" id="contentDiv">
                  <!-- 정보 출력 -->
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      $('.card-body').on('keyup', 'input', function(e) {

        let str = '';
        var search = '';

        if (window.event.keyCode == 13) {
          if (this === document.getElementById('Username')) {
            search = document.getElementById('Username').value;
          } else if(this === document.getElementById('UserPhonNumber')) {
            search = document.getElementById('UserPhonNumber').value;
          } else if(this === document.getElementById('OrderNumber')) {
            search = document.getElementById('OrderNumber').value;
          } else {
            return;
          }

          $.getJSON(
            '<c:url value="/admin/usersSearch?search='+ search +'" />',
            function(result) {
              
              if(result.length === 0){
                str = '<p>정보가 없습니다.</p>';
                console.log('asdasdasd'+result.length);
              } else {
                for(let i=0; i<result.length; i++) {
                  str += 
                    `<thead>
                      <tr>
                        <th class="mx-auto">아이디</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>` + result[i].userId + `</td>
                        <td class="border-start">` + result[i].userTel + `</td>
                        <td class="border-start">` + result[i].userName + `</td>
                        <td class="border-start">` + result[i].userEmail + `</td>
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>주문번호</th>
                        <th>주문수량</th>
                        <th>주문가격</th>
                        <th>주문상태</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>` + result[i].orderNum + `</td>
                        <td class="border-start">` + result[i].orderQuantity + `</td>
                        <td class="border-start">` + result[i].orderPrice + `</td>
                        <td class="border-start">` + result[i].orderStatus + `</td>
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>받는사람</th>
                        <th>전화번호</th>
                        <th>우편번호</th>
                        <th>동주소</th>
                        <th>상세주소</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>` + result[i].orderRecipientName + `</td>
                        <td class="border-start">` + result[i].orderRecipientTel + `</td>
                        <td class="border-start">` + result[i].orderAddressZipNum + `</td>
                        <td class="border-start">` + result[i].orderAddressBasic + `</td>
                        <td class="border-start">` + result[i].orderAddressDetail + `</td>
                      </tr>
                    </tbody>

                    <thead>
                      <tr>
                        <th>결제방법</th>
                        <th>환불은행</th>
                        <th>환불계좌</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>` + result[i].orderPaymentMethod + `</td>
                        <td class="border-start">` + result[i].orderReturnBank + `</td>
                        <td class="border-start">` + result[i].orderReturnAccount + `</td>
                      </tr>
                    </tbody>`;
                  }
                console.log(str);
              }
              console.log('if 나와서 : ' + str);
              $('#contentDiv').html(str);
            }
          ); //end getJSON()
        }
      });
    </script>
  </body>
</html>
