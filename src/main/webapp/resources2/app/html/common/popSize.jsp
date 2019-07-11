

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
							<div class="uiSlider">
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
							<div class="uiSlider">
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
							b
						</div>
					</li>
					<li class="bot">
						<div class="ht">BOTTOM</div>
						<div class="ct">
							b
						</div>
					</li>
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl d btnSave" href="javascript:;">SAVE</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popSize = function(){
	ui.popLayer.open('popSize',{
		ocb: function(){
			ui.size.height();
			ui.size.fit();
		}
	});
	
};
</script>
