<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain myinfo step4">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<!-- <a href="javascript:history.back();" class="bt hisback">뒤로</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec coms">
				<div class="hdt"><em>LOOKING FOR <br> YOUR STYLE </em> </div>
				<div class="box">
					<div class="msgs">
						사이즈를 등록하여 <br>
						당신의 핏을 찾아보세요. <br>
					</div>
					<div class="total">
						현재 <em><c:out value="${sizeCount.count}"/>명</em>의 <br>
						사이즈가 등록되어 있습니다.
					</div>
				</div>

			</section>			
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="/app/home/home.do" class="btn xl e btnLater">LATER</a>
						<a href="javascript:ui.loading.show('사이즈 등록 화면으로 <br> 이동합니다.');" class="btn xl b fill btnStart">START</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	
	$(function() {
		$('.fit a').click(function() {
			
			if(!fp.data.intro) {
				console.log('데이터 없음');
				pjax('/app/user/join_intro.do');
				return false;
			}
			
			var index = $(this).index();
			ui.loading.show();
			
			fp.util.jsonAjax({
				url : '/app/intro/intro_complte.do',
				data : fp.data.intro,
                success : function(data) {
                	if(data === "t") {
                		fp.data.intro = null;
                		
                		if(index == 0) {
            				console.log('홈 이동');
            			} else if (index == 1) {
            				pjax('/app/user/join_intro.do');
            			}
                		
                		setTimeout(function(){
                			ui.loading.hide();
                			
                		},500);
                	} else {
                		console.log('실패');
                		ui.loading.hide();
                	}
                },
                error : function(x, s, e) {
                	console.log('error');
            		ui.loading.hide();
                }
			});
			 
			
			return false;
		});
		
	});
	
	</script>
	
</div>