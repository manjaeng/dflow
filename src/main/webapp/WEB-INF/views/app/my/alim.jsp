<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain alim">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">Notification</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="tabs">
				<ul class="uiTab menu a">
					<li grp="ME" class="me"><a href="alim.do?grp=ME">ME</a></li>
					<li grp="NOTICE" class="fol"><a href="alim.do?grp=NOTICE">NOTICE</a></li>
				</ul>
				<script>
					$('ul.uiTab').find('li').removeClass('active');
					$('ul.uiTab').find('li[grp=${form.grp}]').addClass('active');
				</script>
			</div>
			<section class="sec notifi" id="alimTabCont">

				<div class="tabCtn">
					
					<div class="nodata">
						<div class="msg">내용이 없습니다.</div>
					</div>
					<ul class="list" id="alimCont">
						<li class="list-template" style="display: none;">
							<div class="box">
								<a href="javascript:;" class="pic"><div class="img"><img src="//placeimg.com/72/96/7" alt="사진"></div></a>
								<div class="msgs">
									<div class="text"><a href="javascript:;">BLUE MOON</a>님이 나를 즐겨찾기 하였습니다.</div>
									<div class="info"><div class="time">-</div></div>
								</div>
								<a href="javascript:;" class="thum">
									<div class="img"><img src="//placeimg.com/72/96/4" alt="사진"></div>
								</a>
							</div>
						</li>
					</ul>
					<div class="uiLoadMore">
						<em></em> <button type="button" class="btnLoad" id="btnListMore">불러오기</button>
					</div>
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
		//쓰기 버튼.
		$('body').delegate( 'a.view', 'click', function() {
			var row = $(this).closest('li');
			var idKey			= row.data('idKey');
			var linkUrl			= row.data('linkUrl');

			if(linkUrl && linkUrl.length > 0) {
				location.href = linkUrl;
			}
		});
		
		$(".uiLoadMore").click( function(){
			if(page==0) $("ul.list").find('li.rowitem').remove();
			
			$('div.nodata').hide();
			$(".uiLoadMore").addClass("active");
			page ++ ;
			
			var url = '/app/my/rest/alim.do?grp=${form.grp}&page='+page;
			$.get(url )
			.done(function( data ) {
				var listTemplate = $('li.list-template:first');

				//alert(JSON.stringify(data.form));
				$.each(data.list, function(idx, item) {
					var row = listTemplate.clone(true).removeClass('list-template');
					row.show();
					row.addClass('rowitem')
					
					row.data('idKey'		, item.idKey);
					row.data('linkUrl'		, item.linkUrl);

					row.find('img:eq(0)').attr('src', item.senderImageUrl);
					row.find('div.text').html(item.content);
					row.find('div.time').text(item.elapsedTime);
					if(item.linkImageUrl && item.linkImageUrl.length > 0) {
						row.find('img:eq(1)').attr('src', item.linkImageUrl);
					}
					else {
						row.find('img:eq(1)').closest('a.thum').remove();
					}
					
					$("ul.list").append(row).addClass("load");;
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
