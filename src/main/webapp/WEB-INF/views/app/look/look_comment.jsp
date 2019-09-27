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

		var comment_info;
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
								
								var imageUrl = (e.imageUrl == '' || e.imageUrl == null) ? '/resources/app/images/common/profile_no.png' : '${s3Url}'+e.imageUrl;
								
								var tmp = '';
								
									if (e.idKey == e.parentIdKey) {
										tmp+= '	<li>';
									} else {
										tmp+= '	<li style="margin-left: 40px;">';
									}
									
								    tmp+= '		<div class="comts">';
								    tmp+= '			<a href="/app/my/profile.do?id='+e.userId+'" class="pic"><span class="img"><img src="'+ imageUrl +'" alt=""></span></a>';
								    tmp+= '			<div class="ment">';
								    tmp+= '				<a href="/app/my/profile.do?id='+e.userId+'" class="name">'+e.nickName+'</a>';
								    tmp+= '				<div class="text" style="white-space:pre;">'+e.content+'</div>';
								    tmp+= '				<div class="info">';
								    tmp+= '					<div class="time">'+e.createDate+'</div>';
								    
								    if (e.idKey == e.parentIdKey) {
								    	 tmp+= '			<div class="btns"><a class="bt rp" href="javascript:;" onclick=commentreply("'+e.nickName+'","'+e.userId+'","'+e.idKey+'");>답글달기</a></div>';
									}
								    
								    tmp+= '				</div>';
								    tmp+= '			</div>';
								    tmp+= '		</div>';
							    	tmp+= '	</li>';
										
								    
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
			
			var isLogin = '${!empty sessionScope.__sessiondata__}';
	
			$(window).on("scroll", function() {
				var docH = $(document).height();
				var scr = $(window).scrollTop() + $(window).height() + $(".contain.comment .sec.write").outerHeight() + 30;
				if (docH <= scr  && appendStat == true) {
					addItemFnc();
					appendStat = false;
				}
			});
			
			
			$('#input_reply').focus(function() {
				
				if(isLogin == 'false') {
					ui.confirm({
						msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
							'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
						ycb: function(){
							pjax('/app/user/login.do?after=comment&key=${param.key}');
						}
					});
					
					$(this).val('');
					
					return false;
				}
			});
			
			$('.comment .write .send').click(function() {

				if ($.trim($('#input_reply').val()) == '') {
					alert('댓글을 입력 해주세요');
					return false;
				} 
				
				if (comment_info == undefined && comment_info == null) {
					comment_info = {};
					comment_info.parentIdKey = '0';
				}
				
				$.ajax({
					type: "post",
					url: "/app/my/profile/add_look_comment.do",
					data : JSON.stringify({
						'lookIdKey' : '${param.key}',
						'content' : $.trim($('#input_reply').val()),
						'parentIdKey' : comment_info.parentIdKey
					}),
					contentType : 'application/json; charset=utf-8',
					success: function(data) {
						
						if (data === 't') {
							comment_info = null;
							pjaxReload();
						} else if (data === 'f') {
							
						}
					}
					
				});
				
				return false;
			});
			
			addItemFnc();
			inputReplyHt();
	
		});
		
		function commentreply(nickName, userId, commentIdKey){
			comment_info = {};
			comment_info.nickName = nickName;
			comment_info.userId = userId;
			comment_info.parentIdKey = commentIdKey;
			
			$("#input_reply").val("@"+nickName+" ").focus()
		}
	
		
		var inputReplyHt = function(){  //  입력칸 높이 조절
			$(window , "#input_reply").on("keyup input",function(){
				autosize( $('#input_reply') );
				$(".contain.comment .sec.write").css( {"height" : $(".contain.comment .sec.write>.box").outerHeight() })
			});
		}
	
	</script>
</div>