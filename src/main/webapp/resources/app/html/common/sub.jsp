<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain mn">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="hisback">뒤로</a>
				</div>
				<h1 class="tit">Titles</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
			내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>내용 <br>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	$(document).ready(function(){
		ui.menu.nav("home");  // 하단 메뉴 활성화
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>