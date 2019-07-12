

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
				<ul class="filters">
					<li class="keyword">
						<div class="ct">
							<form action="/resources2/app/html/common/searchResult.jsp">
							<input type="search" class="input key" placeholder="검색...">
							</form>
						</div>
					</li>
					<li class="style">
						<div class="ht">STYLE</div>
						<div class="ct">
							<ul class="list">
								<li>
									<label><input type="checkbox"><span class="tit">Casual</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Girly</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Tomboy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Business</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Chic</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Bohemian</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sexy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Punk</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sporty</span></label>
								</li>
							</ul>
						</div>
					</li>
				</ul>
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
});
</script>
