

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
				<div class="uiSize">
					<div class="sets default">
						<ul class="filter">
							<li class="gender">
								<div class="ht"><span class="tit">성별</span></div>
								<div class="ct">
									<label class="radio"><input type="radio" name="filter_gender" value="female" checked><span>FEMALE</span></label>
									<label class="radio"><input type="radio" name="filter_gender" value="male"><span>MALE</span></label>
								</div>
							</li>
							<li class="hgt">
								<div class="ht"><span class="tit">HEIGHT</span> <span class="unit"><select id="hgt_unit" class="select"><option>CM</option><option>FT</option></select></span> </div>
								<div class="ct cm" id="hgt_unit_box">
									<div class="uiSlider hgt cm">
										<div class="height" id="sizeHeightSliderCm" data-amount="168">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<div class="range_amount"></div>
											<div class="nums">
												<span class="num min">1M</span>
												<span class="num max">2M<i></i></span>
											</div>
										</div>
									</div>
									<div class="uiSlider hgt ft">
										<div class="height" id="sizeHeightSliderFt" data-amount="5.6">
											<em class="bar"></em>
											<div class="ui-slider-handle"></div>
											<div class="range_amount"></div>
											<div class="nums">
												<span class="num min">3FT</span>
												<span class="num max">7FT<i></i></span>
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
							<li class="size bust">
								<div class="ht"><span class="tit"><em id="bustChest"> Bust</em> <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>CM</option><option>INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<input type="number" value="50" id="bustinput">
									</div>
									<div class="num"><em class="n">50</em> <i class="s">CM</i></div>
								</div>
							</li>
							<li class="size hip">
								<div class="ht"><span class="tit">Hip <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>CM</option><option>INCH</option></select></span> </div>
								<div class="ct">
									<div class="amount">
										<input type="number" value="51">
									</div>
									<div class="num"><em class="n">51</em> <i class="s">CM</i></div>
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
											<input type="number" value="21">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Sleeve Length <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Upper Arm <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
								<li class="size">
									<div class="ht"><span class="tit">Thigh <a href="javascript:;" class="bt help" onclick="ui.popLayer.open('popSizeGud');">?</a></span> <span class="unit"><select class="select"><option>INCH</option><option>CM</option></select></span> </div>
									<div class="ct">
										<div class="amount">
											<input type="number" value="21">
										</div>
										<div class="num"><em class="n">21</em> <i class="s">INCH</i></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
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
$(document).ready(function(){
	// popSize();
});
</script>
