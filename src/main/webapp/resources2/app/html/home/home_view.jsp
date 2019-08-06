<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<%@ include file="../_inc/head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain mn veiw">
		<main id="contents" class="contents">
			<section class="secLk look mn">
				<ul class="lookList">
					<li><%@ include file="../look/uiLkSet.jsp" %></li>
				</ul>
			</section>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>


	$(document).ready(function(){
		ui.nav.act("home");  // 하단 메뉴 활성화
	});

	
	</script>
	<script>

    </script>
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>