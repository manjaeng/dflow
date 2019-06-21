<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popLayer type b popSample2" id="popSample2">
		<div class="pbd">
			<button type="button" class="btnPopClose">닫기</button>
			<div class="phd">
				<div class="in">
					<h1 class="tit">레이어팝업</h1>
					<button type="button" class="btnPopClose">닫기</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
					<p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p><p>내용</p>
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
	
	<!--// 컨텐츠 끝 -->
	
	<div class="btnGuide">
		<div>레이어팝업</div>
		<button type="button" onclick="ui.popLayer.open('popSample2');" >ui.popLayer.open('popSample2');</button>
	</div>
	<script>$(document).ready(function(){	ui.popLayer.open('popSample2');} );</script>
	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>