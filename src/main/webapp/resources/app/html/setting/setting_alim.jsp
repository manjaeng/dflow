<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain setalim">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">알림설정</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec alim">



				<ul class="list">
					<li>
						<ul>
							<li><span class="tit">내가 올린 LOOK에 대한 댓글 </span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
							<li><span class="tit">내가 남긴 댓글에 대한 댓글</span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
							<li><span class="tit">내가 COOL 누른 게시물의 댓글 </span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="tit">타인이 나를 팔로우 할 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
							<li><span class="tit">타인이 나의 LOOK에 COOL을 누를 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="tit">앱 공지사항</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
							<li><span class="tit">앱 내 이벤트 알림</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
						</ul>
					</li>
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