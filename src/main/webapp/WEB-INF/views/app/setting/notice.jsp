<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.uiAccd>li .cBox {white-space:pre}
</style>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain notice">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">공지사항</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="sec notice">
				<ul class="uiAccd list" data-accd="accd" id="notice_list">
				</ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</div>
		</main>
	</div>

	<script>

	var page = -1;
	var appendStat = true ;
	var addItemFnc = function(){
		$(".uiLoadMore").addClass("active");
		page ++ ;
		$.ajax({
			type: "post",
			url: "/app/setting/notice.do",
			data: {
				"pageStart" : page
			},
			success: function(data) {
				window.setTimeout(function(){
					
					if (data.length == 0) {
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					} else {
						$.each(data,function(i,e) {
							var tmp ='<li class="except"><div class="hBox">';
							    tmp+= '<span class="tit">';
							    tmp+= e.title;
							   	tmp+= '</span>';
							    tmp+= '<span class="date">';
							    tmp+= e.createDate.replace(/-/g, '.');
							    tmp+= '</span>'; 
							    tmp+= '<a href="javascript:;" class="btnTog">열기</a>'; 
							    tmp+= '</div><div class="cBox">'; 
							    tmp+= e.content; 
							    tmp+= '</div></li>';
							    
							var obj = $(tmp);
							obj.find('.cBox').hide();
							
							$("#notice_list").append(obj).addClass("load");
						});
						
						appendStat = true ;
					}
					
					//ui.accd.set();
					$(".uiLoadMore").removeClass("active");
					
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
		if (docH <= scr  && appendStat == true) {
			addItemFnc();
			appendStat = false;
		}
	});

	$(document).ready(function(){
		addItemFnc();
		
		$('body').delegate('.btnTog', 'click', function() {
			var $pnt = $(this).closest("li");
			var isHidden = $pnt.children(".cBox").is(":hidden");
			$(this).closest(".uiAccd").find(">li").removeClass("open").children(".cBox").slideUp(100);
			if (isHidden) {
				window.setTimeout(function() {
					$pnt.addClass("open").children(".cBox").slideDown(100);
				}, 110);
			}
		});
		
	});

	</script>
	
</div>