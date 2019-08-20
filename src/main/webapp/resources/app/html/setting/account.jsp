<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain account">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">연동계정</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="sec acc">
				<ul class="list">
					<li class="instar"><span class="tit">INSTARGRAM</span> <div class="uiChk"><input type="checkbox" checked><em></em></div> </li>
					<li class="kakao"><span class="tit">KAKAOTALK</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
					<li class="facebook"><span class="tit">FACEBOOK</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
				</ul>
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