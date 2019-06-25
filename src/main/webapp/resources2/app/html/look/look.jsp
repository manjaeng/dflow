<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<%@ include file="../_inc/head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain look">
		<main id="contents" class="contents">
			<section class="secLookWrap">
				<ul class="lookList" id="lookList"></ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="itemListAdd()" id="btnListMore">불러오기</button>
				</div>
			</section>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>


	<script>
	$(document).ready(function(){
		ui.listMore.init(itemListAdd);
	});

	var page = 0;
	var itemListAdd = function(){
		ui.listLoad.attach(); // 로딩이미지 Show
		$("#btnListMore").prop("disabled",true);
		if( ui.listMore.active ){
			ui.listMore.active = false;
			ui.listMore.using();
			page ++;
			window.setTimeout(function(){
				$.ajax({
					type: "post",
					url: "./look_more.jsp",
					dataType: "html",
					success: function(html) {
						$("#lookList").append(html);
						$("#btnListMore").prop("disabled",false);
						ui.listLoad.detach();
						ui.listMore.active = true;
						console.log("페이징 = " + page);
						if (page >= 3) {
							console.log("끝");
							ui.listMore.removeEvent();
						}
						setTimeout(function(){

						},500);
							ui.slides.lookPic.using();
					},
					error:function(error){
						page --;
						console.log("페이징 = " + page);
						console.log("에러 = " + error.readyState);
						ui.listLoad.error();
						$("#btnListMore").prop("disabled",false);
					}
				});
			},1000);
		}
	};
	</script>
	

	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>