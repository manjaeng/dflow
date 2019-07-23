<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain comment">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">COMMENTS</h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec comt">
				
				<ul class="list" id="comment_list">
					
				</ul>

				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
				
			</section>

			<section class="sec write">
				<div class="box">
					<div class="pic"><div class="img"><img src="//placeimg.com/72/96/1" alt="사진"></div></div>
					<div class="write">
						<input type="text" class="ment" placeholder="댓글달기" id="input_reply">
						<a href="javascript:;" class="send">SEND</a>
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
			url: "./comments_more.jsp",
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#comment_list").append(html).addClass("load");
					console.log("페이징 = " + page);
					appendStat = true ;
					if (page >= 3) {
						console.log("끝");
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					}
					$(".uiLoadMore").removeClass("active");
					comtActFnc();
				},500);
			},
			error:function(error){
				page --;
				console.log("페이징 = " + page);
				$(".uiLoadMore").removeClass("active").addClass("error");
				
			}
		});	
	};


	var testFncRply = function(){
		$("#input_reply").focus().val("@JENNY ");
	}

	$(document).ready(function(){

		$(window).on("scroll", function() {

			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $(".contain.comment .sec.write").outerHeight() + 30;
			// console.log(docH,scr);
			if (docH <= scr  && appendStat == true) {
				console.log("바닥sss");
				addItemFnc();
				appendStat = false;
			}
		});

		addItemFnc();


	});

	var comtActFnc = function(){
		// $("#comment_list>li , #comment_list>li>ul.list.r2>li ").listSwipe({
		// 	itemSelector: '>.comts',
		// 	leftAction: false,
		// 	itemActionWidth: 100,
		// 	snapThreshold: 0.1
		// });
	}

	</script>
	


	<!--// 컨텐츠 끝 -->
	

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>