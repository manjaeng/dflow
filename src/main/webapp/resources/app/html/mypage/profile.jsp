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
						<!-- <div class="pic"><a href="./profile_set.jsp"><img src="//placeimg.com/160/160/1" alt=""></a></div> -->
						<div class="pic"><a href="./profile_set.jsp"><img src="../../images/common/profile_no.png" alt=""></a></div>
					</div>
					<div class="infos">
						<div class="name">Bluemoon <em class="ico seller">셀러</em></div>
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
					</div>
				</div>
				<div class="desc">
					<div class="name">푸른달 블루문</div>
					<div class="ment">
						하늘색과 트렌치 코트를 좋아합니다. 
					</div>
					<!-- <div class="url"><a href="javascript:;">www.beautyitem.com</a></div> -->
				</div>
			</section>

			<section class="prfNav">
				
				<!-- 내프로필이면.my  ||  모델 있으면.mdl ||  팔로우중이면 .ing  -->
				<div class="bts">
					<a href="./profile_set.jsp" class="bt edit">Edit Profile</a>
					<a href="javascript:;" class="bt fwer" onclick="testTogleFw(this)">FOLLOW</a>
					<a href="javascript:;" class="bt fwing" onclick="testTogleFw(this)">ING</a>
					<a href="javascript:;" class="bt model" onclick="popLookReg_open();">Model</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a> 
				</div>
				
			</section>

			<section class="prfList">
				<div class="nodata">
					<div class="msg">NO POSTS YET</div>
				</div>
				<ul class="list" id="look_list"></ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
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
	var addItemFnc = function(){  //  탭 내용 아래 추가 하기
		appendStat = false ;
		page ++ ;
		$(".uiLoadMore").addClass("active");
		$.ajax({
			type: "post",
			url: "./profile_look_thum_li.jsp",
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#look_list").append(html).addClass("load");
					console.log("페이징 = " + page );
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
		if (docH <= scr  && appendStat == true) {
			console.log("바닥입니다.");
			addItemFnc();
			appendStat = false;
		}
	});

	var testTogleFw = function(els){
		if( $(els).closest(".bts").hasClass("ing") ){
			$(els).closest(".bts").removeClass('ing');
		}else{
			$(els).closest(".bts").addClass('ing');
		}
	};

	var testRefresh = function(){
		console.log("댕겨서 새로고침");
	}

	$(document).ready(function(){
		addItemFnc();
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