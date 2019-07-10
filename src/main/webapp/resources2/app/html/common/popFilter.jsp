

<article class="popLayer a popFilter" id="popFilter">
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">STYLE FILTER</h1>
				<button type="button" class="btnPopClose">닫기</button>
			</div>
		</div>
		<div class="pct">
			<main class="poptents">
				<ul class="filters">
					<li class="gender">
						<div class="ht">성별</div>
						<div class="ct">
							<label class="radio"><input type="radio" name="filter_gender"><span>여자</span></label>
							<label class="radio"><input type="radio" name="filter_gender"><span>남자</span></label>
						</div>
					</li>
					<li class="country">
						<div class="ht">국가</div>
						<div class="ct">
							<select class="select">
								<option>Korea</option>
								<option>Korea</option>
							</select>
						</div>
					</li>
					<li class="style">
						<div class="ht">STYLE</div>
						<div class="ct">
							<ul class="list">
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/1" alt=""></span></div>
										<span class="tit">Casual</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/2" alt=""></span></div>
										<span class="tit">Elegant</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/3" alt=""></span></div>
										<span class="tit">Curvy</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/4" alt=""></span></div>
										<span class="tit">Boho</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/5" alt=""></span></div>
										<span class="tit">Vintage</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/6" alt=""></span></div>
										<span class="tit">Rock</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/7" alt=""></span></div>
										<span class="tit">Sporty</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/8" alt=""></span></div>
										<span class="tit">Grunge</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/9" alt=""></span></div>
										<span class="tit">Sexy</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox">
										<div class="thumb"><span class="img"><img src="//placeimg.com/160/160/any/10" alt=""></span></div>
										<span class="tit">Trendy</span>
									</label>
								</li>
							</ul>
						</div>
					</li>
					<li class="match">
						<div class="ht">MATCH</div>
						<div class="ct">
							<div class="uiSlider">
								<div class="match" id="filtMatchSlider" data-amount="85">
									<em class="bar"></em>
									<div class="ui-slider-handle"><span class="match-handle"></span></div>
									<div class="nums">
										<span class="num min">0</span>
										<span class="ds">~</span>
										<span class="num max">100<i>%</i></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="keyword">
						<div class="ct">
							<input type="search" class="input key" placeholder="검색어 입력">
						</div>
					</li>
				</ul>
			</main>
		</div>
		<div class="pbt">
			<div class="in">
				<div class="bts">
					<a class="btn xl e btnReset" href="javascript:;">초기화</a>
					<a class="btn xl d btnSch" href="javascript:;">검색</a>
				</div>
			</div>
		</div>
	</div>
</article>
<script>
var popFilter = function(){
	ui.popLayer.open('popFilter',{
		ocb: function(){
			ui.filter.match();	
		}
	});
	
};
</script>
