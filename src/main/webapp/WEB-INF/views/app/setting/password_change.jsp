<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain pwmod">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">비밀번호 변경</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="findForm">
				<div class="form">
					<form>
						<div class="uiIptPlc pw now">
							<input type="password" class="input" id="pw_now">
							<span class="plc">현재비밀번호 입력</span>
						</div>
						<div class="uiIptPlc pw new">
							<input type="password" class="input" id="pw_new">
							<span class="plc">변경비밀번호 입력</span>
						</div>
						<div class="uiIptPlc pw com">
							<input type="password" class="input" id="pw_re">
							<span class="plc">비밀번호 확인</span>
						</div>
						<div class="msg_error" id="msg_check">비밀번호가 일치하지 않습니다.</div>
						<div class="msgs">* 영문숫자조합 6자 이상 조합으로 가능합니다. </div>
					</form>
				</div>
			</div>
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type b fill xl">DONE</a>
					</div>
				</div>
			</section>

		</main>
	</div>

	<div class="popLayerArea">
		<!-- 필터 -->
<article class="popLayer a popFilter" id="popFilter">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">FILTER</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="filters">
					<li class="match">
						<div class="ht">MATCH</div>
						<div class="ct">
							<div class="uiSlider range">
								<div class="match" id="filtMatchSlider" data-amount-min="65"  data-amount-max="100" >
									<div class="ui-slider-handle"></div>
									<div class="range_amount"></div>
								</div>
							</div>
						</div>
					</li>
					<li class="style">
						<!-- <div class="ht">STYLE</div> -->
						<div class="ct">
							<ul class="list">
								<li>
									<label><input type="checkbox"><span class="tit">Casual</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Girly</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Tomboy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Business</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Chic</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Bohemian</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sexy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Punk</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sporty</span></label>
								</li>
							</ul>
						</div>
					</li>
					<!-- <li class="keyword">
						<div class="ct">
							<input type="search" class="input key" placeholder="검색어 입력">
						</div>
					</li>
					<li class="gender">
						<div class="ht">성별</div>
						<div class="ct">
							<label class="radio"><input type="radio" name="filter_gender"><span>여자</span></label>
							<label class="radio"><input type="radio" name="filter_gender"><span>남자</span></label>
						</div>
					</li>
					<li class="country">
						<div class="ht">국가</div>
						<div class="ct">
							<select class="select">
								<option>Korea</option>
								<option>Korea</option>
							</select>
						</div>
					</li> -->
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl d btnSave" href="javascript:;" onclick="ui.popLayer.close('popFilter');">SAVE</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popFilter = function(){
	ui.popLayer.open('popFilter',{
		ocb: function(){
			ui.filter.init();	
		}
	});
	
};
</script>

<!-- 사이즈 -->
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
								<c:forEach begin="15" end="60" var="i">
									<option><c:out value="${i}"/></option>
								</c:forEach>
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
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">A</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">B</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">C</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">D</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">E</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">F</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">G</span></label></li>
									<li class="swiper-slide"><label><input type="radio" name="size_bra"><span class="tit">H</span></label></li>
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
						<div class="ht">BOTTOM</div>
						<div class="ct">
							<div class="slideSize bot swiper-container">
								<ul class="list bot swiper-wrapper slide">

									<c:forEach begin="20" end="39" var="i">
										<li class="swiper-slide">
											<label><input type="radio" name="size_bott">
												<span class="tit"><c:out value="${i}"/></span>
											</label>
										</li>
									</c:forEach>									
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

<!-- 검색 -->
<article class="popLayer a popSearch" id="popSearch">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">SEARCH</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<div class="sec formSch">
					<div class="sch">
						<input type="search" class="input key" id="input_kwd" placeholder="#@" value="">
						<a href="javascript:;" class="bt sch">SEARCH</a>			
						<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
					</div>
				</div>

				<div class="tags">
					<ul class="tg">
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#유니크스타일</em> </a></li>
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#톰보이스타일</em> </a></li>
						<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#호피무늬</em> </a></li>
					</ul>
				</div>

				<div class="recent">
					<div class="ht">RECENT</div>
					<ul class="list">
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li class="nodata">
							<div class="msg">검색기록이 존재하지 않습니다.</div>
						</li>
					</ul>
				</div>
				
			</main>
		</div>
	</div>
</article>
<script>
var popSearch = function(){
	ui.popLayer.open('popSearch',{
		ocb: function(){
			ui.filter.match();	
		}
	});
	
};
$(document).ready(function(){
	// popSearch();

	// $(document).on("keyup","#input_kwd",function (e) {
	// 	if( e.keyCode == 13 ) {
	// 		window.location.href = '../common/searchResult.jsp';
	// 	}
	// });
	// $(document).on("click","#btSchCancel",function (e) {

	// 	$("#input_kwd").val("")

	// });



});
</script>


