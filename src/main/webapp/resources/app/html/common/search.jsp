<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain search popSearch">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">SEARCH</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="sec formSch">
				<div class="sch">
					<input type="search" class="input key" id="input_kwd" placeholder="#@" value="">
					<a href="javascript:;" class="bt sch">SEARCH</a>			
					<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
				</div>
			</div>

			<div class="tags">
				<ul class="tg">
					<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#유니크스타일</em> </a></li>
					<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#톰보이스타일</em> </a></li>
					<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#호피무늬</em> </a></li>
				</ul>
			</div>

			<div class="recent">
				<div class="ht">RECENT</div>
				<ul class="list">
					<li>
						<div class="box">
							<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
							<span class="date">2019.07.01</span>
							<a href="javascript:;" class="del">삭제</a>
						</div>
					</li>
					<li>
						<div class="box">
							<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
							<span class="date">2019.07.01</span>
							<a href="javascript:;" class="del">삭제</a>
						</div>
					</li>
					<li>
						<div class="box">
							<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
							<span class="date">2019.07.01</span>
							<a href="javascript:;" class="del">삭제</a>
						</div>
					</li>
					<li>
						<div class="box">
							<a href="../common/searchResult.jsp" class="kwd">TOMBOY</a>
							<span class="date">2019.07.01</span>
							<a href="javascript:;" class="del">삭제</a>
						</div>
					</li>
					<li class="nodata">
						<div class="msg">검색기록이 존재하지 않습니다.</div>
					</li>
				</ul>
			</div>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	$(document).ready(function(){
		ui.nav.act("look");  // 하단 메뉴 활성화
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>