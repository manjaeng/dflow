<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	<!-- 컨텐츠 시작 -->
	<div class="pageHd">
		<div class="in">
			<div class="bts">
				<a href="javascript:history.back();" class="hisback">뒤로</a>
			</div>
			<!-- <h1 class="tit">패피루키</h1> -->
			<div class="set">
				<a class="bt alim on" href="../mypage/alim.jsp">알림</a>
				<a class="bt conf" href="../setting/setting.jsp">설정</a>
			</div>
		</div>
	</div>	
	<div id="contain" class="contain my prf">

		<main id="contents" class="contents">

			<section class="uiPrfeSet">
				<div class="user">
					<div class="photo">
						<div class="pic"><a href="./profile_set.jsp"><img src="https://placeimg.com/160/160/1" alt=""></a></div>
						<!-- <div class="bts"><a href="javascript:;" class="bt mod" onclick="popPrfPicMod();">수정</a></div> -->
					</div>
					<div class="infos">
						<div class="name">Bluemoon</div>
						<!-- <div class="models">
							<div class="uiDropDown noWidth sel" data-ui="val">
								<div class="list">
									<ul>
										<li class="active"><button type="button" value="1">All</button></li>
										<li><button type="button" value="2">Bluemoon</button></li>
										<li><button type="button" value="3">Model A</button></li>
										<li><button type="button" value="4">Model B</button></li>
										<li><button type="button" value="5">Model C</button></li>
									</ul>
								</div>
							</div>

						</div> -->
						<div class="summ">
							<span class="nt">163cm</span>
							<span class="nt">Korea</span>
							<!-- <span class="nt">45kg</span> -->
							<span class="nt">Women</span>
						</div>
						<div class="amount">
							<a href="./follow.jsp?tabs=fwers" class="fw fwers"><i>Follower</i><em>1.1K</em></a>
							<a href="./follow.jsp?tabs=fwing" class="fw fwing"><i>Following</i><em>51</em></a>
						</div>
						<!-- <div class="bts">
							<a class="bt more" href="javascript:;" onclick="popPrfOthers();">더보기</a>
						</div> -->
						<!-- <div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div> -->
					</div>
				</div>
				<div class="desc">
					<div class="name">푸른달 블루문</div>
					<div class="ment">
						하늘색과 트렌치 코트를 좋아합니다. 
					</div>
					<div class="url"><a href="javascript:;">www.beautyitem.com</a></div>
					<!-- <div class="tag">
						<a href="javascript:;" class="hash">#Casual</a> <a href="javascript:;" class="hash">#Elegant</a> <a href="javascript:;" class="hash">#Vintage</a> 
					</div> -->
				</div>
			</section>

			<section class="prfNav">
				<div class="bts">
					<a href="./profile_set.jsp" class="bt edit">Edit Profile</a>
					<a href="javascript:;" class="bt model" onclick="popLookReg_open();">Model</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div>
				<!-- <div class="bts">
					<a href="javascript:;" class="bt fwer">FOLLOW</a>
					<a href="javascript:;" class="bt model" onclick="popLookReg_open();">Model</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div>
				<div class="bts">
					<a href="javascript:;" class="bt fwing">ING</a>
					<a href="javascript:;" class="bt model" onclick="popLookReg_open();">Model</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div> -->

				<!-- <div class="bts">
					<a href="./profile_set.jsp" class="bt edit">Edit Profile</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div>
				<div class="bts">
					<a href="javascript:;" class="bt fwer">FOLLOW</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div>
				<div class="bts">
					<a href="javascript:;" class="bt fwing">ING</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a>
				</div> -->
			</section>

			<section class="prInfoList">
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
		var pageUrl={
			thum:"./profile_look_thum.jsp",
			list:"./profile_look_list.jsp",
		};
		$("#prInfoCont").attr("data-tab", opt);
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				// $(".prInfoList>.tabs .menu>li."+opt).addClass("active").siblings("li").removeClass("active");
				
				$("#prInfoCont").html(html);
				addItemFnc(opt);
				$(".floatNav .bt.prf").removeClass("thum , list").addClass(opt);
				$("#prInfoCont").removeClass("thum , list").addClass(opt);
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
			thum:"./profile_look_thum_li.jsp",
			list:"./profile_look_list_li.jsp",
		};
		$.ajax({
			type: "post",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$(".prInfoCont .tabCtn."+opt+">ul.list").append(html).addClass("load");
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
		var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
		// console.log(docH,scr);
		var tabAct = $("#prInfoCont").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			console.log("바닥입니다.",tabAct);
			addItemFnc(tabAct);
			appendStat = false;
		}
	});

	var togThumbMode = function(){
		if( $(".floatNav .bt").hasClass("list") ){
			prfTabFnc('thum');
		}else{
			prfTabFnc('list');
		}
		$(window).scrollTop(0);
	};

	var testRefresh = function(){
		console.log("댕겨서 새로고침");
	}

	$(document).ready(function(){
		prfTabFnc('thum');  // 최초 탭 활성화
		ui.nav.act("mypg");  // 하단 메뉴 활성화
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