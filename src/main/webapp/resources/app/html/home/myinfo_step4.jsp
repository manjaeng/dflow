<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain myinfo step4">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<!-- <a href="javascript:history.back();" class="bt hisback">뒤로</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec coms">
				<div class="hdt"><em>LOOKING FOR <br> YOUR STYLE </em> </div>
				<div class="box">
					<div class="msgs">
						사이즈를 등록하여 <br>
						당신의 핏을 찾아보세요. <br>
						<!-- <em>30초면 충분합니다.</em>	 -->						
					</div>
					<div class="total">
						현재 <em>2,429명</em>의 <br>
						사이즈가 등록되어 있습니다.
					</div>
				</div>

			</section>			
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../home/home.jsp" class="btn xl e btnLater">LATER</a>
						<a href="javascript:ui.loading.show();" class="btn xl b fill btnStart">START</a>
					</div>
				</div>
			</div>
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