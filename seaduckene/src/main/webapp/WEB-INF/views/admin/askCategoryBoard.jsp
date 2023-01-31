<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Insert title here</title>
	
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/askCategoryBoard.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
    <section class="form-signin w-100 m-auto">
      <div class="col-md-12">
        <h1 class="add-product-title h1 mt-4">게시글별 문의사항</h1>
      </div>
      <div class="container">
        <div class="row">	
          <form action="<c:url value='/admin/askCategoryBoard'/>" id="askCategoryBoard-form" method="post">
          	<input type="hidden" name="askBoardUserNo" value="${login.userNo}">
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="category">카테고리</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <div class="row">
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="askBoardMajorCategory" id="majorCategory" >
                      <option selected disabled>대 카테고리</option>
                    </select>
                  </div>
                  <div class="col-6">
                    <select class="form-select" aria-label="Default select example" name="askBoardMinorCategory" id="minorCategory" >
                      <option selected disabled>소 카테고리</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="cate">제목</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <input class="form-control" type="text" name="askBoardTitle" id="title" required />
              </div>
            </div>
            <div class="input-group inputArea">
              <div class="col-md-2 offset-md-1 col-sm-12 col-12">
                <label for="productContent">요청사유</label>
              </div>
              <div class="col-md-7 col-sm-12 col-12">
                <textarea class="form-control"  name="askBoardContent" id="content" required ></textarea>
              </div>
            </div>

            <div class="inputArea input-group btns">
              <div class="btn-b" >
                <button type="button" class="order_btn btn btn-outline-success" id="submit-btn">문의하기</button>
              </div>
              <div class="btn-b">
                <button type="button" class="cancel_btn btn btn-outline-secondary"  onclick="history.back()" >뒤로가기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    
    	<%@ include file="../include/footer.jsp" %>
</body>

<script>

$(function() {
	
	console.log('${login}');
	console.log('${login.userNo}');
	
	const categoryListJson = '${categoryListJson}';
	
	const categoryList = JSON.parse(categoryListJson);
	
	const $majorCategorySelect = $('#majorCategory')[0];
	
	const $fragOpts1 = document.createDocumentFragment();
	
	for (let i = 0; i < categoryList.length; i++) {
		const $option = document.createElement('option');
		$option.textContent = categoryList[i].categoryMajorTitle;
        $fragOpts1.appendChild($option);
	}
	
	$majorCategorySelect.appendChild($fragOpts1);
	
	$('#majorCategory').on('change', function() {
		for (let i = 0; i < categoryList.length; i++) {
			const categoryMajorTitle = categoryList[i].categoryMajorTitle;
			const $fragOpts2 = document.createDocumentFragment();
			
			if (categoryMajorTitle === this.value) {
				const categoryMinorList = categoryList[i].categoryMinorList;
				
				const $optDefault = document.createElement('option');
				$($optDefault).attr('selected', 'true');			
				$($optDefault).attr('disabled', 'true');			
				$($optDefault).text('소 카테고리');
				
				$fragOpts2.appendChild($optDefault);
				
				for (let i = 0; i < categoryMinorList.length; i++) {
					const $option = document.createElement('option');
					$option.textContent = categoryMinorList[i];
		        	$fragOpts2.appendChild($option);
				}
				
				const $minorCategorySelect = $('#minorCategory')[0];
				$($minorCategorySelect).html('');
		        $minorCategorySelect.appendChild($fragOpts2);
				
			}
		}
		
	});
	
    // 버튼 클릭, 버튼 엔터 이벤트 시 submit 실행 코드.
    $('#submit-btn').click(submit);
    $('#askCategoryBoard-form').on('keyup', 'input', keyPressEnter);
	
    function keyPressEnter() {
    	if (window.event.keyCode == 13) {
    		submit();				
		}
    }
    
	function submit() {
		
		if (true) {
			const major = $('#majorCategory');
			if (major[0].value === '대 카테고리') {
				alert('대 카테고리를 선택하세요.');
				major[0].focus();				
				return;						
			}	  
			
			const minor = $('#minorCategory');
			if (minor[0].value === '소 카테고리') {
				alert('소 카테고리를 선택하세요.');
				minor[0].focus();				
				return;						
			}	  
		}

		if ($('#title').val().trim() === '') {			
			alert('문의 제목을 입력해주세요.');
			$('#title').focus();
			return;
		} else if ($('#content').val().trim() === '') {
			alert('문의 내용을 입력해주세요.');
			$('#content').focus();
			return;
		} 
		
   		$('#askCategoryBoard-form').submit();
		
	}
	
}); // end jQuery

</script>
</html>