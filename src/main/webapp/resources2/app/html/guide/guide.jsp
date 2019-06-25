<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>

<link href="/resources2/app/html/guide/shCore.css" rel="stylesheet">
<script src="/resources2/app/html/guide/shCore.js"></script>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
		
	<%@ include file="../_inc/head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	<div class="contain ui" id="contain">

		<main class="contents" id="contents">
			
		
			<h2 class="hdt">UI Guide</h2>

			<div class="device">
				<h3>User Agent</h3>
				<div id="userAgent"></div>
				<div id="cssStatus"></div>
				<div id="browserStatus"></div>
			</div>

			<p class="gap"></p>
			
			<p class="gap"></p>
			<a href="javascript:;" class="btn xs">버튼</a>
			<a href="javascript:;" class="btn sm">버튼</a>
			<a href="javascript:;" class="btn md">버튼</a>
			<a href="javascript:;" class="btn lg">버튼</a>
			<a href="javascript:;" class="btn xl">버튼</a>
			<a href="javascript:;" class="btn" disabled="disabled">버튼</a>
			<button type="button" class="btn" disabled="disabled">버튼</button>
			<p class="gap"></p>
			<a href="javascript:;" class="btn type a">버튼</a>
			<a href="javascript:;" class="btn type b">버튼</a>
			<a href="javascript:;" class="btn type c">버튼</a>
			<a href="javascript:;" class="btn type d">버튼</a>
			<a href="javascript:;" class="btn type e">버튼</a>
			<a href="javascript:;" class="btn type f">버튼</a>

			<p class="gap"></p>
			<div class="btnSet">
				<a href="javascript:;" class="btn">버튼</a>
			</div>
			<p class="gap"></p>
			<div class="btnSet">
				<a href="javascript:;" class="btn">버튼</a>
				<a href="javascript:;" class="btn">버튼</a>
			</div>
			<p class="gap"></p>
			<div class="btnSet fit">
				<a href="javascript:;" class="btn type a">버튼</a>
				<a href="javascript:;" class="btn type d">버튼</a>
			</div>

			<div class="codeBox">
				<div class="code">
					<pre class="brush: html">
						<a href="javascript:;" class="btn xs">버튼</a>
						<a href="javascript:;" class="btn sm">버튼</a>
						<a href="javascript:;" class="btn md">버튼</a>
						<a href="javascript:;" class="btn lg">버튼</a>
						<a href="javascript:;" class="btn xl">버튼</a>
						<a href="javascript:;" class="btn" disabled="disabled">버튼</a>
						<button class="btn" disabled="disabled">버튼</button></pre>
				</div>
			</div>
			

			<section class="codeBox"> 
				<div class="code">
					<div class="bts">
						<a class="btn" href="javascript:ui.popLayer.open('popSample1');">팝레이어1</a>
						<a class="btn" href="javascript:ui.popLayer.open('popSample2');">팝레이어2</a>
						<a class="btn" href="javascript:ui.popLayer.open('popSample3');">팝레이어3</a>
					</div>
					<pre class="brush: js">
						ui.popLayer.open('popSample1'); // 팝레이어열기
						ui.popLayer.close('popSample1'); // 팝레이어닫기
						ui.popLayer.refresh('popSample1'); // 팝스크롤새로고침</pre>
				</div>	
			</section>
			<script>
				$(document).ready(function(){

					// 레이어팝업 열기 콜백
					ui.popLayer.open.popSample1 = function(){
						console.log("popSample1 열기");
					}
					// 레이어팝업 닫기 콜백
					ui.popLayer.close.popSample1 = function(){
						console.log("popSample1 닫힘");
					}
				});
			</script>

			<section class="codeBox">
				<div class="code">
					<div class="bts">
						<a class="btn" href="javascript:alert_sample();">알럿</a>
						<a class="btn" href="javascript:confirm_sample();">컨펌</a>
					</div>
					<pre class="brush: js">
					ui.alert({  // 알럿창 띄우기
						msg:'<p>알럿 메시지<br> 입니다.</p>' ,
						ycb:function(){
							console.log('알럿확인결과');
						},
						ybt:'확인'	
					});	

					ui.confirm({ // 컨펌 창 띄우기
						msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
							'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
						ycb:function(){
							console.log('컨펌확인결과');
						},
						ncb:function(){
							console.log('컨펌취소결과');
						},
						ybt:'로그인하기',
						nbt:'닫기'	
					});</pre>
				</div>	
			</section>

			<section class="codeBox">
				<div class="code">
					<div class="bts">
						<a class="btn" href="javascript:toast_sample1();">토스트1</a>
						<a class="btn" href="javascript:toast_sample2();">토스트2</a>
					</div>
					<pre class="brush: js">
						ui.toast({  // 토스트 창띄우기
							msg:'<p>토스트메시지입니다.</p>', // 메시지(HTML)
							cls:'wish', // null, 'wish' , 'cart'
							sec:1500 // 사라질 시간
						});</pre>
				</div>
			</section>
			<script>
			var confirm_sample = function(){
				ui.confirm({ // 컨펌 창 띄우기
					msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
						'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
					ycb:function(){
						console.log('컨펌확인결과');
					},
					ncb:function(){
						console.log('컨펌취소결과');
					},
					ybt:'로그인하기',
					nbt:'닫기'	
				});
			}
			var alert_sample = function(){
				ui.alert({  // 알럿창 띄우기
					msg:'<p>등록이 완료 되었습니다.</p>' ,
					ycb:function(){
						console.log('알럿확인결과');
					},
					ybt:'확인'	
				});
			}
			var toast_sample1 = function(){
				ui.toast({   // 토스트 창띄우기
					msg:'<p>토스트메시지입니다.</p>',
					cls:'type a',
					sec:1500
				});
			}
			var toast_sample2 = function(){
				ui.toast({   // 토스트 창띄우기
					msg:'<p>토222스트메시지입니다.</p>',
					cls:'type b',
					sec:1500,
					bot:50
				});
			}
			</script>

			<p class="gap"></p>
			
			<input type="text" placeholder="텍스트">								<p class="gap"></p>
			
			<input type="text" class="valid" placeholder="텍스트">					<p class="gap"></p>
			
			<input type="text" class="valid ok" placeholder="텍스트 ok">			<p class="gap"></p>
			
			<input type="text" class="valid no" placeholder="텍스트 no">			<p class="gap"></p>
			
			<input type="password" class="valid" placeholder="비밀번호">			<p class="gap"></p>
			
			<input type="text" readonly="readonly" value="readonly">				<p class="gap"></p>
			
			<input type="text" disabled="disabled" value="disabled">				<p class="gap"></p>
			
			<textarea class="textarea" placeholder="내용"></textarea>				<p class="gap"></p>
			
			<select class="select">
				<option>선택</option>
			</select>
																					<p class="gap"></p>
			<select class="select" disabled="disabled">
				<option>선택</option>
			</select>
																					<p class="gap"></p>
			<div class="uiSchIpt">
				<input type="search" placeholder="검색어를 입력하세요">
				<button type="button" class="sch"></button>
			</div>

			<p class="gap"></p>

			<span class="uiAddFile" data-ui="attach">
				<span class="file">
					<input type="text" class="loc" readonly="readonly" value="" placeholder="첨부파일">
					<button type="button" class="delete">삭제</button>
				</span>
				<span class="btnAttach">
					<label class="fileButton">찾기<input type="file" class="fileInput" accept="*/*"></label>
				</span>
				<ul class="file"></ul>
			</span>

			<p class="gap"></p>

			<span class="uiAttach" data-ui="attach" data-max-size="3">
				<span class="btnAttach">
					<label class="fileButton">사진추가<input type="file" class="fileInput" accept="image/*"></label>
				</span>
				<ul class="file"></ul>
			</span>

			
			<p class="gap"></p>
			
			<label class="checkbox"><input type="checkbox"><span>첵크박스</span></label>

			<label class="checkbox"><input type="checkbox" checked="checked"><span>첵크박스</span></label>
			<label class="checkbox"><input type="checkbox" checked="checked" disabled="disabled"><span></span></label>
			<label class="checkbox"><input type="checkbox" disabled="disabled"><span></span></label>

			<p class="gap"></p>

			<label class="radio"><input type="radio" name="radio1"><span>라디오</span></label>
			<label class="radio"><input type="radio" name="radio1" checked="checked"><span>라디오</span></label>
			<label class="radio"><input type="radio" name="radio2" checked="checked" disabled="disabled"><span></span></label>
			<label class="radio"><input type="radio" name="radio2" disabled="disabled"><span></span></label>

			<p class="gap"></p>
			
			<label class="checkbox"><input type="checkbox" data-check="all" data-check-id="checkTest1"><span>전체선택</span></label>
			<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택1</span></label>
			<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택2</span></label>
			<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택3</span></label>
			
			<p class="gap"></p>
			
			<div class="uiChk"><input type="checkbox" checked="checked"><em></em></div>
			<div class="uiChk"><input type="checkbox" checked="checked" disabled="disabled"><em></em></div>

			<section class="codeBox">
				<div class="code">
					<pre class="brush: html">
						<label class="checkbox"><input type="checkbox" data-check="all" data-check-id="checkTest1"><span>전체선택</span></label>
						<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택1</span></label>
						<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택2</span></label>
						<label class="checkbox"><input type="checkbox" data-check="check" data-check-id="checkTest1"><span>선택3</span></label></pre>
				</div>
			</section>

			<section class="codeBox">
				<div class="code">
					<div class="bts">
						<a class="btn" href="javascript:ui.loading.show();">로딩열기</a>
						<a class="btn loadingClose" href="javascript:ui.loading.hide();">로딩닫기</a>
					</div>
					<pre class="brush: js">
						ui.loading.show(); // 로딩열기
						ui.loading.hide(); // 로딩닫기 </pre>
				</div>
			</section>

			<div class="uiDate"><input type="text"  placeholder="YYYY-MM-DD" class="datepicker" readonly="readonly"></div>
			<p class="gap"></p>
						
			<ul class="uiTab type a">
				<li class="active"><a href="javascript:;">탭메뉴1</a></li>
				<li><a href="javascript:;">탭메뉴2</a></li>
			</ul>
			
			<p class="gap"></p>

			<ul class="uiTab type a">
				<li class="active"><a href="#tabPanelA1">탭메뉴1</a></li>
				<li class=""><a href="#tabPanelA2">탭메뉴2</a></li>
			</ul>
			<div class="uiTabPan">
				<div class="panel active" id="tabPanelA1">
					<p><a href="javascript:;">탭내용1</a></p>
				</div>
				<div class="panel" id="tabPanelA2">
					<p><a href="javascript:;">탭내용2</a></p>
				</div>
			</div>

			<div class="codeBox">
				<div class="code">
					<pre class="brush: html">
						<ul class="uiTab type b">
							<li class="active"><a href="#tabPanelA1">탭메뉴1</a></li>
							<li><a href="#tabPanelA2">탭메뉴2</a></li>
						</ul>
						<div class="uiTabPan">
							<div class="panel active" id="tabPanelA1">탭내용1</div>
							<div class="panel" id="tabPanelA2">탭내용2</div>
						</div></pre>
				</div>
			</div>


			<p class="gap"></p>
			<!-- 아코디언형 -->
			<ul class="uiAccd" data-accd="accd">
				<li class="open">
					<div class="hBox"> 아코디언 UI Accd <button type="button" class="btnTog">버튼</button></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
				<li>
					<div class="hBox"> 아코디언 UI Accd <button type="button" class="btnTog">버튼</button></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
				<li class="except">
					<div class="hBox"> 아코디언 UI Accd 제외 <button type="button" class="btnTog">버튼</button></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
			</ul>
			<p class="gap"></p>
			<!-- 토글형 -->
			<ul class="uiAccd" data-accd="tog">
				<li class="open">
					<div class="hBox"> 아코디언 UI Tog <a class="btnTog" href="javascript:;">버튼</a></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
				<li>
					<div class="hBox"> 아코디언 UI Tog <a class="btnTog" href="javascript:;">버튼</a></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
				<li class="except">
					<div class="hBox"> 아코디언 UI Tog 제외 <div class="btnTog" href="javascript:;">버튼</div></div>
					<div class="cBox">내용 내용 내용 <br> 내용</div>
				</li>
			</ul>
			<div class="codeBox">
				<div class="code">
					<pre class="brush: html">
						<ul class="uiAccd" data-accd="accd">
							<li class="open">
								<div class="hBox">타이틀 <button type="button" class="btnTog">버튼</button></div>
								<div class="cBox">내용</div>
							</li>
							<li>
								<div class="hBox">타이틀 <button type="button" class="btnTog">버튼</button></div>
								<div class="cBox">내용</div>
							</li>
							<li class="except">
								<div class="hBox">타이틀 <button type="button" class="btnTog">버튼</button></div>
								<div class="cBox">내용</div>
							</li>
						</ul></pre>
				</div>
			</div>

			<p class="gap"></p>

			<div class="slideSample1">
				<div class="swiper-container">
					<ul class="swiper-wrapper slide">
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/1" alt=""></span></a></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/2" alt=""></span></a></div>
							</div>
						</li>
					</ul>
					<div class="pagination"></div>
					<div class="navigation">
						<button type="button" class="nav prev">이전</button>
						<button type="button" class="nav next">다음</button>
					</div>
				</div>
			</div>

			<p class="gap"></p>

			<div class="slideSample2">
				<div class="swiper-container">
					<ul class="swiper-wrapper slide">
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/10" alt=""></span></a></div>
								<div class="info">
									<div class="name">뉴욕양키스 액센트 커브조절캡</div>
									<div class="prc"><em class="p">59,000원</em></div>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/11" alt=""></span></a></div>
								<div class="info">
									<div class="name">뉴욕양키스 액센트 커브조절캡</div>
									<div class="prc"><em class="p">59,000원</em></div>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/12" alt=""></span></a></div>
								<div class="info">
									<div class="name">뉴욕양키스 액센트 커브조절캡</div>
									<div class="prc"><em class="p">59,000원</em></div>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb"><a href="javascript:;"><span class="img"><img src="//placeimg.com/720/720/13" alt=""></span></a></div>
								<div class="info">
									<div class="name">액센트 커브조절캡</div>
									<div class="prc"><em class="p">59,000원</em></div>
								</div>
							</div>
						</li>
					</ul>              
				</div>
			</div>

			<script>
			$(document).ready(function(){
				// http://idangero.us/swiper/api/
				// ui.slides.sample1.slide.on('slideChange', function () {
				// 	console.log('cmRecom slideChange');
				// });
			});
			</script>
			<p class="gap"></p>

			<div style="border:#cccccc solid 1px; padding:10px 15px ;">
				<h4>블릿타입A ul.bullet.type.a</h4>	
				<ul class="bullet type a">
					<li>도로명을 입력하세요.  예) 중앙로, 불정로432번길 도로명을 입력하세요.도로명을 입력하세요.  예) 중앙로, 불정로432번길 도로명을 입력하세요.도로명을 입력하세요.  예) 중앙로, 불정로432번길 도로명을 입력하세요.</li>
					<li>동/읍/면/리 이름을 입력하세요.  예) 역삼동, 화도읍, 장유면</li>
				</ul>
				<h4>블릿타입B ul.bullet.type.b</h4>	
				<ul class="bullet type b">
					<li>사진은 2MB 미만의 JPG, PNG, GIF 형식으로 업로드 가능합니다.</li>
					<li>파일명은 영문과 숫자로 작성해 주시기 바랍니다.</li>
				</ul>
			</div>

			<p class="gap"></p>

			<section class="uiItemList">
				<ul class="list" id="dp_list"></ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="itemListAdd()" id="btnListMore">불러오기</button>
				</div>
			</section>

			<script>
			$(document).ready(function(){
				ui.listMore.init(itemListAdd);
			});

			var page = 0;
			var itemListAdd = function(){
				ui.listLoad.attach(); // 로딩이미지 Show
				$("#btnListMore").prop("disabled",true);
				if( ui.listMore.active ){
					ui.listMore.active = false;
					ui.listMore.using();
					page ++;
					window.setTimeout(function(){
						$.ajax({
							type: "post",
							url: "./list_more.jsp",
							dataType: "html",
							success: function(html) {
								$("#dp_list").append(html).addClass("load");
								$("#btnListMore").prop("disabled",false);
								ui.listLoad.detach();
								ui.listMore.active = true;
								console.log("페이징 = " + page);
								$("#debug").html("페이징 = " + page );
								if (page >= 3) {
									console.log("끝");
									ui.listMore.removeEvent();
								}
							},
							error:function(error){
								page --;
								console.log("페이징 = " + page);
								console.log("에러 = " + error.readyState);
								ui.listLoad.error();
								$("#btnListMore").prop("disabled",false);
							}
						});
					},1000);
				}
			};
			</script>

		</main>
	
	</div>

	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<nav class="floatNav">
		<button type="button" class="bt refresh">Refresh</button>
		<button type="button" class="bt top">TOP</button>
	</nav>
	
	<!--// 컨텐츠 끝 -->

	<%@ include file="../_inc/menubar.jsp" %>

	
</div>


<div id="debug"></div>


<script>
var html = document.documentElement;
function showInfo() {
	$('#cssStatus').html(html.className);
	$('#browserStatus').html('Client Size : ' + html.clientWidth + 'x' + html.clientHeight + ', Orientation : ' + window.orientation);
}
$(function() {
	$('#userAgent').html(navigator.userAgent);
	$(document.body).bind('orientationchange', showInfo);
	$(window).bind('orientationchange', showInfo);
	$(window).bind('resize', showInfo);
});
</script>

<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>