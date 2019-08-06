<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain ver">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">앱 버전정보</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec vinfo">
				<div class="logo">FAPEE</div>
				<div class="vers">
					<div class="ver now">
						<div class="tt">현재버전</div>
						<div class="vv">1.02</div>
					</div>
					<div class="ver new">
						<div class="tt">최신버전</div>
						<div class="vv">1.03</div>
					</div>
				</div>
			</div>
			
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type b fill xl">UPDATE</a>
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