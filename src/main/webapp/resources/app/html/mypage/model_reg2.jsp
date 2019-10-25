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
				<div class="uiSize">
					<div class="sets default">
						<ul class="filter">
							<!-- <li class="gender">
								<div class="ht"><span class="tit">성별</span></div>
								<div class="ct">
									<label class="radio"><input type="radio" name="filter_gender" checked><span>FEMALE</span></label>
									<label class="radio"><input type="radio" name="filter_gender"><span>MALE</span></label>
								</div>
							</li> -->
							<li class="hgt">
								<div class="ht"><span class="tit">HEIGHT</span> <span class="unit"><select class="select"><option>CM</option><option>FT</option></select></span> </div>
								<div class="ct">
									<div class="uiSlider hgt">
										<div class="height" id="sizeHeightSlider" data-amount="168">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<div class="range_amount"></div>
											<div class="nums">
												<span class="num min">1M</span>
												<span class="num max">2M<i></i></span>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="size age">
								<div class="ht"><span class="tit">AGE</span> </div>
								<div class="ct">
									<div class="amount">
										<select class="select">
											<option>28</option>
										</select>
									</div>
								</div>
							</li>
							<li class="fit">
								<div class="ht"><span class="tit">Fit</span></div>
								<div class="ct">
									<div class="uiSlider fit">
										<div class="fit" id="sizeFittSlider" data-amount="50">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<!-- <div class="range_amount"></div> -->
											<div class="nums">
												<span class="num min">Tight</span>
												<span class="num mid">FIT</span>
												<span class="num max">Loose</span>
											</div>
										</div>
									</div>
								</div>
							</li>
							<!-- 
							<li class="bra">
								<div class="ht"><span class="tit">BRA</span></div>
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
								<div class="ht"><span class="tit">BOTTOM</span></div>
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
							-->
							<li class="size bust">
								<div class="ht"><span class="tit">Bust <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>CM</option><option>INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<select class="select">
											<option>50</option>
										</select>
									</div>
									<div class="num"><em class="n">19</em> <i class="s">CM</i></div>
								</div>
							</li>
							<li class="size hip">
								<div class="ht"><span class="tit">Hip <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>CM</option><option>INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<select class="select">
											<option>51</option>
										</select>
									</div>
									<div class="num"><em class="n">19</em> <i class="s">CM</i></div>
								</div>
							</li>
						</ul>

					</div>

					<div class="sets detail">
						<div class="hdt">
							<span class="tit">DETAIL SIZE</span>
							<div class="btnTog"><a href="#tog_detailsize" data-ui-tog="btn" class="bt tog">열기</a></div>
						</div>
						<div class="cdt" id="tog_detailsize" data-ui-tog="ctn">
							<ul class="filter">
								<li class="size">
									<div class="ht"><span class="tit">Waist <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<select class="select">
												<option>51</option>
											</select>
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Sleeve Length <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<select class="select">
												<option>51</option>
											</select>
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Upper Arm <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<select class="select">
												<option>51</option>
											</select>
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Thigh <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<select class="select">
												<option>51</option>
											</select>
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
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