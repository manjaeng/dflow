<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popPage popFilter" id="popFilter">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit">STYLE FILTER</h1>
					<button type="button" class="btnPopClose" onclick="history.back();">뒤로</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<ul class="filters">
						<li class="gender">
							<div class="ht">GENDER</div>
							<div class="ct">
								<label class="checkbox"><input type="checkbox"><span>여자</span></label>
								<label class="checkbox"><input type="checkbox"><span>남자</span></label>
							</div>
						</li>
						<li class="country">
							<div class="ht">COUNTRY</div>
							<div class="ct">
								<select class="select">
									<option>KOREA</option>
									<option>KOREA</option>
								</select>
							</div>
						</li>
						<li class="style">
							<div class="ht">STYLE</div>
							<div class="ct">
								<ul class="list">
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Casual</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Elegant</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Curvy</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Boho</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Vintage</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Rock</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Sporty</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Grunge</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Sexy</span>
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox">
											<div class="thumb"><span class="img"><img src="https://dummyimage.com/160x160" alt=""></span></div>
											<span class="tit">Trendy</span>
										</label>
									</li>
								</ul>
							</div>
						</li>
						<li class="match">
							<div class="ht">MATCH</div>
							<div class="ct">
								<div class="uiSlider" id="matchSlider">
									<em class="bar"></em>
									<div class="ui-slider-handle"><span id="custom-handle"></span></div>
									<div class="nums">
										<span class="num min">0</span>
										<span class="ds">~</span>
										<span class="num max">100<i>%</i></span>
									</div>
								</div>
							</div>
						</li>
						<li class="keyword">
							<div class="ct">
								<input type="search" class="input key" placeholder="검색어 입력">
							</div>
						</li>
					</ul>
				</main>
			</div>
			<div class="pbt">
				<div class="in">
					<div class="bts">
						<a class="btn type xl e btnReset" href="javascript:;">초기화</a>
						<a class="btn type xl d btnSch" href="/resources2/app/html/common/filterResult.jsp">검색</a>
					</div>
				</div>
			</div>
		</div>
	</article>
	<script>
	$(document).ready(function(){

		var bar = $(".filters em.bar")
		var handle = $( "#matchSlider #custom-handle" );
		$( "#matchSlider" ).slider({
			value:85,
			min: 0,
			max: 100,
			step: 1,
			create: function() {
				handle.text( $( this ).slider( "value" ) + "%");
				bar.css("width", $( this ).slider( "value" ) + "%");
			},
			slide: function( event, ui ) {
				handle.text( ui.value + "%");
				bar.css("width", $( this ).slider( "value" ) + "%");
				console.log(ui.value);	
			}
		});

	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>