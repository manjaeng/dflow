<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	<!-- 컨텐츠 시작 -->
	<div class="pageHd">
		<div class="in">
			<div class="bts">
				<a href="javascript:history.back();" class="hisback">뒤로</a>
			</div>
			<h1 class="tit">체크셔츠 원피스</h1>
		</div>
	</div>
	<div id="contain" class="contain gds">
		<main id="contents" class="contents">
			<section class="secLk item">
				<div class="uiLkItem">
					<div class="tops">
						<div class="info">
							<div class="code">PDT1909050002</div>
							<div class="prc"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
						</div>
						<div class="bts">
							<a href="javascript:;" class="bt buy"><em class="t">BUY NOW</em></a>
						</div>
					</div>
					<div class="slideLookPic" id="slideLookPic">
						<div class="swiper-container">
							<ul class="swiper-wrapper slide">
								<li class="swiper-slide">
									<div class="uiPhoto ">
										<div class="photo">
											<span class="pic swiper-zoom-container"><img src="//placeimg.com/720/960/2" alt="사진"></span>
										</div>
									</div>
								</li>
								<li class="swiper-slide">
									<div class="uiPhoto">
										<div class="photo">
											<span class="pic swiper-zoom-container"><img src="//placeimg.com/720/960/2" alt="사진"></span>
										</div>
									</div>
								</li>
							</ul>
							<div class="pagination"></div>
						</div>						
					</div>

					<div class="info">
						<div class="name">
							<a href="../mypage/profile.jsp" class="mem"><span class="nm">TNNYY</span></a>
						</div>
						<div class="desc">
							<a href="javascript:;" class="txt">디어클라우드에서 산 호피무니 미니스커트 인증! 블랙 가죽 슈즈와 매치하면 끝장 디어클라우드에서 산 호피무니 미니스커트 인증! 블랙 가죽 슈즈와 매치하면 끝장 디어클라우드에서 산 호피무니 미니스커트 인증! 블랙 가죽 슈즈와 매치하면 끝장</a>
							<a href="javascript:;" class="more">더보기</a>
						</div>
					</div>
					<div class="review">
						<div class="tit"><em class="t">REVEIW</em><i class="n">(13)</i> </div>
						<div class="bts">
							<a href="../look/review.jsp" class="bt more">MORE</a>
						</div>
					</div>

				</div>
			</section>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>


	<script>
	$(document).ready(function(){
		// ui.nav.act("look");  // 하단 메뉴 활성화
	});
	</script>
	

	<!--// 컨텐츠 끝 -->
	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>