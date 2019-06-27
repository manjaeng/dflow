<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain filter result">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="hisback">뒤로</a>
				</div>
				<h1 class="tit"><a href="javascript:;"  onclick="addItemFnc();">FILTER RESULT</a> </h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="secHashWord">
				<ul class="list">
					<li><span class="hash"><em class="tt">#캐쥬얼스타일</em> <button class="del" type="button">삭제</button></span></li>
					<li><span class="hash"><em class="tt">#대한민국</em> <button class="del" type="button">삭제</button></span></li>
					<!-- <li><span class="hash"><em class="tt">#GGondae_st.</em> <button class="del" type="button">삭제</button></span></li>
					<li><span class="hash"><em class="tt">#노땅st.</em> <button class="del" type="button">삭제</button></span></li> -->
				</ul>
			</section>

			<section class="secResult">
				<div class="rsOpts">
					<div class="sort">
						<select class="select">
							<option>최신순</option>
							<option>최신순</option>
							<option>최신순</option>
							<option>최신순</option>
						</select>
					</div>
					<div class="filt"><a href="/resources2/app/html/common/filter.jsp" class="btnFilter">필터</a></div>
				</div>
				<div class="tots"><span class="dt">RESULT</span><span class="num">52,623</span> </div>
				<div class="uiItemList resultList">
					<ul class="list" id="dp_list">



					</ul>

					<div class="uiLoadMore">
						<em></em>
						<button type="button" class="btnLoad" onclick="itemListAdd()" id="btnListMore">불러오기</button>
					</div>
				</div>
			</section>

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>
	<script src="/resources2/app/js/masonry.pkgd.js"></script>
	<script src="/resources2/app/js/imagesloaded.pkgd.min.js"></script>
	<script>
		

	$(document).ready(function(){

	
		$cult_grid = $('#dp_list').masonry({
			itemSelector: '#dp_list .box',
			percentPosition: true,
			gutter:2,
			transitionDuration: 700
		});
		$cult_grid.imagesLoaded().progress( function() {
			$cult_grid.masonry('layout');
		}); 
		// $(window).resize(function() {
		// 	$('#dp_list').masonry('layout');
		// });


		$cult_grid.on( 'click', '.del', function(event) {
			// remove clicked element
			// console.log( $(event.currentTarget).closest(".box") );

			$cult_grid.masonry( 'remove', $(event.currentTarget).closest(".box")  );
			// $cult_grid.masonry('layout');
			
			window.setTimeout(function(){
				$cult_grid.masonry('layout');
			},750);
			// layout remaining item elements
			
		});

		appendStat = true ;
		addItemFnc = function(){
			$(".uiLoadMore").addClass("active");
			//ui.loading.show();
			$.ajax({
				type: "post",
				url: "./filterResult_more.jsp",
				dataType: "html",
				success: function(html) {
					window.setTimeout(function(){
						$items = $(html)
						$cult_grid.append( $items ).masonry( 'appended', $items );
						window.setTimeout(function(){
						},10);
							$cult_grid.masonry('layout');
							$('#dp_list').addClass("load");
						appendStat = true;
						$(".uiLoadMore").removeClass("active");
						//ui.loading.hide();
					},500);
				}
			});	
		};

		$(window).on("scroll load", function() {
			
			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			console.log(docH,scr);
			if (docH <= scr  && appendStat == true) {
				console.log("바닥sss");
				addItemFnc();
				appendStat = false;
				
				
			}
		});

		window.setTimeout(function(){

		},1000)
			addItemFnc();



		$(document).on("click",".uiItemList>.list>li .item .bts .bt.del",function(e){
			// $(this).closest(".box").fadeOut(0,function(){
			// 	$(this).remove();
			// 		$('#dp_list').masonry('destroy')
			// 	window.setTimeout(function(){
			// 		$('#dp_list').masonry('layout');
			// 	},210);
			// });

		});


	});



	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>