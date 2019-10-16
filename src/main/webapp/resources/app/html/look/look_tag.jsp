<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain lkreg tag">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<a href="javascript:;" class="bt save">저장</a>
				</div>
				<h1 class="tit">Tag Items</h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec tagset">
				<div class="uiPhoto">
					<div class="photo">
						<div class="pic"><img class="img" src="//placeimg.com/720/960/1" alt="사진"></div>
						<div class="uiTag" style="left: 30%; top: 30%;">
							<button class="bt" type="button">태그</button>
							<article class="pop">
								<div class="pan">
									<button class="close" type="button">닫기</button>
									<div class="info">
										<div class="name">롱코트롱코트롱코트롱코트롱코트롱코트롱코트</div>
										<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
									</div>
								</div>
							</article>
						</div>
					</div>
				</div>
			</section>


			<div class="btsTag">
				<a href="javascript:;" class="btAddTag" onclick="popSchItem();">tag items</a>
			</div>

		</main>
	</div>




	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<!-- 상품검색팝업  -->
		<article class="popLayer c popSchItem" id="popSchItem">
			<div class="pbd">
				<button type="button" class="btnPopClose">닫기</button>
				<div class="sec formSch">
					<div class="sch">
						<input type="search" class="input key" id="input_kwd"value="">
					</div>
				</div>
				<div class="pct">
					<main class="poptents">

						<div class="itemList">
							<div class="msgs">Search  Your Items</div>
							<ul class="tlist">
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="item">
										<span class="img"><span class="lk"><img src="//placeimg.com/100/120/any/1" alt=""></span></span>
										<div class="info">
											<div class="name">호피무늬 스커트</div>
											<div class="pric"><em class="w">&#92;</em><span class="p">999,999,999</span></div>
										</div>
									</a>
								</li>
							</ul>
						</div>
						

					</main>
				</div>
			</div>
		</article>

		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	function popSchItem(){
		ui.popLayer.open('popSchItem');
	};
	
	$(document).ready(function(){
		
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>