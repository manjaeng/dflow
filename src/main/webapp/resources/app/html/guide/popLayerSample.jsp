<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popLayer type a popSample2" id="popSample2">
		<div class="pbd">
			<div class="phd">
				<h1 class="tit">레이어팝업</h1>
				<button type="button" class="close">닫기</button>
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
			<div class="pbt">
				<div class="bts">
					<a href="javascript:;" class="btn type e">버튼</a>
					<a href="javascript:;" class="btn type a">버튼</a>
				</div>
			</div>
		</div>
	</article>
	<script>
	$(document).ready(function(){
		ui.popLayer.open('popSample2');
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<button type="button" class="btn" onclick="ui.popLayer.open('popSample2');" >ui.popLayer.open('popSample2');</button>
	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>