<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrap" id="wrap">
	<div id="contain" class="contain comment">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">COMMENTS</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec comt">
				<ul class="list" id="comment_list">
				</ul>
				<div class="uiLoadMore">
					<em></em>
					<button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
			</section>
			<section class="sec write">
				<div class="box">
					<div class="pic">
						<div class="img">
							<img src="<c:out value="${empty profileInfo.imageUrl ? '/resources/app/images/common/profile_no.png' : profileInfo.imageUrl}"/>" alt="">
						</div>
					</div>
					<div class="write">
						<textarea class="ment"placeholder="댓글달기" id="input_reply"></textarea>
						<a href="javascript:;" class="send">SEND</a>
					</div>
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
		var addItemFnc = function(){
			appendStat = false ;
			page ++ ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "${ajaxUrl}",
				data : JSON.stringify({
					'pageStart' : page,
					'lookIdKey' : '${param.key}',
				}),
				contentType : 'application/json; charset=utf-8',
				dataType: "json",
				success: function(data) {
					window.setTimeout(function(){
						
						if (page == 0) {
							$("#comment_list").empty();
						}
						
						if (data.length === 0) {
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						} else {
							$.each(data, function(i, e) {
								
								var tmp = '';
								    tmp+= '';
								
								$("#comment_list").append(tmp).addClass("load");
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
	
	
		$(document).ready(function(){
	
			$(window).on("scroll", function() {
				var docH = $(document).height();
				var scr = $(window).scrollTop() + $(window).height() + $(".contain.comment .sec.write").outerHeight() + 30;
				if (docH <= scr  && appendStat == true) {
					addItemFnc();
					appendStat = false;
				}
			});
	
			addItemFnc();
			inputReplyHt();
	
		});
	
		var testFncRply = function(){
			$("#input_reply").focus().val("@JENNY ");
		}
		
		var inputReplyHt = function(){  //  입력칸 높이 조절
			$(window , "#input_reply").on("keyup input",function(){
				autosize( $('#input_reply') );
				$(".contain.comment .sec.write").css( {"height" : $(".contain.comment .sec.write>.box").outerHeight() })
			});
		}
	
	</script>
</div>