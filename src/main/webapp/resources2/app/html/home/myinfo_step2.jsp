<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain myinfo step2">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec style">
				<div class="hdt"><em>CHOOSE YOUR <br> FAVORITE STYLE </em> </div>
				<ul class="list">
					<li><label><input type="checkbox"><span class="tit">Casual</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Girly</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Business</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Tomboy</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Chic</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Bohemian</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Sexy</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Punk</span></label></li>
					<li><label><input type="checkbox"><span class="tit">Sporty</span></label></li>
				</ul>
			</section>
			
			<section class="steps st2">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>

			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./myinfo_step3.jsp" class="btn xl b fill btnNext">NEXT</a>
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