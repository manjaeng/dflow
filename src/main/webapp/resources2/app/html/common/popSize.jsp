

<article class="popLayer a popSize" id="popSize">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">MY SIZE</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="filters">
					<li class="hgt">
						<div class="ht">HEIGHT</div>
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
								<div class="fit" id="sizeFittSlider" data-amount="50">
									<em class="bar"></em>
									<div class="ui-slider-handle"></div>
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
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">A</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">B</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">C</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">D</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">E</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">F</span></label></li>
								</ul>
							</div>
							<div class="slideSize siz swiper-container">
								<ul class="list siz swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">60</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">65</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">70</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">75</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">80</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">85</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">90</span></label></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="bot">
						<div class="ht">BOTTOM</div>
						<div class="ct">
							<div class="slideSize bot swiper-container">
								<ul class="list bot swiper-wrapper slide">
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">26</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">28</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">30</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">32</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">34</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">36</span></label></li>
									<li class="swiper-slide"><label><input type="checkbox"><span class="tit">38</span></label></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl d btnSave" href="javascript:;" onclick="ui.popLayer.close('popSize');">SAVE</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popSize = function(){
	ui.popLayer.open('popSize',{
		ocb: function(){
			ui.size.init();
		}
	});
	
};
</script>
