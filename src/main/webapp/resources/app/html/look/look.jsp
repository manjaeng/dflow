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
			<section class="secLk look">
				<div class="welcome" style="display: none;">
					<div class="msg">
						<h2 class="tit">WELCOME TO FAPEE</h2>
						<p class="txt">
							When you follow people, <br>
							You’ll see the fashions <br>
							they post here.
						</p>
					</div>
				</div>
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
				url: "./look_more.jsp",
				dataType: "html",
				success: function(html) {
					window.setTimeout(function(){
						page ++ ;
						$("#lookList").append(html).addClass("load");
						console.log("페이징 = " + page);
						appendStat = true ;
						if (page >= 3) {
							console.log("끝");
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						}
						ui.slides.lookPic.using();
						ui.look.elip.using();
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

		var testRefresh = function(){
			console.log("댕겨서 새로고침");
		}

		$(document).ready(function(){
			ui.nav.act("look");  // 하단 메뉴 활성화
			ui.refresh.init(testRefresh);  //  pulldown 새로고침
		});


	</script>
	

	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>