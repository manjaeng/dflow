<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain search result tag">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit"><c:out value="#${param.tag}"/></h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="secResult" id="searchResult"></section>
		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp"%>
	</div>

	<script>
	
	var page;
	var appendStat = false ;
	
	function schResultTabFnc(opt){
		page = -1;
	
		var pageUrl={
			look:"/app/home/search_result_div.do?type=look",
			acct:"/app/home/search_result_div.do?type=acct",
		};
		
		$("#searchResult").attr("data-tab", opt);
		
		$.ajax({
			type: "get",
			url: pageUrl[opt],
			dataType: "html",
			success: function(html) {			
				
				$(".tabsSch>.uiTab>li."+opt).addClass("active").siblings("li").removeClass("active");
				
				
				$("#searchResult").html(html);
				$("#searchResult").removeClass("look , acct").addClass(opt);
				
				appendStat = true ;
				addItemFnc(opt);
			}
		});
		
	}
	function addItemFnc(opt){
		appendStat = false ;
		page ++ ;
		$(".uiLoadMore").addClass("active");
		
		$.ajax({
			type: "post",
			url: '/app/home/searchList.do',
			data : JSON.stringify({
				'type' : opt,
				'pageStart' : page,
				'searchKeword' : '${param.tag}',
			}),
			contentType : 'application/json; charset=utf-8',
			success: function(data) {
				window.setTimeout(function(){
					
					if (page == 0) {
						$(".secResult .tabCtn."+opt+" .list").empty();
					}
					
					
					if (data.searchList.length == 0) {
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					} else {
						
						$.each(data.searchList,function(i,e) {
							
							$(".secResult .tabCtn."+opt+" .list").append(html).addClass("load");
						});
						
						appendStat = true ;
					}
					
					$(".uiLoadMore").removeClass("active");
					
				},500);
			},
			error:function(error){
				page --;
				$(".uiLoadMore").removeClass("active").addClass("error");
				
			}
		});	
	};

	var look_grid_set = function(){
		$look_grid = $('#dp_list').masonry({
			itemSelector: '#dp_list .box',
			percentPosition: true,
			gutter:0,
			transitionDuration: 700
		});

		$look_grid.on( 'click', '.del', function(event) {
			$look_grid.masonry( 'remove', $(event.currentTarget).closest(".box")  );		
			window.setTimeout(function(){
				$look_grid.masonry('layout');
			},750);
		});
	}

	$(window).on("scroll", function() {
		var docH = $(document).height();
		var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
		var tabAct = $("#searchResult").attr("data-tab");
		if (docH <= scr  && appendStat == true) {
			addItemFnc(tabAct);
			appendStat = false;
		}
	});

	$(document).ready(function(){
		schResultTabFnc('look'); 
	});

	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>