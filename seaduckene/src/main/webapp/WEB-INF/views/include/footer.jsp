<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<section></section>

<footer>
   <div class="container f-wrap mt-5">

      <div class="row">
         <div class="col text-center">세상의 모든 덕질</div>
      </div>
      <hr>
      <div class="row">
         <div class="col-md-4">
            <div class="f_box text-center">
               <p>
                  Bootstrap | 대표자 : 박세덕 <br> E-MAIL : saeduckene&#64;info.com<br>
                  사업자번호 : 123-56-78910 <br> 개인정보보호책임자 : 최재덕 <br>통신판매업 :
                  2019-서울강남-0001<br> 주소 :세덕시 세덕구 세덕동 세덕빌딩 304호
               </p>
            </div>
         </div>
         <div class="col-md-4">
            <div class="f_box text-center">
               <p>
                  <strong style="font-size: 15px;">반품배송지 </strong><br>
               </p>
               <p style="font-size: 12px;">
                  인규시 세덕면 보라리 <br> 세덕물류센터
               </p>
               <br>
               <p>
                  <strong>CUSTOMER CENTER</strong> <br> <strong>2577-3839</strong>
                  <br>
               </p>
               <p style="font-size: 12px;">
                  AM 9:00 ~ PM 6:00 <br> break time pm:1:00 ~ pm2:00
               </p>
            </div>
         </div>
         <div class="col-md-4">
            <div class="f_box text-center">
               <h3>
                  <a class="text-danger" href="<c:url value='/board/notice' />"><strong>공지사항</strong></a>
               </h3>
               <ul id="contentUl">
                  <!-- <li><a href="">공지사항1 안녕하세요오</a></li>
                  <li><a href="">공지사항2 세덕이네입니다.</a></li>
                  <li><a href="">공지사항3 세상 모든덕질을</a></li>
                  <li><a href="">공지사항4 열심히할수있는</a></li>
                  <li><a href="">공지사항5 좋은사이트</a></li> -->
               </ul>
               <br> <br> <br>
            </div>
         </div>

      </div>
   </div>


</footer>

<!-- 스와이프 js -->
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<script>
   var swiper = new Swiper(".mySwiper", {
      slidesPerView : 1,
      spaceBetween : 1,
      breakpoints: {
         '@0.75': {
            slidesPerView: 2,
            spaceBetween: 1,
          },
          '@1.00': {
            slidesPerView: 3,
            spaceBetween: 1,
          }
      },
      slidesPerGroup : 1,
      loop : true,
      loopFillGroupWithBlank : true,
      autoplay : {
         delay : 2500,
         disableOnInteraction : false
      },
      pagination : {
         el : ".swiper-pagination",
         clickable : true
      }
      // https://swiperjs.com/swiper-api
   });
    
    $(document).ready(function() {
        $('#summernote').summernote({
          height: 300,                 // 에디터 높이
          minHeight: null,             // 최소 높이
          maxHeight: null,             // 최대 높이
          focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
          lang: "ko-KR",               // 한글 설정
          placeholder: '최대 2048자까지 쓸 수 있습니다',   //placeholder 설정
          toolbar: [
              // 글꼴 설정
              ['fontname', ['fontname']],
              // 글자 크기 설정
              ['fontsize', ['fontsize']],
              // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
              ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
              // 글자색
              ['color', ['color']],
              // 표만들기
              ['table', ['table']],
              // 글머리 기호, 번호매기기, 문단정렬
              ['para', ['ul', 'ol', 'paragraph']],
              // 줄간격
              ['height', ['height']],
              // 그림첨부, 링크만들기, 동영상첨부
              ['insert',['picture','video']],
              // 코드보기, 확대해서보기, 도움말
              ['view', ['codeview']]
            ],
            // 추가한 글꼴
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            // 추가한 폰트사이즈
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
          callbacks: {
              onImageUpload : function(files, editor, welEditable){

                    // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i >= 0; i--) {
                        uploadSummernoteImageFile(files[i],
                    this);
                        }
                    }
          } 
        });
      });

</script>
</body>
</html>