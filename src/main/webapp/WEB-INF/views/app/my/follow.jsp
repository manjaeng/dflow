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
					<form id="searchForm">
						<input type="search" class="input key" id="input_kwd" placeholder="" value="">
						<a href="javascript:;" class="bt sch">SEARCH</a>			
						<a href="javascript:$('#input_kwd').val('');" class="bt cancel" id="btSchCancel">CANCEL</a>
					</form>
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
	var page;
	var appendStat = true ;
	function followTabFnc(opt){
		page = -1 ;
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
				$("#followTabCont").removeClass("fwers , fwing").addClass(opt);
				appendStat = true ;
				
				ui.slides.lookPic.using();
				
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
			url: '/app/my/followList.do',
			data : JSON.stringify({
				'type' : opt,
				'pageStart' : page,
				'userId' : '${param.id}',
				'searchId' : $('#input_kwd').val()
			}),
			contentType : 'application/json; charset=utf-8',
			success: function(data) {
				
				$('.fwers a i').text('('+ data.followCountMap.followerCount + ')');
				$('.fwing a i').text('('+ data.followCountMap.followingCount + ')');
				
				window.setTimeout(function(){

					if (page == 0) {
						$("#followTabCont .tabCtn."+opt+">ul.list").empty();
					}
					
					if (data.followList.length == 0) {
						$(".uiLoadMore").addClass("hide");
						appendStat = false ;
					} else {
						
						$.each(data.followList,function(i,e) {
							
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
							    
						    $("#followTabCont .tabCtn."+opt+">ul.list").append(tmp).addClass("load");
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
		
		var isLogin = '${!empty sessionScope.__sessiondata__}';
		
		$('#followTabCont').on('click','.foll input',function(e) {
			e.preventDefault();
			
			var _this = $(this);
			var type;
			
			if(isLogin == 'false') {
				
				ui.confirm({
					msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
						'<p>로그인화면으로 <br>이동하시겠습니까?</p>',
					ycb: function(){
						pjax('/app/user/login.do?after=my&id=${param.id}');
					}
				});
				return false;
			}
			
			if(_this.is(':checked')) {
				type = 'insert';
			} else {
				type = 'delete';
			}
			
			$.ajax({
				type : 'post',
				url : '/app/my/follow_edit.do',
				data : JSON.stringify({
					type : type,
					userId : _this.parents('.item').find('.name').text(),
				}),
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					
					if(data === 't') {
						var chk = _this.is(":checked");
				        if(chk) _this.prop('checked', false);
				        else  _this.prop('checked', true);
					}
				}
			}); 
			 
		});
		
		$('.follow #searchForm').submit(function(e) {
			
			var tabAct = $("#followTabCont").attr("data-tab");
			
			followTabFnc(tabAct);
			
			return false;
		});
	});

	</script>
</div>