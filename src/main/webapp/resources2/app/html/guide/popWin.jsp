<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<!-- 아직 미사용 케이스 형태 -->
	<article class="popLayer win type a popSample1" id="popSample1">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit">윈도우 팝업</h1>
					<button type="button" class="btnPopClose" onclick="window.self.close();">닫기</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
					<input type="text">
					<p>내용</p>
					<input type="text">
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
					
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