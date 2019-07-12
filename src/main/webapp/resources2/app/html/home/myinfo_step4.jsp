<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popPage popMysize" id="popMysize">
		<div class="pbd">
			<!-- <a href="javascript:;" class="btnHisback" onclick="history.back();">뒤로</a> -->
			<!-- <a href="javascript:;" class="btnPopClose" onclick="history.back();">뒤로</a> -->
			<div class="pct">
				<main class="poptents">

					<section class="sec coms">
						<div class="hdt"><em>LOOKING FOR <br> YOUR STYLE </em> </div>
						<div class="box">
							<div class="msgs">
								사이즈를 등록하여 <br>
								당신의 핏을 찾아보세요. <br>
								<em>30초면 충분합니다.</em>							
							</div>
							<div class="total">
								현재 <em>2,429명</em>의 <br>
								사이즈가 등록되어 있습니다.
							</div>
						</div>

					</section>

				</main>
			</div>
			<div class="pbt">
				<div class="in">
					<div class="bts">
						<a href="../home/home.jsp" class="btn type xl a btnLater">LATER</a>
						<a href="../member/joinPre.jsp" class="btn type xl a btnStart">START</a>
					</div>
				</div>
			</div>
		</div>
	</article>


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