<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl reg r2">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Register</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="sec size">
				<ul class="filters">
					<li class="hgt">
						<div class="ht">HEIGHT</div>
						<div class="ct">
							<div class="uiSlider hgt">
								<div class="height ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" id="sizeHeightSlider" data-amount="168">
									<em class="bar" style="width: 84%;"></em>
									<div class="ui-slider-handle ui-corner-all ui-state-default" tabindex="0" style="left: 68%;"></div>
									<div class="range_amount">168<i>cm</i></div>
									<div class="nums">
										<span class="num min">1M</span>
										<span class="num max">2M<i></i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="age">
						<div class="ht">AGE</div>
						<div class="ct">
							<select class="select">
								<option>28</option>
							</select>
						</div>
					</li>
					<li class="fit">
						<div class="ht">Fit</div>
						<div class="ct">
							<div class="uiSlider fit">
								<div class="fit ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" id="sizeFittSlider" data-amount="86">
									<em class="bar" style="width: 86%;"></em>
									<div class="ui-slider-handle ui-corner-all ui-state-default" tabindex="0" style="left: 86%;"></div>
									<!-- <div class="range_amount"></div> -->
									<div class="nums">
										<span class="num min">Tight</span>
										<span class="num mid">FIT</span>
										<span class="num max">Oversized<i></i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="bra">
						<div class="ht">BRA</div>
						<div class="ct">
							<div class="slideSize cup swiper-container">
								<ul class="list cup swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">A</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">B</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">C</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">D</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">E</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">F</span></label></li>
								</ul>
							</div>
							<div class="slideSize siz swiper-container">
								<ul class="list siz swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">60</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">65</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">70</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">75</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">80</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">85</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_siz"><span class="tit">90</span></label></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="bot">
						<div class="ht">BOTTOM</div>
						<div class="ct">
							<div class="slideSize bot swiper-container">
								<ul class="list bot swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">26</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">28</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">30</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">32</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">34</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">36</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bott"><span class="tit">38</span></label></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</section>
			

			<section class="steps st2">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./profile.jsp" class="btn type d fill xl">Save</a>
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
		ui.size.init();
	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>