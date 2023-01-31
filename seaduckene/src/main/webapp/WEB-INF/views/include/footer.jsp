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
               <div>
               		<div id="ask-btn" class="btn btn-primary rounded" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="location.href ='<c:url value='/admin/askWrite' />'">문의하기</div>
               </div>
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
   
   let str = '';
    

    $(document).ready(function() {
      let str = '';

      $.getJSON(
         '<c:url value="/board/noticeList" />',
         function(list) {
            
            if(list.length === 0) {
                  
                  str += 
                  `<li><a href="#">공지 사항이 없습니다.</a></li>`;      

            } else {
               for(let i=0; i<list.length; i++) {
                  
                  str += 
                  `<li>`+ list[i].noticeTitle +`</li>`;      
               }
            }

            $('#contentUl').html(str);
         }
         
            
      ); //end getJSON()
      
   });


</script>
</body>
</html>