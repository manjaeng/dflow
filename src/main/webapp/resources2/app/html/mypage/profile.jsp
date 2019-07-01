<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain my prf">
		<div class="prfeHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="hisback">뒤로</a>
				</div>
				<h1 class="tit">패피루키</h1>
				<div class="set">
					<a class="bt alim on" href="javascript:;">알림</a>
					<a class="bt conf" href="/resources2/app/html/mypage/setting.jsp">설정</a>
					<a class="bt more" href="javascript:;">더보기</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="uiPrfeSet a">
				<div class="user">
					<div class="photo">
						<div class="pic"><img src="https://placeimg.com/160/160/1" alt=""></div>
						<div class="bts"><a href="javascript:;" class="bt mod">수정</a></div>
					</div>
					<div class="infos">
						<div class="name">패피루키</div>
						<div class="summ">
							<span class="cm">163cm</span>
							<span class="nt">Korea</span>
						</div>
						<div class="amount">
							<div class="fw fwers"><em>1.1K</em><i>followers</i></div>
							<div class="fw fwing"><em>51</em><i>following</i></div>
						</div>
					</div>
				</div>
				<div class="foll"><a href="javascript:;" class="btn type a">FOLLOW</a></div>
				<div class="desc">
					<div class="ment">
						하늘색과 트렌치 코트를 좋아합니다.<br>
						편안하고 출근할 때 입기 좋은 옷을 좋아해요~
					</div>
					<div class="url"><a href="http://www.beautyitem.com" target="_blank">www.beautyitem.com</a></div>
					<div class="tag">
						<a href="javascript:;" class="hash">#Casual</a> <a href="javascript:;" class="hash">#Elegant</a> <a href="javascript:;" class="hash">#Vintage</a> 
					</div>
				</div>
			</section>

			<section class="prInfoList">
				<div class="tabs">
					<ul class="menu">
						<li class="look"><a href="javascript:;" onclick="prfTabFnc('look')">LOOK</a></li>
						<li class="foll"><a href="javascript:;" onclick="prfTabFnc('foll')">FOLLOW</a></li>
						<li class="cool"><a href="javascript:;" onclick="prfTabFnc('cool')">COOL</a></li>
					</ul>
				</div>
				<div class="prInfoCont" id="prInfoCont">
				</div>

			</section>

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>


	<script>
	var prfTabFnc = function(opt){  // 탭메뉴 클릭시 페이지 불러오기
		ui.loading.show();
		// console.log(opt);
		var pageUrl={
			look:"./profile_tab_look.jsp",
			foll:"./profile_tab_foll.jsp",
			cool:"./profile_tab_cool.jsp",
		};
		$("#prInfoCont").attr("data-tab", opt);
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				
				window.setTimeout(function(){
					$(".prInfoList>.tabs .menu>li."+opt).addClass("active").siblings("li").removeClass("active");
					$("#prInfoCont").html(html);
					$("#prInfoCont").removeClass("look , foll , cool").addClass(opt);
					ui.loading.hide();
					appendStat = true ;
					page = 0 ;
					console.log( "현재탭 =" , opt );
				},300);
			}
		});	
	}


	var page = 0 ;
	var appendStat = true ;
	var addItemFnc = function(opt){  //  탭 내용 아래 추가 하기
		appendStat = false ;
		$(".uiLoadMore").addClass("active");
		var pageUrl={
			look:"./profile_tab_look_li.jsp",
			foll:"./profile_tab_foll_li.jsp",
			cool:"./profile_tab_cool_li.jsp",
		};
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					page ++ ;
					console.log();
					$(".prInfoCont .tabCtn."+opt+" .list").append(html);
					console.log("페이징 = " + page +" + "+ pageUrl[opt]);
					appendStat = true ;
					if (page >= 3) {
						console.log("끝");
						$(".uiLoadMore").hide();
						appendStat = false ;
						page = 0 ;
					}
					$(".uiLoadMore").removeClass("active");
					
				},500);
			}
		});	
	};

	$(window).on("scroll", function() { // 바닥 확인
		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
		// console.log(docH,scr);
		var tabAct = $("#prInfoCont").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			console.log("바닥입니다.",tabAct);
			addItemFnc(tabAct);
			appendStat = false;
		}
	});


	var coolEditFnc = function(opt){  //  cool 탭에서  편집 버튼 눌렀을때 
		if (opt==true) {
			$("#btnset_modi").show();
			$("#btnset_edit").hide();
			$(".prInfoCont .tabCtn .itemList").addClass("check");
		}
		if (opt==false){
			$("#btnset_modi").hide();
			$("#btnset_edit").show();
			$(".prInfoCont .tabCtn .itemList").removeClass("check");
		}
	}


	$(document).ready(function(){
		prfTabFnc('look');  // 최초 탭 활성화
		ui.nav.act("mypg");  // 하단 메뉴 활성화
	});
	</script>
	

	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>