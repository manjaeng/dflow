<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain follow">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Follower</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="sec formSch">
				<div class="sch">
					<input type="search" class="input key" id="input_kwd" placeholder="" value="">
					<a href="javascript:;" class="bt sch">SEARCH</a>			
					<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
				</div>
			</div>

			<div class="tabs">
				<ul class="uiTab menu a">
					<li class="fwers"><a href="javascript:;" onclick="followTabFnc('fwers');">Follower <i>(<c:out value="${profileInfo.followerCount}"/>)</i></a></li>
					<li class="fwing"><a href="javascript:;" onclick="followTabFnc('fwing');">Following <i>(<c:out value="${profileInfo.followingCount}"/>)</i></a></li>
				</ul>
			</div>
			
			<section class="sec follow" id="followTabCont">
			</section>
		</main>
	</div>


	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	function followTabFnc(opt){  // 탭메뉴 클릭시 페이지 불러오기
		if (!opt) { opt = "fwers" }
		var pageUrl={
			fwers : "/app/my/follow_div.do?type=fwers",
			fwing : "/app/my/follow_div.do?type=fwing",
		};
		
		$("#followTabCont").attr("data-tab", opt);
		
		$.ajax({
			type: "get",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				$(".tabs .menu>li."+opt).addClass("active").siblings("li").removeClass("active");
				
				$("#followTabCont").html(html);
				addItemFnc(opt);
				
				$("#followTabCont").removeClass("fwers , fwing").addClass(opt);
				appendStat = true ;
				page = 1 ;
				ui.slides.lookPic.using();
			}
		});	
	}

	var page = 0 ;
	var appendStat = true ;
	var addItemFnc = function(opt){
		appendStat = false ;
		page ++ ;
		$(".uiLoadMore").addClass("active");

		$.ajax({
			type: "post",
			url: '/app/my/followList.do',
			data : JSON.stringify({
				'type' : opt,
				'pageStart' : page
			}),
			contentType : 'application/json; charset=utf-8',
			success: function(data) {
				window.setTimeout(function(){
					
					if (data.length == 0) {
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					} else {
						
						$.each(data,function(i,e) {
						 	var tmp ='<li><div class="hBox">';
							    tmp+= '<span class="tit">';
							    tmp+= e.title;
							   	tmp+= '</span>';
							    tmp+= '<span class="date">';
							    tmp+= e.createDate;
							    tmp+= '</span>'; 
							    tmp+= '<a href="javascript:;" class="btnTog">열기</a>'; 
							    tmp+= '</div><div class="cBox">'; 
							    tmp+= e.content; 
							    tmp+= '</div></li>'; 
						    
						    $("#followTabCont .tabCtn."+opt+">ul.list").append(tmp).addClass("load");
						});
						
						appendStat = true ;
						
						$(".uiLoadMore").removeClass("active");
						ui.slides.lookPic.using();
					}
				},500);
			},
			error:function(error){
				page --;
				$(".uiLoadMore").removeClass("active").addClass("error");
			}
		});	
	};

	$(window).on("scroll", function() {
		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + 30;
		var tabAct = $("#followTabCont").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			addItemFnc(tabAct);
			appendStat = false;
		}
	});

	
	$(document).ready(function(){
		followTabFnc('${param.type}');  
	});

	</script>
</div>