<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain review my cate">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<div class="forms">
				<ul class="list">
					<li class="items">
						<div class="ht">ITEM</div>
						<div class="ct">
							<div class="item">
								<span class="img"><a class="pic" href="javascript:;"><img src="//placeimg.com/360/360/any/2" alt=""></a></span>
								<div class="info">
									<div class="tit">Product NAme</div>
									<div class="desc">
										<span class="prc"><em class="w">\</em><span class="p">38,000</span></span>
										<span class="name">@blurryellow55</span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="text">
						<div class="ht">DETAIL</div>
						<div class="ct">
							<div class="num on">MAX 250</div>
							<textarea class="textarea"></textarea>
						</div>
					</li>
				</ul>
			</div>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../setting/review.jsp" class="btn type b fill xl">DONE</a>
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
		
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>