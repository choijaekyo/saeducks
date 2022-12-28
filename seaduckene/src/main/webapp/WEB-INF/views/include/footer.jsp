<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<script>
	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 3,
		spaceBetween : 1,
		slidesPerGroup : 1,
		loop : true,
		loopFillGroupWithBlank : true,
		autoplay : {
			delay : 1000,
			disableOnInteraction : false
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true
		}
	});
</script>
</body>
</html>