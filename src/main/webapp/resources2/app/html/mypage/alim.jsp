<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain alim">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">Notification</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="tabs">
				<ul class="uiTab menu a">
					<li class="me"><a href="javascript:;" onclick="alimTabFnc('me');">ME</a></li>
					<li class="fol"><a href="javascript:;" onclick="alimTabFnc('fol');">NOTICE</a></li>
				</ul>
			</div>
			<section class="sec notifi" id="alimTabCont">
				
			</section>
		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	var alimTabFnc = function(opt){  // 탭메뉴 클릭시 페이지 불러오기
		var pageUrl={
			me:"./alim_tab_me.jsp",
			fol:"./alim_tab_fol.jsp",
		};
		$("#alimTabCont").attr("data-tab", opt);
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				$(".tabs .menu>li."+opt).addClass("active").siblings("li").removeClass("active");
				
				$("#alimTabCont").html(html);
				addItemFnc(opt);
				
				$("#alimTabCont").removeClass("me , fol").addClass(opt);
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
			me:"./alim_tab_me_li.jsp",
			fol:"./alim_tab_fol_li.jsp",
		};
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#alimTabCont .tabCtn."+opt+">ul.list").append(html).addClass("load");
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
		var tabAct = $("#alimTabCont").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			console.log("바닥입니다.",tabAct);
			addItemFnc(tabAct);
			appendStat = false;
		}
	});

	
	$(document).ready(function(){
		alimTabFnc('me');  // 최초 탭 활성화
	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>