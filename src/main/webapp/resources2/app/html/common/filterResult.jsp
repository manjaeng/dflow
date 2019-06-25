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
				<h1 class="tit">FILTER RESULT </h1>
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
					<ul class="list" id="dp_list"></ul>

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

	<script>
	$(document).ready(function(){
		ui.listMore.init(itemListAdd);
	});

	var page = 0;
	var itemListAdd = function(){
		ui.listLoad.attach(); // 로딩이미지 Show
		$("#btnListMore").prop("disabled",true);
		if( ui.listMore.active ){
			ui.listMore.active = false;
			ui.listMore.using();
			page ++;
			window.setTimeout(function(){
				$.ajax({
					type: "post",
					url: "./filterResult_more.jsp",
					dataType: "html",
					success: function(html) {
						$("#dp_list").append(html).addClass("load");
						$("#btnListMore").prop("disabled",false);
						ui.listLoad.detach();
						ui.listMore.active = true;
						console.log("페이징 = " + page);
						$("#debug").html("페이징 = " + page );
						if (page >= 3) {
							console.log("끝");
							ui.listMore.removeEvent();
						}
					},
					error:function(error){
						page --;
						console.log("페이징 = " + page);
						console.log("에러 = " + error.readyState);
						ui.listLoad.error();
						$("#btnListMore").prop("disabled",false);
					}
				});
			},1000);
		}
	};
	</script>
	
	<!--// 컨텐츠 끝 -->
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>