<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">

	<%@ include file="/WEB-INF/views/common/app-head.jsp" %>

	<!-- 컨텐츠 시작 -->
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain search result">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">SEARCH</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec formSch">
				<div class="sch">
					<input type="search" class="input key" id="input_kwd" placeholder="#@" value="">
					<a href="javascript:schResultTabFnc('look');" class="bt sch">SEARCH</a>
					<a href="javascript:;" class="bt cancel" id="btSchCancel">CANCEL</a>					
				</div>
			</div>

			<div class="tabsSch">
				<ul class="uiTab type a sch">
					<li class="look"><a href="javascript:;" onclick="schResultTabFnc('look')">LOOK</a></li>
					<li class="acct"><a href="javascript:;" onclick="schResultTabFnc('acct')">ACCOUNT</a></li>
				</ul>
			</div>
			<section class="secResult" id="searchResult"></section>

		</main>
	</div>

	<script>
        var page = 0 ;
        var startSize = 0;

        var schResultTabFnc = function(opt){  // 탭메뉴 클릭시 페이지 불러오기
            var pageUrl={
                look:"/app/look/search_more.do",
                acct:"/app/look/search_more.do",
            };
            $("#searchResult").attr("data-tab", opt);
			var search = document.getElementById('input_kwd').value;
            var modelData = {

                'pageSize' : 4,
                'pageStart' : startSize,
                'tag' : search

            };
            $.ajax({
                type: "post",
                url: pageUrl[opt],
                data : modelData,
                dataType: "html",
                success: function(html) {
                    $(".tabsSch>.uiTab>li."+opt).addClass("active").siblings("li").removeClass("active");
                    $("#searchResult").html(html);
                    // look_grid_set();
                    addItemFnc(opt);
                    $("#searchResult").removeClass("look , acct").addClass(opt);
                    appendStat = true ;
                    page = 1 ;
                    console.log( "현재탭 =" , opt );
                }
            });
        }


        var appendStat = true ;
        var addItemFnc = function(opt){
            $(".uiLoadMore").addClass("active");
            var modelData = {

                'pageSize' : 4,
                'pageStart' : startSize,
                'tag' : '${tag}'

            }
            var pageUrl={
                look:"/app/look/search_more.do",
                acct:"/app/look/search_more.do",
            };
            page ++ ;
            $.ajax({
                type: "post",
                data: modelData,
                url: pageUrl[opt],
                dataType: "html",
                success: function(html) {
                    window.setTimeout(function(){

                        // if (opt == 'look') { // LOOK 일때 append
                        // 	$items = $(html);
                        // 	$look_grid.append( $items ).masonry( 'appended', $items );
                        // 	$look_grid.masonry('layout');
                        // }
                        // if (opt == 'acct') { // Account 일때 append
                        // 	$(".secResult .tabCtn."+opt+" .list").append(html).addClass("load");
                        // }


                        $(".secResult .tabCtn."+opt+" .list").append(html).addClass("load");
                        console.log("페이징 = " + page +" + "+ pageUrl[opt]);
                        appendStat = true ;
                        if (page >= 3) {
                            console.log("끝");
                            $(".uiLoadMore").addClass("hide");
                            appendStat = false ;
                            page = 0 ;
                        }
                        $(".uiLoadMore").removeClass("active");

                    },500);
                },
                error:function(error){
                    page --;
                    console.log("페이징 = " + page);
                    $(".uiLoadMore").removeClass("active").addClass("error");

                }
            });
        };

        var look_grid_set = function(){  //  그리드 플러그인 셋팅
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



        $(document).ready(function(){

            $(window).on("scroll", function() {
                var docH = $(document).height();
                var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
                // console.log(docH,scr);
                var tabAct = $("#searchResult").attr("data-tab");
                if (docH <= scr  && appendStat == true) {
                    console.log("바닥sss");
                    addItemFnc(tabAct);
                    appendStat = false;
                }
            });

            //schResultTabFnc('look');

        });

        $(document).ready(function(){
            ui.nav.act("look");  // 하단 메뉴 활성화
        });

        $(document).on("keyup","#input_kwd",function (e) {
            if( e.keyCode == 13 ) {
                schResultTabFnc('look');
            }
        });
        $(document).on("click","#btSchCancel",function (e) {
            $("#input_kwd").val("")
        });

	</script>

	<!--// 컨텐츠 끝 -->
	<!--// 컨텐츠 끝 -->
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>


</div>

