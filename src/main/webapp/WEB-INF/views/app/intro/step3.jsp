<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain myinfo step3">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec photo">
				<div class="hdt"><em>UPLOAD YOUR <br> STYLE PHOTOS </em> </div>

				<div class="pics swiper-container" id="slideUploadPic">
					<ul class="list swiper-wrapper slide">
						<li class="swiper-slide"><div class="img"><a class="btnAdd" href="javascript:openPhotoMulti()">선택</a></div></li>
						<!--li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this)">삭제</a></div></li>
						<li class="swiper-slide"><div class="img"></div></li>
						<li class="swiper-slide"><div class="img"></div></li-->
					</ul>
				</div>
			</section>
			
			<section class="steps st3">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>
			
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./step4.do" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	var testPicAdd = function(){
		var picHtml = '<li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this)">삭제</a></div></li>';
		$("#slideUploadPic .list").append( picHtml );
	}
	var testPicDel = function(els){
		$(els).closest(".swiper-slide").find("img , .bts").remove();
	}

	</script>

	<script>
	var onPhotoSelected = function(success, status, photos) {
		if (success && photos) {
			for (var ii=0; ii<photos.length; ii++) {
				var picHtml = '<li class="swiper-slide">' + 
								'<div class="img">' +
									'<img src="data:image/jpeg;base64,' + photos[ii] + '">' +
								'</div>' +
								'<div class="bts">' +
									'<a href="javascript:;" class="del" onclick="deletePicture(this)">삭제</a>
								'</div>' +
							'</li>';
				$("#slideUploadPic .list").append( picHtml );
			}
		}
	}
	
	function openPhotoMulti() {
		showPhotoForPickupMulti(onPhotoSelected)
	}
	
	var deletePicture = function(els){
		$(els).closest(".swiper-slide").find("img , .bts").remove();
	}
	</script>	
</div>
