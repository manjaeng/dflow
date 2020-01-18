<style>
	.list-template { 
		display: none !important;
	}
</style>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain look review">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">REVIEW<span class="n">(0)</span></h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="uiItemList reviewList">
				<div class="nodata">
					<div class="msg">리뷰 목록이 존재하지 않습니다.</div>
				</div>
				<ul class="list" id="review_list">
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/1556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/640/960/any/2556" alt=""><span class="num"><em class="n">2</em></span></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/960/720/any/3556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/4556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/5556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/6556" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/7556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/8556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/9556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/10556" alt=""><span class="num"></span></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/11556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/12556" alt=""></a></span>
						</div>
					</li>
					<li class="box list-template" style="display: none;">
						<div class="item">
							<span class="img"><a href="../look/review_view.jsp"><img src="//placeimg.com/720/960/any/13556" alt=""><span class="num"></span></a></span>
						</div>
					</li>
				</ul>

				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>

			</section>

		</main>
	</div>

	<script>
	var page = 0 ;
	var morePage = true ;

	$(window).on("scroll", function() {
		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + 30;
		// console.log(docH,scr);
		if (docH <= scr  && morePage) {
			console.log("바닥sss");
			$(".uiLoadMore").trigger('click');
			morePage = false;
		}
	});

	$(document).ready(function(){
		
		$(".uiLoadMore").click( function(){
			$('div.nodata').hide();
			$(".uiLoadMore").addClass("active");
			page ++ ;
			
			var url = '/app/look/rest/review.do?lookIdKey=${form.lookIdKey}&productIdKey=${form.productIdKey}&page='+page;
			$.get(url )
			.done(function( data ) {
				$('span.n').text('(' + data.form.totalRows + ')');

				//alert(JSON.stringify(data.form));
				$.each(data.list, function(idx, item) {
					var listTemplate = $('li.list-template:eq(' + idx + ')');

					var row = listTemplate.clone(true).removeClass('list-template');
					row.addClass('rowitem');
					row.show();

					row.find('a:eq(0)').attr('href', '/app/look/review_view.do?reviewIdKey=' + item.reviewIdKey);
					row.find('img:eq(0)').attr('src', item.imageUrl);
					
					$("#review_list").append(row).addClass("load");;
				})

				console.log("페이징 = " + page);
				morePage = data.form.morePage ;
				if (!morePage) {
					console.log("끝");
					$(".uiLoadMore").addClass("hide");
					morePage = false ;
				}
				ui.accd.set();
				$(".uiLoadMore").removeClass("active");

				//전체 건수가 0인 경우.
				if(data.form.totalRows==0) {
					$('div.nodata').show();
					return;
				}
			});
		});
		
		//화면 로딩시 자동으로 목록 조회.
		if($('li.rowitem').length==0) $(".uiLoadMore").trigger('click');
	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

</div>
