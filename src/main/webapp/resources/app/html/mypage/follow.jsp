<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain follow">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">Follower</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec formSch">
				<div class="sch">
					<input type="search" class="input key" id="input_kwd" placeholder="" value="">
					<a href="javascript:;" class="bt sch">SEARCH</a>			
					<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
				</div>
			</div>

			<div class="tabs">
				<ul class="uiTab menu a">
					<li class="fwers"><a href="javascript:;" onclick="followTabFnc('fwers');">Follower <i>(308)</i></a></li>
					<li class="fwing"><a href="javascript:;" onclick="followTabFnc('fwing');">Following <i>(27)</i></a></li>
				</ul>
			</div>
			
			<section class="sec follow" id="followTabCont">
				
			</section>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	var followTabFnc = function(opt){  // 탭메뉴 클릭시 페이지 불러오기
		if (!opt) { opt = "fwers" }
		var pageUrl={
			fwers:"./follow_tab_fwers.jsp",
			fwing:"./follow_tab_fwing.jsp",
		};
		$("#followTabCont").attr("data-tab", opt);
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				$(".tabs .menu>li."+opt).addClass("active").siblings("li").removeClass("active");
				
				$("#followTabCont").html(html);
				addItemFnc(opt);
				
				$("#followTabCont").removeClass("fwers , fwing").addClass(opt);
				appendStat = true ;
				page = 1 ;
				console.log( "타입 =" , opt );
				ui.slides.lookPic.using();
			}
		});	
	}

	var page = 0 ;
	var appendStat = true ;
	var addItemFnc = function(opt){  //  탭 내용 아래 추가 하기
		appendStat = false ;
		page ++ ;
		$(".uiLoadMore").addClass("active");
		var pageUrl={
			fwers:"./follow_tab_fwers_li.jsp",
			fwing:"./follow_tab_fwing_li.jsp",
		};
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#followTabCont .tabCtn."+opt+">ul.list").append(html).addClass("load");
					console.log("페이징 = " + page +" + "+ pageUrl[opt]);
					appendStat = true ;
					if (page >= 3) {
						console.log("끝");
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
						page = 0 ;
					}
					$(".uiLoadMore").removeClass("active");
					ui.slides.lookPic.using();
				},500);
			},
			error:function(error){
				page --;
				console.log("페이징 = " + page);
				$(".uiLoadMore").removeClass("active").addClass("error");
			}
		});	
	};

	$(window).on("scroll", function() { // 바닥 확인
		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + 30;
		// console.log(docH,scr);
		var tabAct = $("#followTabCont").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			console.log("바닥입니다.",tabAct);
			addItemFnc(tabAct);
			appendStat = false;
		}
	});

	
	$(document).ready(function(){
		console.log(ui.param.tabs);
		followTabFnc( ui.param.tabs );  // 최초 탭 활성화
	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>