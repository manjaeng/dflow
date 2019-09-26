<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
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
						
						if (data.length === 0) {
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						} else {
							
							$.each(data, function(i, e) {
								
								var tmp = '<li><div class="item"><span class="img">';
							        tmp+= '<a class="lk" href="/app/my/profile/look_detail_list.do?id=">';
							        tmp+= '<img src=https://s3thenet.s3.ap-northeast-2.amazonaws.com/' + e.image[0] + ' alt="">';
							    
							    if(e.image.length > 1) {
							    	tmp+= '<span class="num"></span>';
							    }
							    
							    tmp+= '</a>';
							    tmp+= '</span></div></li>';
								
								$("#lookList").append(tmp).addClass("load");
							});
							
							console.log("페이징 = " + page);
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
		});

	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>