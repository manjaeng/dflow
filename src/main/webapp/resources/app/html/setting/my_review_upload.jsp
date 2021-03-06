<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain review my upload">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="upload photo">
				<div class="hdt"><em>UPLOAD YOUR <br> REVIEW PHOTOS </em> </div>

				<div class="pics swiper-container" id="slideUploadPic">
					<ul class="list swiper-wrapper slide">
						<li class="swiper-slide">
							<div class="img"><a class="btnAdd" href="javascript:;">선택</a></div>
							<div class="counts">
								<div class="txt">uploaded count</div>
								<div class="cnt">0/10</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="img">
								<a href="javascript:;"><img src="//placeimg.com/380/500/1" alt=""></a>
								<div class="num">1/10</div>
							</div>
							<div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this);">삭제</a></div>
						</li>
					</ul>
				</div>
			</section>

			<!-- <button type="button" onclick="testPicAdd()">추가</button> -->

			<!-- <section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section> -->

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<button type="button" class="btn type b fill xl" onclick="location.href = '../setting/my_review_write.jsp';">NEXT</button>
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
	var testPicAdd = function(){
		var picHtml = 
			'<li class="swiper-slide">'+
				'<div class="img">'+
					'<a href="javascript:;"><img src="//placeimg.com/380/500/2" alt=""></a>'+
					'<div class="num">1/10</div>'+
				'</div>'+
				'<div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this);">삭제</a></div>'+
			'</li>';
		$("#slideUploadPic .list").append( picHtml );
	}
	var testPicDel = function(els){
		$(els).closest(".swiper-slide").remove();
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