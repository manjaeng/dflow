<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain qna">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<a href="javascript:;" class="bt write" onclick="popQnaWrite();">쓰기</a>
				</div>
				<h1 class="tit">1 : 1 문의</h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<div class="sec qna">
				<ul class="uiAccd list" data-accd="accd" id="qna_list">

				</ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</div>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->

		<!-- qnaWrite 샘플2 -->
		<article class="popLayer a popQnaWrite" id="popQnaWrite">
			<div class="pbd">
				<div class="phd">
					<div class="in">
						<h1 class="tit">1:1 문의작성</h1>
						<button type="button" class="btnPopClose">닫기</button>
					</div>
				</div>
				<div class="pct">
					<main class="poptents">
						<div class="sec forms">
							<ul class="form">
								<li class="subj">
									<div class="dt">TITLE</div>
									<div class="dd">
										<input type="text" class="input">
									</div>
								</li>
								<li class="memo">
									<div class="dt">CONTENTS</div>
									<div class="dd">
										<textarea class="textarea"></textarea>
									</div>
								</li>
							</ul>
						</div>
						
					</main>
				</div>
				<div class="pbt">
					<div class="bts"><a href="../mypage/profile.jsp" class="btn type b fill xl">Done</a></div>
				</div>
			</div>
		</article>

		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>

	var popQnaWrite = function(){
		ui.popLayer.open('popQnaWrite');
	}
	
	var page = 0 ;
	var appendStat = true ;
	var addItemFnc = function(){
		$(".uiLoadMore").addClass("active");
		page ++ ;
		$.ajax({
			type: "post",
			url: "./qna_more.jsp",
			dataType: "html",
			success: function(html) {
				window.setTimeout(function(){
					$("#qna_list").append(html).addClass("load");;
					console.log("페이징 = " + page);
					appendStat = true ;
					if (page >= 3) {
						console.log("끝");
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					}
					ui.accd.set();
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

	$(window).on("scroll", function() {

		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + 30;
		// console.log(docH,scr);
		if (docH <= scr  && appendStat == true) {
			console.log("바닥sss");
			addItemFnc();
			appendStat = false;
		}
	});

	$(document).ready(function(){
		addItemFnc();
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>