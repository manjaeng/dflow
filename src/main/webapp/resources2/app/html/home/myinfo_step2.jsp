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
			<a href="javascript:;" class="btnHisback" onclick="history.back();">뒤로</a>
			<a href="javascript:;" class="btnPopClose" onclick="history.back();">뒤로</a>
			<div class="pct">
				<main class="poptents">

					<section class="sec photo">
						<div class="hdt"><em>UPLOAD YOUR <br> STYLE PHOTOS </em> </div>

						<div class="pics">
							<ul class="list">
								<li><a class="btnAdd" href="javascript:;">선택</a></li>
								<li></li>
							</ul>
						</div>
					</section>

					<section class="steps st2">
						<ul class="st">
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</section>

				</main>
			</div>
			<div class="pbt">
				<div class="in">
					<div class="bts">
						<a href="./myinfo_step3.jsp" class="btn type xl a btnNext">NEXT</a>
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