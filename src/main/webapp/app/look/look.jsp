<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<%@ include file="../_inc/head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain look list">
		<main id="contents" class="contents">
			<section class="secLookWrap">
				<ul class="lookList" id="lookList"></ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</section>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>


	<script>
		
		var page = 0 ;
		appendStat = true ;
		addItemFnc = function(){
			appendStat = false ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "/app/look/look_more.jsp",
				dataType: "html",
				success: function(html) {
					window.setTimeout(function(){
						page ++ ;
						$("#lookList").append(html);
						$("#btnListMore").prop("disabled",false);
						console.log("페이징 = " + page);
						appendStat = true ;
						if (page >= 3) {
							console.log("끝");
							$(".uiLoadMore").hide();
							appendStat = false ;
						}
						ui.slides.lookPic.using();
						$(".uiLoadMore").removeClass("active");
						
					},500);
				}
			});	
		};

		$(window).on("scroll", function() { // 바닥 확인

			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			// console.log(docH,scr);
			if (docH <= scr  && appendStat == true) {
				console.log("바닥sss");
				addItemFnc();
				appendStat = false;
			}
		});

		addItemFnc();


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