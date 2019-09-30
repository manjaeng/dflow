<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<div id="contain" class="contain cool">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">COOL</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="coolList">
				<ul class="list" id="cool_list">
				</ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</section>
		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp"%>
	</div>

	<script>

	var page = -1 ;
	var appendStat = true ;
	
	function addItemFnc() {
		appendStat = false ;
		page ++ ;
		$(".uiLoadMore").addClass("active");
		$.ajax({
			type: "post",
			url: "/app/my/profile/look_cool.do",
			data : JSON.stringify({
				'pageStart' : page,
				'lookIdKey' : '${param.key}',
			}),
			contentType : 'application/json; charset=utf-8',
			dataType: "json",
			success: function(data) {
				window.setTimeout(function(){
					
					if (page == 0) {
						$("#cool_list").empty();
					}
					
					if (data.length == 0) {
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					} else {
						
						$.each(data,function(i,e) {
							
							var chk = '';
							var sessionId = '${sessionScope.__sessiondata__.userId}';
							
							var imageUrl = (e.imageUrl == '' || e.imageUrl == null) ? '/resources/app/images/common/profile_no.png' : '${s3Url}'+e.imageUrl;
							
							if(e.isFollow) {
								chk = (e.isFollow == '0') ? '' : 'checked';
							}
							
						 	var tmp ='<li><div class="item">';
							    tmp+= '<span class="img"><a class="lk" href="';
							    tmp+= '/app/my/profile.do?id='+e.userId;
							    tmp+= '"><img src="';
							    tmp+= imageUrl;
							    tmp+= '" alt="">';
							   	tmp+= '</a></span>';
							    tmp+= '<div class="name">';
							    tmp+= e.userId;
							    tmp+= '</div>';
							    
							    if(e.userId !== sessionId) {
							    	tmp+= '<div class="foll"><label class="checkbox"><input type="checkbox"';
									tmp+= chk;
									tmp+= '><span></span></label></div>';
							    }
							    tmp+= '</div></li>';
							    
						    $("#cool_list").append(tmp).addClass("load");
						});
						
						appendStat = true ;
					}
					
					$(".uiLoadMore").removeClass("active");
					ui.slides.lookPic.using();
					
				},500);
				
			},
			error:function(error){
				page --;
				$(".uiLoadMore").removeClass("active").addClass("error");
				
			}
		});	
	};

	$(document).ready(function(){

		$(window).on("scroll", function() {

			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			if (docH <= scr  && appendStat == true) {
				addItemFnc();
				appendStat = false;
			}
		});

		ui.nav.act("mypg");
		addItemFnc();
	});

	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>