<!--  추가 메뉴 popOthers -->
<article class="popLayer c popOthers" id="popOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt">EDIT</a></li>
					<li class="st"><a href="javascript:;" class="bt">DELETE</a></li>
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popOthers');">COPY LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" class="bt" onclick="popShare(); ui.popLayer.close('popOthers');">SHARE</a></li>
					<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popOthers');">REPORT</a></li>
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
					<li class="st"><a href="javascript:postReport(1);" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s Spam</a></li>
					<li class="st"><a href="javascript:postReport(2);" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s appropriate</a></li>
				</ul>
			</main>
		</div>
	</div>
</article>
<script>
var postReport = function(status) {
	var postUrl = "/app/home/report.do";

	fp.util.jsonAjax({
		url:postUrl,
		data : {
			idKey : fp.data.targetIdKey,
			detail : status,
			type : fp.data.reportType,
			userIdKey : '${sessionScope.__sessiondata__.idKey}'
		},
		success:function() {
			/* alert("success"); */
		},
		error:function() {
			/* alert("error"); */
		}
	});
}

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
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popPrfOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" onclick="popShare(); ui.popLayer.close('popPrfOthers');" class="bt">SHARE</a></li>
					<c:if test="${!isMyProfile}">
						<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popPrfOthers');">REPORT</a></li>
					</c:if>
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
			console.log("11");
		}
	});
};
</script>






<!-- 공유하기 팝업 -->
<article class="popLayer c popShare" id="popShare">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li class="twitter"><a href="javascript:;" class="bt">TWITTER</a></li>
					<li class="katalk"><a href="javascript:;" class="bt">KAKAOTALK</a></li>
					<li class="facebook"><a href="javascript:;" class="bt">FACEBOOK</a></li>
					<li class="kastory"><a href="javascript:;" class="bt">KAKAOSTORY</a></li>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popShare(){
	// ui.popLayer.open('popShare',{
	// 	ocb:function(){
	// 		// ui.popLayer.close('popPrfOthers');
	// 		console.log("공유하기 열림");
	// 	},
	// 	ccb:function(){
	// 		console.log("공유하기 닫힘");
	// 	}
	// });
};
</script>



<script>
function testUrlCopy() {
	// 클립보드로 복사하는 기능을 생성
	var aux = document.createElement("input"); // 글을 쓸 수 있는 란을 만든다.
	aux.setAttribute("value", window.location.href); // 지정된 요소의 값을 할당 한다.
	document.body.appendChild(aux); // bdy에 추가한다.
	aux.select(); // 지정된 내용을 강조한다.
	document.execCommand("copy"); // 텍스트를 카피 하는 변수를 생성
	document.body.removeChild(aux); // body 로 부터 다시 반환 한다.
	console.log(aux.value);

	ui.toast({msg:'<p>Link copied to clipboard</p>'});
}
</script>




<!-- 프로필사진변경 -->
<article class="popLayer c popPrfPicMod" id="popPrfPicMod">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:openPhotoMulti()" class="bt">CHANGE PHOTO</a></li>
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
	</div>

	<script>
		$(function() {
			$('.fit a').click(function() {
				
				$("#pw_now ,#pw_new, #pw_re").removeClass("no");
				
				var $pw_now = $.trim($('.pw input').eq(0).val()),
					$pw_new = $.trim($('.pw input').eq(1).val()),
					$pw_re  = $.trim($('.pw input').eq(2).val());
				
				if($pw_now.length === 0) {
					$("#pw_now").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(0)').focus();
					return false;
				}
				
				if($pw_new.length === 0) {
					$("#pw_new").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				if($pw_re.length === 0) {
					$("#pw_re").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(2)').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('pw',$pw_new)) {
					$("#pw_new, #pw_re").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('6자이상 영문숫자조합으로 입력해주세요.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				if($pw_new !== $pw_re) {
					$("#pw_re").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호가 일치하지 않습니다.');
					$('.pw input:eq(2)').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/setting/password_change.do',
					data : JSON.stringify({
						'password' : $pw_now,
						'password_new' : $pw_new
					}),
					contentType : 'application/json; charset=utf-8',
					success: function(data) {
						
						if (data === 'noSession') {
							alert('계정 연결 끊김');
						} else if(data === 'mismatch') {
							$("#pw_now").addClass("no").val('');
							$('#msg_check').addClass('show');
							$('#msg_check').text('비밀번호가 일치하지 않습니다.');
							$('.pw input:eq(0)').focus();
						} else if(data === 'success') {
							history.back();
						}
					}
				});
				
				return false;
			});
			
			$('#pw_re').keypress(function(e) {
				if(e.keyCode == 13) {
					$('.fit a').trigger('click');
				}
			});
		});
	</script>
	
</div>