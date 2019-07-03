



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
					<li><a href="javascript:;" class="bt" onclick="popAccus();">신고하기</a></li>
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
<script>
function popAccus(){
	ui.popLayer.open('popAccus',{
		ocb:function(){
			console.log("신고하기팝업 열림");
			// ui.popLayer.close('popPrfOthers');
		},
		ccb:function(){
			console.log("신고하기팝업 닫힘");
		}
	});
};
</script>




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
				
				<div class="uiSlider" id="popMatchSlider" data-amount="85">
					<em class="bar"></em>
					<div class="ui-slider-handle"><span class="match-handle"></span></div>
					<div class="nums">
						<span class="num min">0</span>
						<span class="ds">~</span>
						<span class="num max">100<i>%</i></span>
					</div>
				</div>
				<p>내용</p>
				<div class="botBts">
					<div class="btnSet">
					<a href="javascript:;" class="btn type a btnFind" onclick="ui.popLayer.close('popMatching')">다시찾기</a></div>
				</div>		
				
			</main>
		</div>
	</div>
</article>

<script>
var popMatching={
	using:function(){
		ui.popLayer.open('popMatching',{
			ocb:function(){
				popMatching.slider();
			},
			ccb:function(){
				console.log("매칭 닫힘");
			}
		});
	},
	slider:function(){
		var $slider = $("#popMatchSlider");
		var bar = $slider.find("em.bar");
		var handle = $slider.find(".match-handle");
		$slider.slider({
			value: $slider.attr("data-amount") ,
			min: 0,
			max: 100,
			step: 1,
			create: function(event, ui) {
				handle.text( $(this).slider( "value" ) + "%");
				bar.css("width", $(this).slider( "value" ) + "%");
			}
		});

		$slider.on("slidechange slide", function( event, ui ) {
			handle.text( ui.value + "%");
			bar.css("width", $(this).slider( "value" ) + "%");
			$(this).attr("data-amount",ui.value);
			$("#match_amount").text(  ui.value + "%"  );
			// console.log(ui.value);
		} );
		console.log("매칭 오픈");
	}
};
$(document).ready(function(){
	popMatching.slider();
});
</script>





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
				<p>내용</p>
				<div class="botBts">
					<div class="btnSet">
					<a href="javascript:;" class="btn type a btnFind" onclick="ui.popLayer.close('popMyStyle')">확인</a></div>
				</div>	
			</main>
		</div>
	</div>
</article>
<script>
function popMyStyle(){
	ui.popLayer.open('popMyStyle',{
		ocb:function(){
			console.log("선호스타일 열림");
		},
		ccb:function(){
			console.log("선호스타일 닫힘");
		}
	});
};
</script>





<!-- 프로필 기타 팝업 -->
<article class="popLayer type b popPrfOthers" id="popPrfOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt" onclick="popShare();">공유하기</a></li>
					<li><a href="javascript:;" class="bt">링크복사</a></li>
					<li><a href="javascript:;" class="bt" onclick="popAccus();">신고하기</a></li>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popPrfOthers(){
	ui.popLayer.open('popPrfOthers',{
		ocb:function(){
			console.log("프로필 기타팝업 열림");
		},
		ccb:function(){
			console.log("프로필 기타팝업 닫힘");
		}
	});
};
</script>



<!-- 공유하기 팝업 -->
<article class="popLayer type b popShare" id="popShare">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">공유하기</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="twitter"><a href="javascript:;" class="bt">트위터</a></li>
					<li class="katalk"><a href="javascript:;" class="bt">카카오톡</a></li>
					<li class="facebook"><a href="javascript:;" class="bt">페이스북</a></li>
					<li class="kastory"><a href="javascript:;" class="bt">카카오스토리</a></li>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popShare(){
	ui.popLayer.open('popShare',{
		ocb:function(){
			// ui.popLayer.close('popPrfOthers');
			console.log("공유하기 열림");
		},
		ccb:function(){
			console.log("공유하기 닫힘");
		}
	});
};
</script>



<!-- 프로필사진변경 -->
<article class="popLayer type b popPrfPicMod" id="popPrfPicMod">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">프로필사진변경</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">프로필 사진변경</a></li>
					<li><a href="javascript:;" class="bt">프로필 사진삭제</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>
<script>
function popPrfPicMod(){
	ui.popLayer.open('popPrfPicMod',{
		ocb:function(){
			console.log("프로필사진변경 열림");
		},
		ccb:function(){
			console.log("프로필사진변경 닫힘");
		}
	});
};
</script>




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
				<a class="btn" href="javascript:ui.popLayer.open('popSample3');">팝레이어2</a>
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
				<a class="btn" href="javascript:popMatching();">매칭</a>
				<a class="btn" href="/resources2/app/html/look/look.jsp" onclick="ui.popLayer.close('popMatching')">이동</a>
			</main>
		</div>
	</div>
</article>
