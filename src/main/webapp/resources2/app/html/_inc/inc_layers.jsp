﻿



<!--  추가 메뉴 popOthers -->
<article class="popLayer type b popOthers" id="popOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">스타일 만족도</a></li>
					<li><a href="javascript:;" class="bt">저장하기</a></li>
					<li><a href="javascript:;" class="bt">공유하기</a></li>
					<li><a href="javascript:;" class="bt">링크복사</a></li>
					<li><a href="javascript:;" class="bt" onclick="ui.popLayer.open('popAccus');">신고하기</a></li>
					<li><a href="javascript:;" class="bt" onclick="ui.alert({'msg':'<p>신고가 취소 되었습니다.</p>'})">신고취소하기</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>



<!-- 신고 하기  -->
<article class="popLayer type b popAccus" id="popAccus">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
				<li><a href="javascript:;" class="bt">저작권침해 우려됨</a></li>
				<li><a href="javascript:;" class="bt">다른스타일과 중복됨</a></li>
				<li><a href="javascript:;" class="bt">혐오스러움</a></li>
				<li><a href="javascript:;" class="bt">외설적임</a></li>
				<li><a href="javascript:;" class="bt">패션과 무관함</a></li>
				<li><a href="javascript:;" class="bt">지나친 광고성게시물</a></li>
				<li><a href="javascript:;" class="bt">사기피해 우려가 있음</a></li>
				</ul>
				
			</main>
		</div>
	</div>
</article>


<!-- 매칭율 -->
<article class="popLayer type b popMatching" id="popMatching">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">FAPEE 매칭율</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<p>내용</p>
				<p>내용</p>
				<p>내용</p>
				<div class="uiSlider" id="popMmatchSlider">
					<em class="bar"></em>
					<div class="ui-slider-handle"><span id="custom-handle"></span></div>
					<div class="nums">
						<span class="num min">0</span>
						<span class="ds">~</span>
						<span class="num max">100<i>%</i></span>
					</div>
				</div>
				
			</main>
		</div>
		<script>
		$(document).ready(function(){
			
			ui.popLayer.open.popMatching  = function(){
				var bar = $("#popMmatchSlider em.bar")
				var handle = $( "#popMmatchSlider #custom-handle" );
				$( "#popMmatchSlider" ).slider({
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
				$(".ui-slider-handle").triggerHandler("click")
			}

		});	
		</script>
	</div>
</article>

<!-- 선호스타일 -->
<article class="popLayer type b popMyStyle" id="popMyStyle">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">선호스타일</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<div class="uiChk"><input type="checkbox" checked="checked"><em></em></div>
				
			</main>
		</div>
	</div>
</article>

<!-- 팝레이어 샘플1 -->
<article class="popLayer type a popSample1" id="popSample1">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<a class="btn" href="javascript:ui.popLayer.open('popSample2');">팝레이어2</a>
				<p>sdfsdfsfsd</p>
				<label class="checkbox"><input type="checkbox" checked="checked"><span></span></label>
				<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
				<input type="text" class="input">
				<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
				<input type="text" class="input">
				<p>내용</p><p>내용</p>
				<label class="checkbox"><input type="checkbox"><span></span></label>
				<label class="radio"><input type="radio"><span></span></label>
				<p>내용</p><p>내용</p><p>내용</p><p>내용</p>
				<input type="text" class="input">
			</main>
		</div>
		<div class="pbt">
			<div class="bts">
				<a href="javascript:;" class="btn type e">버튼</a>
				<a href="javascript:;" class="btn type a">버튼</a>
			</div>
		</div>
	</div>
</article>


<!-- 팝레이어 샘플2 -->
<article class="popLayer type b popSample2" id="popSample2">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
				<input type="text" class="input">
				<p>sdfsdfsfsd</p>
				<textarea class="textarea"></textarea>
				<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
				
			</main>
		</div>
	</div>
</article>



<!-- 팝레이어 샘플3 -->
<article class="popLayer type a popSample3" id="popSample3">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<img src="http://placeimg.com/640/640/any/5" alt="">
				
			</main>
		</div>
	</div>
</article>
