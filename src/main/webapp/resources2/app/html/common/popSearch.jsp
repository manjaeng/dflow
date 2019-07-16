

<article class="popLayer a popSearch" id="popSearch">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="phd">
			<div class="hdt">
				<h1 class="title">SEARCH</h1>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				
				<div class="sec formSch">
					<div class="sch">
						<input type="search" class="input key" id="input_kwd" placeholder="해시태그 또는 ID를 검색하세요" value="">
						<a href="javascript:;" class="bt sch">SEARCH</a>			
						<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
					</div>
				</div>

				<div class="tags">
					<ul class="tg">
						<li><a href="/resources2/app/html/common/searchTag.jsp" class="hash"><em class="tt">#캐쥬얼스타일</em> </a></li>
						<li><a href="/resources2/app/html/common/searchTag.jsp" class="hash"><em class="tt">#대한민국</em> </a></li>
						<li><a href="/resources2/app/html/common/searchTag.jsp" class="hash"><em class="tt">#GGondae_st.</em> </a></li>
					</ul>
				</div>

				<div class="recent">
					<div class="ht">RECENT</div>
					<ul class="list">
						<li>
							<div class="box">
								<a href="javascript:;" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="javascript:;" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="javascript:;" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li>
							<div class="box">
								<a href="javascript:;" class="kwd">TOMBOY</a>
								<span class="date">2019.07.01</span>
								<a href="javascript:;" class="del">삭제</a>
							</div>
						</li>
						<li class="nodata">
							<div class="msg">검색기록이 존재하지 않습니다.</div>
						</li>
					</ul>
				</div>
				
			</main>
		</div>
	</div>
</article>
<script>
var popSearch = function(){
	ui.popLayer.open('popSearch',{
		ocb: function(){
			ui.filter.match();	
		}
	});
	
};
$(document).ready(function(){
	// popSearch();

	$(document).on("keyup","#input_kwd",function (e) {
		if( e.keyCode == 13 ) {
			window.location.href = '/resources2/app/html/common/searchResult.jsp';
		}
	});
	$(document).on("click","#btSchCancel",function (e) {

		$("#input_kwd").val("")

	});



});
</script>
