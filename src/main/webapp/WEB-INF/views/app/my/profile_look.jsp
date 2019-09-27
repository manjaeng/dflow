<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<div class="pageHd">
		<div class="in">
			<div class="bts">
				<a href="javascript:history.back();" class="hisback">뒤로</a>
			</div>
		</div>
	</div>	

	<div id="contain" class="contain my list">
		<main id="contents" class="contents">
			<section class="secLk look">
				<ul class="lookList" id="lookList"></ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</section>
		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
		var page = -1 ;
		appendStat = true ;
		addItemFnc = function(){
			appendStat = false ;
			page ++ ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "/app/my/profile/look_list.do",
				data : JSON.stringify({
					'pageStart' : page,
					'userId' : '${param.id}',
				}),
				contentType : 'application/json; charset=utf-8',
				dataType: "json",
				success: function(data) {
					window.setTimeout(function(){
						
						if (page == 0) {
							$("#lookList").empty();
						}
						
						if (data.length === 0) {
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						} else {
							
							$.each(data, function(i, e) {
								
								var imageUrl = (e.imageUrl == '' || e.imageUrl == null) ? '/resources/app/images/common/profile_no.png' : '${s3Url}'+e.imageUrl;
								
								var tmp = '	<li><div class="uiLkSet">';
									tmp+= '		<div class="slideLookPic" id="slideLookPic">';
									tmp+= '			<div class="swiper-container">';
									tmp+= '				<ul class="swiper-wrapper slide">';
												$.each(e.image, function(i, ee) {
													tmp+= '<li class="swiper-slide"><a href="../look/look_view.jsp"><span class="pic swiper-zoom-container"><img src="${s3Url}'+ee+'" alt="사진"></span></a></li>';
												});
									tmp+= '				</ul>';				
									tmp+= '				<div class="pagination"></div>';
									tmp+= '			</div>';
									tmp+= '		</div>';
									tmp+= '		<div class="match">';
									tmp+= '			<div class="box mat"><a class="bt" href="javascript:;" data-match="75"><i class="bar"></i><em class="amt"></em> <span class="txt">MATCH?</span></a></div>';
									tmp+= '			<div class="box sty"><a class="bt" href="../common/searchTag.jsp"><span class="txt">STYLE</span></a></div>';
									tmp+= '		</div>';
									tmp+= '		<div class="info">';
									tmp+= '			<div class="user">';
									tmp+= '				<a href="/app/my/profile.do?id='+e.userId+'" class="pic"><span class="img"><img src="'+ imageUrl +'" alt=""></span></a>';
									tmp+= '				<a href="/app/my/profile.do?id='+e.userId+'" class="mem">';
									tmp+= '					<div class="nm">'+e.nickName+'</div>';
									tmp+= '					<div class="dt"><em class="k">000cm</em><em class="n">'+e.country+'</em></div>';
									tmp+= '				</a>';
									tmp+= '				<div class="bts"><a href="javascript:;" class="bt more" onclick="ui.popLayer.open('+'\'popOthers\''+');">더보기</a></div>';
									tmp+= '			</div>';
									tmp+= '			<div class="desc">';
									tmp+= '				<a href="javascript:;" class="txt">'+e.content+'</a>';
									tmp+= '				<a href="javascript:;" class="more">더보기</a>';
									tmp+= '			</div>';
									tmp+= '		</div>';
									tmp+= '		<div class="data">';
									tmp+= '			<ul class="dl">';
									tmp+= '				<li class="cool"><a href="javascript:;" class="bt"><span>쿨</span></a></li>';
									tmp+= '				<li class="like"><a href="../common/cool.jsp" class="bt"><span>'+e.coolCount+'</span></a></li>';
									tmp+= '				<li class="reply"><a href="/app/my/profile/look_comment.do?key='+e.lookIdkey+'" class="bt"><span>'+e.commentCount+'</span></a></li>';
									tmp+= '				<li class="scrap"><a href="javascript:;" class="bt">저장</a></li>';
									tmp+= '			</ul>';
									tmp+= '		</div>';
									tmp+= '		<div class="tags">';
									tmp+= '			<ul class="tg">';
											$.each(e.tag, function(i, ee) {
												tmp+= '<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#'+ee+'</em> </a></li>';
											});
									tmp+= '			</ul>';
									tmp+= '		</div>';
									tmp+= '	</div></li>';
									
								$("#lookList").append(tmp).addClass("load");
							});
							
							appendStat = true ;
						}
						
						ui.slides.lookPic.using();
						ui.look.elip.using();
						$(".uiLoadMore").removeClass("active");
						
					},500);
				}
			});	
		};

		$(window).on("scroll", function() {

			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			if (docH <= scr  && appendStat == true) {
				addItemFnc();
				appendStat = false;
			}
		});

		addItemFnc();

		$(document).ready(function(){
			ui.nav.act("mypg");
			ui.refresh.init(function(){
				pjaxReload();
			});
			
			$('#lookList').on("click",".uiLkSet>.data ul.dl>li .bt",function(e){
				
				var type = $(this).parent().attr('class');
				
				if( $(this).hasClass("on") ){
					$(this).removeClass("on");
				}else{
					$(this).addClass("on");
				}
			});
		});

	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>