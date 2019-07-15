<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain search result">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">SEARCH</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="secHashWord">
				<div class="sch">
					<input type="search" class="input key" placeholder="검색..." value="TREND">					
				</div>
			</section>
			<div class="tabsSch">
				<ul class="uiTab type a sch">
					<li class="look"><a href="javascript:;" onclick="schResultTabFnc('look')">LOOK</a></li>
					<li class="acct"><a href="javascript:;" onclick="schResultTabFnc('acct')">ACCOUNT</a></li>
				</ul>
			</div>
			<section class="secResult" id="searchResult"></section>

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	var schResultTabFnc = function(opt){  // 탭메뉴 클릭시 페이지 불러오기
		var pageUrl={
			look:"./searchResult_look.jsp",
			acct:"./searchResult_acct.jsp",
		};
		$("#searchResult").attr("data-tab", opt);
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				$(".tabsSch>.uiTab>li."+opt).addClass("active").siblings("li").removeClass("active");
				$("#searchResult").html(html);
				// look_grid_set();
				addItemFnc(opt);
				$("#searchResult").removeClass("look , acct").addClass(opt);
				appendStat = true ;
				page = 1 ;
				console.log( "현재탭 =" , opt );
			}
		});	
	}

	var page = 0 ;
	var appendStat = true ;
	var addItemFnc = function(opt){
		$(".uiLoadMore").addClass("active");
		var pageUrl={
			look:"./searchResult_look_more.jsp",
			acct:"./searchResult_acct_more.jsp",
		};
		page ++ ;
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					
					// if (opt == 'look') { // LOOK 일때 append
					// 	$items = $(html);
					// 	$look_grid.append( $items ).masonry( 'appended', $items );
					// 	$look_grid.masonry('layout');
					// }
					// if (opt == 'acct') { // Account 일때 append
					// 	$(".secResult .tabCtn."+opt+" .list").append(html);
					// }

					$(".secResult .tabCtn."+opt+" .list").append(html);
					console.log("페이징 = " + page +" + "+ pageUrl[opt]);
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

	var look_grid_set = function(){  //  그리드 플러그인 셋팅
		$look_grid = $('#dp_list').masonry({
			itemSelector: '#dp_list .box',
			percentPosition: true,
			gutter:0,
			transitionDuration: 700
		});

		$look_grid.on( 'click', '.del', function(event) {
			$look_grid.masonry( 'remove', $(event.currentTarget).closest(".box")  );		
			window.setTimeout(function(){
				$look_grid.masonry('layout');
			},750);
		});
	}



	$(document).ready(function(){

		$(window).on("scroll", function() {
			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			// console.log(docH,scr);
			var tabAct = $("#searchResult").attr("data-tab");
			if (docH <= scr  && appendStat == true) {
				console.log("바닥sss");
				addItemFnc(tabAct);
				appendStat = false;
			}
		});

		schResultTabFnc('look'); 

	});



	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>