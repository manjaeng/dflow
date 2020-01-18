<style>
	.list-template { display: none; }
</style>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain review my">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">쇼핑내역</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="sec review">
				<div class="nodata">
					<div class="msg">쇼핑내역이 존재하지 않습니다.</div>
				</div>
				<ul class="list" data-accd="accd" id="my_review_list">
					<li class="list-template" style="display: none;">
						<div class="item">
							<span class="img"><a class="pic profile" href="javascript:;"><img src="" alt=""></a></span>
							<div class="info">
								<div class="tit"><a class="product" href="javascript:;">제품명</a></div>
								<div class="prc"><em class="w">&#8361;</em><span class="p">가격</span></div>
								<div class="name">게시자</div>
								<div class="remove"><a href="javascript:;" class="bt del">삭제</a></div>
								<div class="bts"><a href="javascript:;" class="bt write">WRITE</a></div>
							</div>
						</div>
					</li>
				</ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</div>
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
		//프로필
		$('body').delegate( 'a.profile', 'click', function() {
			var row = $(this).closest('li');
			var lookIdKey		= row.data('lookIdKey');
			location.href = $.validator.format('/app/my/profile.do?id={0}', lookIdKey);
		});
		
		//제품 상세
		$('body').delegate( 'a.product', 'click', function() {
			var row = $(this).closest('li');
			var lookIdKey		= row.data('lookIdKey');
			var productIdKey	= row.data('productIdKey');
			//location.href = '/app/look/product.do?lookIdKey='+lookIdKey;
		});
		
		//쓰기 버튼.
		$('body').delegate( 'a.write', 'click', function() {
			var row = $(this).closest('li');
			var clickKey		= row.data('clickKey');
			var productIdKey	= row.data('productIdKey');
			var lookIdKey		= row.data('lookIdKey');
			var mapIdKey		= row.data('mapIdKey');
			var reviewIdKey		= row.data('reviewIdKey');

			if(reviewIdKey==null) {
				location.href = $.validator.format('/app/setting/my_review_upload.do?clickKey={0}', clickKey);
			}
			else {
				location.href = $.validator.format('/app/look/review_view.do?reviewIdKey={0}', reviewIdKey);
			}
		});
		
		//삭제 버튼.
		$('body').delegate( 'a.del', 'click', function() {
			var row = $(this).closest('li');
			var clickKey		= row.data('clickKey');

			var param = { clickKey: clickKey };
			
			$.post('/app/setting/rest/my_click_delete.do', param, function(data) {
				if(data.code==0) {
					ui.alert({  // 알럿창 띄우기
						msg:'<p>삭제되었습니다.</P>' ,
						ycb:function(){
							location.reload();
						},
						ybt:'확인'
					});	
				}
				else {
					ui.alert({ msg: '<p>' + data.message + '</P>' });
				}
			}, 'json');

		});
		
		$(".uiLoadMore").click( function(){
			$('div.nodata').hide();
			$(".uiLoadMore").addClass("active");
			page ++ ;
			
			var url = '/app/setting/rest/my_review.do?page='+page;
			$.get(url )
			.done(function( data ) {
				var listTemplate = $('li.list-template:first');

				//alert(JSON.stringify(data.form));
				$.each(data.list, function(idx, item) {
					var row = listTemplate.clone(true).removeClass('list-template');
					row.show();
					
					row.data('clickKey'		, item.clickKey);
					row.data('productIdKey'	, item.productIdKey);
					row.data('lookIdKey'	, item.lookIdKey);
					row.data('mapIdKey'		, item.mapIdKey);
					row.data('reviewIdKey'	, item.reviewIdKey);

					row.find('img:eq(0)').attr('src', item.userImageUrl);
					row.find('a:eq(1)').text(item.productName);
					row.find('span.p').text(item.price.toLocaleString());
					row.find('div.name').text(item.lookUserId);
					row.find('a.write').text((item.reviewIdKey==null)? 'WRITE' : 'REVIEW');
					//리뷰가 작성되었거나 정산 또는 리워드 대상인 경우 삭제 불가.
					if(item.deletable==false) row.find('a.del').parent().remove();
					
					$("#my_review_list").append(row).addClass("load");;
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
		$(".uiLoadMore").trigger('click');
	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>
