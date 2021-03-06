<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<%@ include file="../_inc/head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain mn">

		<main id="contents" class="contents">
			
			<section class="secMn tops">
				<div class="hdt"><p>Clothes <br>That fit You</p></div>
				<!--
				<div class="bts">
					<a href="javascript:popSize();" class="btSize">
						<span>사이즈를 등록하시면 <br>최적의 핏을 찾을 수 있습니다. </span>
					</a>
				</div>
				-->
			</section>
 			

			<section class="secMn post">
				<ul class="postList" id="postList">
					<li><%@ include file="../home/uiMnSet.jsp" %></li>
					<li><%@ include file="../home/uiMnSet.jsp" %></li>
					<li><%@ include file="../home/uiMnSet.jsp" %></li>
				</ul>
				<!-- <div class="uiListMore">
					<em></em>
					<a class="btMore" href="javascript:;" onclick="addItemFnc_post(this)"><em class="tt">더보기</em><i class="num">(5/20)</i></a>
				</div> -->
			</section>
			<script>
				var page_post = 0 ;
				var appendStat_post = true ;
				var addItemFnc_post = function(els){
					$thisEls = $(els).closest(".uiListMore");
					appendStat_post = false ;
					$thisEls.addClass("active");
					$.ajax({
						type: "post",
						url: "./home_more_post.jsp",
						dataType: "html",
						success: function(html) {
							window.setTimeout(function(){
								page_post ++ ;
								$("#postList").append(html).addClass("load");
								console.log("페이징 = " + page_post);
								appendStat_post = true ;
								if (page_post >= 3) {
									console.log("끝");
									$thisEls.addClass("hide");
									appendStat_post = false ;
								}
								ui.slides.mnPic.using();
								$thisEls.removeClass("active");
								
							},500);
						}
					});	
				};
			</script>

			<section class="secMn match">
				<div class="hdt"><p>Maybe it's right <br> for you</p></div>
				<!-- <div class="mats">
					<a href="javascript:;" onclick="popMatching.using();" class="dd"><em class="tt">매칭율</em><i class="nm" id="match_amount">85%</i></a>
					<a href="javascript:;" onclick="popMyStyle();" class="dd"><em class="tt">선호스타일</em><i class="nm" id="mystyle_chk">ON</i></a>
				</div> -->
				<ul class="matchList" id="matchList">
					<li>
						<div class="item"><span class="img"><a href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/1" alt=""><span class="num"></span></a></span></div>
					</li>
					<li>
						<div class="item"><span class="img"><a href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/2" alt=""></a></span></div>
					</li>
					<li>
						<div class="item"><span class="img"><a href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/3" alt=""></a></span></div>
					</li>
					<li>
						<div class="item"><span class="img"><a href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/4" alt=""></a></span></div>
					</li>
					<li>
						<div class="item"><span class="img"><a href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/5" alt=""><span class="num"></span></a></span></div>
					</li>
				</ul>
				<div class="uiListMore">
					<em></em><a class="btMore" href="javascript:;" onclick="addItemFnc_match(this)"><em class="tt">더보기</em></a>
				</div>
			</section>

			<script>
				var page_match = 0 ;
				var appendStat_match = true ;
				var addItemFnc_match = function(els){
					$thisEls = $(els).closest(".uiListMore");
					appendStat_match = false ;
					$thisEls.addClass("active");
					$.ajax({
						type: "post",
						url: "./home_more_match.jsp",
						dataType: "html",
						success: function(html) {
							window.setTimeout(function(){
								page_match ++ ;
								$("#matchList").append(html).addClass("load");
								console.log("페이징 = " + page_match);
								appendStat_match = true ;
								if (page_match >= 3) {
									console.log("끝");
									$thisEls.addClass("hide");
									appendStat_match = false ;
								}
								$thisEls.removeClass("active");
								
							},500);
						}
					});	
				};
			</script>

			<!-- 삭제 
			<section class="secMn newb">
				<div class="hdt">
					<h3>Welcome to Fapee</h3>
					<p>New Style For <br> Women</p>
				</div>
				<div class="swiper-container slideNewbie">
					<ul class="swiper-wrapper slide">
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/1" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/2" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox" checked="checked"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/2" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/3" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/4" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox" checked="checked"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/4" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox" checked="checked"><span></span></label></div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/360/360/any/4" alt=""></a></span>
								<div class="name">JENNY</div>
								<div class="foll"><label class="checkbox"><input type="checkbox" checked="checked"><span></span></label></div>
							</div>
						</li>
					</ul>
				</div>
				<div class="swiper-container slideNewup">
					<ul class="swiper-wrapper slide">
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb">
									<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/1" alt=""><span class="num"></span></a></span>
								</div>
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic"><span class="img"><img src="//placeimg.com/60/70" alt=""></span></a>
									<a href="../mypage/profile.jsp" class="mem">
										<div class="nm">JENNY</div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb">
									<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/2" alt=""><span class="num"></span></a></span>
								</div>
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic"><span class="img"><img src="//placeimg.com/60/70" alt=""></span></a>
									<a href="../mypage/profile.jsp" class="mem">
										<div class="nm">JENNY</div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb">
									<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/3" alt=""><span class="num"></span></a></span>
								</div>
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic"><span class="img"><img src="//placeimg.com/60/70" alt=""></span></a>
									<a href="../mypage/profile.jsp" class="mem">
										<div class="nm">JENNY</div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
								</div>
							</div>
						</li>
						<li class="swiper-slide">
							<div class="item">
								<div class="thumb">
									<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/4" alt=""><span class="num"></span></a></span>
								</div>
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic"><span class="img"><img src="//placeimg.com/60/70" alt=""></span></a>
									<a href="../mypage/profile.jsp" class="mem">
										<div class="nm">JENNY</div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</section>
			-->


			<section class="secMn hash">
				<div class="pgtd">
					<div class="tit">#저녁모임</div>
					<div class="bts"><a class="link" href="../common/searchTag.jsp">전체보기</a></div>
				</div>
				<ul class="hashList" id="hashList">
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/1" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/2" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/3" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/4" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/5" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/6" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/7" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/8" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li>
						<div class="item">
							<span class="img"><a class="lk" href="../look/look_view.jsp"><img src="//placeimg.com/360/480/any/9" alt=""><span class="num"></span></a></span>
						</div>
					</li>
				</ul>
			</section>

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<!-- 공지팝업 -->
		<article class="popLayer b popNotice" id="popNotice">
			<button type="button" class="btnPopClose">닫기</button>
			<div class="pbd">
				<div class="pct">
					<main class="poptents">
						<img src="//placeimg.com/640/640/any/5" alt="">
					</main>
				</div>
				<div class="pbt">
					<div class="bts">
						<a href="javascript:;" class="btn lg a btnClose" onclick="ui.popLayer.close('popNotice');">다시보지않기</a>
					</div>
				</div>
			</div>
		</article>

		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	var testRefresh = function(){
		console.log("댕겨서 새로고침");
	}

	$(document).ready(function(){
		ui.nav.act("home");  // 하단 메뉴 활성화
		ui.refresh.init(testRefresh);  //  pulldown 새로고침
		ui.popLayer.open('popNotice');
	});
	</script>

	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>