
<!-- 필터 -->
<%@ include file="../common/popFilter.jsp" %>

<!-- 사이즈 -->
<%@ include file="../common/popSize.jsp" %>

<!-- 검색 -->
<%@ include file="../common/popSearch.jsp" %>


<!--  추가 메뉴 popOthers -->
<article class="popLayer c popOthers" id="popOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">LOOK EDIT</a></li>
					<li class="st"><a href="javascript:;" class="bt">LOOK DELETE</a></li>
					<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popOthers');">REPORT</a></li>
					<li><a href="javascript:;" class="bt" onclick="ui.toast({msg:'<p>Link copied to clipboard</p>'}); ui.popLayer.close('popOthers');">COPY LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="ui.toast({msg:'<p>Link copied to clipboard</p>'}); ui.popLayer.close('popOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="popShare(); ui.popLayer.close('popOthers');">SHARE</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>



<!-- 신고 하기  -->
<article class="popLayer c popAccus" id="popAccus">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="st"><a href="javascript:;" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s Spam</a></li>
					<li class="st"><a href="javascript:;" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s appropriate</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>
<script>
function popAccus(){
	ui.popLayer.open('popAccus',{
		zIndex : 1500,
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
<article class="popLayer c popMatching" id="popMatching">
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
				<div class="uiSlider">
					<div class="mat" id="popMatchSlider" data-amount="85">
						<em class="bar"></em>
						<div class="ui-slider-handle"><span class="match-handle"></span></div>
						<div class="nums">
							<span class="num min">0</span>
							<span class="ds">~</span>
							<span class="num max">100<i>%</i></span>
						</div>
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
				console.log("매칭 열림");
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
		// console.log("매칭 오픈");
	}
};
$(document).ready(function(){
	popMatching.slider();
});
</script>





<!-- 선호스타일 -->
<article class="popLayer c popMyStyle" id="popMyStyle">
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
<article class="popLayer c popPrfOthers" id="popPrfOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popPrfOthers');">REPORT</a></li>
					<li><a href="javascript:;" class="bt" onclick="ui.toast({msg:'<p>Link copied to clipboard</p>'}); ui.popLayer.close('popPrfOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" onclick="popShare(); ui.popLayer.close('popPrfOthers');" class="bt">SHARE</a></li>
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




<!-- 룩등록 팝업 -->
<article class="popLayer a popLookReg" id="popLookReg">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li>
						<span href="javascript:;" class="bt">MY PROFILE</span>
						<ol class="mds">
							<li>
								<a href="javascript:;" class="box">
									<span class="pic"><div class="img"><img src="//placeimg.com/80/94" alt=""></div></span>
									<span class="name">JENNY</span>
									<span class="info">160cm, KOREA</span>
								</a>
							</li>
						</ol>
					</li>
					<li>
						<span href="javascript:;" class="bt">MODEL PROFILE</span>
						<ol class="mds">
							<li>
								<a href="../look/look_upload.jsp" class="box">
									<span class="pic"><div class="img"><img src="//placeimg.com/80/94" alt=""></div></span>
									<span class="name">JENNY</span>
									<span class="info">160cm, KOREA</span>
								</a>
							</li>
							<li>
								<a href="javascript:;" class="box">
									<span class="pic"><div class="img"><img src="//placeimg.com/80/94" alt=""></div></span>
									<span class="name">LUCKY</span>
									<span class="info">153cm, JAPAN</span>
								</a>
							</li>
							<li>
								<a href="javascript:;" class="box">
									<span class="none">등록된 모델이 없습니다.</span>
								</a>
							</li>
						</ol>
					</li>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popLookReg(){
	ui.confirm({ // 컨펌 창 띄우기
		msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
			'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
		ycb:function(){
			popLookReg_open();
		}
	});
};

function popLookReg_open(){
	ui.popLayer.open('popLookReg',{
		ocb:function(){
			console.log("프로필 기타팝업 열림");
		},
		ccb:function(){
			console.log("프로필 기타팝업 닫힘");
		}
	});
}
</script>



<!-- 공유하기 팝업 -->
<article class="popLayer c popShare" id="popShare">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
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
<article class="popLayer c popPrfPicMod" id="popPrfPicMod">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">CHANAGE PHOTO</a></li>
					<li><a href="javascript:;" class="bt">DELETE PHOTO</a></li>
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
<article class="popLayer a popSample1" id="popSample1">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀 타입 a</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<a class="btn" href="javascript:ui.popLayer.open('popSample2');">팝레이어2</a>
				<p>sdfsdfsfsd</p>
				<input type="text" class="input">
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
<article class="popLayer b popSample2" id="popSample2">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀 타입 b</h1>
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
<article class="popLayer b popSample3" id="popSample3">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">타이틀 타입 b</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<img src="http://placeimg.com/640/640/any/5" alt="">
				<a class="btn" href="javascript:popMatching.using();">매칭</a>
				<a class="btn" href="../look/look.jsp" onclick="ui.popLayer.close('popMatching')">이동</a>
			</main>
		</div>
	</div>
</article>


<!-- 팝레이어 샘플4 아래에서 올라오는 팝업 type c -->
<article class="popLayer c popSample4" id="popSample4">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="twitter"><a href="javascript:;" class="bt">타입 c</a></li>
					<li class="katalk"><a href="javascript:;" class="bt">카카오톡</a></li>
					<li class="facebook"><a href="javascript:;" class="bt">페이스북</a></li>
					<li class="kastory"><a href="javascript:;" class="bt">카카오스토리</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>