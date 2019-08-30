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
			<c:if test="${isMyProfile}">
				<div class="set">
					<a class="bt alim on" href="../mypage/alim.jsp">알림</a>
					<a class="bt conf" href="/app/setting/setting.do">설정</a>
				</div>
			</c:if>
		</div>
	</div>	
	<div id="contain" class="contain my prf">
		<main id="contents" class="contents">
			<section class="uiPrfeSet">
				<div class="user">
					<div class="photo">
						<div class="pic">
							<a href="/app/my/profile_edit.do">
								<img src='<c:out value="${empty profileInfo.imageUrl ? '/resources/app/images/common/profile_no.png' : profileInfo.imageUrl}"/>' alt="">
							</a>
						</div>
					</div>
					<div class="infos">
						<div class="name"><c:out value="${profileInfo.userId}"/></div>
						<div class="summ">
							<c:if test="${!empty profileInfo.height}">
								<span class="nt"><c:out value="${profileInfo.height}"/>cm</span>
							</c:if>
							<span class="nt"><c:out value="${profileInfo.country}"/></span>
							<span class="nt"><c:out value="${profileInfo.gender}"/></span>
						</div>
						<div class="amount">
							<a href="./follow.jsp?tabs=fwers" class="fw fwers"><i>Follower</i><em><c:out value="${profileInfo.followerCount}"/></em></a>
							<a href="./follow.jsp?tabs=fwing" class="fw fwing"><i>Following</i><em><c:out value="${profileInfo.followingCount}"/></em></a>
						</div>
					</div>
				</div>
				<div class="desc">
					<div class="name"><c:out value="${profileInfo.nickName}"/></div>
					<div class="ment" style="white-space:pre;"><c:out value="${profileInfo.content}"/></div>
				</div>
			</section>

			<section class="prfNav">
				<!-- 내프로필이면.my  ||  모델 있으면.mdl ||  팔로우중이면 .ing  -->
				<div class="bts <c:out value='${profileNavClass}'/>">
					<a href="/app/my/profile_edit.do" class="bt edit">Edit Profile</a>
					<a href="javascript:;" class="bt fwer">FOLLOW</a>
					<a href="javascript:;" class="bt fwing">ING</a>
					<a href="javascript:;" class="bt model" onclick="popLookReg_open();">Model</a>
					<a href="javascript:;" class="bt more" onclick="popPrfOthers();">More</a> 
				</div>
				
			</section>
			<section class="prfList">
				<ul class="list" id="look_list"></ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
				
			</section>

		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>

		var page = 0 ;
		var appendStat = true ;
		var addItemFnc = function(){  //  탭 내용 아래 추가 하기
			appendStat = false ;
			page ++ ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "./profile_look_thum_li.jsp",
				dataType: "html",
				success: function(html) {
					window.setTimeout(function(){
						$("#look_list").append(html).addClass("load");
						console.log("페이징 = " + page );
						appendStat = true ;
						if (page >= 3) {
							console.log("끝");
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
							page = 0 ;
						}
						$(".uiLoadMore").removeClass("active");
						ui.slides.lookPic.using();
					},500);
				},
				error:function(error){
					page --;
					console.log("페이징 = " + page);
					$(".uiLoadMore").removeClass("active").addClass("error");
				}
			});	
		};
	
		$(window).on("scroll", function() {
			var docH = $(document).height();
			var scr = $(window).scrollTop() + $(window).height() + $("#menubar").outerHeight() + 30;
			
			if (docH <= scr  && appendStat == true) {
				console.log("바닥입니다.");
				addItemFnc();
				appendStat = false;
			}
		});
	
		$(document).ready(function(){
			
			var isLogin = '${!empty sessionScope.__sessiondata__}';
			
			$('.prfNav .bts .fwer, .prfNav .bts .fwing').click(function() {
				
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
				
				if(_this.parent().hasClass("ing")) {
					type = 'delete';
				} else {
					type = 'insert';
				}
				
				$.ajax({
					type : 'post',
					url : '/app/my/follow_edit.do',
					data : JSON.stringify({
						type : type,
						userId : '${param.id}',
					}),
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						
						var followerCount  = $('.amount .fwers em').text();
						var followingCount = $('.amount .fwing em').text();
						
						if(data === 't') {
							
							if(_this.parent().hasClass("ing")) {
								
								if(/^[\d]*$/.test(followerCount)) {
									followerCount = Number(followerCount) - 1;
									$('.amount .fwers em').text(followerCount);
								}
								
								_this.parent().removeClass('ing');
							} else {
								
								if(/^[\d]*$/.test(followerCount)) {
									followerCount = Number(followerCount) + 1;
									$('.amount .fwers em').text(followerCount);
								}
								
								_this.parent().addClass('ing');
							}
						}
					}
				});
				
			});
			
			//addItemFnc();
			ui.nav.act("mypg");
			ui.refresh.init(function(){
				pjaxReload();
				console.log("댕겨서 새로고침");
			});
		});
	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>
</div>