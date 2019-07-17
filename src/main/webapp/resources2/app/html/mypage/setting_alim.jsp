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
					<li><span class="tit">누가 날 팔로우할 때</span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
					<li><span class="tit">패피의 중요한 소식이 있을 때</span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
					<li><span class="tit">내 스타일을 누가 즐겨찾기했을 때 </span> <div class="uiChk"><input type="checkbox" checked="checked"><em></em></div> </li>
					<li><span class="tit">친구가 댓글을 남길 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
					<li><span class="tit">즐겨찾기한 친구가 신규 룩을 업로드 했을 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
					<li><span class="tit">팔로잉한 친구가 신규 룩을 업로드 했을 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
					<li><span class="tit">공지사항이 업로드 됐을 때</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>
					<li><span class="tit">이벤트 공지</span> <div class="uiChk"><input type="checkbox"><em></em></div> </li>					
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