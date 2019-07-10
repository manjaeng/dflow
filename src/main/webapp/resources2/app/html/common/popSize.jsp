

<article class="popLayer a popSize" id="popSize">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">사이즈관리</h1>
				<button type="button" class="btnPopClose">닫기</button>
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
									<div class="ui-slider-handle"><span class="match-handle"></span></div>
									<div class="nums">
										<span class="num min">1M</span>
										<span class="ds">~</span>
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
								<option>AGE 20~ AGE 25</option>
							</select>
						</div>
					</li>
					<li class="fit">
						<div class="ht">Fit</div>
						<div class="ct">
							<div class="uiSlider">
								<div class="fit" id="sizeFittSlider" data-amount="50">
									<em class="bar"></em>
									<div class="ui-slider-handle"><span class="match-handle"></span></div>
									<div class="nums">
										<span class="num min">Tight</span>
										<span class="ds">~</span>
										<span class="num max">Oversized<i></i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="bra">
						<div class="ht">BRA SIZE</div>
						<div class="ct">
							b
						</div>
					</li>
					<li class="bot">
						<div class="ht">BOTTOM SIZE</div>
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
					<a class="btn xl e btnCancel" href="javascript:;">취소</a>
					<a class="btn xl d btnCom" href="javascript:;">완료</a>
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
