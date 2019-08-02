<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain lkreg upload">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec photo">
				<div class="hdt"><em>UPLOAD YOUR <br> LOOK PHOTOS </em> </div>

				<div class="pics swiper-container" id="slideUploadPic">
					<ul class="list swiper-wrapper slide">
						<li class="swiper-slide"><div class="img"><a class="btnAdd" href="javascript:showPhotoForPickupThree(null);">선택</a></div></li>
						<li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del">삭제</a></div></li>
						<li class="swiper-slide"><div class="img"></div></li>
						<li class="swiper-slide"><div class="img"></div></li>
					</ul>
				</div>
			</section>

			<section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<button type="button" class="btn type b fill xl" onclick="location.href = './look_cate.jsp';">NEXT</button>
					</div>
				</div>
			</section>

		</main>
	</div>




	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	$(document).ready(function(){
		
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>