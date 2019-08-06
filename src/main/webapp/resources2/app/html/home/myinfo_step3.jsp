<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain myinfo step3">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec photo">
				<div class="hdt"><em>UPLOAD YOUR <br> STYLE PHOTOS </em> </div>

				<div class="pics swiper-container" id="slideUploadPic">
					<ul class="list swiper-wrapper slide">
						<li class="swiper-slide"><div class="img"><a class="btnAdd" href="javascript:;">선택</a></div></li>
						<li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this)">삭제</a></div></li>
						<li class="swiper-slide"><div class="img"></div></li>
						<li class="swiper-slide"><div class="img"></div></li>
					</ul>
				</div>
			</section>

			<!-- <button type="button" onclick="testPicAdd()">추가</button> -->
			
			<section class="steps st3">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>
			
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./myinfo_step4.jsp" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>
		</main>
	</div>

	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	var testPicAdd = function(){
		var picHtml = '<li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this)">삭제</a></div></li>';
		$("#slideUploadPic .list").append( picHtml );
	}
	var testPicDel = function(els){
		$(els).closest(".swiper-slide").find("img , .bts").remove();
	}

	$(document).ready(function(){
		
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>