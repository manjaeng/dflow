<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain search result tag">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">#저녁모임</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="secResult">
				
				<div class="uiItemList">
					<div class="nodata">
						<div class="msg">검색기록이 존재하지 않습니다.</div>
					</div>
					<ul class="list" id="tag_list">
						<!-- ./searchTag_more.jsp -->
					</ul>
					<div class="uiLoadMore">
						<em></em> <button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
					</div>
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
	var appendStat = true ;
	var addItemFnc = function(){
		$(".uiLoadMore").addClass("active");
		page ++ ;
		$.ajax({
			type: "post",
			url: "./searchTag_more.jsp",
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#tag_list").append(html).addClass("load");
					console.log("페이징 = " + page );
					appendStat = true ;
					if (page >= 3) {
						console.log("끝");
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
						page = 0 ;
					}
					$(".uiLoadMore").removeClass("active");

				},500);
			},
			error:function(error){
				page --;
				console.log("페이징 = " + page);
				$(".uiLoadMore").removeClass("active").addClass("error");
				
			}
		});	
	};

	var look_grid_set = function(){  //  masonry 플러그인 적용
		$look_grid = $('#tag_list').masonry({
			itemSelector: '#tag_list .box',
			percentPosition: true,
			gutter:0,
			transitionDuration: 700
		});
	}


	$(document).ready(function(){

		$(window).on("scroll", function() {
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

	});


	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>