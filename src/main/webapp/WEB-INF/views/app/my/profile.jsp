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
								<c:set var="imageUrl" value="${s3Url}${profileInfo.imageUrl}"/>
								<img src='<c:out value="${empty profileInfo.imageUrl ? '/resources/app/images/common/profile_no.png' : imageUrl}"/>' alt="">
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
							<a href="/app/my/follow.do?type=fwers&id=${profileInfo.userId}" class="fw fwers"><i>Follower</i><em><c:out value="${profileInfo.followerCount}"/></em></a>
							<a href="/app/my/follow.do?type=fwing&id=${profileInfo.userId}" class="fw fwing"><i>Following</i><em><c:out value="${profileInfo.followingCount}"/></em></a>
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
					<a href="javascript:;" class="bt more" onclick="openPopup('${profileInfo.idKey}');">More</a>
					<!-- <a href="javascript:;" class="bt more" onclick="popSystem();">More</a> -->
				</div>
				
			</section>
			<section class="prfList">
				<ul class="list" id="look_list" style="background:#FFF"></ul>
				<div class="uiLoadMore">
					<em></em><button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
				</div>
				
			</section>

		</main>
	</div>
<!-- 프로필 기타 팝업 -->
<article class="popLayer c popPrfOthers" id="popPrfOthers">
	<div class="pbd">
		<button type="button" class="btnPopClose">닫기</button>
		<div class="pct">
			<main class="poptents">
				<ul class="list">
					<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popPrfOthers');">COPY PROFILE LINK</a></li>
					<li><a href="javascript:;" onclick="popShare(); ui.popLayer.close('popPrfOthers');" class="bt">SHARE</a></li>
					<c:if test="${!isMyProfile}">
						<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popPrfOthers');">REPORT</a></li>
					</c:if>
				</ul>	
			</main>
		</div>
	</div>
</article>
<script>
function popPrfOthers(){
	ui.popLayer.open('popPrfOthers',{
		ocb:function(){
			console.log("프로필 기타팝업 열림");
		},
		ccb:function(){
			console.log("11");
		}
	});
};
</script>
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	/* function popSystem() {
			openSystemSharePopup(null);
		} */
		function openPopup(targetIdKey) {
			fp.data.targetIdKey = targetIdKey;
			fp.data.reportType = "user";
			ui.popLayer.open("popPrfOthers");
		}
		
		var page = -1;
		var appendStat = true ;
		var addItemFnc = function(){
			appendStat = false ;
			page ++ ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "/app/my/profile/look_thum.do",
				data : JSON.stringify({
					'pageStart' : page,
					'userId' : '${param.id}',
				}),
				contentType : 'application/json; charset=utf-8',
				dataType: "json",
				success: function(data) {
					window.setTimeout(function(){
						
						if (page == 0) {
							$("#look_list").empty();
						}
						
						if (data.length === 0) {
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						} else {
							var id = '${(param.id != null) ? param.id : sessionScope.__sessiondata__.userId}';
							
							$.each(data, function(i,e) {
								
								var tmp = '<li><div class="item"><span class="img">';
								    tmp+= '<a class="lk" href="/app/my/profile/look_list.do?id='+ id +'">';
								    tmp+= '<img src="' + e.image[0] + '" alt="">';

								    if(e.image.length > 1) {
								    	tmp+= '<span class="num"></span>';
								    }
								    
								    tmp+= '</a>';
								    tmp+= '</span></div></li>';
							
								    $("#look_list").append(tmp).addClass("load");
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
			
			addItemFnc();
			ui.nav.act("mypg");
			ui.refresh.init(function(){
				pjaxReload();
			});
		});
	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>
</div>