<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	
	<article class="popLayer type a popLogin" id="popLogin">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit">레이어팝업</h1>
					<button type="button" class="btnPopClose">닫기</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
					<p>sdfsdfsfsd</p>
				</main>
			</div>
		</div>
	</article>
	<script>
	$(document).ready(function(){
		ui.popLayer.open('popLogin');
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<button type="button" class="btn" onclick="ui.popLayer.open('popLogin');" >ui.popLayer.open('popLogin');</button>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>