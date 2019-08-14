<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
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
						<a href="../home/home.jsp" class="btn xl e btnLater">LATER</a>
						<a href="javascript:ui.loading.show('사이즈 등록 화면으로 <br> 이동합니다.');" class="btn xl b fill btnStart">START</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	
	$(function() {
		$('.fit a').click(function() {
		
			alert('return false');
			
			return false;
		});
		
	});
	
	</script>
	
	<!--// 컨텐츠 끝 -->
	
</div>