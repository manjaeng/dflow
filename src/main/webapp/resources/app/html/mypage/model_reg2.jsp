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
										<input type="number" value="28">
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